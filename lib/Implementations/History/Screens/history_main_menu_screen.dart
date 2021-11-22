import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Components/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Components/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Components/Text/my_text.dart';

import '../../../Components/Button/button_skin_config.dart';
import '../../../Components/Font/font_config.dart';

class HistoryMainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero,
        () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return RateAppPopup();
            }));

    var gameTitle = GameTitle(
      text: "History Game",
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          borderWidth: FontConfig.getStandardBorderWidth() * 2,
          fontSize: FontConfig.getBigFontSize(),
          borderColor: Colors.green),
      backgroundImagePath:
          "assets/implementations/history/title_clouds_background.png",
    );

    var level1 = MyButton(
        width: 200,
        height: 100,
        onClick: () {},
        buttonSkinConfig: ButtonSkinConfig(
          borderColor: Colors.blue.shade600,
          backgroundColor: Colors.lightBlueAccent,
        ),
        fontConfig: FontConfig(),
        customContent: <Widget>[
          MyText(text: "Important Years In History"),
          MyText(
            text: "Highscore: 100",
            fontConfig: FontConfig(
                textColor: Colors.yellow,
                fontWeight: FontWeight.normal,
                borderColor: Colors.black),
          ),
        ]);

    var level2 = MyButton(
        width: 200,
        height: 100,
        onClick: () {},
        buttonSkinConfig: ButtonSkinConfig(
            borderColor: Colors.green.shade600,
            backgroundColor: Colors.greenAccent),
        fontConfig: FontConfig(),
        customContent: <Widget>[
          MyText(text: "Great World Powers"),
          MyText(
            text: "Highscore: 100",
            fontConfig: FontConfig(
                textColor: Colors.yellow,
                fontWeight: FontWeight.normal,
                borderColor: Colors.black),
          )
        ]);

    var mainColumn = Column(
      children: <Widget>[
        SizedBox(height: 20),
        gameTitle,
        SizedBox(height: 60),
        level1,
        SizedBox(height: 20),
        level2,
      ],
    );

    return AspectRatio(
      aspectRatio: 1.777083333333333,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage(
              'assets/implementations/history/background_texture.png'),
        )),
        alignment: Alignment.center,
        child: mainColumn,
      ),
    );
  }
}
