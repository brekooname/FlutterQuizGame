import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_game_question_config.dart';

import '../../../Game/Question/Model/question_category.dart';
import '../../../Game/Question/Model/question_difficulty.dart';

class HangmanCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

  static final HangmanCampaignLevelService singleton =
      HangmanCampaignLevelService.internal();

  factory HangmanCampaignLevelService() {
    var questionConfig = HangmanGameQuestionConfig();

    singleton.allLevels = [];
    for (QuestionDifficulty diff in questionConfig.difficulties) {
      for (QuestionCategory cat in questionConfig.categories) {
        singleton.allLevels.add(CampaignLevel(
          difficulty: diff,
          categories: [
            cat,
          ],
        ));
      }
    }

    singleton.level_0 = singleton.allLevels[0];

    return singleton;
  }

  HangmanCampaignLevelService.internal();
}
