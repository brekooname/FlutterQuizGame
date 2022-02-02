import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';

class HistoryCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;
  late CampaignLevel level_3;

  static final HistoryCampaignLevelService singleton =
      HistoryCampaignLevelService.internal();

  factory HistoryCampaignLevelService() {
    var questionConfig = HistoryGameQuestionConfig();
    singleton.allLevels = [
      singleton.level_0 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat0,
          questionConfig.cat1,
          questionConfig.cat2,
          questionConfig.cat3,
          questionConfig.cat4
        ],
      ),
      singleton.level_1 = CampaignLevel(
        difficulty: questionConfig.diff1,
        categories: [
          questionConfig.cat0,
          questionConfig.cat1,
          questionConfig.cat2,
          questionConfig.cat3,
          questionConfig.cat4
        ],
      ),
      singleton.level_2 = CampaignLevel(
        difficulty: questionConfig.diff2,
        categories: [
          questionConfig.cat0,
          questionConfig.cat1,
          questionConfig.cat2,
          questionConfig.cat3,
          questionConfig.cat4
        ],
      ),
      singleton.level_3 = CampaignLevel(
        difficulty: questionConfig.diff3,
        categories: [
          questionConfig.cat0,
          questionConfig.cat2,
          questionConfig.cat3,
        ],
      )
    ];
    return singleton;
  }

  HistoryCampaignLevelService.internal();
}
