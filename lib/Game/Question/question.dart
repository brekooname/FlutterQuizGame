import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

class Question {
  int lineInFile;
  QuestionDifficulty difficulty;
  QuestionCategory category;
  String rawString;

  Question(this.lineInFile, this.difficulty, this.category, this.rawString);

  QuestionService getQuestionService() {
    return category.questionCategoryService.getQuestionService();
  }

  @override
  String toString() {
    return 'Question{lineInFile: $lineInFile, difficulty: $difficulty, category: $category, rawString: $rawString}';
  }
}
