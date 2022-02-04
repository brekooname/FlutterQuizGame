import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_bigfive_play.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

abstract class PersTestGameTypePlay {
  ImageService imageService = ImageService();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  CampaignLevel campaignLevel;
  late QuestionCategory category;
  late QuestionDifficulty difficulty;

  PersTestGameTypePlay(this.campaignLevel) {
    difficulty = campaignLevel.difficulty;
    category = campaignLevel.categories.first;
  }

  Widget createGamePlayContent(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState);

  void storeResultsToStorage(PersTestGameContext gameContext);

  Widget createResultsReportContent(BuildContext context);

  static PersTestGameTypePlay createGameType(CampaignLevel campaignLevel) {
    var questionConfig = PersTestGameQuestionConfig();
    if (campaignLevel.categories.first == questionConfig.cat0) {
      return PersTestGameTypeBigFivePlay(campaignLevel);
    }
    throw UnimplementedError("no gametype for category");
  }
}
