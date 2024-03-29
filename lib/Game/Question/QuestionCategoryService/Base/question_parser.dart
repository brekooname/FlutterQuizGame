import 'dart:core';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';

import '../../../../main.dart';
import '../../question_collector_service.dart';

abstract class QuestionParser<
    TQuestionCollectorService extends QuestionCollectorService> {
  late TQuestionCollectorService questionCollectorService;

  QuestionParser() {
    questionCollectorService = MyApp.appId.gameConfig.questionCollectorService
        as TQuestionCollectorService;
  } //We return a list in case of multiple correct answers
  List<String> getCorrectAnswersFromRawString(Question question);

  String getQuestionToBeDisplayed(Question question);
}
