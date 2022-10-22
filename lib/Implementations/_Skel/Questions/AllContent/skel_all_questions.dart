import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Constants/skel_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class SkelAllQuestions extends AllQuestionsService {
  static final SkelAllQuestions singleton = SkelAllQuestions.internal();

  factory SkelAllQuestions() {
    return singleton;
  }

  SkelAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    // ignore: unused_local_variable
    var questionConfig = SkelGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();

    return result;
  }
}
