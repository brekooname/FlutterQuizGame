import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Components/hangman_smoke_animation.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Hangman/hangman_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import '../../../Game/Question/Model/question_info_status.dart';
import '../../../Lib/Animation/animation_fade_in_fade_out.dart';
import '../../../Lib/Color/color_util.dart';
import '../../../main.dart';
import '../Service/hangman_game_service.dart';

class HangmanQuestionScreen extends GameScreen<HangmanGameContext,
        HangmanScreenManagerState, HangmanCampaignLevelService>
    with
        HangmanGameScreen<
            QuizQuestionManager<HangmanGameContext, HangmanLocalStorage>> {
  final HangmanGameService _hangmanGameService = HangmanGameService();

  HangmanQuestionScreen(
    HangmanScreenManagerState gameScreenManagerState, {
    Key? key,
    required HangmanGameContext gameContext,
    required QuestionInfo questionInfo,
  }) : super(gameScreenManagerState, gameContext, [questionInfo], key: key) {
    debugPrint(gameContext.gameUser
        .getAllQuestions([])
        .map((e) => e.question.rawString)
        .toList()
        .toString());
    initHangmanGameScreen(
        HangmanQuizQuestionManager(
            gameContext, currentQuestionInfo, HangmanLocalStorage()),
        label.l_a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z);
  }

  @override
  ImageRepeat? get backgroundTextureRepeat => null;

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

  late final bool _onInitLevelIsAlreadyFinished;

  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      _onHintButtonClick();
    });

    widget.pressFirstAndLastLetter();

    for (int i = 0; i < 7; i++) {
      _hImages.putIfAbsent(
          i,
          () => _getGameImage(
              "h" + i.toString(), "game/hangman_img/" + _getHangmanImgModule));
      _skybImages.putIfAbsent(
          i, () => _getGameImage("skyb" + i.toString(), "game"));
    }
    _emojiDead = _getEmojiImage("emoji_dead");
    _emojiHappy = _getEmojiImage("emoji_happy");
    _emojiNothing = _getEmojiImage("emoji_nothing");
    _forestTexture = imageService.getSpecificImage(
        imageName: "forest_texture",
        imageExtension: "png",
        module: "game",
        maxWidth: screenDimensions.dimen(100));

    _onInitLevelIsAlreadyFinished =
        widget._hangmanGameService.isLevelFinished(_getNrOfWonQuestions());
  }

  String get _getHangmanImgModule {
    if (kIsWeb) {
      return "android";
    } else if (Platform.isAndroid) {
      return "android";
    }
    return "default";
  }

  Image _getEmojiImage(String imgName) {
    var emojiWidth = screenDimensions.dimen(10);
    return imageService.getSpecificImage(
        imageName: imgName,
        imageExtension: "png",
        module: "game",
        maxWidth: emojiWidth);
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
    if (widget.gameContext.gameUser.getOpenQuestions().isEmpty) {
      widget.quizQuestionManager.quizGameLocalStorage
          .setFoundWordsInOneGameForCatDiff(
              widget.category, widget.difficulty, _getNrOfWonQuestions());
    }

    return Stack(alignment: Alignment.center, children: [
      Column(children: [
        _createBackgroundWithHangmanImage(),
        widget.createWordContainer(),
        widget.createLettersRows(setStateCallback, widget.goToNextGameScreen)
      ]),
      _processAchievementAnimation() ?? Container()
    ]);
  }

  Widget? _processAchievementAnimation() {
    double imgSizeDimen = screenDimensions.dimen(30);
    if (!widget.currentQuestionInfo.isQuestionOpen()) {
      String? achievementImgName;
      var nrOfWonQuestions = _getNrOfWonQuestions();
      if (nrOfWonQuestions ==
          HangmanGameContextService.numberOfQuestionsPerGame) {
        achievementImgName = "achv_all_words_found";
        widget.audioPlayer.playSuccess2();
      } else if (!_onInitLevelIsAlreadyFinished &&
          widget._hangmanGameService.isLevelFinished(nrOfWonQuestions)) {
        achievementImgName = "achv_level_finished";
        widget.audioPlayer.playSuccess();
      } else if (widget.currentQuestionInfo.status == QuestionInfoStatus.won) {
        widget.audioPlayer.playClick2();
      }
      if (achievementImgName != null) {
        var image = widget.imageService.getSpecificImage(
            imageName: achievementImgName,
            imageExtension: "png",
            maxHeight: imgSizeDimen,
            module: "game");
        return SizedBox(
            width: imgSizeDimen,
            height: imgSizeDimen,
            child: AnimateFadeInFadeOut(
              key: Key(achievementImgName),
              duration: widget.quizQuestionManager.durationGoToNextScreen(),
              onlyFadeOut: true,
              toAnimateWidget: image,
            ));
      }
    }
    return null;
  }

  int _getNrOfWonQuestions() =>
      widget.gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);

  Widget _createAnsweredQuestionsHeader() {
    var hintButton = HintButton(
        watchRewardedAdForHint: MyApp.isExtraContentLocked,
        disabled: widget.quizQuestionManager.isGameFinished(),
        onClick: _onHintButtonClick,
        availableHints: widget.gameContext.amountAvailableHints,
        showAvailableHintsText: true);
    List<Widget> rowItems = [];
    var hintBtnLateralPadding = EdgeInsets.fromLTRB(
        screenDimensions.dimen(1), 0, screenDimensions.dimen(1), 0);
    rowItems
        .add(Padding(padding: hintBtnLateralPadding, child: MyBackButton()));
    rowItems.add(const Spacer());
    var allQuestions = widget.gameContext.gameUser.getAllQuestions([]);
    allQuestions.sort((a, b) => (a.questionAnsweredAt ?? DateTime.now())
        .compareTo(b.questionAnsweredAt ?? DateTime.now()));
    var allQLength = allQuestions.length;
    for (int i = 0; i < allQLength; i++) {
      var item = allQuestions.elementAt(i);
      var emojiIcon = item.status == QuestionInfoStatus.won
          ? _emojiHappy
          : item.status == QuestionInfoStatus.lost
              ? _emojiDead
              : ColorUtil.imageToGreyScale(_emojiNothing);

      rowItems.add(Opacity(
          opacity: 0.7,
          child: Padding(
              padding: EdgeInsets.all(screenDimensions.dimen(1)),
              child: emojiIcon)));
    }
    rowItems.add(const Spacer());
    rowItems.add(Padding(padding: hintBtnLateralPadding, child: hintButton));
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
          _getHangmanImgModule == "android"
              ? Container()
              : HangmanSmokeAnimation(_forestTexture)
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
      height: screenDimensions.dimen(70 - _getVariableForNrOfLetterRows()),
    );
  }

  Image _getGameImage(String imgName, String module) {
    return imageService.getSpecificImage(
        imageName: imgName,
        imageExtension: "png",
        module: module,
        maxHeight:
            screenDimensions.dimen(50 - _getVariableForNrOfLetterRows()));
  }

  double _getVariableForNrOfLetterRows() {
    return widget.getNrRowsWithLetters() > 5 ? 12.5 : 0;
  }

  void setStateCallback() {
    setState(() {});
  }
}

class HangmanQuizQuestionManager
    extends QuizQuestionManager<HangmanGameContext, HangmanLocalStorage> {
  HangmanQuizQuestionManager(
      HangmanGameContext gameContext,
      QuestionInfo currentQuestionInfo,
      HangmanLocalStorage quizGameLocalStorage)
      : super(gameContext, currentQuestionInfo, quizGameLocalStorage);

  @override
  void playSuccessAudio() => "";
}
