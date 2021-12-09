import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';

import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';

class ExampleCampaignLevel {
  late CampaignLevel level_0_0;
  late CampaignLevel level_0_1;
  late CampaignLevel level_0_2;
  late CampaignLevel level_0_3;
  late CampaignLevel level_0_4;

  //
  late CampaignLevel level_1_0;
  late CampaignLevel level_1_1;
  late CampaignLevel level_1_2;
  late CampaignLevel level_1_3;
  late CampaignLevel level_1_4;

  //
  late CampaignLevel level_2_0;
  late CampaignLevel level_2_1;
  late CampaignLevel level_2_2;
  late CampaignLevel level_2_3;
  late CampaignLevel level_2_4;

  //
  late CampaignLevel level_3_0;
  late CampaignLevel level_3_1;
  late CampaignLevel level_3_2;
  late CampaignLevel level_3_3;
  late CampaignLevel level_3_4;

  static final ExampleCampaignLevel singleton = ExampleCampaignLevel.internal();

  factory ExampleCampaignLevel() {
    var questionConfig = HistoryGameQuestionConfig();
    //DIFF_0
    singleton.level_0_0 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [questionConfig.cat0],
    );
    singleton.level_0_1 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [questionConfig.cat1],
    );
    singleton.level_0_2 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [questionConfig.cat2],
    );
    singleton.level_0_3 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [questionConfig.cat3],
    );
    singleton.level_0_4 = CampaignLevel(
      difficulty: questionConfig.diff0,
      category: [questionConfig.cat4],
    );
    //
    //DIFF_1
    singleton.level_1_0 = CampaignLevel(
      difficulty: questionConfig.diff1,
      category: [questionConfig.cat0],
    );
    singleton.level_1_1 = CampaignLevel(
      difficulty: questionConfig.diff1,
      category: [questionConfig.cat1],
    );
    singleton.level_1_2 = CampaignLevel(
      difficulty: questionConfig.diff1,
      category: [questionConfig.cat2],
    );
    singleton.level_1_3 = CampaignLevel(
      difficulty: questionConfig.diff1,
      category: [questionConfig.cat3],
    );
    singleton.level_1_4 = CampaignLevel(
      difficulty: questionConfig.diff1,
      category: [questionConfig.cat4],
    );
    //
    //DIFF_2
    singleton.level_2_0 = CampaignLevel(
      difficulty: questionConfig.diff2,
      category: [questionConfig.cat0],
    );
    singleton.level_2_1 = CampaignLevel(
      difficulty: questionConfig.diff2,
      category: [questionConfig.cat1],
    );
    singleton.level_2_2 = CampaignLevel(
      difficulty: questionConfig.diff2,
      category: [questionConfig.cat2],
    );
    singleton.level_2_3 = CampaignLevel(
      difficulty: questionConfig.diff2,
      category: [questionConfig.cat3],
    );
    singleton.level_2_4 = CampaignLevel(
      difficulty: questionConfig.diff2,
      category: [questionConfig.cat4],
    );
    //
    //DIFF_3
    singleton.level_3_0 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [questionConfig.cat0],
    );
    singleton.level_3_1 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [questionConfig.cat1],
    );
    singleton.level_3_2 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [questionConfig.cat2],
    );
    singleton.level_3_3 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [questionConfig.cat3],
    );
    singleton.level_3_4 = CampaignLevel(
      difficulty: questionConfig.diff3,
      category: [questionConfig.cat4],
    );
    return singleton;
  }

  ExampleCampaignLevel.internal();
}
