import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';

class AnatomyQuestionParser extends QuestionParser {
  AnatomyGameQuestionConfig questionConfig = AnatomyGameQuestionConfig();
  static final AnatomyQuestionParser singleton =
      AnatomyQuestionParser.internal();

  factory AnatomyQuestionParser() {
    return singleton;
  }

  AnatomyQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    Question? questionOpt = questionCollectorService.getAllQuestions(
        difficulties: [
          questionConfig.diff0
        ],
        categories: [
          question.category
        ]).firstWhereOrNull((element) => element.index == question.index);
    if (questionOpt == null) {
      return [];
    }
    return [questionOpt.rawString.split(":")[0]];
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0];
  }
}
