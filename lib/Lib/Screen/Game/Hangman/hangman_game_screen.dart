import 'package:flutter/material.dart';

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
            allPressedLetters,
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
    Set<String> alreadyPressedLetters,
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    var btnSide = _screenDimensions.dimen(12);
    return MyButton(
      onClick: () {
        quizQuestionManager.onClickAnswerOptionBtn(
            btnLetter, refreshSetState, goToNextScreenAfterPress);
      },
      disabled: alreadyPressedLetters
          .map((e) => e.toLowerCase())
          .contains(btnLetter.toLowerCase()),
      buttonAllPadding: _screenDimensions.dimen(2),
      text: btnLetter,
      size: Size(btnSide, btnSide),
    );
  }

  int _getNrOfAnswersOnRow(int nrOfAllLetters, int nrOfRowsWithLetters) {
    return (nrOfAllLetters / nrOfRowsWithLetters).ceil();
  }

  Widget createWordContainer() {
    var hangmanWordFontSize = _getHangmanWordFontSize(hangmanWord);
    var fontConfig =
        FontConfig(fontSize: FontConfig.getCustomFontSize(hangmanWordFontSize));
    String currentWordState =
        _hangmanService.getCurrentWordState(hangmanWord, allPressedLetters);
    List<Widget> lettersRowChildren = [];
    for (int i = 0; i < currentWordState.length; i++) {
      lettersRowChildren.add(MyText(
        fontConfig: fontConfig,
        text: currentWordState[i],
        textAllPadding: _screenDimensions.dimen(.65),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: lettersRowChildren,
    );
  }

  double _getHangmanWordFontSize(String hangmanWord) {
    var val = 2.5;
    if (hangmanWord.length < 10) {
      val = 2.5;
    } else if (hangmanWord.length < 15) {
      val = 2;
    } else {
      val = 1.5;
    }
    return val;
  }
}
