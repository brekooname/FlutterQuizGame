import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_level.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/File/file_util.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';
import 'history_game_screen.dart';

class HistoryMainMenuScreen extends StatefulWidget {
  Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig =
      HashMap<CategoryAndDifficulty, List<String>>();
  MyAppContext myAppContext;

  HistoryMainMenuScreen(this.myAppContext);

  @override
  State<HistoryMainMenuScreen> createState() => HistoryMainMenuScreenState();
}

class HistoryMainMenuScreenState extends State<HistoryMainMenuScreen>
    with StandardScreen {
  setupQuestions() async {
    if (widget.allQuestionsWithConfig.isEmpty) {
      RatePopupService ratePopupService = RatePopupService(
          buildContext: context, myAppContext: widget.myAppContext);
      ratePopupService.showRateAppPopup();

      Map<CategoryAndDifficulty, List<String>> res =
          HashMap<CategoryAndDifficulty, List<String>>();
      var categories =
          widget.myAppContext.appId.gameConfig.questionCategories();
      var difficulties =
          widget.myAppContext.appId.gameConfig.questionDifficulties();
      for (QuestionCategory category in categories) {
        for (QuestionDifficulty difficulty in difficulties) {
          String questions = await FileUtil(myAppContext: widget.myAppContext)
              .getTextForConfig(difficulty, category);
          CategoryAndDifficulty config =
              CategoryAndDifficulty(category, difficulty);
          res[config] = questions.split("\n");
        }
      }

      setState(() {
        widget.allQuestionsWithConfig = res;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initScreen(widget.myAppContext, context);

    setupQuestions();

    var gameTitle = GameTitle(
      text: widget.myAppContext.appTitle,
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          borderWidth: FontConfig.getStandardBorderWidth() * 2,
          fontSize: FontConfig.getBigFontSize(),
          borderColor: Colors.green),
      backgroundImagePath: imageService.getImagePath("title_clouds_background"),
    );

    var level1 = MyButton(
        width: 200,
        height: 100,
        onClick: () {
          if (widget.allQuestionsWithConfig.isNotEmpty) {
            var gameLevel =
                HistoryGameLevel(myAppContext: widget.myAppContext).level_0_0;

            var gameContext = GameContextService(
                    myAppContext: widget.myAppContext,
                    allQuestionsWithConfig: widget.allQuestionsWithConfig)
                .createGameContextWithQuestions(widget
                    .myAppContext.appId.gameConfig
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
            text: getLabelTextWithParam(label.l_high_score_param0, "100"),
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
          MyText(text: label.l_great_world_powers),
          MyText(
            text: getLabelTextWithParam(label.l_high_score_param0, "100"),
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
    bannerAd.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }
}
