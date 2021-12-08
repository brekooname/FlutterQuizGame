import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';

class QuestionDifficulty {
  int index;
  List<QuestionCategory> categories;

  QuestionDifficulty(
      {required this.index,  required this.categories});

  String get name {
    return "diff" + index.toString();
  }

  @override
  String toString() {
    return 'QuestionDifficulty{name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is QuestionDifficulty &&
              index == other.index &&
              name == other.name;

  @override
  int get hashCode =>
      index.hashCode ^
      name.hashCode ^
      categories.hashCode;

}
