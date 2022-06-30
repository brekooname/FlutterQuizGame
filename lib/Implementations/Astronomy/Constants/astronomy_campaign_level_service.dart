import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';

class AstronomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

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
      )
    ];
    return singleton;
  }

  AstronomyCampaignLevelService.internal();
}
