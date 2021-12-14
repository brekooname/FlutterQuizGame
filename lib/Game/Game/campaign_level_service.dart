import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';

import 'campaign_level.dart';

abstract class CampaignLevelService {

  List<CampaignLevel> get allLevels;

  CampaignLevel campaignLevel(
      QuestionDifficulty difficulty, QuestionCategory category) {
    return allLevels.firstWhere((element) =>
    element.difficulty == difficulty &&
        element.category.contains(category));
  }
}
