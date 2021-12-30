import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
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

  List<String> getLostQuestions(QuestionDifficulty diff) {
    return localStorage.getStringList(_getLostQuestionsFieldName(diff)) ?? [];
  }

  List<String> _getTimelineShownImages(QuestionDifficulty diff) {
    return localStorage
            .getStringList(_getTimelineShownImagesHintFieldName(diff)) ??
        [];
  }

  void setTimelineShownImagesQuestion(
      QuestionDifficulty diff, QuestionCategory cat, int qIndex) {
    updateList(diff, cat, qIndex, _getTimelineShownImages(diff),
        _getTimelineShownImagesHintFieldName(diff));
  }

  bool isTimelineImageShown(Question question) {
    List<String> list = _getTimelineShownImages(question.difficulty);
    return list.contains(getQuestionStorageKey(
        question.category, question.difficulty, question.index));
  }

  int getRemainingHints(QuestionDifficulty diff) {
    return localStorage.getInt(_getRemainingHintsFieldName(diff)) ?? -1;
  }

  void setRemainingHints(QuestionDifficulty diff, int hints) {
    if (hints >= 0) {
      localStorage.setInt(_getRemainingHintsFieldName(diff), hints);
    }
  }

  int getTotalWonQuestions(QuestionDifficulty diff) {
    return localStorage.getInt(_getTotalWonQuestionsFieldName(diff)) ?? 0;
  }

  void setTotalWonQuestions(QuestionDifficulty diff, int val) {
    localStorage.setInt(_getTotalWonQuestionsFieldName(diff), val);
  }

  void setLostQuestion(Question question) {
    updateList(
        question.difficulty,
        question.category,
        question.index,
        getLostQuestions(question.difficulty),
        _getLostQuestionsFieldName(question.difficulty));
  }

  void setWonQuestion(Question question) {
    List<String> list = getWonQuestions(question.difficulty);
    updateList(question.difficulty, question.category, question.index, list,
        _getWonQuestionsFieldName(question.difficulty));
    if (list.length > getTotalWonQuestions(question.difficulty)) {
      setTotalWonQuestions(question.difficulty, list.length);
    }
  }

  void updateList(QuestionDifficulty diff, QuestionCategory cat, int qIndex,
      List<String> list, String fieldName) {
    var qKey = getQuestionStorageKey(cat, diff, qIndex);
    if (!list.contains(qKey)) {
      list.add(qKey);
      localStorage.setStringList(fieldName, list);
    }
  }

  String getQuestionStorageKey(
          QuestionCategory cat, QuestionDifficulty diff, int qIndex) =>
      cat.name + "_" + diff.name + "_" + qIndex.toString();

  String _getWonQuestionsFieldName(QuestionDifficulty difficulty) {
    return localStorageName + "_" + difficulty.name + "_finishedQ";
  }

  String _getLostQuestionsFieldName(QuestionDifficulty difficulty) {
    return localStorageName + "_" + difficulty.name + "_finishedLostQ";
  }

  String _getTotalWonQuestionsFieldName(QuestionDifficulty difficulty) {
    return localStorageName + "_" + difficulty.name + "_TotalWonQuestions";
  }

  String _getRemainingHintsFieldName(QuestionDifficulty difficulty) {
    return localStorageName + "_" + difficulty.name + "_RemainingHints";
  }

  String _getTimelineShownImagesHintFieldName(QuestionDifficulty difficulty) {
    return localStorageName +
        "_" +
        difficulty.name +
        "_TimelineShownImagesHint";
  }

  void clearAll() {
    for (var diff in HistoryGameQuestionConfig().difficulties) {
      resetLevel(diff);
      localStorage.setInt(_getTotalWonQuestionsFieldName(diff), 0);
    }
  }

  void resetLevel(QuestionDifficulty diff) {
    localStorage.setStringList(_getWonQuestionsFieldName(diff), []);
    localStorage.setStringList(_getTimelineShownImagesHintFieldName(diff), []);
    localStorage.setInt(_getRemainingHintsFieldName(diff), -1);
  }
}
