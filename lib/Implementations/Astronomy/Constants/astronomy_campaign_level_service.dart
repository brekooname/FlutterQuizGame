import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';

class AstronomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;
  late CampaignLevel level_3;
  late CampaignLevel level_4;
  late CampaignLevel level_5;
  late CampaignLevel level_6;
  late CampaignLevel level_7;

  static final AstronomyCampaignLevelService singleton =
      AstronomyCampaignLevelService.internal();

  factory AstronomyCampaignLevelService() {
    var questionConfig = AstronomyGameQuestionConfig();
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
      ),
      singleton.level_3 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat3,
        ],
      ),
      singleton.level_4 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat4,
        ],
      )
    ];
    return singleton;
  }

  AstronomyCampaignLevelService.internal();
}
