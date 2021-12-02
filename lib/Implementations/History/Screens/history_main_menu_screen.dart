import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_level.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_questions.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';
import 'history_game_screen.dart';

class HistoryMainMenuScreen extends StatefulWidget {
  Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig =
      HashMap<CategoryDifficulty, List<Question>>();
  MyAppContext myAppContext;

  HistoryMainMenuScreen(this.myAppContext) {
    allQuestionsWithConfig = HistoryQuestions().getAllQuestions();
  }

  @override
  State<HistoryMainMenuScreen> createState() => HistoryMainMenuScreenState();
}

class HistoryMainMenuScreenState extends State<HistoryMainMenuScreen>
    with StandardScreen {
  @override
  Widget build(BuildContext context) {
    initScreen(widget.myAppContext, context);
    var gameTitle = GameTitle(
      text: widget.myAppContext.appTitle,
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          borderWidth: FontConfig.getStandardBorderWidth() * 2,
          fontSize: FontConfig.getBigFontSize(),
          borderColor: Colors.green),
      backgroundImagePath: imageService.getSpecificImagePath(
          appKey: myAppContext.appId.appKey,
          imageName: "title_clouds_background"),
    );

    var btnSize = Size(200, 100);
    var level1 = MyButton(
        size: btnSize,
        onClick: () {
          if (widget.allQuestionsWithConfig.isNotEmpty) {
            var gameLevel =
                HistoryGameLevel(myAppContext: widget.myAppContext).level_0_0;

            var gameContext = GameContextService(
                    myAppContext: widget.myAppContext,
                    allQuestionsWithConfig: widget.allQuestionsWithConfig)
                .createGameContextWithHintsAndQuestions(
                    6,
                    widget.myAppContext.appId.gameConfig
                        .getQuestionParser()
                        .getAllQuestionsForCategoryAndDifficulty(
                          widget.allQuestionsWithConfig,
                          gameLevel.category,
                          gameLevel.difficulty,
                        ));
            showPopupAd(context, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HistoryGameScreen(
                            myAppContext: widget.myAppContext,
                            gameContext: gameContext,
                            gameLevel: gameLevel,
                          )));
            });
          }
        },
        buttonSkinConfig: ButtonSkinConfig(
          borderColor: Colors.blue.shade600,
          backgroundColor: Colors.lightBlueAccent,
        ),
        fontConfig: FontConfig(),
        customContent: <Widget>[
          MyText(text: label.l_important_years_in_history),
          MyText(
            text: formatTextWithOneParam(label.l_high_score_param0, "100"),
            fontConfig: FontConfig(
                textColor: Colors.yellow,
                fontWeight: FontWeight.normal,
                borderColor: Colors.black),
          ),
        ]);

    var level2 = MyButton(
        size: btnSize,
        onClick: () {},
        buttonSkinConfig: ButtonSkinConfig(
            borderColor: Colors.green.shade600,
            backgroundColor: Colors.greenAccent),
        fontConfig: FontConfig(),
        customContent: <Widget>[
          MyText(text: label.l_great_world_powers),
          MyText(
            text: formatTextWithOneParam(label.l_high_score_param0, "100"),
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

    return createScreen(mainColumn);
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }
}
