import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';

class AnatomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0; //Organs diagram image click
  late CampaignLevel level_12;//Organs trivia
  late CampaignLevel level_24;//Organs disease trivia
  late CampaignLevel level_36;//Organs disease symptoms
  late CampaignLevel level_48;//Organs image trivia

  static final AnatomyCampaignLevelService singleton =
      AnatomyCampaignLevelService.internal();

  factory AnatomyCampaignLevelService() {
    var questionConfig = AnatomyGameQuestionConfig();
    singleton.allLevels = [];
    for (QuestionDifficulty diff in questionConfig.difficulties) {
      for (QuestionCategory cat in questionConfig.categories) {
        singleton.allLevels.add(CampaignLevel(
          difficulty: diff,
          categories: [
            cat,
          ],
        ));
      }
    }
    singleton.level_0 = singleton.allLevels[0];
    singleton.level_12 = singleton.allLevels[12];
    singleton.level_24 = singleton.allLevels[24];
    singleton.level_36 = singleton.allLevels[36];
    singleton.level_48 = singleton.allLevels[57];
    return singleton;
  }

  AnatomyCampaignLevelService.internal();
}
