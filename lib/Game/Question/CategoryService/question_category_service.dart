import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCreator/question_creator.dart';

abstract class QuestionCategoryService {

  QuestionCreator getQuestionCreator(){
    return QuestionCreator();
  }

  QuestionService getQuestionService();

  String getHintButtonType();
}