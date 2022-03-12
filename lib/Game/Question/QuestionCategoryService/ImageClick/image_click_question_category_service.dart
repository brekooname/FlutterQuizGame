import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_service.dart';


class ImageClickCategoryQuestionService extends QuestionCategoryService {
  static final ImageClickCategoryQuestionService singleton =
      ImageClickCategoryQuestionService.internal();

  factory ImageClickCategoryQuestionService() {
    return singleton;
  }

  ImageClickCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  ImageClickQuestionService getQuestionService() {
    return ImageClickQuestionService(questionParser: getQuestionParser());
  }

  @override
  ImageClickQuestionParser getQuestionParser() {
    return ImageClickQuestionParser();
  }
}
