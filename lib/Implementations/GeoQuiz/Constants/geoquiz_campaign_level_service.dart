import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';

class GeoQuizCampaignLevelService extends CampaignLevelService {
  late CampaignLevel level_0;
  late CampaignLevel level_1;
  late CampaignLevel level_2;
  late CampaignLevel level_3;
  late CampaignLevel level_4;
  late CampaignLevel level_5;
  late CampaignLevel level_6;
  late CampaignLevel level_7;
  late CampaignLevel level_8;
  late CampaignLevel level_9;
  late CampaignLevel level_10;
  late CampaignLevel level_11;

  static final GeoQuizCampaignLevelService singleton =
      GeoQuizCampaignLevelService.internal();

  factory GeoQuizCampaignLevelService() {
    var questionConfig = HistoryGameQuestionConfig();
    singleton.level_0 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_1 = CampaignLevel(
      difficulty: questionConfig.diff1,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_2 = CampaignLevel(
      difficulty: questionConfig.diff2,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_3 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_4 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_5 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_6 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_7 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_8 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_9 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_10 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    singleton.level_11 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [
        questionConfig.cat0,
      ],
    );
    return singleton;
  }

  GeoQuizCampaignLevelService.internal();

  @override
  List<CampaignLevel> get allLevels => [
        level_0,
        level_1,
        level_2,
        level_3,
        level_4,
        level_5,
        level_6,
        level_7,
        level_8,
        level_9,
        level_10,
        level_11,
      ];
}
