import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';

import 'game_question_config.dart';

abstract class GameConfig {
  GameQuestionConfig get gameQuestionConfig;

  AllQuestionsService get allQuestionsService;

  QuestionCollectorService get questionCollectorService;

  String getTitle(Language language);

  Contrast get screenContrast => Contrast.light;

  String get extraContentProductId;

  Color get screenBackgroundColor;

  GameScreenManager get gameScreenManager;

  ImageRepeat get backgroundTextureRepeat => ImageRepeat.repeat;

  List<QuestionCategory> get questionCategories =>
      gameQuestionConfig.categories;

  List<QuestionDifficulty> get questionDifficulties =>
      gameQuestionConfig.difficulties;
}
