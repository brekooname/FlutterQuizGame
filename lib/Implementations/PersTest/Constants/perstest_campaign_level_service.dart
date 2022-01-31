import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';

class PersTestCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

  static final PersTestCampaignLevelService singleton =
      PersTestCampaignLevelService.internal();

  factory PersTestCampaignLevelService() {
    var questionConfig = PersTestGameQuestionConfig();
    singleton.level_0 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [
        questionConfig.cat0,
      ],
    );
    return singleton;
  }

  PersTestCampaignLevelService.internal();

  @override
  List<CampaignLevel> get allLevels => [level_0];
}
