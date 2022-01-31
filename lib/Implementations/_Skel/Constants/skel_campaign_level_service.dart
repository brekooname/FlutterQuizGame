import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Constants/skel_game_question_config.dart';

class SkelCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

  static final SkelCampaignLevelService singleton =
      SkelCampaignLevelService.internal();

  factory SkelCampaignLevelService() {
    var questionConfig = SkelGameQuestionConfig();
    singleton.level_0 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [
        questionConfig.cat0,
      ],
    );
    return singleton;
  }

  SkelCampaignLevelService.internal();

  @override
  List<CampaignLevel> get allLevels => [level_0];
}
