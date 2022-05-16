import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';

class IqGameCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;
  late CampaignLevel level_3;

  static final IqGameCampaignLevelService singleton =
      IqGameCampaignLevelService.internal();

  factory IqGameCampaignLevelService() {
    var questionConfig = IqGameQuestionConfig();
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
      )
    ];
    return singleton;
  }

  IqGameCampaignLevelService.internal();
}
