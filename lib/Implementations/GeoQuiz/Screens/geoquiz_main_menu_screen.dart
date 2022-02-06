import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_experience_map.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_increase_number_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
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
  final GeoQuizGameQuestionConfig _geoQuizGameQuestionConfig =
      GeoQuizGameQuestionConfig();
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  final GeoQuizCampaignLevelService _geoQuizCampaignLevelService =
      GeoQuizCampaignLevelService();
  final GeoQuizCampaignLevelExperienceMap _campaignLevelExperienceMap =
      GeoQuizCampaignLevelExperienceMap();
  late Map<CampaignLevel, MapEntry<Color, Color>> _campaignLevelBackgrColor;
  late MapEntry<CampaignLevel, ExperienceLevel>
      _mostRecentUnlockedCampaignLevel;
  late MapEntry<CampaignLevel, ExperienceLevel>? _previousUnlockedCampaignLevel;

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
    _mostRecentUnlockedCampaignLevel =
        _campaignLevelExperienceMap.getMostRecentUnlockedCampaignLevel();
    _previousUnlockedCampaignLevel =
        _campaignLevelExperienceMap.getPreviousUnlockedCampaignLevel();
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
      backgroundImageWidth: screenDimensions.dimen(70),
      fontConfig: FontConfig(
          borderWidth: FontConfig.standardBorderWidth * 3,
          fontColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.getCustomFontSize(
              [Language.nl.name].contains(MyApp.languageCode) ? 1.5 : 2),
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

    var bottomMargin = screenDimensions.dimen(10);
    Container mainContent = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenDimensions.dimen(17)),
          gameTitleContainer,
          SizedBox(height: bottomMargin),
          _createPlayerInfo(),
          SizedBox(height: bottomMargin / 2),
          _createLevelBtnColumn(),
          const Spacer(),
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
                widget.gameScreenManagerState.showMainScreen();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget _createPlayerInfo() {
    var xpWidth = screenDimensions.dimen(10);
    var progressBarWidth = screenDimensions.dimen(90);
    Widget info = Stack(alignment: Alignment.center, children: [
      ProgressBar(
        width: progressBarWidth,
        height: screenDimensions.dimen(10),
        totalNr: widget._campaignLevelExperienceMap
            .getExperienceNeededForNextLevelToDisplay(),
        startNr: getExperienceForCurrentLevelBeforeLeavingMainScreen(),
        endNr: getExperienceForCurrentLevel(),
        fillBarColor: widget._campaignLevelBackgrColor
            .get<CampaignLevel, MapEntry<Color, Color>>(
                widget._mostRecentUnlockedCampaignLevel.key)!
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
                fontColor: Colors.lightGreenAccent,
                fontSize: FontConfig.getCustomFontSize(1)),
            text: "XP",
          ),
          const Spacer(),
          createExperienceContainer(),
          const Spacer(),
          SizedBox(
            width: xpWidth,
          )
        ]),
      )
    ]);
    return info;
  }

  int getExperienceForCurrentLevel() {
    var experience = widget._geoQuizLocalStorage.getExperience();
    if (widget._previousUnlockedCampaignLevel != null) {
      experience = experience -
          widget._previousUnlockedCampaignLevel!.value
              .experienceNeededForNextLevel;
    }
    return max(experience, 0);
  }

  int getExperienceForCurrentLevelBeforeLeavingMainScreen() {
    var experience =
        widget._geoQuizLocalStorage.getExperienceBeforeLeavingMainScreen();
    if (widget._previousUnlockedCampaignLevel != null) {
      experience = experience -
          widget._previousUnlockedCampaignLevel!.value
              .experienceNeededForNextLevel;
    }
    return max(experience, 0);
  }

  Widget createExperienceContainer() {
    var fontConfig = FontConfig(
        borderColor: Colors.black,
        borderWidth: FontConfig.standardBorderWidth * 1.1,
        fontColor: Colors.white,
        fontSize: FontConfig.getCustomFontSize(0.9));
    var currentExperience = AnimateIncreaseNumberText(
        audioPlayerId: "ExperienceContainerAudioId",
        startNr: getExperienceForCurrentLevelBeforeLeavingMainScreen(),
        endNr: getExperienceForCurrentLevel(),
        toAnimateText: MyText(
          fontConfig: fontConfig,
          text: getExperienceForCurrentLevel().toString(),
        ));
    var allExperience = MyText(
      fontConfig: fontConfig,
      text: " / " +
          widget._campaignLevelExperienceMap
              .getExperienceNeededForNextLevelToDisplay()
              .toString(),
    );
    widget._geoQuizLocalStorage.setExperienceBeforeLeavingMainScreen(
        widget._geoQuizLocalStorage.getExperience());
    return Row(
      children: [currentExperience, allExperience],
    );
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
    var levelBtnDisabled =
        widget._mostRecentUnlockedCampaignLevel.key.difficulty.index <
            campaignLevel.difficulty.index;
    var contentLocked =
        campaignLevel.difficulty == widget._geoQuizGameQuestionConfig.diff3 &&
            MyApp.isExtraContentLocked;
    return Padding(
        padding: EdgeInsets.all(screenDimensions.dimen(2)),
        child: MyButton(
          disabled: levelBtnDisabled,
          contentLocked: contentLocked,
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
              fontColor: Colors.white,
              fontSize: FontConfig.getCustomFontSize(1.3)),
          size: Size(screenDimensions.dimen(60), screenDimensions.dimen(17)),
          text: formatTextWithOneParam(label.l_level_param0.capitalized, index),
        ));
  }
}
