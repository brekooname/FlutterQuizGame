import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_background.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Game/Question/Model/category_difficulty.dart';
import '../../../Lib/Button/my_back_button.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';
import '../Components/astronomy_components_service.dart';
import '../Constants/astronomy_campaign_level_service.dart';
import '../Questions/AllContent/astronomy_question_collector_service.dart';

class AstronomyLevelsScreen
    extends StandardScreen<AstronomyScreenManagerState> {
  final AstronomyComponentsService _astronomyComponentsService =
      AstronomyComponentsService();
  final AstronomyLocalStorage _astronomyLocalStorage = AstronomyLocalStorage();
  final AstronomyQuestionCollectorService _questionCollectorService =
      AstronomyQuestionCollectorService();
  final AstronomyGameQuestionConfig _questionConfig =
      AstronomyGameQuestionConfig();
  final AstronomyGameType gameType;

  AstronomyLevelsScreen(AstronomyScreenManagerState gameScreenManagerState,
      {Key? key, required this.gameType})
      : super(gameScreenManagerState, key: key);

  @override
  State<AstronomyLevelsScreen> createState() => AstronomyLevelsScreenState();
}

class AstronomyLevelsScreenState extends State<AstronomyLevelsScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var myBackButton = MyBackButton();
    var campaignText = MyText(
        text: widget.gameType.gameTypeLabel,
        width: screenDimensions.dimen(100) - myBackButton.buttonSize.width * 2,
        maxLines: 1,
        fontConfig: FontConfig(
            fontColor: Colors.blue.shade50,
            borderColor: Colors.indigo.shade800,
            fontWeight: FontWeight.w500,
            fontSize: FontConfig.getCustomFontSize(1.4)));

    var mainColumn = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  myBackButton,
                  const Spacer(),
                  campaignText,
                  const Spacer(),
                  SizedBox(
                    width: myBackButton.buttonSize.width,
                  )
                ]),
            const Spacer(),
            _createLevelBtnRows(),
            const Spacer(),
          ],
        ));

    return AnimateBackground(
      mainContent: mainColumn,
      particleImage: imageService.getSpecificImage(
          imageName: "stars", imageExtension: "png"),
    );
  }

  Widget _createLevelBtnRows() {
    List<Widget> btnRows = [];
    List<Widget> btns = [];
    int i = 0;

    var lockedCategs = [
      widget._questionConfig.cat5,
      widget._questionConfig.cat6,
      widget._questionConfig.cat10,
      widget._questionConfig.cat16,
    ];

    for (CampaignLevel campaignLevel
        in widget.gameType.gameTypeCampaignLevels) {
      var category = campaignLevel.categories.first;

      var contentLocked =
          MyApp.isExtraContentLocked && lockedCategs.contains(category);

      btns.add(widget._astronomyComponentsService.createLevelBtn(
          () {
            widget.gameScreenManagerState.showNewGameScreen(campaignLevel);
          },
          "btn_cat" + category.index.toString(),
          category.categoryLabel ?? "xx",
          widget._astronomyLocalStorage.getWonQuestionsForCat(category).length,
          widget._questionCollectorService
                  .totalNrOfQuestionsForCategoryDifficulty
                  .get(CategoryDifficulty(
                      category, widget._questionConfig.diff0)) ??
              0,
          contentLocked,
          () {
            widget.gameScreenManagerState.showLevelsScreen(widget.gameType);
          }));
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
}
