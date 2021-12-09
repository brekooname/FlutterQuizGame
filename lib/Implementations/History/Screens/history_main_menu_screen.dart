import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';

import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/settings_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';
import 'history_game_timeline_screen.dart';

class HistoryMainMenuScreen extends StatefulWidget {
  Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig =
      HashMap<CategoryDifficulty, List<Question>>();
  late HistoryLocalStorage historyLocalStorage;

  HistoryMainMenuScreen() {
    allQuestionsWithConfig =
        HistoryQuestions().getAllQuestions(MyApp.languageCode);
    historyLocalStorage = HistoryLocalStorage();
  }

  @override
  State<HistoryMainMenuScreen> createState() => HistoryMainMenuScreenState();
}

class HistoryMainMenuScreenState extends State<HistoryMainMenuScreen>
    with StandardScreen {
  @override
  Widget build(BuildContext context) {
    initScreen(context);
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      backgroundImageWidth: screenDimensions.w(70),
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.getBigFontSize(),
          borderColor: Colors.green),
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png", assetName: "title_clouds_background"),
    );

    var historyCampaignLevel = HistoryCampaignLevel();

    var level0 = createLevelButton(context, historyCampaignLevel.level_0,
        Colors.blue.shade300, label.l_modern_history, false);
    var level1 = createLevelButton(context, historyCampaignLevel.level_1,
        Colors.green.shade300, label.l_middle_ages, false);
    var level2 = createLevelButton(context, historyCampaignLevel.level_2,
        Colors.red.shade300, label.l_ancient_history, false);
    var level3 = createLevelButton(context, historyCampaignLevel.level_3,
        Colors.yellow.shade300, label.l_prehistory, true);

    var btnMargin = screenDimensions.h(3);
    var mainColumn = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenDimensions.h(4)),
            gameTitle,
            SizedBox(height: screenDimensions.h(7)),
            level0,
            SizedBox(height: btnMargin),
            level1,
            SizedBox(height: btnMargin),
            level2,
            SizedBox(height: btnMargin),
            level3,
          ],
        ));
    return createScreen(Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: SettingsButton(
          context: context,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop));
  }

  MyButton createLevelButton(BuildContext context, CampaignLevel campaignLevel,
      Color btnColor, String labelText, bool contentLocked) {
    var btnSize = Size(screenDimensions.w(80), screenDimensions.h(11));
    var paddingBetween = btnSize.width / 20;
    var iconWidth = screenDimensions.w(15);
    return MyButton(
        contentLocked: contentLocked,
        size: btnSize,
        onClick: () {
          NavigatorService().goTo(
              context,
              HistoryGameTimelineScreen(
                gameContext: HistoryGameContextService().createGameContext(
                    campaignLevel, widget.allQuestionsWithConfig),
                difficulty: campaignLevel.difficulty,
                category: HistoryGameQuestionConfig().cat0,
              ), () {
            setState(() {});
          });
        },
        buttonSkinConfig: ButtonSkinConfig(backgroundColor: btnColor),
        fontConfig: FontConfig(),
        customContent: Row(children: [
          SizedBox(width: paddingBetween),
          getBtnIcon(campaignLevel, btnColor, iconWidth),
          SizedBox(width: paddingBetween),
          Container(
              width: btnSize.width - iconWidth - paddingBetween * 5,
              child: Column(children: [
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
              ])),
          SizedBox(width: paddingBetween),
        ]));
  }

  Widget getBtnIcon(
      CampaignLevel campaignLevel, Color circleColor, double iconWidth) {
    return Container(
      width: iconWidth,
      height: iconWidth,
      decoration: BoxDecoration(
        color: ColorUtil.colorDarken(circleColor, -0.15),
        shape: BoxShape.circle,
      ),
      child: imageService.getSpecificImage(
          imageName:
              "history_btn_diff" + campaignLevel.difficulty.index.toString(),
          maxWidth: iconWidth / 1.2,
          module: "buttons"),
    );
  }

  @override
  void dispose() {
    disposeScreen();
    super.dispose();
  }
}
