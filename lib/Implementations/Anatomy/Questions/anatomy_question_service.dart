import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_question_parser.dart';


class AnatomyQuestionService extends QuestionService {
  late AnatomyQuestionParser questionParser;

  static final AnatomyQuestionService singleton =
  AnatomyQuestionService.internal();

  factory AnatomyQuestionService(
      {required AnatomyQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  AnatomyQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question);
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return questionParser.getAnswerOptions(question.rawString, 1);
  }
}
