import 'package:flutter/foundation.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';

class CampaignLevel {
  QuestionDifficulty difficulty;
  List<QuestionCategory> categories;

  CampaignLevel({
    required this.difficulty,
    required this.categories,
  });

  String get name {
    return difficulty.name + categories.map((e) => e.name).toList().toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignLevel &&
          difficulty == other.difficulty &&
          listEquals(categories, other.categories);

  @override
  int get hashCode => difficulty.hashCode ^ categories.hashCode;
}
