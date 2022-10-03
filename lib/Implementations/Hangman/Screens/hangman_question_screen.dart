import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Components/hangman_smoke_animation.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Hangman/hangman_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import '../../../Lib/Color/color_util.dart';

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

  @override
  Gradient? get screenBackgroundGradient => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(62, 185, 0, 1),
            Color.fromRGBO(142, 233, 54, 1),
          ]);
}

class HangmanQuestionScreenState extends State<HangmanQuestionScreen>
    with ScreenState, LabelMixin, SingleTickerProviderStateMixin {
  late final Image _forestTexture;
  late final Image _emojiNothing;
  late final Image _emojiHappy;
  late final Image _emojiDead;

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
    var emojiWidth = screenDimensions.dimen(10);
    _emojiDead = imageService.getSpecificImage(
        imageName: "emoji_dead",
        imageExtension: "png",
        module: "game",
        maxWidth: emojiWidth);
    _emojiHappy = imageService.getSpecificImage(
        imageName: "emoji_happy",
        imageExtension: "png",
        module: "game",
        maxWidth: emojiWidth);
    _emojiNothing = imageService.getSpecificImage(
        imageName: "emoji_nothing",
        imageExtension: "png",
        module: "game",
        maxWidth: emojiWidth);
    _forestTexture = imageService.getSpecificImage(
        imageName: "forest_texture",
        imageExtension: "png",
        module: "game",
        maxWidth: screenDimensions.dimen(100));
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
    precacheImage(_forestTexture.image, context);
    precacheImage(_emojiNothing.image, context);
    precacheImage(_emojiDead.image, context);
    precacheImage(_emojiHappy.image, context);
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

  Widget _createAnsweredQuestionsHeader() {
    var hintButton = HintButton(
        onClick: _onHintButtonClick,
        availableHints: 4,
        showAvailableHintsText: true);
    List<Widget> rowItems = [];
    rowItems.add(SizedBox(
      width: hintButton.buttonSize.width,
    ));
    rowItems.add(const Spacer());
    for (int i = 0; i < 5; i++) {
      rowItems.add(Padding(
          padding: EdgeInsets.all(screenDimensions.dimen(1)),
          child: ColorUtil.imageToGreyScale(_emojiNothing)));
    }
    rowItems.add(const Spacer());
    rowItems.add(hintButton);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: rowItems,
    );
  }

  void _onHintButtonClick() {
    widget.quizQuestionManager.onHintButtonClickForCatDiff(
        setStateCallback, widget.processNextGameScreenCallBack());
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
          HangmanSmokeAnimation(_forestTexture)
        ]),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createAnsweredQuestionsHeader(),
              SizedBox(height: screenDimensions.dimen(5)),
              Stack(children: [
                _hImages.get(prevValue)!,
                AnimatedSwitcher(
                    duration: animationDuration,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(child: child, opacity: animation);
                    },
                    child: Container(
                      key: UniqueKey(),
                      child: _hImages.get(nrOfWrongAnswers)!,
                    ))
              ])
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

  Image _getGameImage(String imgName) {
    return imageService.getSpecificImage(
        imageName: imgName,
        imageExtension: "png",
        module: "game",
        maxHeight: screenDimensions.dimen(50));
  }

  void setStateCallback() {
    setState(() {});
  }
}
