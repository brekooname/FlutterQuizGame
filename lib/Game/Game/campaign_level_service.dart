import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

import 'campaign_level.dart';

abstract class CampaignLevelService {

  List<CampaignLevel> allLevels();

  CampaignLevel campaignLevel(
      QuestionDifficulty difficulty, QuestionCategory category) {
    return allLevels().firstWhere((element) =>
    element.difficulty == difficulty &&
        element.category.contains(category));
  }
}
