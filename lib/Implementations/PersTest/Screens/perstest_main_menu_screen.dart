import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_attr_description_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_report_not_available_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class PersTestMainMenuScreen
    extends StandardScreen<PersTestGameScreenManagerState> {
  final PersTestLocalStorage _persTestLocalStorage = PersTestLocalStorage();
  late Image backgroundImage;

  PersTestMainMenuScreen(PersTestGameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<PersTestMainMenuScreen> createState() => PersTestMainMenuScreenState();
}

class PersTestMainMenuScreenState extends State<PersTestMainMenuScreen>
    with ScreenState {
  @override
  void initState() {
    super.initState();
    widget.backgroundImage = imageService.getSpecificImage(
        imageName: "background_texture2", imageExtension: "png");
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      textShadow: Shadow(
        offset: Offset(
            FontConfig.standardShadowOffset, FontConfig.standardShadowOffset),
        blurRadius: FontConfig.standardShadowRadius * 2,
        color: Colors.black.withOpacity(0.2),
      ),
      fontConfig: FontConfig(
        borderColor: Colors.grey.shade200,
        borderWidth: screenDimensions.dimen(0.4),
        fontColor: Colors.black,
        fontSize: FontConfig.getCustomFontSize(1.8),
      ),
    );

    var mainColumn = Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.noRepeat,
          image: widget.backgroundImage.image,
        )),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenDimensions.dimen(11)),
            gameTitle,
            SizedBox(height: screenDimensions.dimen(14)),
            createLevelBtnsContainer()
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
                widget._persTestLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget createLevelBtnsContainer() {
    var campLevelService = PersTestCampaignLevelService();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createLevelBtn(
            campLevelService.level_0,
            label.l_big_five_personality_traits,
            label
                .l_the_test_consists_of_50_self_assessment_questions_this_questionnaire_has_the_highest_acceptance_ra,
            Colors.green.shade400),
        createLevelBtn(
            campLevelService.level_1,
            label.l_rosenberg_self_esteem_scale,
            label
                .l_the_test_consists_of_10_self_assessment_questions_developed_by_the_sociologist_morris_rosenberg_is,
            Colors.red.shade300),
        createLevelBtn(
            campLevelService.level_2,
            label.l_disc_personality_test,
            label
                .l_the_test_consists_of_16_self_assessment_questions_disc_assessments_are_behavior_self_assessment_to,
            Colors.yellow.shade400),
      ],
    );
  }

  Widget createLevelBtn(CampaignLevel campaignLevel, String levelText,
      String levelDescr, Color color) {
    var reportBtnDimen = screenDimensions.dimen(15);
    var infoBtnDimen = screenDimensions.dimen(10);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyButton(
            backgroundColor: color,
            fontSize: [Language.sl.name].contains(MyApp.languageCode)
                ? FontConfig.normalFontSize / 1.1
                : FontConfig.normalFontSize,
            size: Size(screenDimensions.w(32), screenDimensions.dimen(20)),
            buttonAllPadding: screenDimensions.dimen(0.5),
            textMaxLines: levelText.contains(" ") ? 2 : 1,
            text: levelText,
            onClick: () {
              widget.gameScreenManagerState.showNewGameScreen(campaignLevel);
            },
          ),
          Row(children: [
            MyButton(
              size: Size(infoBtnDimen, infoBtnDimen),
              buttonAllPadding: screenDimensions.dimen(2),
              buttonSkinConfig: ButtonSkinConfig(
                  image: imageService.getMainImage(
                      maxWidth: reportBtnDimen,
                      imageName: "info",
                      imageExtension: "png",
                      module: "general")),
              onClick: () {
                MyPopup.showPopup(
                    context, PersTestDescriptionPopup(levelDescr));
              },
            ),
            MyButton(
              size: Size(reportBtnDimen, reportBtnDimen),
              buttonAllPadding: screenDimensions.dimen(2),
              buttonSkinConfig: ButtonSkinConfig(
                  image: imageService.getMainImage(
                      maxWidth: reportBtnDimen,
                      imageName: "pie_chart",
                      imageExtension: "png",
                      module: "general")),
              onClick: () {
                var difficulty = campaignLevel.difficulty;
                var category = campaignLevel.categories.first;
                if (widget._persTestLocalStorage
                    .getGameTypeResults(difficulty, category)
                    .isEmpty) {
                  MyPopup.showPopup(context,
                      PersTestReportNotAvailablePopup(() {
                    widget.gameScreenManagerState
                        .showNewGameScreen(campaignLevel);
                  }));
                } else {
                  widget.gameScreenManagerState
                      .showGameOverScreen(difficulty, category);
                }
              },
            )
          ])
        ]);
  }
}
