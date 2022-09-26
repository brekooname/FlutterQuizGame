import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Hangman/hangman_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class HangmanQuestionScreen extends GameScreen<
    HangmanGameContext,
    HangmanScreenManagerState,
    HangmanCampaignLevelService> with HangmanGameScreen<QuizQuestionManager> {
  HangmanQuestionScreen(
    HangmanScreenManagerState gameScreenManagerState, {
    Key? key,
    required HangmanGameContext gameContext,
    required QuestionInfo questionInfo,
  }) : super(gameScreenManagerState, gameContext, [questionInfo], key: key) {
    initHangmanGameScreen(
        QuizQuestionManager<HangmanGameContext, HangmanLocalStorage>(
            gameContext, currentQuestionInfo, HangmanLocalStorage()));
  }

  @override
  HangmanCampaignLevelService get campaignLevelService =>
      HangmanCampaignLevelService();

  @override
  State<HangmanQuestionScreen> createState() => HangmanQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class HangmanQuestionScreenState extends State<HangmanQuestionScreen>
    with ScreenState, LabelMixin {

  @override
  void initState() {
    super.initState();
    initScreenState();
    widget.pressFirstAndLastLetter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      widget.createWordContainer(),
      widget.createLettersRows(
          setStateCallback,
          widget.goToNextGameScreen,
          label.l_a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z)
    ]);
  }

  void setStateCallback() {
    setState(() {});
  }
}
