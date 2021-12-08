import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
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
import 'history_game_timeline_screen.dart';

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
      backgroundImageWidth: screenDimensions.w(70),
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.getBigFontSize(),
          borderColor: Colors.green),
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png",
          appKey: myAppContext.appId.appKey,
          assetName: "title_clouds_background"),
    );

    var historyCampaignLevel = HistoryCampaignLevel();

    var level0 = createLevelButton(context, historyCampaignLevel.level_0,
        Colors.blue.shade300, label.l_modern_history);
    var level1 = createLevelButton(context, historyCampaignLevel.level_1,
        Colors.green.shade300, label.l_middle_ages);
    var level2 = createLevelButton(context, historyCampaignLevel.level_2,
        Colors.red.shade300, label.l_ancient_history);
    var level3 = createLevelButton(context, historyCampaignLevel.level_3,
        Colors.yellow.shade300, label.l_prehistory);

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
            SizedBox(height: screenDimensions.h(3)),
            level1,
            SizedBox(height: screenDimensions.h(3)),
            level2,
            SizedBox(height: screenDimensions.h(3)),
            level3,
          ],
        ));
    return createScreen(Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: SettingsButton(
          context: context,
          myAppContext: myAppContext,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop));
  }

  MyButton createLevelButton(BuildContext context, CampaignLevel campaignLevel,
      Color btnColor, String labelText) {
    var btnSize = Size(screenDimensions.w(80), screenDimensions.h(11));
    var paddingBetween = btnSize.width / 20;
    var iconWidth = screenDimensions.w(15);
    return MyButton(
        size: btnSize,
        onClick: () {
          NavigatorService().goTo(
              context,
              HistoryGameTimelineScreen(
                myAppContext: widget.myAppContext,
                gameContext:
                    HistoryGameContextService(myAppContext: widget.myAppContext)
                        .createGameContext(
                            campaignLevel, widget.allQuestionsWithConfig),
                difficulty: campaignLevel.difficulty,
                category: HistoryGameQuestionConfig().cat0,
              ), () {
            setState(() {});
          });
        },
        buttonSkinConfig: ButtonSkinConfig(backgroundColor: btnColor),
        fontConfig: FontConfig(),
        customContent: <Widget>[
          Row(children: [
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
          ])
        ]);
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
          module: "buttons",
          appKey: myAppContext.appId.appKey),
    );
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }
}
