import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/AllContent/history_all_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class HistoryMainMenuScreen extends StandardScreen {
  HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();
  HistoryGameQuestionConfig historyGameQuestionConfig =
      HistoryGameQuestionConfig();
  HistoryAllQuestions allQuestions = HistoryAllQuestions();
  Map<QuestionDifficulty, int> totalNrOfQuestionsForCampaignLevel = HashMap();

  HistoryMainMenuScreen(GameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key) {
    for (CampaignLevel l in HistoryCampaignLevelService().allLevels) {
      totalNrOfQuestionsForCampaignLevel.putIfAbsent(l.difficulty,
          () => allQuestions.getAllQuestionsForDifficulty(l.difficulty).length);
    }
  }

  @override
  State<HistoryMainMenuScreen> createState() => HistoryMainMenuScreenState();
}

class HistoryMainMenuScreenState extends State<HistoryMainMenuScreen>
    with ScreenState {
  @override
  void initState() {
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      backgroundImageWidth: screenDimensions.w(70),
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.bigFontSize,
          borderColor: Colors.green),
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png", assetName: "title_clouds_background"),
    );

    var historyCampaignLevel = HistoryCampaignLevelService();

    var level0 = createLevelButton(context, historyCampaignLevel.level_0,
        Colors.blue.shade300, label.l_modern_history, false);
    var level1 = createLevelButton(context, historyCampaignLevel.level_1,
        Colors.green.shade300, label.l_middle_ages, false);
    var level2 = createLevelButton(context, historyCampaignLevel.level_2,
        Colors.red.shade300, label.l_ancient_history, false);
    var level3 = createLevelButton(context, historyCampaignLevel.level_3,
        Colors.yellow.shade300, label.l_prehistory, MyApp.isExtraContentLocked);

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
    return Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: Row(children: [
          FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContent: () {
                widget.historyLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget createLevelButton(BuildContext context, CampaignLevel campaignLevel,
      Color btnColor, String labelText, bool contentLocked) {
    var btnSize = Size(screenDimensions.w(84), screenDimensions.h(12));
    var paddingBetween = btnSize.width / 20;
    var iconWidth = screenDimensions.w(14);

    int totalQuestionsForCampaignLevel = widget
            .totalNrOfQuestionsForCampaignLevel
            .get<QuestionDifficulty, int>(campaignLevel.difficulty) ??
        0;
    var totalWonQuestions = widget.historyLocalStorage
        .getTotalWonQuestions(campaignLevel.difficulty);
    var myButton = MyButton(
        contentLocked: contentLocked,
        size: btnSize,
        onClick: () {
          if (widget.historyLocalStorage
                  .getWonQuestionsForDiff(campaignLevel.difficulty)
                  .length ==
              totalQuestionsForCampaignLevel) {
            widget.historyLocalStorage.resetLevel(campaignLevel.difficulty);
          }
          widget.gameScreenManagerState.showNewGameScreen(campaignLevel);
        },
        buttonSkinConfig: ButtonSkinConfig(backgroundColor: btnColor),
        fontConfig: FontConfig(),
        customContent: Row(children: [
          SizedBox(width: paddingBetween),
          getBtnIcon(campaignLevel, btnColor, iconWidth),
          SizedBox(width: paddingBetween),
          SizedBox(
              width: btnSize.width - iconWidth - paddingBetween * 5,
              child: Column(children: [
                MyText(
                  text: labelText,
                  textColor: Colors.grey.shade800,
                ),
                MyText(
                  text: contentLocked
                      ? ""
                      : formatTextWithOneParam(
                          label.l_score_param0,
                          totalWonQuestions.toString() +
                              "/" +
                              totalQuestionsForCampaignLevel.toString()),
                  fontConfig: FontConfig(
                      textColor:
                          totalWonQuestions == totalQuestionsForCampaignLevel
                              ? Colors.greenAccent
                              : Colors.yellow,
                      fontWeight: FontWeight.normal,
                      borderColor: Colors.black),
                )
              ])),
          SizedBox(width: paddingBetween),
        ]));

    return Column(
      children: [
        myButton,
      ],
    );
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
}
