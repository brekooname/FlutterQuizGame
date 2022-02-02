import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

abstract class PersTestGameType  {

  ImageService imageService = ImageService();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  CampaignLevel campaignLevel;
  QuestionInfo currentQuestionInfo;
  PersTestGameContext gameContext;
  PersTestGameScreenManagerState gameScreenManagerState;


  PersTestGameType(this.campaignLevel, this.currentQuestionInfo,
      this.gameContext, this.gameScreenManagerState);

  Widget createGamePlayContent(BuildContext context);

  Widget createGameOverContent(BuildContext context);
}
