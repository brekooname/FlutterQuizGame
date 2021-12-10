import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import '../../main.dart';
import 'Model/category_difficulty.dart';

abstract class AllQuestionsService {

  Map<CategoryDifficulty, List<Question>>? allQuestionsCache;

  Map<CategoryDifficulty, List<Question>> get allQuestions {
    if (allQuestionsCache == null) {
      Language language = Language.values
          .firstWhere((element) => element.name() == MyApp.languageCode);

      allQuestionsCache = getAllQuestionsWithLanguages().get(language) ??
          getAllQuestionsWithLanguages().get(Language.en);
    }
    return allQuestionsCache!;
  }

  Map<Language, Map<CategoryDifficulty, List<Question>>> getAllQuestionsWithLanguages();

  void addQuestions(
      Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      Language language,
      QuestionCategory cat,
      QuestionDifficulty diff,
      List<String> strings) {
    Map<CategoryDifficulty, List<Question>>? map = result.get(language);
    if (map == null) {
      result.putIfAbsent(
          language, () => HashMap<CategoryDifficulty, List<Question>>());
      map = result.get(language);
    }
    _addQuestions(map, cat, diff, strings);
  }

  void _addQuestions(result, QuestionCategory cat, QuestionDifficulty diff,
      List<String> strings) {
    var categoryDifficulty = CategoryDifficulty(
      cat,
      diff,
    );
    result.putIfAbsent(categoryDifficulty,
        () => _createQuestions(categoryDifficulty, strings));
  }

  List<Question> _createQuestions(
      CategoryDifficulty categoryDifficulty, List<String> strings) {
    List<Question> result = [];
    for (int i = 0; i < strings.length; i++) {
      result.add(Question(i, categoryDifficulty.difficulty,
          categoryDifficulty.category, strings[i]));
    }
    return result;
  }
}
