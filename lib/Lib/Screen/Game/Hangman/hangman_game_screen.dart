import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

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
  late final List<String> allLetters;

  void initHangmanGameScreen(
      TQuizQuestionManager quizQuestionManager, String allLettersLabel) {
    this.quizQuestionManager = quizQuestionManager;
    allLetters = allLettersLabel.split(",");
  }

  void pressFirstAndLastLetter() {
    quizQuestionManager.gameContext.gameUser.addAnswerToQuestionInfo(
        quizQuestionManager.currentQuestionInfo.question,
        _hangmanService.normalizeString(hangmanWord[0].toLowerCase()));
    quizQuestionManager.gameContext.gameUser.addAnswerToQuestionInfo(
        quizQuestionManager.currentQuestionInfo.question,
        _hangmanService.normalizeString(
            hangmanWord[hangmanWord.length - 1].toLowerCase()));
  }

  String get hangmanWord =>
      quizQuestionManager.currentQuestionInfo.question.questionToBeDisplayed;

  Set<String> get allPressedLetters =>
      (quizQuestionManager.correctPressedAnswer.toList() +
              quizQuestionManager.wrongPressedAnswer.toList())
          .toSet();

  Widget createLettersRows(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    int nrOfRowsWithLetters = getNrRowsWithLetters();
    int answerIndex = 0;
    List<Row> allRows = [];
    for (int i = nrOfRowsWithLetters - 1; i >= 0; i--) {
      List<MyButton> rowButtons = [];
      for (int j = 0; j < _getNrOfLettersOnRow(); j++) {
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
        children: FontConfig.isRtlLanguage
            ? rowButtons.reversed.toList()
            : rowButtons,
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
    var btnSide = _screenDimensions.dimen(14.5);
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
      buttonAllPadding: _screenDimensions.dimen(1),
      text: btnLetter.toLowerCase(),
      textFirstCharUppercase: false,
      size: Size(btnSide, btnSide),
    );
  }

  int getNrRowsWithLetters() {
    return (allLetters.length / _getNrOfLettersOnRow()).ceil();
  }

  Widget createWordContainer() {
    debugPrint(hangmanWord);
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
      section = FontConfig.isRtlLanguage ? section.reversed : section;
      List<Widget> lettersRowChildren = [];
      for (int i = 0; i < section.length; i++) {
        var letter = section[i];
        var normalizedLetter =
            _hangmanService.normalizeString(letter.toLowerCase());
        var fontColor = gameFinished &&
                !allPressedAnswer.contains(normalizedLetter) &&
                !HangmanService.charsToBeIgnored.contains(normalizedLetter)
            ? Colors.red.shade600
            : Colors.black;
        lettersRowChildren.add(MyText(
          fontConfig: FontConfig(
            fontSize: FontConfig.getCustomFontSize(hangmanWordFontSize),
            fontColor: fontColor,
          ),
          text: letter,
          firstCharUppercase: false,
          trim: false,
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
    var delimiter = " ";
    var maxOneLineLength = 20;
    if (word.length > maxOneLineLength && word.contains(delimiter)) {
      var lastIndexOf = word.lastIndexOf(delimiter);
      if (word.length - word.substring(lastIndexOf).length < maxOneLineLength) {
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

  int _getNrOfLettersOnRow() => 6;
}
