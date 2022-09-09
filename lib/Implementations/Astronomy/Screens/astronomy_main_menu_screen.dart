import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Components/astronomy_components_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_background.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Game/Question/Model/category_difficulty.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';
import '../Constants/astronomy_game_question_config.dart';
import '../Questions/AllContent/astronomy_question_collector_service.dart';
import '../Service/astronomy_local_storage.dart';

class AstronomyMainMenuScreen
    extends StandardScreen<AstronomyScreenManagerState> {
  final AstronomyComponentsService _astronomyComponentsService =
      AstronomyComponentsService();
  final AstronomyLocalStorage _astronomyLocalStorage = AstronomyLocalStorage();
  final AstronomyCampaignLevelService _campaignLevelService =
      AstronomyCampaignLevelService();
  final AstronomyQuestionCollectorService _questionCollectorService =
      AstronomyQuestionCollectorService();
  final AstronomyGameQuestionConfig _questionConfig =
      AstronomyGameQuestionConfig();

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
        backgroundImageWidth: screenDimensions.dimen(60),
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
            SizedBox(height: screenDimensions.dimen(1)),
            gameTitle,
            SizedBox(height: screenDimensions.dimen(10)),
            _createGameTypeBtnRows(),
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
              resetContentOnClick: () {
                widget._astronomyLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget _createGameTypeBtnRows() {
    List<Widget> btnRows = [];
    List<Widget> btns = [];
    int i = 0;
    for (AstronomyGameType gameType in widget._campaignLevelService.gameTypes) {
      btns.add(widget._astronomyComponentsService.createLevelBtn(() {
        onLevelBtnClick(gameType);
      },
          "btn_gametype" + gameType.id.toString(),
          gameType.gameTypeLabel,
          gameType.gameTypeAllCategories
              .map((e) =>
                  widget._astronomyLocalStorage.getWonQuestionsForCat(e).length)
              .reduce((a, b) => a + b),
          gameType.gameTypeAllCategories
              .map((e) =>
                  widget._questionCollectorService
                      .totalNrOfQuestionsForCategoryDifficulty
                      .get(CategoryDifficulty(
                          e, widget._questionConfig.diff0)) ??
                  0)
              .reduce((a, b) => a + b),
          false,
          null));
      if (i > 0 && (i + 1) % 2 == 0) {
        btnRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: btns,
        ));
        btns = [];
      }
      i++;
    }
    btnRows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: btns,
    ));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: btnRows,
    );
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
