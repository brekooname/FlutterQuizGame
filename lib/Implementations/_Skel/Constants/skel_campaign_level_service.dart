import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Constants/skel_game_question_config.dart';

import '../../../Game/Question/Model/question_category.dart';
import '../../../Game/Question/Model/question_difficulty.dart';

class SkelCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;

  static final SkelCampaignLevelService singleton =
      SkelCampaignLevelService.internal();

  factory SkelCampaignLevelService() {
    var questionConfig = SkelGameQuestionConfig();

    singleton.allLevels = [
      singleton.level_0 = CampaignLevel(
        difficulty: questionConfig.diff0,
        categories: [
          questionConfig.cat0,
        ],
      )
    ];
    //////////
    ////OR////
    //////////
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

    return singleton;
  }

  SkelCampaignLevelService.internal();
}
