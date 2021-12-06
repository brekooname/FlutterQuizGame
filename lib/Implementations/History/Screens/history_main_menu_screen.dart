import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_level.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';
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
  late HistoryLocalStorage historyLocalStorage;

  HistoryMainMenuScreen(this.myAppContext) {
    allQuestionsWithConfig =
        HistoryQuestions().getAllQuestions(myAppContext.languageCode);
    historyLocalStorage = HistoryLocalStorage(myAppContext: myAppContext);
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
          borderWidth: FontConfig.getStandardBorderWidth() * 1.6,
          fontSize: FontConfig.getBigFontSize(),
          borderColor: Colors.green),
      backgroundImagePath: imageService.getSpecificImagePath(
          appKey: myAppContext.appId.appKey,
          imageName: "title_clouds_background"),
    );

    var historyCampaignLevel =
        HistoryCampaignLevel(myAppContext: widget.myAppContext);
    var btnSize = Size(screenDimensions.w(60), screenDimensions.h(15));

    var level1 = createLevelButton(
        btnSize,
        context,
        historyCampaignLevel.level_0_0,
        Colors.lightBlueAccent,
        Colors.blue.shade600,
        label.l_important_years_in_history);

    var level2 = createLevelButton(
        btnSize,
        context,
        historyCampaignLevel.level_0_1,
        Colors.greenAccent,
        Colors.green.shade600,
        label.l_great_world_powers);

    var mainColumn = Column(
      children: <Widget>[
        SizedBox(height: screenDimensions.h(4)),
        gameTitle,
        SizedBox(height: screenDimensions.h(7)),
        level1,
        SizedBox(height: screenDimensions.h(3)),
        level2,
      ],
    );

    return createScreen(mainColumn);
  }

  MyButton createLevelButton(
      Size btnSize,
      BuildContext context,
      CampaignLevel campaignLevel,
      Color btnColor,
      Color btnBorderColor,
      String labelText) {
    return MyButton(
        size: btnSize,
        onClick: () {
          NavigatorService().goTo(
              context,
              HistoryGameScreen(
                myAppContext: widget.myAppContext,
                gameContext:
                    HistoryGameContextService(myAppContext: widget.myAppContext)
                        .createGameContext(
                            campaignLevel, widget.allQuestionsWithConfig),
                gameLevel: campaignLevel,
              ), () {
            setState(() {});
          });
        },
        buttonSkinConfig: ButtonSkinConfig(
            borderColor: btnBorderColor, backgroundColor: btnColor),
        fontConfig: FontConfig(),
        customContent: <Widget>[
          MyText(text: labelText),
          MyText(
            text: formatTextWithOneParam(
                label.l_high_score_param0,
                widget.historyLocalStorage
                    .getHighScore(campaignLevel)
                    .toString()),
            fontConfig: FontConfig(
                textColor: Colors.yellow,
                fontWeight: FontWeight.normal,
                borderColor: Colors.black),
          )
        ]);
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }
}
