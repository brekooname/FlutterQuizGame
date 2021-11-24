import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCreator/question_creator.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game_question_config.dart';

abstract class GameConfig {
  GameQuestionConfig getGameQuestionConfig();

  Contrast getScreenContrast() {
    return Contrast.LIGHT;
  }

  String getExtraContentProductId() {
    return "";
  }

  Color getScreenBackgroundColor() {
    return getScreenContrast() == Contrast.LIGHT
        ? Colors.lightBlue
        : Colors.blue.shade600;
  }

  QuestionCreator getQuestionCreator() {
    return QuestionCreator();
  }

  List<QuestionCategory> questionCategories() {
    return getGameQuestionConfig().categories();
  }

  List<QuestionDifficulty> questionDifficulties() {
    return getGameQuestionConfig().difficulties();
  }
}
