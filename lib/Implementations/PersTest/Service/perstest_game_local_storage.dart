import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

import '../../../main.dart';

class PersTestLocalStorage extends QuizGameLocalStorage {
  static final PersTestLocalStorage singleton = PersTestLocalStorage.internal();

  factory PersTestLocalStorage() {
    return singleton;
  }

  PersTestLocalStorage.internal();

  int getUserAge() {
    return localStorage.getInt(_getPersTestUserAgeFieldName()) ?? -1;
  }

  void setUserAge(int age) {
    if (age > 0 && age <= 100) {
      localStorage.setInt(_getPersTestUserAgeFieldName(), age);
    }
  }

  List<PersTestGameTypeAttrStorage> getGameTypeResults(QuestionDifficulty diff,
      QuestionCategory cat) {
    return PersTestGameTypeStorage
        .decode(localStorage
        .getString(_getPersTestGameTypeFieldName(diff, cat)) ??
        "")
        ?.attrs ??
        [];
  }

  void storeGameTypeResults(QuestionDifficulty diff, QuestionCategory cat,
      List<PersTestGameTypeAttrStorage> attrs) {
    localStorage.setString(_getPersTestGameTypeFieldName(diff, cat),
        PersTestGameTypeStorage(cat, diff, attrs).encode());
  }

  String _getPersTestGameTypeFieldName(QuestionDifficulty diff,
      QuestionCategory cat) {
    return localStorageName + "_PersTestGameType_" + cat.name + "_" + diff.name;
  }

  String _getPersTestUserAgeFieldName() {
    return localStorageName + "_getPersTestUserAgeFieldName";
  }

  void clearAge() {
    localStorage.setInt(_getPersTestUserAgeFieldName(), -1);
  }

  @override
  void clearAll() {
    super.clearAll();
    clearAge();
    var gameConfig = MyApp.appId.gameConfig;
    for (var diff in gameConfig.questionDifficulties) {
      for (var cat in gameConfig.questionCategories) {
        localStorage.setString(_getPersTestGameTypeFieldName(diff, cat), "");
      }
    }
  }
}

class PersTestGameTypeStorage {
  QuestionCategory cat;
  QuestionDifficulty diff;
  List<PersTestGameTypeAttrStorage> attrs;

  PersTestGameTypeStorage(this.cat, this.diff, this.attrs);

  static PersTestGameTypeStorage? decode(String encoded) {
    if (encoded.isEmpty) {
      return null;
    }
    var split = encoded.split("_");
    var gameConfig = MyApp.appId.gameConfig;
    QuestionCategory cat =
    gameConfig.questionCategories.firstWhere((e) => e.name == split[0]);
    QuestionDifficulty diff =
    gameConfig.questionDifficulties.firstWhere((e) => e.name == split[1]);
    List<PersTestGameTypeAttrStorage> attrs = split[2].split(";").map((e) {
      var eSplit = e.split(":");
      return PersTestGameTypeAttrStorage(eSplit[0], eSplit[1]);
    }).toList();
    return PersTestGameTypeStorage(cat, diff, attrs);
  }

  String encode() {
    return cat.name +
        "_" +
        diff.name +
        "_" +
        attrs.map((e) => e.attrKey + ":" + e.attrValue).join(";");
  }
}

class PersTestGameTypeAttrStorage {
  String attrKey;
  String attrValue;

  PersTestGameTypeAttrStorage(this.attrKey, this.attrValue);
}
