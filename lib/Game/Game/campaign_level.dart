import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';

class CampaignLevel {
  QuestionDifficulty difficulty;
  List<QuestionCategory> category;

  CampaignLevel({
    required this.difficulty,
    required this.category,
  });

  String get name {
    return difficulty.name + category.map((e) => e.name).toList().toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignLevel &&
          difficulty == other.difficulty &&
          category == other.category;

  @override
  int get hashCode => difficulty.hashCode ^ category.hashCode;
}
