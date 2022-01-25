import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

mixin QuizOptionsGameScreen<TGameContext extends GameContext> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();
  final MyAudioPlayer _audioPlayer = MyAudioPlayer();
  final Set<String> _wrongPressedAnswer = HashSet();
  late QuizGameLocalStorage quizGameLocalStorage;
  late TGameContext _gameContext;
  late Set<String> _possibleAnswers;
  late QuestionInfo _currentQuestionInfo;
  Image? _questionImage;
  bool? _zoomableImage;
  ButtonSkinConfig? _buttonSkinConfig;
  late List<String> correctAnswersForQuestion;
  Set<String> hintDisabledPossibleAnswers = HashSet();

  void initQuizOptionsScreen(
      TGameContext gameContext,
      QuizGameLocalStorage quizGameLocalStorage,
      QuestionInfo currentQuestionInfo,
      {bool isOneCorrectAnswerEnoughToWin = false,
      ButtonSkinConfig? buttonSkinConfig,
      ButtonSkinConfig? multipleCorrectAnswersButtonSkinConfig,
      Image? questionImage,
      bool? zoomableImage}) {
    this.quizGameLocalStorage = quizGameLocalStorage;
    _gameContext = gameContext;
    _zoomableImage = zoomableImage;
    _questionImage = questionImage;
    _currentQuestionInfo = currentQuestionInfo;

    var question = currentQuestionInfo.question;
    var questionService = question.questionService;
    correctAnswersForQuestion = questionService.getCorrectAnswers(question);
    _buttonSkinConfig = correctAnswersForQuestion.length == 1
        ? buttonSkinConfig
        : multipleCorrectAnswersButtonSkinConfig ?? buttonSkinConfig;

    _possibleAnswers =
        HashSet.of(_getPossibleAnswerOption(isOneCorrectAnswerEnoughToWin));
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
    var btnSize = _getAnswerBtnSize();
    Widget btnContainer = Container(
        height: (btnSize.height + getAnswerButtonPaddingBetween() * 2) *
            (_possibleAnswers.length / 2).ceil(),
        child: ListView(
          children: answerRows,
        ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createImageContainer(_currentQuestionInfo.question),
        btnContainer
      ],
    );
  }

  Widget _createImageContainer(Question question) {
    if (_questionImage == null) {
      return Container();
    }
    return SizedBox(
        width: _screenDimensions.w(98),
        height: _screenDimensions.h(40),
        child: _zoomableImage ?? false
            ? createZoomableContainer()
            : _questionImage!);
  }

  Widget createZoomableContainer() {
    var pinchIconSideDimen = _screenDimensions.w(10);
    Stack stack = Stack(
      alignment: Alignment.center,
      children: [
        InteractiveViewer(
          minScale: 1,
          maxScale: 3,
          child: _questionImage!,
        ),
        Padding(
            padding: EdgeInsets.all(_screenDimensions.w(5)),
            child: Container(
                alignment: Alignment.bottomRight,
                child: _imageService.getMainImage(
                    imageName: "pinch",
                    module: "general",
                    imageExtension: "png",
                    maxHeight: pinchIconSideDimen)))
      ],
    );
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(
                color: Colors.blue.shade700, width: _screenDimensions.w(0.3)),
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius * 0.1)),
        child: stack);
  }

  Widget _createPossibleAnswerButton(VoidCallback refreshSetState,
      VoidCallback goToNextScreenAfterPress, String answerBtnText) {
    var question = _currentQuestionInfo.question;
    var btnSize = _getAnswerBtnSize();
    var answerBtnDisabled = _wrongPressedAnswer.isNotEmpty ||
        correctAnswersForQuestion.contains(answerBtnText) &&
            _currentQuestionInfo.pressedAnswers.contains(answerBtnText) ||
        _isGameFinished() ||
        hintDisabledPossibleAnswers.contains(answerBtnText.toLowerCase());

    var disabledBackgroundColor = answerBtnDisabled
        ? _wrongPressedAnswer.contains(answerBtnText)
            ? Colors.red
            : question.questionService.isAnswerCorrectInOptionsList(
                    correctAnswersForQuestion, answerBtnText)
                ? Colors.green
                : null
        : null;

    return Padding(
        padding: EdgeInsets.all(getAnswerButtonPaddingBetween()),
        child: MyButton(
            size: btnSize,
            disabled: answerBtnDisabled,
            disabledBackgroundColor: disabledBackgroundColor,
            onClick: () {
              _onClickAnswerOptionBtn(question, answerBtnText, refreshSetState,
                  goToNextScreenAfterPress);
            },
            buttonSkinConfig: _buttonSkinConfig ?? _defaultButtonSkinConfig(),
            customContent: MyText(
              text: answerBtnText,
              maxLines: _getValueBasedOnNrOfPossibleAnswers(3, 3, 2, 1, true),
              width: btnSize.width / 1.1,
            )));
  }

  void _onClickAnswerOptionBtn(Question question, String answerBtnText,
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    _gameContext.gameUser.addAnswerToQuestionInfo(question, answerBtnText);
    if (question.questionService.isAnswerCorrectInOptionsList(
        correctAnswersForQuestion, answerBtnText)) {
      executeOnPressedCorrectAnswer();
    } else {
      executeOnPressedWrongAnswer(answerBtnText);
    }
    refreshSetState.call();
    _processGameFinished(question, goToNextScreenAfterPress);
  }

  void executeOnPressedCorrectAnswer() {
    _audioPlayer.playSuccess();
  }

  void executeOnPressedWrongAnswer(String answerBtnText) {
    _audioPlayer.playFail();
    _wrongPressedAnswer.add(answerBtnText);
  }

  ButtonSkinConfig _defaultButtonSkinConfig() {
    return ButtonSkinConfig(backgroundColor: Colors.lightBlueAccent);
  }

  List<String> _getPossibleAnswerOption(bool oneCorrectAnswerEnoughToWin) {
    List<String> possibleAnswers;
    var question = _currentQuestionInfo.question;
    var questionService = question.questionService;
    if (oneCorrectAnswerEnoughToWin) {
      correctAnswersForQuestion.shuffle();
      correctAnswersForQuestion = [correctAnswersForQuestion.first];
      possibleAnswers = List.of(
          questionService.getQuizAnswerOptionsWithSingleCorrectAnswer(
              correctAnswersForQuestion.first, question));
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
          durationGoToNextScreen, () => goToNextScreenAfterPress.call());
      if (isGameFinishedSuccessful()) {
        _gameContext.gameUser.setWonQuestion(_currentQuestionInfo);
        quizGameLocalStorage.setWonQuestion(question);
      } else if (questionService.isGameFinishedFailedWithOptionList(
          correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers)) {
        _gameContext.gameUser.setLostQuestion(_currentQuestionInfo);
        quizGameLocalStorage.setLostQuestion(question);
      }
    }
  }

  Duration get durationGoToNextScreen => Duration(
      milliseconds:
          _getValueBasedOnNrOfPossibleAnswers(1100, 1600, 1700, 1800, false));

  bool isGameFinishedSuccessful() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedSuccessfulWithOptionList(
            correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  bool isGameFinishedFailed() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedFailedWithOptionList(
            correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  bool _isGameFinished() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedWithOptionList(
            correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  void onHintButtonClick(VoidCallback refreshSetState) {
    _gameContext.amountAvailableHints--;
    quizGameLocalStorage.setRemainingHints(
        _currentQuestionInfo.question.difficulty,
        _gameContext.amountAvailableHints);

    var optionsToDisable = List.of(_possibleAnswers);
    optionsToDisable.shuffle();
    optionsToDisable.removeAll(correctAnswersForQuestion);

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

  double getAnswerButtonPaddingBetween() => _screenDimensions.w(1);

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
