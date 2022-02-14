import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_game_question_config.dart';

class DopeWarsCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

  static final DopeWarsCampaignLevelService singleton =
      DopeWarsCampaignLevelService.internal();

  factory DopeWarsCampaignLevelService() {
    var questionConfig = DopeWarsGameQuestionConfig();
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

  DopeWarsCampaignLevelService.internal();
}
