import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_background.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Button/my_back_button.dart';
import '../../../Lib/Font/font_config.dart';
import '../Components/astronomy_components_service.dart';
import '../Constants/astronomy_campaign_level_service.dart';

class AstronomyLevelsScreen
    extends StandardScreen<AstronomyScreenManagerState> {
  final AstronomyComponentsService _astronomyComponentsService =
      AstronomyComponentsService();
  AstronomyGameType gameType;

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
    var campaignText = MyText(
        text: widget.gameType.gameTypeLabel,
        fontConfig: FontConfig(
            fontColor: Colors.blue.shade50,
            borderColor: Colors.indigo.shade800,
            fontWeight: FontWeight.w500,
            fontSize: FontConfig.getCustomFontSize(1.4)));

    var myBackButton = MyBackButton();
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
    for (CampaignLevel campaignLevel
        in widget.gameType.gameTypeCampaignLevels) {
      var category = campaignLevel.categories.first;
      btns.add(widget._astronomyComponentsService.createLevelBtn(() {
        widget.gameScreenManagerState.showNewGameScreen(campaignLevel);
      }, "btn_cat" + category.index.toString(),
          category.categoryLabel ?? "xx"));
      if (i > 0 &&( i + 1) % 2 == 0) {
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
