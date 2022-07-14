import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';

import '../../../Game/Question/Model/question_category.dart';
import '../../../Game/Question/Model/question_difficulty.dart';

class AstronomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;

  late List<AstronomyGameType> gameTypes;

  static final AstronomyCampaignLevelService singleton =
      AstronomyCampaignLevelService.internal();

  factory AstronomyCampaignLevelService() {
    var questionConfig = AstronomyGameQuestionConfig();

    singleton.allLevels = [];
    for (QuestionCategory cat in questionConfig.categories) {
      for (QuestionDifficulty diff in questionConfig.difficulties) {
        singleton.allLevels.add(CampaignLevel(
          difficulty: diff,
          categories: [
            cat,
          ],
        ));
      }
    }

    singleton.level_0 = singleton.allLevels[0];
    singleton.level_1 = singleton.allLevels[1];

    singleton.gameTypes = [
      AstronomyGameType(
        0,
        "Solar System",
        singleton.allLevels.sublist(0, 1),
      ),
      AstronomyGameType(
        1,
        "Planets",
        singleton.allLevels.sublist(1, 7),
      ),
      AstronomyGameType(
        2,
        "Astronomy Trivia",
        singleton.allLevels.sublist(7, 11),
      ),
      AstronomyGameType(
        3,
        "Recognize the Image",
        singleton.allLevels.sublist(11, 14),
      ),
    ];

    return singleton;
  }

  bool isPlanetsGameType(AstronomyGameType gameType) {
    return gameType.id == 1;
  }

  bool isImageQuestionGameType(AstronomyGameType gameType) {
    return gameType.id == 3;
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
