import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

import '../../../main.dart';

class HangmanLocalStorage extends QuizGameLocalStorage {
  static final HangmanLocalStorage singleton = HangmanLocalStorage.internal();

  factory HangmanLocalStorage() {
    return singleton;
  }

  HangmanLocalStorage.internal();

  int getFoundWordsInOneGameForCatDiff(
      QuestionCategory cat, QuestionDifficulty diff) {
    return localStorage
            .getInt(_getFoundWordsInOneGameForCatDiffFieldName(cat, diff)) ??
        -1;
  }

  void setFoundWordsInOneGameForCatDiff(
      QuestionCategory cat, QuestionDifficulty diff, int value) {
    if (value > getFoundWordsInOneGameForCatDiff(cat, diff)) {
      localStorage.setInt(
          _getFoundWordsInOneGameForCatDiffFieldName(cat, diff), value);
    }
  }

  String _getFoundWordsInOneGameForCatDiffFieldName(
      QuestionCategory cat, QuestionDifficulty diff) {
    return localStorageName +
        "_FoundWordsInOneGameForCatDiff_" +
        cat.index.toString() +
        "_" +
        diff.index.toString();
  }

  @override
  void clearAll() {
    super.clearAll();
    var gameConfig = MyApp.appId.gameConfig;
    for (var diff in gameConfig.questionDifficulties) {
      for (var cat in gameConfig.questionCategories) {
        localStorage.setInt(
            _getFoundWordsInOneGameForCatDiffFieldName(cat, diff), -1);
      }
    }
  }
}
