import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';

class PersTestCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;

  static final PersTestCampaignLevelService singleton =
      PersTestCampaignLevelService.internal();

  factory PersTestCampaignLevelService() {
    var questionConfig = PersTestGameQuestionConfig();
    singleton.allLevels = [
      singleton.level_0 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat0,
        ],
      ),
      singleton.level_1 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat1,
        ],
      ),
      singleton.level_2 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat2,
        ],
      )
    ];
    return singleton;
  }

  PersTestCampaignLevelService.internal();
}
