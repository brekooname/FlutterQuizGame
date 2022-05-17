import 'dart:convert';

import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class IqGameLocalStorage extends QuizGameLocalStorage {
  static final IqGameLocalStorage singleton = IqGameLocalStorage.internal();

  factory IqGameLocalStorage() {
    return singleton;
  }

  IqGameLocalStorage.internal();

  void putAnsweredQuestions(
      Map<String, List<String>> questionWithAnswer, QuestionCategory category) {
    localStorage.setString(
        _answeredQuestionsFieldName(category), jsonEncode(questionWithAnswer));
  }

  Map<String, List<String>> getAnsweredQuestions(QuestionCategory category) {
    String? json =
        localStorage.getString(_answeredQuestionsFieldName(category));
    if (json == null || json.isEmpty) {
      return {};
    }
    Map<String, List<String>> result = {};
    Map<String, dynamic> decoded = jsonDecode(json);
    for (var e in decoded.entries) {
      result.putIfAbsent(e.key,
          () => (e.value as List<dynamic>).map((e) => e.toString()).toList());
    }
    return result;
  }

  String _answeredQuestionsFieldName(QuestionCategory category) {
    return localStorageName + "_" + category.name + "_answeredQuestions";
  }

  @override
  void clearAll() {
    IqGameQuestionConfig config = IqGameQuestionConfig();
    for (QuestionCategory cat in config.categories) {
      localStorage.setString(_answeredQuestionsFieldName(cat), "");
    }
    super.clearAll();
  }
}
