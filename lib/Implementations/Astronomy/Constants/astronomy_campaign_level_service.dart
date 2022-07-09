import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';

import '../../../Game/Question/Model/question_category.dart';

class AstronomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;
  late CampaignLevel level_3;
  late CampaignLevel level_4;
  late CampaignLevel level_5;
  late CampaignLevel level_6;

  late List<AstronomyGameType> gameTypes;

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
      ),
      singleton.level_4 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat4,
        ],
      ),
      singleton.level_5 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat5,
        ],
      ),
      singleton.level_6 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat6,
        ],
      )
    ];

    singleton.gameTypes = [
      AstronomyGameType(
        0,
        "Solar System",
        [
          singleton.level_0,
        ],
      ),
      AstronomyGameType(
        1,
        "Planets",
        [
          singleton.level_1,
          singleton.level_2,
          singleton.level_3,
          singleton.level_4,
          singleton.level_5,
          singleton.level_6,
        ],
      ),
    ];

    return singleton;
  }

  AstronomyGameType findGameTypeForCategory(QuestionCategory cat) {
    var questionConfig = AstronomyGameQuestionConfig();
    return gameTypes.firstWhere((element) => element.gameTypeCampaignLevels
        .contains(campaignLevel(questionConfig.diff0, cat)));
  }

  AstronomyCampaignLevelService.internal();
}

class AstronomyGameType {
  int id;
  String gameTypeLabel;
  List<CampaignLevel> gameTypeCampaignLevels;

  AstronomyGameType(this.id, this.gameTypeLabel, this.gameTypeCampaignLevels);
}
