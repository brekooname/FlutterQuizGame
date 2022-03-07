import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';

class AnatomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

  static final AnatomyCampaignLevelService singleton =
      AnatomyCampaignLevelService.internal();

  factory AnatomyCampaignLevelService() {
    var questionConfig = AnatomyGameQuestionConfig();
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

  AnatomyCampaignLevelService.internal();
}
