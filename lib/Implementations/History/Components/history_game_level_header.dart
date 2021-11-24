import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Components/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Components/Text/my_text.dart';

import '../../../Components/Font/font_config.dart';

class HistoryGameLevelHeader extends StatelessWidget {
  int score;
  int availableHints;
  String historyEra;
  String question;

  HistoryGameLevelHeader(
      {this.score = 0,
      this.availableHints = 6,
      required this.historyEra,
      required this.question});

  @override
  Widget build(BuildContext context) {
    return createLevelHeader();
  }

  Container createLevelHeader() {
    var questionText = MyText(text: question);

    return Container(
        child: Column(children: [
      createGreenHeader(),
      questionText,
      SizedBox(height: 10)
    ]));
  }

  Container createGreenHeader() {
    var backBtn = MyBackButton();
    var hintBtn = HintButton(
      disabled: false,
      showAvailableHintsText: true,
    );
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.withAlpha(150),
        ),
        child: Row(
          children: <Widget>[
            backBtn,
            SizedBox(width: 10),
            MyText(
              text: this.score.toString(),
              fontConfig: FontConfig(
                  textColor: Colors.yellow,
                  borderColor: Colors.black,
                  fontSize: FontConfig.getBigFontSize()),
            ),
            SizedBox(width: 10),
            Image.asset(
              "assets/implementations/history/score_icon.png",
              alignment: Alignment.center,
              width: 20,
            ),
            Spacer(),
            MyText(
              width: 100,
              text: historyEra,
              fontConfig: FontConfig(textColor: Colors.green.shade600),
            ),
            Spacer(),
            hintBtn,
          ],
        ));
  }
}
