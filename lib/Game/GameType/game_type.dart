import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Game/Game/GameService/game_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCreator/question_creator.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';

import 'game_question_config.dart';

abstract class GameType {

  Map<QuestionCategory, GameService> gameServices = HashMap<QuestionCategory, GameService>();

  GameService getGameService(QuestionCategory questionCategory){
    if(gameServices.containsKey(questionCategory)){
      return gameServices[questionCategory];
    }
    GameService
  }

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

  QuestionCreator getQuestionCreator(){
    return QuestionCreator();
  }

  GameQuestionConfig getGameQuestionConfig();
}
