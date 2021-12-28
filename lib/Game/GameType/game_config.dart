import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager.dart';

import 'game_question_config.dart';

abstract class GameConfig {
  GameQuestionConfig get gameQuestionConfig;

  AllQuestionsService get allQuestionsService;

  String getTitle(Language language);

  Contrast get screenContrast => Contrast.LIGHT;

  String get extraContentProductId;

  GameScreenManager get gameScreenManager;

  Color get screenBackgroundColor => screenContrast == Contrast.LIGHT
      ? Colors.lightBlue
      : Colors.blue.shade600;

  List<QuestionCategory> get questionCategories =>
      gameQuestionConfig.categories;

  List<QuestionDifficulty> get questionDifficulties =>
      gameQuestionConfig.difficulties;
}
