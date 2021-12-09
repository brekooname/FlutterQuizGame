import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';


import 'game_question_config.dart';

abstract class GameConfig {

  GameQuestionConfig getGameQuestionConfig();

  String getTitle(Language language);

  Contrast get screenContrast {
    return Contrast.LIGHT;
  }

  String getExtraContentProductId() {
    return "";
  }

  Color getScreenBackgroundColor() {
    return screenContrast == Contrast.LIGHT
        ? Colors.lightBlue
        : Colors.blue.shade600;
  }

  List<QuestionCategory> questionCategories() {
    return getGameQuestionConfig().categories();
  }

  List<QuestionDifficulty> questionDifficulties() {
    return getGameQuestionConfig().difficulties();
  }
}
