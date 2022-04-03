import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../quiz_question_manager.dart';


mixin QuizOptionsGameScreen<TQuizQuestionManager extends QuizQuestionManager> {
  late TQuizQuestionManager quizQuestionManager;
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();
  late QuestionInfo _currentQuestionInfo;

  Image? _questionImage;
  bool? _zoomableImage;
  ButtonSkinConfig? _buttonSkinConfig;

  void initQuizOptionsScreen(
      TQuizQuestionManager quizQuestionManager, QuestionInfo currentQuestionInfo,
      {ButtonSkinConfig? buttonSkinConfig,
      ButtonSkinConfig? multipleCorrectAnswersButtonSkinConfig,
      Image? questionImage,
      bool? zoomableImage}) {
    this.quizQuestionManager = quizQuestionManager;
    _zoomableImage = zoomableImage;
    _questionImage = questionImage;
    _currentQuestionInfo = currentQuestionInfo;

    _buttonSkinConfig =
        this.quizQuestionManager.correctAnswersForQuestion.length == 1
            ? buttonSkinConfig
            : multipleCorrectAnswersButtonSkinConfig ?? buttonSkinConfig;
  }

  Widget createOptionRows(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    List<Row> answerRows = [];
    int answersOnRow = 2;
    List<Widget> answerBtns = [];
    for (String possibleAnswer in quizQuestionManager.possibleAnswers) {
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
            (quizQuestionManager.possibleAnswers.length / 2).ceil(),
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
        width: _screenDimensions.dimen(98),
        height: _screenDimensions.dimen(70),
        child: _zoomableImage ?? false
            ? createZoomableContainer()
            : _questionImage!);
  }

  Widget createZoomableContainer() {
    var pinchIconSideDimen = _screenDimensions.dimen(10);
    Stack stack = Stack(
      alignment: Alignment.center,
      children: [
        InteractiveViewer(
          minScale: 1,
          maxScale: 3,
          child: _questionImage!,
        ),
        Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(5)),
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
                color: Colors.blue.shade700,
                width: _screenDimensions.dimen(0.3)),
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius * 0.1)),
        child: stack);
  }

  Widget _createPossibleAnswerButton(VoidCallback refreshSetState,
      VoidCallback goToNextScreenAfterPress, String answerBtnText) {
    var question = _currentQuestionInfo.question;
    var btnSize = _getAnswerBtnSize();
    var answerBtnDisabled = quizQuestionManager.wrongPressedAnswer.isNotEmpty ||
        quizQuestionManager.correctAnswersForQuestion.contains(answerBtnText) &&
            _currentQuestionInfo.pressedAnswers.contains(answerBtnText) ||
        quizQuestionManager.isGameFinished() ||
        quizQuestionManager.hintDisabledPossibleAnswers
            .contains(answerBtnText.toLowerCase());

    var disabledBackgroundColor = answerBtnDisabled
        ? quizQuestionManager.wrongPressedAnswer.contains(answerBtnText)
            ? Colors.red
            : quizQuestionManager.isAnswerCorrectInOptionsList(
                    question, answerBtnText)
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
              quizQuestionManager.onClickAnswerOptionBtn(question,
                  answerBtnText, refreshSetState, goToNextScreenAfterPress);
            },
            buttonSkinConfig: _buttonSkinConfig ?? _defaultButtonSkinConfig(),
            customContent: MyText(
              text: answerBtnText,
              maxLines: quizQuestionManager.getValueBasedOnNrOfPossibleAnswers(
                  3, 3, 2, 1, true, _questionImage == null ? 2 : 1),
              width: btnSize.width / 1.1,
            )));
  }

  ButtonSkinConfig _defaultButtonSkinConfig() {
    return ButtonSkinConfig(backgroundColor: Colors.lightBlueAccent);
  }

  Size _getAnswerBtnSize() {
    return Size(
        _screenDimensions.dimen(45),
        _screenDimensions.dimen(quizQuestionManager
            .getValueBasedOnNrOfPossibleAnswers(
                26, 23, 19, 16, true, _questionImage == null ? 2 : 1)
            .toDouble()));
  }

  double getAnswerButtonPaddingBetween() => _screenDimensions.dimen(1);
}
