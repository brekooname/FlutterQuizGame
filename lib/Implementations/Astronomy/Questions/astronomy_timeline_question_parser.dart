import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

class AstronomyTimelineQuestionParser extends QuestionParser {
  static const String delimiter = "::";
  
  static final AstronomyTimelineQuestionParser singleton =
      AstronomyTimelineQuestionParser.internal();

  factory AstronomyTimelineQuestionParser() {
    return singleton;
  }

  AstronomyTimelineQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(delimiter)[0].split("##")[1];
  }

  List<String> getCorrectAnswers(Question question) {
    return [question.rawString.split(delimiter)[1]];
  }

  List<String> getOrderedAnswerOptions(
      Set<String> options, QuestionCategory cat) {
    var allQuestions =
        questionCollectorService.getAllQuestions(categories: [cat]);
    allQuestions.sort((a, b) => a.rawString
        .split("##")[0]
        .parseToInt
        .compareTo(b.rawString.split("##")[0].parseToInt));
    List<String> res = [];
    for (Question q in allQuestions) {
      var answ = getCorrectAnswers(q).first;
      if (options.contains(answ) && !res.contains(answ)) {
        res.add(answ);
      }
    }
    return res;
  }

  Set<String> getQuizAnswerOptions(Question question) {
    var allQuestions = questionCollectorService
        .getAllQuestions(categories: [question.category]);
    Set<String> opt = {getCorrectAnswers(question).first};
    List<int> ansRef = question.rawString
        .split(delimiter)[2]
        .split(",")
        .map((e) => e.parseToInt)
        .toList();
    int i = 0;
    for (Question q in allQuestions) {
      if (ansRef.contains(i)) {
        opt.add(getCorrectAnswers(q).first);
      }
      i++;
    }
    return opt;
  }
}
