import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

mixin QuizOptionsGameScreen<TGameContext extends GameContext> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final MyAudioPlayer _audioPlayer = MyAudioPlayer();
  final ImageService _imageService = ImageService();
  final Set<String> _wrongPressedAnswer = HashSet();
  late QuizGameLocalStorage quizGameLocalStorage;
  late TGameContext _gameContext;
  late Set<String> _possibleAnswers;
  late List<String> _correctAnswersForQuestion;
  late QuestionInfo _currentQuestionInfo;
  Set<String> hintDisabledPossibleAnswers = HashSet();
  Image? _questionImage;

  void initQuizOptionsScreen(
      TGameContext gameContext,
      QuizGameLocalStorage quizGameLocalStorage,
      QuestionInfo currentQuestionInfo,
      {bool shouldHaveQuestionImage = false,
      bool isOneCorrectAnswerEnoughToWin = false}) {
    this.quizGameLocalStorage = quizGameLocalStorage;
    _gameContext = gameContext;
    _currentQuestionInfo = currentQuestionInfo;

    var question = currentQuestionInfo.question;
    var questionService = question.questionService;
    _correctAnswersForQuestion = questionService.getCorrectAnswers(question);

    _possibleAnswers =
        HashSet.of(_getPossibleAnswerOption(isOneCorrectAnswerEnoughToWin));
    if (shouldHaveQuestionImage) {
      initQuestionImage();
    }
  }

  void initQuestionImage() {
    Question question = _currentQuestionInfo.question;
    _questionImage = _imageService.getSpecificImage(
        module: _getQuestionImagePath(question.difficulty, question.category),
        imageExtension: "jpeg",
        imageName: "i" + question.index.toString());
  }

  Widget createOptionRows(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    List<Row> answerRows = [];
    int answersOnRow = 2;
    List<Widget> answerBtns = [];
    for (String possibleAnswer in _possibleAnswers) {
      answerBtns.add(_createPossibleAnswerButton(
          refreshSetState, goToNextScreenAfterPress, possibleAnswer));
      if (answerBtns.length == answersOnRow) {
        answerRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: answerBtns,
        ));
        answerBtns = [];
      }
    }
    answerRows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: answerBtns,
    ));
    Widget btnContainer = Expanded(
        child: Column(
      children: answerRows,
    ));

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createImageContainer(_currentQuestionInfo.question),
        btnContainer
      ],
    ));
  }

  Widget _createImageContainer(Question question) {
    return _questionImage == null
        ? Container()
        : Expanded(child: Container(child: _questionImage));
  }

  String _getQuestionImagePath(
          QuestionDifficulty difficulty, QuestionCategory category) =>
      "questions/images/" + difficulty.name + "/" + category.name;

  Widget _createPossibleAnswerButton(VoidCallback refreshSetState,
      VoidCallback goToNextScreenAfterPress, String answerBtnText) {
    var question = _currentQuestionInfo.question;
    var questionService = question.questionService;
    var btnBackgr = Colors.lightBlueAccent;
    var btnSize = _getAnswerBtnSize();
    var answerBtnDisabled = _wrongPressedAnswer.isNotEmpty ||
        _correctAnswersForQuestion.contains(answerBtnText) &&
            _currentQuestionInfo.pressedAnswers.contains(answerBtnText) ||
        _isGameFinished() ||
        hintDisabledPossibleAnswers.contains(answerBtnText.toLowerCase());

    var disabledBackgroundColor = answerBtnDisabled
        ? _wrongPressedAnswer.contains(answerBtnText)
            ? Colors.red
            : questionService.isAnswerCorrectInOptionsList(
                    _correctAnswersForQuestion, answerBtnText)
                ? Colors.green
                : null
        : null;

    return Padding(
        padding: EdgeInsets.all(_screenDimensions.w(1)),
        child: MyButton(
            size: btnSize,
            disabled: answerBtnDisabled,
            disabledBackgroundColor: disabledBackgroundColor,
            onClick: () {
              _gameContext.gameUser
                  .addAnswerToQuestionInfo(question, answerBtnText);
              if (questionService.isAnswerCorrectInOptionsList(
                  _correctAnswersForQuestion, answerBtnText)) {
                _audioPlayer.playSuccess();
              } else {
                _audioPlayer.playFail();
                _wrongPressedAnswer.add(answerBtnText);
              }
              refreshSetState.call();
              _processGameFinished(question, goToNextScreenAfterPress);
            },
            buttonSkinConfig: ButtonSkinConfig(
                borderColor: ColorUtil.colorDarken(btnBackgr, 0.1),
                backgroundColor: btnBackgr),
            customContent: MyText(
              text: answerBtnText,
              maxLines: _getValueBasedOnNrOfPossibleAnswers(4, 3, 2, 1, true),
              width: btnSize.width / 1.1,
            )));
  }

  List<String> _getPossibleAnswerOption(bool oneCorrectAnswerEnoughToWin) {
    List<String> possibleAnswers;
    var question = _currentQuestionInfo.question;
    var questionService = question.questionService;
    if (oneCorrectAnswerEnoughToWin) {
      _correctAnswersForQuestion.shuffle();
      _correctAnswersForQuestion = [_correctAnswersForQuestion.first];
      possibleAnswers = List.of(
          questionService.getQuizAnswerOptionsWithSingleCorrectAnswer(
              _correctAnswersForQuestion.first, question));
    } else {
      possibleAnswers = List.of(questionService.getQuizAnswerOptions(question));
    }
    possibleAnswers.shuffle();
    return possibleAnswers;
  }

  void _processGameFinished(
      Question question, VoidCallback goToNextScreenAfterPress) {
    var questionService = question.questionService;
    if (_isGameFinished()) {
      Future.delayed(
          Duration(
              milliseconds: _getValueBasedOnNrOfPossibleAnswers(
                  1100, 1600, 1700, 1800, false)),
          () => goToNextScreenAfterPress.call());
      if (isGameFinishedSuccessful()) {
        _gameContext.gameUser.setWonQuestion(_currentQuestionInfo);
        quizGameLocalStorage.setWonQuestion(question);
      } else if (questionService.isGameFinishedFailedWithOptionList(
          _correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers)) {
        _gameContext.gameUser.setLostQuestion(_currentQuestionInfo);
        quizGameLocalStorage.setLostQuestion(question);
      }
    }
  }

  bool isGameFinishedSuccessful() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedSuccessfulWithOptionList(
            _correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  bool _isGameFinished() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedWithOptionList(
            _correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  void onHintButtonClick(VoidCallback refreshSetState) {
    _gameContext.amountAvailableHints--;
    quizGameLocalStorage.setRemainingHints(
        _currentQuestionInfo.question.difficulty,
        _gameContext.amountAvailableHints);

    var optionsToDisable = List.of(_possibleAnswers);
    optionsToDisable.shuffle();
    optionsToDisable.removeAll(_correctAnswersForQuestion);

    hintDisabledPossibleAnswers.add(optionsToDisable.first.toLowerCase());
    hintDisabledPossibleAnswers.add(optionsToDisable.last.toLowerCase());

    refreshSetState.call();
  }

  Size _getAnswerBtnSize() {
    return Size(
        _screenDimensions.w(45),
        _screenDimensions.h(
            _getValueBasedOnNrOfPossibleAnswers(15, 12, 8, 5, true)
                .toDouble()));
  }

  int _getValueBasedOnNrOfPossibleAnswers(
      int v4, int v6, int v8, int max, bool isSizeValue) {
    double factor = isSizeValue
        ? _questionImage == null
            ? 2
            : 1
        : 1;
    var nrOfPossibleAnswers = _possibleAnswers.length;
    int val = nrOfPossibleAnswers <= 4
        ? v4
        : nrOfPossibleAnswers <= 6
            ? v6
            : nrOfPossibleAnswers <= 8
                ? v8
                : max;
    val = (val * factor).ceil();
    val = isSizeValue
        ? val > v4
            ? v4
            : val
        : val;
    return val;
  }
}
