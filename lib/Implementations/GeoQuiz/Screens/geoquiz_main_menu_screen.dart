import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class GeoQuizMainMenuScreen extends StandardScreen {
  GeoQuizLocalStorage geoQuizLocalStorage = GeoQuizLocalStorage();
  GeoQuizCampaignLevelService geoQuizCampaignLevelService =
      GeoQuizCampaignLevelService();

  GeoQuizMainMenuScreen(GameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key) {}

  @override
  State<GeoQuizMainMenuScreen> createState() => GeoQuizMainMenuScreenState();
}

class GeoQuizMainMenuScreenState extends State<GeoQuizMainMenuScreen>
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
          textColor: Colors.grey.shade400,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.bigFontSize,
          borderColor: Colors.black),
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png", assetName: "title_backgr"),
    );

    MyButton newGame = MyButton(
      text: label.l_new_game,
      onClick: () {
        widget.geoQuizLocalStorage.clearAll();
        widget.gameScreenManagerState
            .showNewGameScreen(GeoQuizCampaignLevelService().level_0);
      },
    );

    var bottomMargin = screenDimensions.h(10);
    Container mainContent = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: bottomMargin),
          gameTitle,
          SizedBox(height: bottomMargin),
          createPlayerInfo(),
          SizedBox(height: bottomMargin / 2),
          newGame,
          Spacer(),
        ],
      ),
    );

    return Scaffold(
        body: mainContent,
        backgroundColor: Colors.transparent,
        floatingActionButton: Row(children: [
          FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContent: () {
                widget.geoQuizLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Container createPlayerInfo() {
    Container info = Container(
        child: Column(children: [
      MyText(
        text: formatTextWithOneParam(label.l_level_param0, "1"),
      ),
      ProgressBar(
        width: screenDimensions.w(90),
        height: screenDimensions.h(5),
        percentFilled: 67,
      )
    ]));
    return info;
  }

  Container createRows(GameTitle gameTitle) {
    int levelsOnRow = 3;
    int i = 0;
    List<Row> levelRows = [];
    List<Widget> rowButtons = [];
    for (CampaignLevel campaignLevel
        in widget.geoQuizCampaignLevelService.allLevels) {
      rowButtons.add(createLevelBtn(campaignLevel, i));
      i++;
      if (i > 0 && i % levelsOnRow == 0) {
        levelRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowButtons,
        ));
        rowButtons = [];
      }
    }

    List<Widget> columnChildren = [gameTitle];
    columnChildren.addAll(levelRows);
    Container mainContent = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: columnChildren,
      ),
    );
    return mainContent;
  }

  Widget createLevelBtn(CampaignLevel campaignLevel, int index) {
    double btnSide = screenDimensions.w(20);

    return Padding(
        padding: EdgeInsets.all(screenDimensions.w(2)),
        child: MyButton(
          fontConfig: FontConfig(
              borderColor: Colors.black,
              textColor: Colors.white,
              fontSize: FontConfig.getCustomFontSize(1.3)),
          size: Size(btnSide, btnSide),
          text: (index + 1).toString(),
        ));
  }
}
