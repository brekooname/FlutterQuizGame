import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_parser.dart';

import '../../Model/question.dart';

class ImageClickQuestionService extends QuestionService {
  late ImageClickQuestionParser questionParser;

  static final ImageClickQuestionService singleton =
      ImageClickQuestionService.internal();

  factory ImageClickQuestionService(
      {required ImageClickQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  ImageClickQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0];
  }

  List<String> getAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  List<ImageClickInfo> getQuizAnswerOptionsCoordinates(Question question) {
    return questionParser
        .getAnswerOptionQuestions(question)
        .map((e) => questionParser.getAnswerOptionCoordinates(e.rawString))
        .toList();
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return questionParser.getAnswerOptions(question);
  }

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return true;
  }

  @override
  bool isGameFinishedFailed(
      Question question, Iterable<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        !isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  @override
  bool isGameFinishedSuccessful(
      Question question, Iterable<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  @override
  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    return getAnswers(question);
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }
}
