import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_service.dart';

abstract class QuestionCategoryService {

  QuestionParser getQuestionParser();

  QuestionService getQuestionService();

  String getHintButtonType();
}