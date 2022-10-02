import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
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
  late final Map<int, Image> _hImages = {};
  late final Map<int, Image> _skybImages = {};

  @override
  void initState() {
    super.initState();
    initScreenState();
    widget.pressFirstAndLastLetter();

    for (int i = 0; i < 7; i++) {
      _hImages.putIfAbsent(i, () => _getGameImage("h" + i.toString()));
      _skybImages.putIfAbsent(i, () => _getGameImage("skyb" + i.toString()));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _skybImages.forEach((key, value) {
      precacheImage(value.image, context);
    });
    _hImages.forEach((key, value) {
      precacheImage(value.image, context);
    });
  }

  Image _getGameImage(String imgName) {
    return imageService.getSpecificImage(
        imageName: imgName,
        imageExtension: "png",
        module: "game",
        maxHeight: screenDimensions.dimen(50));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _createBackgroundWithHangmanImage(),
      widget.createWordContainer(),
      widget.createLettersRows(setStateCallback, widget.goToNextGameScreen,
          label.l_a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z)
    ]);
  }

  Widget _createBackgroundWithHangmanImage() {
    var nrOfWrongAnswers = widget.quizQuestionManager.wrongPressedAnswer.length;
    var prevValue = max(0, nrOfWrongAnswers - 1);
    const animationDuration = Duration(milliseconds: 500);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          _createSkyContainer(prevValue),
          AnimatedSwitcher(
              duration: animationDuration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(child: child, opacity: animation);
              },
              child: _createSkyContainer(nrOfWrongAnswers)),
          imageService.getSpecificImage(
              imageName: "forest_texture",
              imageExtension: "png",
              module: "game",
              // maxHeight: screenDimensions.dimen(50)
          )
        ]),
        Stack(children: [
          _hImages.get(prevValue)!,
          AnimatedSwitcher(
              duration: animationDuration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(child: child, opacity: animation);
              },
              child: Container(
                key: UniqueKey(),
                child: _hImages.get(nrOfWrongAnswers)!,
              ))
        ])
      ],
    );
  }

  Container _createSkyContainer(int index) {
    return Container(
      key: UniqueKey(),
      decoration: BoxDecoration(
          image: DecorationImage(
        repeat: ImageRepeat.repeat,
        image: _skybImages.get(index)!.image,
      )),
      width: double.infinity,
      height: screenDimensions.dimen(70),
    );
  }

  void setStateCallback() {
    setState(() {});
  }
}
