import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';

class QuestionDifficulty {
  int index;
  String name;
  List<QuestionCategory> categories;

  QuestionDifficulty(this.index, this.name, this.categories);
}
