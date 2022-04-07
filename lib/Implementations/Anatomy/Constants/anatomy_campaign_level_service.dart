import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';

class AnatomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_image_click; //Organs diagram image click
  late CampaignLevel level_trivia; //Organs trivia
  late CampaignLevel level_disease_trivia; //Organs disease trivia
  late CampaignLevel level_disease_symp; //Organs disease symptoms
  late CampaignLevel level_image_trivia; //Organs image trivia

  static final AnatomyCampaignLevelService singleton =
      AnatomyCampaignLevelService.internal();

  factory AnatomyCampaignLevelService() {
    var questionConfig = AnatomyGameQuestionConfig();
    singleton.allLevels = [];
    for (QuestionCategory cat in questionConfig.categories) {
      for (QuestionDifficulty diff in questionConfig.difficulties) {
        if (diff == questionConfig.diff3 &&
            (cat == questionConfig.cat6 || cat == questionConfig.cat8)) {
          continue;
        }
        singleton.allLevels.add(CampaignLevel(
          difficulty: diff,
          categories: [
            cat,
          ],
        ));
      }
    }
    singleton.level_image_click = singleton.allLevels[0];
    singleton.level_trivia = singleton.allLevels[12];
    singleton.level_disease_trivia = singleton.allLevels[24];
    singleton.level_disease_symp = singleton.allLevels[36];
    singleton.level_image_trivia = singleton.allLevels[53];
    return singleton;
  }

  AnatomyCampaignLevelService.internal();
}
