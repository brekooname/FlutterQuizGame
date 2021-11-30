import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';

class FileUtil {
  late MyAppContext myAppContext;

  static final FileUtil singleton = FileUtil.internal();

  factory FileUtil({required MyAppContext myAppContext}) {
    singleton.myAppContext = myAppContext;
    return singleton;
  }

  FileUtil.internal();

  Future<String> getTextForConfig(QuestionDifficulty difficultyLevelToCreate,
      QuestionCategory categoryEnumToCreate) async {
    return await rootBundle.loadString(
        getQuestionFilePath(difficultyLevelToCreate, categoryEnumToCreate));
  }

  List<String> getTextFromPath(String path) {
    return File(path).readAsLinesSync();
  }

  String getQuestionFilePath(QuestionDifficulty difficultyLevelToCreate,
      QuestionCategory categoryEnumToCreate) {
    var gameName = myAppContext.appId.appKey;
    var diffIndex = difficultyLevelToCreate.index;
    var categIndex = categoryEnumToCreate.index;
    var langCode = myAppContext.languageCode;
    return "assets/implementations/$gameName/questions/$langCode/diff$diffIndex/questions_diff${diffIndex}_cat$categIndex.txt";
  }
}
