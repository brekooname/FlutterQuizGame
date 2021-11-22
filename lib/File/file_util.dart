import 'dart:io';

import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/game.dart';

class FileUtil {
  static List<String> getTextForConfig(
      QuestionDifficulty difficultyLevelToCreate,
      QuestionCategory categoryEnumToCreate)  {
    return File(getQuestionFilePath(difficultyLevelToCreate, categoryEnumToCreate)).readAsLinesSync();
  }

  static List<String> getTextFromPath(String path) {
    return File(path).readAsLinesSync();
  }

  static String getQuestionFilePath(QuestionDifficulty difficultyLevelToCreate,
      QuestionCategory categoryEnumToCreate) {
    var gameName = Game.getGameId().name;
    var diffIndex = difficultyLevelToCreate.index;
    var categIndex = categoryEnumToCreate.index;
    return "implementations/$gameName/questions/en/diff$diffIndex/questions_diff${diffIndex}_cat$categIndex.txt";
  }
}
