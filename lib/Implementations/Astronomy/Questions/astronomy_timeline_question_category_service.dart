import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_timeline_question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_timeline_question_service.dart';

class AstronomyTimelineCategoryQuestionService extends QuestionCategoryService {
  static final AstronomyTimelineCategoryQuestionService singleton =
      AstronomyTimelineCategoryQuestionService.internal();

  factory AstronomyTimelineCategoryQuestionService() {
    return singleton;
  }

  AstronomyTimelineCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  AstronomyTimelineQuestionService getQuestionService() {
    return AstronomyTimelineQuestionService(
        questionParser: getQuestionParser());
  }

  @override
  AstronomyTimelineQuestionParser getQuestionParser() {
    return AstronomyTimelineQuestionParser();
  }
}
