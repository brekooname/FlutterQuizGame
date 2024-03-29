import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/screen_orientation.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game_question_config.dart';

abstract class GameConfig {
  GameQuestionConfig get gameQuestionConfig;

  AllQuestionsService get allQuestionsService;

  QuestionCollectorService get questionCollectorService;

  String getTitle(Language language);

  Contrast get screenContrast => Contrast.light;

  bool get isLightScreenContrast => screenContrast == Contrast.light;

  bool get hasBackgroundMusic => false;

  ScreenOrientation get screenOrientation => ScreenOrientation.portrait;

  //TODO Check extra content "iOS" and "Android" may be different
  String get extraContentProductId;

  bool get showBuyProPopupAsFirstInterstitial => true;

  Color get defaultScreenBackgroundColor;

  GameScreenManager get gameScreenManager;

  ImageRepeat? get backgroundTextureRepeat => ImageRepeat.repeat;

  TextStyle googleFonts(TextStyle textStyle) {
    return GoogleFonts.roboto(textStyle: textStyle);
  }

  List<QuestionCategory> get questionCategories =>
      gameQuestionConfig.categories;

  List<QuestionDifficulty> get questionDifficulties =>
      gameQuestionConfig.difficulties;
}
