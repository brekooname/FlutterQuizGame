import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Components/astronomy_components_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_background.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class AstronomyMainMenuScreen
    extends StandardScreen<AstronomyScreenManagerState> {
  final AstronomyComponentsService _astronomyComponentsService =
      AstronomyComponentsService();
  final AstronomyGameQuestionConfig _questionConfig =
      AstronomyGameQuestionConfig();

  final AstronomyCampaignLevelService _campaignLevelService =
      AstronomyCampaignLevelService();

  AstronomyMainMenuScreen(AstronomyScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<AstronomyMainMenuScreen> createState() =>
      AstronomyMainMenuScreenState();
}

class AstronomyMainMenuScreenState extends State<AstronomyMainMenuScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var gameTitle = GameTitle(
        text: MyApp.appTitle,
        backgroundImageOpacity: 0.2,
        backgroundImageWidth: screenDimensions.dimen(70),
        fontConfig: FontConfig(
            fontColor: Colors.blue.shade50,
            borderColor: Colors.indigo.shade800,
            fontWeight: FontWeight.w700,
            fontSize: FontConfig.getCustomFontSize(1.8)),
        backgroundImagePath: assetsService.getSpecificAssetPath(
            assetExtension: "png", assetName: "title_background"));

    var mainColumn = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenDimensions.dimen(11)),
            gameTitle,
            SizedBox(height: screenDimensions.dimen(14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget._campaignLevelService.gameTypes.map((gameType) {
                var levelIndexOf =
                    widget._campaignLevelService.gameTypes.indexOf(gameType);
                return widget._astronomyComponentsService.createLevelBtn(() {
                  onLevelBtnClick(gameType);
                }, "btn_gametype" + levelIndexOf.toString(),
                    gameType.gameTypeLabel);
              }).toList(),
            )
          ],
        ));

    return Scaffold(
        body: AnimateBackground(
          mainContent: mainColumn,
          particleImage: imageService.getSpecificImage(
              imageName: "stars", imageExtension: "png"),
        ),
        backgroundColor: Colors.transparent,
        floatingActionButton: Row(children: [
          FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContent: () {
                // widget.astronomyLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  void onLevelBtnClick(AstronomyGameType astronomyGameType) {
    if (astronomyGameType.gameTypeCampaignLevels.length == 1) {
      widget.gameScreenManagerState
          .showNewGameScreen(astronomyGameType.gameTypeCampaignLevels.first);
    } else {
      widget.gameScreenManagerState.showLevelsScreen(astronomyGameType);
    }
  }
}
