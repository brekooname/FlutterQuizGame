import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/my_local_storage.dart';

class HistoryLocalStorage extends MyLocalStorage {
  static final HistoryLocalStorage singleton = HistoryLocalStorage.internal();

  factory HistoryLocalStorage() {
    return singleton;
  }

  HistoryLocalStorage.internal();

  List<String> getWonQuestions(QuestionDifficulty diff) {
    return localStorage.getStringList(_getWonQuestionsFieldName(diff)) ?? [];
  }

  int getRemainingHints(QuestionDifficulty diff) {
    return localStorage.getInt(_getRemainingHintsFieldName(diff)) ?? -1;
  }

  void setRemainingHints(QuestionDifficulty diff, int hints) {
    localStorage.setInt(_getRemainingHintsFieldName(diff), hints);
  }

  void setWonQuestion(Question question) {
    List<String> list = getWonQuestions(question.difficulty);
    var qKey = getQuestionStorageKey(question);
    if (!list.contains(qKey)) {
      list.add(qKey);
    }
    localStorage.setStringList(
        _getWonQuestionsFieldName(question.difficulty), list);
  }

  String getQuestionStorageKey(Question question) =>
      question.category.name +
      "_" +
      question.difficulty.name +
      "_" +
      question.index.toString();

  String _getWonQuestionsFieldName(QuestionDifficulty difficulty) {
    return localStorageName + "_" + difficulty.name + "_finishedQ";
  }

  String _getRemainingHintsFieldName(QuestionDifficulty difficulty) {
    return localStorageName + "_" + difficulty.name + "_RemainingHints";
  }
}
