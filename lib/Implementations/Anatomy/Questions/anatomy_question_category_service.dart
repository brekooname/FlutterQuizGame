import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_question_service.dart';


class AnatomyCategoryQuestionService extends QuestionCategoryService {
  static final AnatomyCategoryQuestionService singleton =
  AnatomyCategoryQuestionService.internal();

  factory AnatomyCategoryQuestionService() {
    return singleton;
  }

  AnatomyCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  AnatomyQuestionService getQuestionService() {
    return AnatomyQuestionService(questionParser: getQuestionParser());
  }

  @override
  AnatomyQuestionParser getQuestionParser() {
    return AnatomyQuestionParser();
  }
}
