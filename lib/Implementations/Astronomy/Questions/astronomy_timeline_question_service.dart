import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_timeline_question_parser.dart';

class AstronomyTimelineQuestionService extends QuestionService {
  late AstronomyTimelineQuestionParser questionParser;

  static final AstronomyTimelineQuestionService singleton =
      AstronomyTimelineQuestionService.internal();

  factory AstronomyTimelineQuestionService(
      {required AstronomyTimelineQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  AstronomyTimelineQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question);
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswers(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return questionParser.getQuizAnswerOptions(question);
  }

  List<String> getOrderedAnswerOptions(
      Set<String> options, QuestionCategory cat) {
    return questionParser.getOrderedAnswerOptions(options, cat);
  }
}
