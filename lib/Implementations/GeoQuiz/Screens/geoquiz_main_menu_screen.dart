import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_experience_map.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
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
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  final GeoQuizCampaignLevelService _geoQuizCampaignLevelService =
      GeoQuizCampaignLevelService();
  final GeoQuizCampaignLevelExperienceMap _campaignLevelExperienceMap =
      GeoQuizCampaignLevelExperienceMap();
  late Map<CampaignLevel, MapEntry<Color, Color>> _campaignLevelBackgrColor;

  GeoQuizMainMenuScreen(GameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key) {
    _campaignLevelBackgrColor = {
      _geoQuizCampaignLevelService.level_0:
          MapEntry(Colors.green.shade400, Colors.lightGreenAccent),
      _geoQuizCampaignLevelService.level_1:
          const MapEntry(Colors.lightBlue, Colors.lightBlueAccent),
      _geoQuizCampaignLevelService.level_2:
          MapEntry(Colors.purple.shade300, Colors.purpleAccent.shade400),
      _geoQuizCampaignLevelService.level_3:
          MapEntry(Colors.redAccent, Colors.redAccent.shade400),
    };
  }

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
    var gameTitleOpacity = 0.6;
    var gameTitle = GameTitle(
      backgroundImageOpacity: gameTitleOpacity,
      text: MyApp.appTitle,
      backgroundImageWidth: screenDimensions.w(70),
      fontConfig: FontConfig(
          borderWidth: FontConfig.standardBorderWidth * 3,
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.getCustomFontSize(2),
          borderColor: Colors.green.shade900),
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png", assetName: "title_backgr"),
    );

    Widget gameTitleContainer = Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(FontConfig.standardBorderRadius / 2),
          gradient: RadialGradient(radius: 4, colors: [
            ColorUtil.colorDarken(
                Colors.lightBlue.shade100.withOpacity(gameTitleOpacity), 0.05),
            Colors.lightBlue.shade600.withOpacity(gameTitleOpacity),
          ]),
        ),
        child: gameTitle);

    var bottomMargin = screenDimensions.h(3);
    Container mainContent = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenDimensions.h(10)),
          gameTitleContainer,
          SizedBox(height: bottomMargin),
          _createPlayerInfo(),
          SizedBox(height: bottomMargin / 2),
          _createLevelBtnColumn(),
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
                widget._geoQuizLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget _createPlayerInfo() {
    var xpWidth = screenDimensions.w(10);
    var progressBarWidth = screenDimensions.w(90);
    Widget info = Stack(alignment: Alignment.center, children: [
      ProgressBar(
        width: progressBarWidth,
        height: screenDimensions.h(5),
        currentStep: 3,
        widthPerStep: screenDimensions.w(15),
        fillBarColor: widget._campaignLevelBackgrColor
            .get<CampaignLevel, MapEntry<Color, Color>>(
                mostRecentUnlockedCampaignLevel().key)!
            .value
            .withOpacity(0.7),
      ),
      SizedBox(
        width: progressBarWidth,
        child: Row(children: [
          MyText(
            width: xpWidth,
            fontConfig: FontConfig(
                borderColor: Colors.black,
                borderWidth: FontConfig.standardBorderWidth * 1.1,
                textColor: Colors.lightGreenAccent,
                fontSize: FontConfig.getCustomFontSize(1)),
            text: "XP",
          ),
          const Spacer(),
          MyText(
            fontConfig: FontConfig(
                borderColor: Colors.black,
                borderWidth: FontConfig.standardBorderWidth * 1.1,
                textColor: Colors.white,
                fontSize: FontConfig.getCustomFontSize(0.9)),
            text: widget._geoQuizLocalStorage.getExperience().toString() +
                " / " +
                widget._campaignLevelExperienceMap
                    .getExperienceNeededForNextLevelToDisplay()
                    .toString(),
          ),
          const Spacer(),
          SizedBox(
            width: xpWidth,
          )
        ]),
      )
    ]);
    return info;
  }

  MapEntry<CampaignLevel, ExperienceLevel> mostRecentUnlockedCampaignLevel() {
    return widget._campaignLevelExperienceMap
        .getMostRecentUnlockedCampaignLevel();
  }

  Container _createLevelBtnColumn() {
    int i = 0;
    List<Widget> levels = [];
    for (CampaignLevel campaignLevel
        in widget._geoQuizCampaignLevelService.allLevels) {
      i++;
      levels.add(_createLevelBtn(campaignLevel, i));
    }

    Container mainContent = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: levels,
      ),
    );
    return mainContent;
  }

  Widget _createLevelBtn(CampaignLevel campaignLevel, int index) {
    return Padding(
        padding: EdgeInsets.all(screenDimensions.w(2)),
        child: MyButton(
          onClick: () {
            var geoQuizLocalStorage = widget._geoQuizLocalStorage;
            geoQuizLocalStorage.setExperienceBeforeLeavingMainScreen(
                geoQuizLocalStorage.getExperience());
            widget.gameScreenManagerState.showNewGameScreen(campaignLevel);
          },
          backgroundColor: widget._campaignLevelBackgrColor
              .get<CampaignLevel, MapEntry<Color, Color>>(campaignLevel)!
              .key,
          fontConfig: FontConfig(
              borderColor: Colors.black,
              textColor: Colors.white,
              fontSize: FontConfig.getCustomFontSize(1.3)),
          size: Size(screenDimensions.w(60), screenDimensions.h(10)),
          text: formatTextWithOneParam(label.l_level_param0, index),
        ));
  }
}
