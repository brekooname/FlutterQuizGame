import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class AnatomyAllQuestions extends AllQuestionsService {
  static final AnatomyAllQuestions singleton = AnatomyAllQuestions.internal();

  factory AnatomyAllQuestions() {
    return singleton;
  }

  AnatomyAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = AnatomyGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();

    return result;
  }
}
