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
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class PersTestMainMenuScreen
    extends StandardScreen<PersTestGameScreenManagerState> {
  final PersTestLocalStorage _persTestLocalStorage = PersTestLocalStorage();

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
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      fontConfig: FontConfig(
          fontColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.bigFontSize,
          borderColor: Colors.green),
    );

    var mainColumn = Container(
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
        createLevelBtn(campLevelService.level_0,
            "The Big Five Personality Test", Colors.green.shade400),
        createLevelBtn(campLevelService.level_1, "Rosenberg self-esteem scale",
            Colors.red.shade300),
        createLevelBtn(campLevelService.level_2, "DISC personality test",
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
            size: Size(screenDimensions.w(32), screenDimensions.dimen(20)),
            buttonAllPadding: screenDimensions.dimen(0.5),
            textMaxLines: 2,
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
                Future.delayed(
                    Duration.zero,
                    () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return PersTestDescriptionPopup(levelDescr);
                        }));
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
                  Future.delayed(
                      Duration.zero,
                      () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PersTestReportNotAvailablePopup(() {
                              widget.gameScreenManagerState
                                  .showNewGameScreen(campaignLevel);
                            });
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
