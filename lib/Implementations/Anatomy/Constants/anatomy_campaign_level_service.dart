import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';

class AnatomyCampaignLevelService extends CampaignLevelService {
  static final AnatomyCampaignLevelService singleton =
      AnatomyCampaignLevelService.internal();

  factory AnatomyCampaignLevelService() {
    var questionConfig = AnatomyGameQuestionConfig();
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
    return singleton;
  }

  AnatomyCampaignLevelService.internal();
}
