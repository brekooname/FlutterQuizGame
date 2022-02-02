import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';

class GeoQuizCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;
  late CampaignLevel level_3;

  static final GeoQuizCampaignLevelService singleton =
      GeoQuizCampaignLevelService.internal();

  factory GeoQuizCampaignLevelService() {
    var questionConfig = GeoQuizGameQuestionConfig();
    singleton.allLevels = [
      singleton.level_0 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat0,
          questionConfig.cat2,
          questionConfig.cat3,
          questionConfig.cat5,
          questionConfig.cat6,
          questionConfig.cat7,
          questionConfig.cat8,
        ],
      ),
      singleton.level_1 = CampaignLevel(
        difficulty: questionConfig.diff1,
        categories: [
          questionConfig.cat1,
          questionConfig.cat2,
          questionConfig.cat3,
          questionConfig.cat4,
          questionConfig.cat5,
          questionConfig.cat6,
          questionConfig.cat7,
          questionConfig.cat8,
          questionConfig.cat9,
        ],
      ),
      singleton.level_2 = CampaignLevel(
        difficulty: questionConfig.diff2,
        categories: [
          questionConfig.cat2,
          questionConfig.cat3,
          questionConfig.cat4,
          questionConfig.cat5,
          questionConfig.cat6,
          questionConfig.cat7,
          questionConfig.cat8,
          questionConfig.cat9,
        ],
      ),
      singleton.level_3 = CampaignLevel(
        difficulty: questionConfig.diff3,
        categories: [
          questionConfig.cat2,
          questionConfig.cat4,
          questionConfig.cat5,
          questionConfig.cat6,
          questionConfig.cat7,
          questionConfig.cat8,
          questionConfig.cat9,
        ],
      )
    ];
    return singleton;
  }

  GeoQuizCampaignLevelService.internal();
}
