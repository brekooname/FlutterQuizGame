import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

class Question {
  int index;
  QuestionDifficulty difficulty;
  QuestionCategory category;
  String rawString;

  Question(this.index, this.difficulty, this.category, this.rawString);

  QuestionService getQuestionService() {
    return category.questionCategoryService.getQuestionService();
  }

  @override
  String toString() {
    return 'Question{lineInFile: $index, difficulty: $difficulty, category: $category, rawString: $rawString}';
  }
}
