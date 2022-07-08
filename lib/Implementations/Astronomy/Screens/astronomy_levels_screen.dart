import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_background.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Audio/my_audio_player.dart';
import '../../../Lib/Button/my_back_button.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class AstronomyLevelsScreen
    extends StandardScreen<AstronomyScreenManagerState> {
  final AstronomyGameQuestionConfig _questionConfig =
      AstronomyGameQuestionConfig();
  CampaignLevel campaignLevel;

  AstronomyLevelsScreen(AstronomyScreenManagerState gameScreenManagerState,
      {Key? key, required this.campaignLevel})
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
        text: "Planets",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _createLevelBtn(widget._questionConfig.cat0),
                _createLevelBtn(widget._questionConfig.cat1),
              ],
            ),
            const Spacer(),
          ],
        ));

    return AnimateBackground(
      mainContent: mainColumn,
      particleImage: imageService.getSpecificImage(
          imageName: "stars", imageExtension: "png"),
    );
  }

  Widget _createLevelBtn(QuestionCategory cat) {
    return MyButton(
      buttonAllPadding: screenDimensions.dimen(10),
      buttonSkinConfig: ButtonSkinConfig(
          image: imageService.getSpecificImage(
              maxWidth: screenDimensions.dimen(25),
              imageName: "btn_cat" + cat.index.toString(),
              imageExtension: "png",
              module: "buttons"),
          borderRadius: FontConfig.standardBorderRadius * 4),
      size: Size(screenDimensions.dimen(30), screenDimensions.dimen(45)),
      fontConfig: FontConfig(fontColor: Colors.black),
      text: cat.categoryLabel,
    );
  }
}
