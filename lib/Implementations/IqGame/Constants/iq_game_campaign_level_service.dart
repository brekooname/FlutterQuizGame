import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';

class IqGameCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

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
      )
    ];
    return singleton;
  }

  IqGameCampaignLevelService.internal();
}
