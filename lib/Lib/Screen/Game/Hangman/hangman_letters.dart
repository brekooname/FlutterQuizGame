import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

mixin HangmanLetters {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  Widget createLettersRows(
      Set<String> alreadyPressedLetters,
      VoidCallback refreshSetState,
      VoidCallback goToNextScreenAfterPress,
      String allLettersLabel) {
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
            alreadyPressedLetters,
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
    var btnSide = screenDimensions.dimen(12);
    return MyButton(
      onClick: () {
        clickAnswerBtn(btnLetter, goToNextScreenAfterPress, refreshSetState);
      },
      disabled: alreadyPressedLetters.contains(btnLetter),
      buttonAllPadding: screenDimensions.dimen(2),
      text: btnLetter,
      size: Size(btnSide, btnSide),
    );
  }

  void clickAnswerBtn(String btnLetter, VoidCallback goToNextScreenAfterPress,
      VoidCallback refreshSetState);

  int _getNrOfAnswersOnRow(int nrOfAllLetters, int nrOfRowsWithLetters) {
    return (nrOfAllLetters / nrOfRowsWithLetters).ceil();
  }
}
