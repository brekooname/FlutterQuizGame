import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_background.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:animated_background/animated_background.dart';

import '../../../Lib/Audio/my_audio_player.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class AstronomyMainMenuScreen
    extends StandardScreen<AstronomyScreenManagerState> {
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
        backgroundImageWidth: screenDimensions.dimen(70),
        fontConfig: FontConfig(
            fontColor: Colors.lightGreenAccent,
            fontWeight: FontWeight.normal,
            fontSize: FontConfig.bigFontSize,
            borderColor: Colors.green),
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
          ],
        ));

    MyAudioPlayer().playSuccess(audioPlayerId: "xxxx");
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
}
