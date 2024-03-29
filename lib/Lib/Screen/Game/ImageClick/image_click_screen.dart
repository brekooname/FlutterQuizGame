import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../Options/quiz_question_manager.dart';

mixin ImageClickScreen<TQuizQuestionManager extends QuizQuestionManager> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();
  late final TQuizQuestionManager quizQuestionManager;
  late final Image imageToClick;
  late final Size _rawImageToClickSize;
  late final double _imageContainerHeightPercent;
  late final ButtonSkinConfig? _answerBtnSkin;

  void initImageClickScreen(
      TQuizQuestionManager quizQuestionManager, Size rawImageToClickSize,
      {double? imageContainerHeightPercent, ButtonSkinConfig? answerBtnSkin}) {
    _imageContainerHeightPercent = imageContainerHeightPercent ?? 75;
    this.quizQuestionManager = quizQuestionManager;
    _rawImageToClickSize = rawImageToClickSize;
    _answerBtnSkin = answerBtnSkin;
  }

  void initImageToClick() {
    var heightGreaterThanWidth = _isImageHeightGreaterThanWidth();
    imageToClick = _imageService.getSpecificImage(
      imageName: _currentQuestionInfo.question.category.index.toString(),
      imageExtension: "png",
      module: "categories",
      maxWidth: heightGreaterThanWidth ? null : _getMaxImgWidth(),
      maxHeight: heightGreaterThanWidth ? _getMaxImgHeight() : null,
    );
  }

  Widget createImageClickContainer(
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    Size imageToClickSize = getImageToClickAdjustedForScreenSize();
    var imageAlignment =
        showAnswerPointerOnOrigin() ? Alignment.center : Alignment.centerLeft;

    List<Widget> stackChildren = [];

    //Add main image
    stackChildren.add(SizedBox(
        height: imageToClickSize.height,
        width: imageToClickSize.width,
        child: _createImageContainer()));

    //Add answer pointers
    stackChildren.add(Container(
        width: _getImageContainerWidth(),
        height: _getImageContainerHeight(),
        alignment: imageAlignment,
        child: Stack(
          clipBehavior: Clip.none,
          children: _createAnswerPointers(
              _rawImageToClickSize, refreshSetState, goToNextScreenAfterPress),
        )));

    return SizedBox(
        width: _getImageContainerWidth(),
        height: _getImageContainerHeight(),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: imageAlignment,
          children: stackChildren,
        ));
  }

  List<Widget> _createAnswerPointers(Size rawImageSize,
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    List<Widget> answerPointerStackChildren = [];
    answerPointerStackChildren.addAll(_getAnswerOptionsCoordinates()
        .map((imageClickInfo) => SizedBox(
            width: _getImageContainerWidth(),
            height: _getImageContainerHeight(),
            child: _createAnswerPointer(rawImageSize, imageClickInfo,
                refreshSetState, goToNextScreenAfterPress)))
        .toList());
    return answerPointerStackChildren;
  }

  Widget _createAnswerPointer(
    Size rawImageSize,
    ImageClickInfo imageClickInfo,
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    List<Widget> answerPointerChildren = [];
    var answerBtn = _createAnswerButton(
        imageClickInfo, refreshSetState, goToNextScreenAfterPress);
    var answerLine = Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          _createAnswerPointerLine(imageClickInfo),
          _createAnswerPointerPoint(),
        ]);
    if (FontConfig.isRtlLanguage) {
      answerPointerChildren.add(answerBtn);
      answerPointerChildren.add(answerLine);
    } else {
      answerPointerChildren.add(answerLine);
      answerPointerChildren.add(answerBtn);
    }
    return Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: _calculateY(imageClickInfo),
              left: _calculateX(imageClickInfo),
              child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    ////
                    ////
                    ////
                    ////
                    ////
                    Row(children: answerPointerChildren),
                    ////
                    ////
                    ////
                    ////
                    ////
                    _createAnswerLabel(imageClickInfo)
                  ]))
        ]);
  }

  double _calculateY(ImageClickInfo imageClickInfo) {
    Size adjustedImageSize = getImageToClickAdjustedForScreenSize();
    return _calculateOriginY() +
        (100 - imageClickInfo.y) / 100 * adjustedImageSize.height;
  }

  double _calculateX(ImageClickInfo imageClickInfo) {
    Size adjustedImageSize = getImageToClickAdjustedForScreenSize();
    bool isPressedAnswerEqualsButton =
        _pressedAnswerEqualsButton(imageClickInfo);
    double paddingForAnswerLabel = 0;
    if (isPressedAnswerEqualsButton) {
      var percentBuffer = 20;
      if (imageClickInfo.x > percentBuffer &&
          imageClickInfo.x < 100 - percentBuffer) {
        paddingForAnswerLabel = _getAnswerLabelWidth(imageClickInfo) / 2 -
            _getAnswerBtnSideDimen() / 2;
      } else {
        paddingForAnswerLabel = showAnswerLabelOnLeftSide(imageClickInfo)
            ? _getAnswerLabelWidth(imageClickInfo) / 1.5
            : 0;
      }
    }
    return _calculateOriginX() +
        imageClickInfo.x / 100 * adjustedImageSize.width -
        paddingForAnswerLabel;
  }

  bool showAnswerLabelOnLeftSide(ImageClickInfo imageClickInfo) {
    return imageClickInfo.x > _imageContainerHeightPercent &&
        showAnswerPointerOnOrigin();
  }

  double _calculateOriginX() {
    return showAnswerPointerOnOrigin()
        //To verify if it works with - or +
        // ?  _getAnswerBtnSideDimen() / 2 + _getAnswerBtnBorderWidth()
        // ?  - _getAnswerBtnSideDimen() / 2 + _getAnswerBtnBorderWidth()
        ? _getAnswerBtnBorderWidth() / 2
        : -_getPointerDimen() / 2 + _getAnswerBtnBorderWidth();
  }

  double _calculateOriginY() {
    Size adjustedImageSize = getImageToClickAdjustedForScreenSize();
    return showAnswerPointerOnOrigin()
        ? (_getImageContainerHeight() - adjustedImageSize.height) / 2 -
            _getAnswerBtnSideDimen() / 2
        : -_getPointerDimen() / 2 +
            ((_getImageContainerHeight() - adjustedImageSize.height) / 2) -
            (_getAnswerBtnSideDimen() / 2 - _getAnswerBtnBorderWidth() * 2);
  }

  QuestionInfo get _currentQuestionInfo =>
      quizQuestionManager.currentQuestionInfo;

  bool _pressedAnswerEqualsButton(ImageClickInfo imageClickInfo) {
    return _currentQuestionInfo.pressedAnswers.isNotEmpty &&
        _currentQuestionInfo.pressedAnswers.first == imageClickInfo.answerLabel;
  }

  double _getAnswerBtnBorderWidth() => FontConfig.standardBorderWidth;

  double _getPointerDimen() => _screenDimensions.dimen(2.5);

  double _getAnswerBtnSideDimen() => _screenDimensions.dimen(10);

  Widget _createAnswerPointerPoint() {
    var pointerDimen = _getPointerDimen();
    var answerPointer = showAnswerPointerOnOrigin()
        ? Container()
        : SizedBox(
            width: pointerDimen,
            height: pointerDimen,
            child: AnimateZoomInZoomOut(
                toAnimateWidgetSize: Size(pointerDimen, pointerDimen),
                zoomAmount: AnimateZoomInZoomOut.defaultZoomAmount / 1.5,
                toAnimateWidget: Container(
                  width: pointerDimen,
                  height: pointerDimen,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(
                          FontConfig.standardBorderRadius * 4),
                      border: Border.all(
                          color: Colors.red,
                          width: _getAnswerBtnBorderWidth())),
                )));
    return answerPointer;
  }

  Widget _createAnswerPointerLine(ImageClickInfo imageClickInfo) {
    return showAnswerPointerOnOrigin()
        ? Container()
        : Padding(
            padding: EdgeInsets.only(left: _screenDimensions.w(1)),
            child: Opacity(
                opacity: 0.7,
                child: Container(
                    width: imageClickInfo.arrowWidth,
                    height: _screenDimensions.h(1),
                    decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(
                            FontConfig.standardBorderRadius),
                        border: Border.all(
                            color: Colors.red,
                            width: _getAnswerBtnBorderWidth())))));
  }

  Visibility _createAnswerButton(ImageClickInfo imageClickInfo,
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    var btnSide = _getAnswerBtnSideDimen();
    var btnDisabled = _currentQuestionInfo.pressedAnswers.isNotEmpty ||
        quizQuestionManager.hintDisabledPossibleAnswers
            .contains(imageClickInfo.answerLabel.toLowerCase());
    var btnFontConfig = FontConfig(
        fontColor: Colors.lightGreenAccent,
        fontWeight: FontWeight.w800,
        borderColor: Colors.black);
    var btnSkin = _answerBtnSkin ??
        ButtonSkinConfig(
            borderRadius: FontConfig.standardBorderRadius * 4,
            borderColor: Colors.red,
            backgroundColor: Colors.lightGreenAccent);
    var answerBtn = MyButton(
        disabled: btnDisabled,
        onClick: () {
          quizQuestionManager.onClickAnswerOptionBtn(
            imageClickInfo.answerLabel,
            refreshSetState,
            goToNextScreenAfterPress,
          );
        },
        text: "?",
        fontConfig: btnFontConfig,
        size: Size(btnSide, btnSide),
        buttonSkinConfig: btnSkin);
    var answerBtnToDisplay = btnDisabled
        ? answerBtn
        : AnimateZoomInZoomOut(
            toAnimateWidgetSize: Size(btnSide, btnSide),
            zoomAmount: AnimateZoomInZoomOut.defaultZoomAmount,
            toAnimateWidget: answerBtn);
    return Visibility(
        visible: !_pressedAnswerEqualsButton(imageClickInfo),
        child: SizedBox(
            width: btnSide,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Opacity(
                  opacity: 0.75,
                  child: SizedBox(
                      height: btnSide,
                      width: btnSide,
                      child: answerBtnToDisplay)),
            ])));
  }

  Visibility _createAnswerLabel(ImageClickInfo imageClickInfo) {
    var answerLabelWidth = _getAnswerLabelWidth(imageClickInfo);
    var answerLabel = Visibility(
        visible: _pressedAnswerEqualsButton(imageClickInfo),
        child: Container(
            width: answerLabelWidth,
            decoration: BoxDecoration(
              color: (quizQuestionManager.isAnswerCorrectInOptionsList(
                          imageClickInfo.answerLabel)
                      ? Colors.lightGreenAccent
                      : Colors.red.shade200)
                  .withOpacity(0.9),
            ),
            child: MyText(
              fontConfig: FontConfig(
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w800,
                  borderColor: Colors.black),
              maxLines: 3,
              width: answerLabelWidth,
              text: imageClickInfo.answerLabel,
            )));
    return answerLabel;
  }

  Size getImageToClickAdjustedForScreenSize() {
    var heightGreaterThanWidth = _isImageHeightGreaterThanWidth();
    var maxImgHeight = _getMaxImgHeight();
    var maxImgWidth = _getMaxImgWidth();
    double imgHeight = heightGreaterThanWidth
        ? maxImgHeight
        : _screenDimensions.getNewHeightForNewWidth(maxImgWidth,
            _rawImageToClickSize.width, _rawImageToClickSize.height);
    double imgWidth = heightGreaterThanWidth
        ? _screenDimensions.getNewWidthForNewHeight(maxImgHeight,
            _rawImageToClickSize.width, _rawImageToClickSize.height)
        : maxImgWidth;

    return Size(imgWidth, imgHeight);
  }

  bool showAnswerPointerOnOrigin() =>
      _rawImageToClickSize.height / _rawImageToClickSize.width < 1.2;

  double _getImageContainerHeight() =>
      _screenDimensions.h(_imageContainerHeightPercent);

  double _getImageContainerWidth() => _screenDimensions.dimen(100);

  List<ImageClickInfo> _getAnswerOptionsCoordinates() {
    var question = _currentQuestionInfo.question;
    var quizAnswerOptionsCoordinates =
        (question.questionService as ImageClickQuestionService)
            .getQuizAnswerOptionsCoordinates(question);
    //Most left pointer should be placed on top
    quizAnswerOptionsCoordinates.sort((a, b) => -a.x.compareTo(b.x));
    //Answered pointer should be placed on top
    quizAnswerOptionsCoordinates
        .sort((a, b) => _pressedAnswerEqualsButton(a) ? 1 : -1);
    return quizAnswerOptionsCoordinates;
  }

  GestureDetector _createImageContainer() {
    return GestureDetector(
        onTapCancel: () {},
        onTapUp: (TapUpDetails details) {},
        onTapDown: (TapDownDetails details) {
          debugPrint("x " +
              (details.localPosition.dx / _rawImageToClickSize.width * 100)
                  .toString() +
              " y " +
              (100 -
                      details.localPosition.dy /
                          _rawImageToClickSize.height *
                          100)
                  .toString());
        },
        child: imageToClick);
  }

  bool _isImageHeightGreaterThanWidth() =>
      _rawImageToClickSize.width < _rawImageToClickSize.height;

  double _getMaxImgWidth() => _screenDimensions.w(80);

  double _getMaxImgHeight() => _screenDimensions.h(
      (_rawImageToClickSize.height / _rawImageToClickSize.width < 2)
          ? 65
          : _imageContainerHeightPercent);

  double _getAnswerLabelWidth(ImageClickInfo imageClickInfo) =>
      showAnswerPointerOnOrigin()
          ? _screenDimensions.dimen(40)
          : imageClickInfo.arrowWidth + _getAnswerBtnSideDimen();
}
