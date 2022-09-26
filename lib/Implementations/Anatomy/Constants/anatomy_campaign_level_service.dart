import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';

class AnatomyCampaignLevelService extends CampaignLevelService {
  late CampaignLevel levelImageClick; //Organs diagram image click
  late CampaignLevel levelTrivia; //Organs trivia
  late CampaignLevel levelDiseaseTrivia; //Organs disease trivia
  late CampaignLevel levelDiseaseSymp; //Organs disease symptoms
  late CampaignLevel levelImageTrivia; //Organs image trivia

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
    singleton.levelImageClick = singleton.allLevels[0];
    singleton.levelTrivia = singleton.allLevels[12];
    singleton.levelDiseaseTrivia = singleton.allLevels[24];
    singleton.levelDiseaseSymp = singleton.allLevels[36];
    singleton.levelImageTrivia = singleton.allLevels[53];
    return singleton;
  }

  AnatomyCampaignLevelService.internal();
}
