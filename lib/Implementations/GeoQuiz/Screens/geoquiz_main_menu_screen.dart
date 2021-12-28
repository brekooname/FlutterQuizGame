
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class GeoQuizMainMenuScreen extends StandardScreen {
  GeoQuizMainMenuScreen(GameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key) {}

  @override
  State<GeoQuizMainMenuScreen> createState() => GeoQuizMainMenuScreenState();
}

class GeoQuizMainMenuScreenState extends State<GeoQuizMainMenuScreen>
    with ScreenState {
  @override
  void initState() {
    super.initState();
    initScreen();
  }

  @override
  Widget build(BuildContext context) {
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      backgroundImageWidth: screenDimensions.w(70),
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.bigFontSize,
          borderColor: Colors.green),
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png", assetName: "title_backgr"),
    );

    return gameTitle;
  }
}
