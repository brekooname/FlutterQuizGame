import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';

class HistoryCampaignLevel extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;
  late CampaignLevel level_3;

  static final HistoryCampaignLevel singleton = HistoryCampaignLevel.internal();

  factory HistoryCampaignLevel() {
    var questionConfig = HistoryGameQuestionConfig();
    singleton.level_0 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [
        questionConfig.cat0,
        questionConfig.cat1,
        questionConfig.cat2,
        questionConfig.cat3,
        questionConfig.cat4
      ],
    );
    singleton.level_1 = CampaignLevel(
      difficulty: questionConfig.diff1,
      category: [
        questionConfig.cat0,
        questionConfig.cat1,
        questionConfig.cat2,
        questionConfig.cat3,
        questionConfig.cat4
      ],
    );
    singleton.level_2 = CampaignLevel(
      difficulty: questionConfig.diff2,
      category: [
        questionConfig.cat0,
        questionConfig.cat1,
        questionConfig.cat2,
        questionConfig.cat3,
        questionConfig.cat4
      ],
    );
    singleton.level_3 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
        questionConfig.cat2,
        questionConfig.cat3,
      ],
    );
    return singleton;
  }

  HistoryCampaignLevel.internal();

  @override
  List<CampaignLevel> get allLevels => [level_0, level_1, level_2, level_3];
}
