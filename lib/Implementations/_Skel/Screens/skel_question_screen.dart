import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Constants/skel_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Questions/skel_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Service/skel_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Service/skel_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class SkelQuestionScreen extends GameScreen<
    SkelGameContext,
    SkelScreenManagerState,
    SkelCampaignLevelService> with QuizOptionsGameScreen<QuizQuestionManager> {
  SkelQuestionScreen(
    SkelScreenManagerState gameScreenManagerState, {
    Key? key,
    required SkelGameContext gameContext,
    required QuestionInfo questionInfo,
  }) : super(gameScreenManagerState, gameContext, [questionInfo], key: key) {
    initQuizOptionsScreen(
        QuizQuestionManager<SkelGameContext, SkelLocalStorage>(
            gameContext, currentQuestionInfo, SkelLocalStorage()));
  }

  @override
  SkelCampaignLevelService get campaignLevelService =>
      SkelCampaignLevelService();

  @override
  State<SkelQuestionScreen> createState() => SkelQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class SkelQuestionScreenState extends State<SkelQuestionScreen>
    with ScreenState, LabelMixin {
  final QuizQuestionContainer _quizQuestionContainer = QuizQuestionContainer();

  @override
  void initState() {
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void setStateCallback() {
    setState(() {});
  }
}
