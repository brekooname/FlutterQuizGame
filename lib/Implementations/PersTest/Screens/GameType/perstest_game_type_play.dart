import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_play_five_options.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

abstract class PersTestGameTypePlay with LabelMixin {
  ImageService imageService = ImageService();
  MyAudioPlayer audioPlayer = MyAudioPlayer();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  CampaignLevel campaignLevel;
  late GameScreen gameScreen;
  late PersTestGameTypeReport gameTypeReport;
  late QuestionCategory category;
  late QuestionDifficulty difficulty;

  PersTestGameTypePlay(this.gameScreen, this.campaignLevel) {
    difficulty = campaignLevel.difficulty;
    category = campaignLevel.categories.first;
    gameTypeReport = PersTestGameTypeReport.createGameTypeReport(campaignLevel);
  }

  Widget createGamePlayContent(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState);

  static PersTestGameTypePlay createGameTypePlay(
      GameScreen gameScreen, CampaignLevel campaignLevel) {
    return PersTestGameTypePlayFiveOptions(gameScreen, campaignLevel);
  }
}
