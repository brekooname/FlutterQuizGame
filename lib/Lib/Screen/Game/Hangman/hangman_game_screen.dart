import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';

import '../../../../Game/Question/QuestionCategoryService/Hangman/hangman_service.dart';
import '../../../Button/my_button.dart';
import '../../../Font/font_config.dart';
import '../../../ScreenDimensions/screen_dimensions_service.dart';
import '../../../Text/my_text.dart';
import '../Options/quiz_question_manager.dart';

mixin HangmanGameScreen<TQuizQuestionManager extends QuizQuestionManager> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final HangmanService _hangmanService = HangmanService();
  late final TQuizQuestionManager quizQuestionManager;

  void initHangmanGameScreen(TQuizQuestionManager quizQuestionManager) {
    this.quizQuestionManager = quizQuestionManager;
  }

  void pressFirstAndLastLetter() {
    quizQuestionManager.gameContext.gameUser.addAnswerToQuestionInfo(
        quizQuestionManager.currentQuestionInfo.question, hangmanWord[0]);
    quizQuestionManager.gameContext.gameUser.addAnswerToQuestionInfo(
        quizQuestionManager.currentQuestionInfo.question,
        hangmanWord[hangmanWord.length - 1]);
  }

  String get hangmanWord =>
      quizQuestionManager.currentQuestionInfo.question.questionToBeDisplayed;

  Set<String> get allPressedLetters =>
      (quizQuestionManager.correctPressedAnswer.toList() +
              quizQuestionManager.wrongPressedAnswer.toList())
          .toSet();

  Widget createLettersRows(VoidCallback refreshSetState,
      VoidCallback goToNextScreenAfterPress, String allLettersLabel) {
    int nrOfRowsWithLetters = 5;
    List<String> allLetters = allLettersLabel.split(",");
    int answerIndex = 0;
    List<Row> allRows = [];
    for (int i = nrOfRowsWithLetters; i >= 0; i--) {
      List<MyButton> rowButtons = [];
      for (int j = 0;
          j < _getNrOfAnswersOnRow(allLetters.length, nrOfRowsWithLetters);
          j++) {
        if (answerIndex < allLetters.length) {
          MyButton button = _createHangmanButton(
            allLetters.elementAt(answerIndex),
            refreshSetState,
            goToNextScreenAfterPress,
          );
          rowButtons.add(button);
          answerIndex++;
        }
      }
      allRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rowButtons,
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: allRows,
    );
  }

  MyButton _createHangmanButton(
    String btnLetter,
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    var btnSide = _screenDimensions.dimen(14);
    var btnDisabled = quizQuestionManager.allPressedAnswer
            .contains(btnLetter.toLowerCase()) ||
        quizQuestionManager.isGameFinished();
    var backgroundColor = Colors.white.withOpacity(0.15);
    var correctAnswerPressed = quizQuestionManager.correctPressedAnswer
        .contains(btnLetter.toLowerCase());
    var wrongAnswerPressed = quizQuestionManager.wrongPressedAnswer
        .contains(btnLetter.toLowerCase());
    return MyButton(
      onClick: () {
        quizQuestionManager.onClickAnswerOptionBtn(
            btnLetter, refreshSetState, goToNextScreenAfterPress);
      },
      disabledButtonSkinConfig: ButtonSkinConfig(
        backgroundColor: correctAnswerPressed
            ? Colors.lightGreenAccent.shade200
            : wrongAnswerPressed
                ? Colors.orange.shade100
                : backgroundColor,
        borderColor: correctAnswerPressed
            ? Colors.green
            : wrongAnswerPressed
                ? Colors.deepOrangeAccent
                : Colors.transparent,
        buttonUnpressedShadowColor: Colors.transparent,
      ),
      buttonSkinConfig: ButtonSkinConfig(
          withBorder: false,
          backgroundColor: backgroundColor,
          buttonUnpressedShadowColor: Colors.transparent,
          buttonPressedShadowColor: Colors.green),
      disabled: btnDisabled,
      fontConfig: FontConfig(
          fontSize: FontConfig.getCustomFontSize(1.3),
          fontWeight: FontWeight.w700),
      buttonAllPadding: _screenDimensions.dimen(1.5),
      text: btnLetter.toLowerCase(),
      textFirstCharUppercase: false,
      size: Size(btnSide, btnSide),
    );
  }

  int _getNrOfAnswersOnRow(int nrOfAllLetters, int nrOfRowsWithLetters) {
    return (nrOfAllLetters / nrOfRowsWithLetters).ceil();
  }

  Widget createWordContainer() {
    var hangmanWordFontSize = _getHangmanWordFontSize(hangmanWord);
    var gameFinished = quizQuestionManager.isGameFinished();
    String currentWordState = _hangmanService.getCurrentWordState(
        hangmanWord,
        gameFinished
            ? quizQuestionManager.correctAnswersForQuestion
            : allPressedLetters);

    List<Widget> lettersRows = [];
    var splitLongWord = _getSplitLongWord(currentWordState);
    var allPressedAnswer = quizQuestionManager.allPressedAnswer;
    for (String section in splitLongWord) {
      List<Widget> lettersRowChildren = [];
      for (int i = 0; i < section.length; i++) {
        var letter = section[i];
        var fontColor =
            gameFinished && !allPressedAnswer.contains(letter.toLowerCase())
                ? Colors.red.shade600
                : Colors.black;
        lettersRowChildren.add(MyText(
          fontConfig: FontConfig(
            fontSize: FontConfig.getCustomFontSize(hangmanWordFontSize),
            fontColor: fontColor,
          ),
          text: letter,
          firstCharUppercase: false,
          textAllPadding: _screenDimensions.dimen(.65),
        ));
      }
      lettersRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: lettersRowChildren,
      ));
    }
    return Column(children: lettersRows);
  }

  List<String> _getSplitLongWord(String word) {
    List<String> currentWordStateSections;
    var delimiter = "  ";
    //For example a value of 40 means that the word contains 20 letters.
    //This is because between the letters there is an empty char.
    var maxOneLineLengthWithSpaceBetweenLetters = 40;
    if (word.length > maxOneLineLengthWithSpaceBetweenLetters &&
        word.contains(delimiter)) {
      var lastIndexOf = word.lastIndexOf(delimiter);
      if (word.length - word.substring(lastIndexOf).length <
          maxOneLineLengthWithSpaceBetweenLetters) {
        currentWordStateSections = [
          word.substring(0, lastIndexOf),
          word.substring(lastIndexOf)
        ];
      } else {
        var indexOf =
            word.indexOf(delimiter, word.indexOf(delimiter) + delimiter.length);
        currentWordStateSections = [
          word.substring(0, indexOf),
          word.substring(indexOf)
        ];
      }
    } else {
      currentWordStateSections = [word];
    }
    return currentWordStateSections;
  }

  double _getHangmanWordFontSize(String hangmanWord) {
    var val = 2.5;
    if (hangmanWord.length < 10) {
      val = 2.5;
    } else if (hangmanWord.length < 15) {
      val = 2;
    } else if (hangmanWord.length < 20) {
      val = 1.5;
    } else {
      val = 1.3;
    }
    return val;
  }
}
