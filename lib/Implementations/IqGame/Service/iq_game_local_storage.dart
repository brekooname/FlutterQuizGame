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

  List<IqGameScoreInfo> getScoreForCat(String cat) {
    List<String>? jsonList =
        localStorage.getStringList(_getScoreForCatFieldName(cat));
    if (jsonList == null || jsonList.isEmpty) {
      return [];
    }
    return jsonList
        .map((json) => IqGameScoreInfo.fromJson(jsonDecode(json)))
        .toList();
  }

  void setScoreForCat(IqGameScoreInfo scoreInfo) {
    List<IqGameScoreInfo> scoreList = getScoreForCat(scoreInfo.category);
    scoreList.add(scoreInfo);
    localStorage.setStringList(_getScoreForCatFieldName(scoreInfo.category),
        scoreList.map((e) => jsonEncode(scoreInfo.toJson())).toList());
  }

  String _getScoreForCatFieldName(String cat) {
    return localStorageName + "_" + cat + "_ScoreForCat";
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

class IqGameScoreInfo {
  String category;
  int score;
  DateTime timeStamp;

  IqGameScoreInfo(this.category, this.score, this.timeStamp);

  IqGameScoreInfo.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        score = json['score'],
        timeStamp = DateTime.parse(json['timeStamp']);

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'score': score,
      'timeStamp': timeStamp.toString(),
    };
  }
}
