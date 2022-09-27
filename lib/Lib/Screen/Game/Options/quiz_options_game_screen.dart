import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../ScreenDimensions/screen_dimensions_service.dart';
import 'quiz_question_manager.dart';

mixin QuizOptionsGameScreen<TQuizQuestionManager extends QuizQuestionManager> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();

  late final TQuizQuestionManager quizQuestionManager;

  late final Image? _questionImage;
  late final bool? _zoomableImage;
  late final ButtonSkinConfig? _optionsButtonSkinConfig;

  void initQuizOptionsScreen(TQuizQuestionManager quizQuestionManager,
      {ButtonSkinConfig? optionsButtonSkinConfig,
      ButtonSkinConfig? multipleCorrectAnswersButtonSkinConfig,
      Image? questionImage,
      bool? zoomableImage}) {
    this.quizQuestionManager = quizQuestionManager;
    _zoomableImage = zoomableImage;
    _questionImage = questionImage;

    _optionsButtonSkinConfig =
        this.quizQuestionManager.correctAnswersForQuestion.length == 1
            ? optionsButtonSkinConfig
            : multipleCorrectAnswersButtonSkinConfig ?? optionsButtonSkinConfig;
  }

  bool questionHasImage() {
    return _questionImage != null;
  }

  Widget createOptionRows(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress,
      {Widget? widgetBetweenImageAndOptionRows,
      double? questionImageHeightPercent,
      FontConfig? optionTextFontConfig}) {
    List<Row> answerRows = [];
    int answersOnRow = 2;
    List<Widget> answerBtns = [];
    for (String possibleAnswer in quizQuestionManager.possibleAnswers) {
      answerBtns.add(createPossibleAnswerButton(
          refreshSetState, goToNextScreenAfterPress, possibleAnswer,
          fontConfig: optionTextFontConfig));
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
    var btnSize = getAnswerBtnSize();
    Widget btnContainer = SizedBox(
        height: (btnSize.height + getAnswerButtonPaddingBetween() * 2) *
            (quizQuestionManager.possibleAnswers.length / 2).ceil(),
        child: ListView(
          children: answerRows,
        ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createImageContainer(questionImageHeightPercent),
        widgetBetweenImageAndOptionRows ?? Container(),
        btnContainer
      ],
    );
  }

  Widget _createImageContainer(double? questionImageHeightPercent) {
    if (_questionImage == null) {
      return Container();
    }
    return SizedBox(
        width: _screenDimensions.dimen(98),
        height: _screenDimensions.h(questionImageHeightPercent ?? 36),
        child: _zoomableImage ?? false
            ? _createZoomableContainer()
            : _questionImage!);
  }

  Widget _createZoomableContainer() {
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
            color: Colors.white,
            border: Border.all(
                color: Colors.blue.shade700,
                width: _screenDimensions.dimen(0.3)),
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius * 0.1)),
        child: stack);
  }

  Widget createPossibleAnswerButton(VoidCallback refreshSetState,
      VoidCallback goToNextScreenAfterPress, String answerBtnText,
      {Widget? customContent, FontConfig? fontConfig}) {
    var btnSize = getAnswerBtnSize();

    return Padding(
        padding: EdgeInsets.all(getAnswerButtonPaddingBetween()),
        child: MyButton(
            size: btnSize,
            disabled: _isAnswerBtnDisabled(answerBtnText),
            disabledBackgroundColor: _getAnswerBtnDisabledColor(answerBtnText),
            onClick: () {
              quizQuestionManager.onClickAnswerOptionBtn(
                  answerBtnText, refreshSetState, goToNextScreenAfterPress);
            },
            buttonSkinConfig:
                _optionsButtonSkinConfig ?? _defaultButtonSkinConfig(),
            customContent: customContent ??
                MyText(
                  fontConfig: fontConfig,
                  text: answerBtnText,
                  maxLines:
                      quizQuestionManager.getValueBasedOnNrOfPossibleAnswers(
                          3, 3, 2, 1, true, _questionImage == null ? 2 : 1),
                  width: btnSize.width / 1.1,
                )));
  }

  ButtonSkinConfig _defaultButtonSkinConfig() {
    return ButtonSkinConfig(backgroundColor: Colors.lightBlueAccent);
  }

  QuestionInfo get currentQuestionInfo =>
      quizQuestionManager.currentQuestionInfo;

  Size getAnswerBtnSize() {
    return Size(
        _screenDimensions.dimen(45),
        _screenDimensions.dimen(quizQuestionManager
            .getValueBasedOnNrOfPossibleAnswers(
                26, 23, 19, 16, true, _questionImage == null ? 2 : 1)
            .toDouble()));
  }

  double getAnswerButtonPaddingBetween() => _screenDimensions.dimen(1);

  MaterialColor? _getAnswerBtnDisabledColor(String answerBtnText) {
    return _isAnswerBtnDisabled(answerBtnText)
        ? quizQuestionManager.wrongPressedAnswer.contains(answerBtnText)
            ? Colors.red
            : quizQuestionManager.isAnswerCorrectInOptionsList(answerBtnText)
                ? Colors.green
                : null
        : null;
  }

  bool _isAnswerBtnDisabled(String answerBtnText) {
    return quizQuestionManager.wrongPressedAnswer.isNotEmpty ||
        quizQuestionManager.correctAnswersForQuestion.contains(answerBtnText) &&
            currentQuestionInfo.pressedAnswers.contains(answerBtnText) ||
        quizQuestionManager.isGameFinished() ||
        quizQuestionManager.hintDisabledPossibleAnswers
            .contains(answerBtnText.toLowerCase());
  }
}
