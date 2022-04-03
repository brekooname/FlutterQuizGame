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

import '../quiz_question_manager.dart';


mixin ImageClickScreen<TQuizQuestionManager extends QuizQuestionManager> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();
  late QuestionInfo _currentQuestionInfo;
  late TQuizQuestionManager quizQuestionManager;

  void initImageClickScreen(TQuizQuestionManager quizQuestionManager,
      QuestionInfo currentQuestionInfo) {
    this.quizQuestionManager = quizQuestionManager;
    _currentQuestionInfo = currentQuestionInfo;
  }

  Widget createImageClickContainer(
    Size rawImageSize,
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    Image categoryImage = _getImageToClick(rawImageSize);
    Size imageToClickSize = _getImageToClickAdjustedForScreenSize(rawImageSize);
    var imageAlignment = _isImageToClickRectangular(rawImageSize)
        ? Alignment.center
        : Alignment.centerLeft;

    List<Widget> stackChildren = [];

    //Add main image
    stackChildren.add(SizedBox(
        height: imageToClickSize.height,
        width: imageToClickSize.width,
        child: _createImageContainer(imageToClickSize, categoryImage)));

    //Add answer pointers
    stackChildren.add(Container(
        width: _getImageContainerWidth(),
        height: _getImageContainerHeight(),
        alignment: imageAlignment,
        child: Stack(
          children: _createAnswerPointers(
              rawImageSize, refreshSetState, goToNextScreenAfterPress),
        )));

    return Expanded(
        child: Stack(
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
    return Stack(alignment: Alignment.centerLeft, children: [
      Positioned(
          top: _calculateY(rawImageSize, imageClickInfo),
          left: _calculateX(rawImageSize, imageClickInfo),
          child: Stack(alignment: Alignment.center, children: [
            Row(children: [
              Stack(alignment: Alignment.centerLeft, children: [
                _createAnswerPointerLine(rawImageSize, imageClickInfo),
                _createAnswerPointerPoint(rawImageSize),
              ]),
              _createAnswerButton(
                  imageClickInfo, refreshSetState, goToNextScreenAfterPress),
            ]),
            _createAnswerLabel(imageClickInfo)
          ]))
    ]);
  }

  double _calculateY(Size rawImageSize, ImageClickInfo imageClickInfo) {
    Size adjustedImageSize =
        _getImageToClickAdjustedForScreenSize(rawImageSize);
    return _calculateOriginY(rawImageSize) +
        (100 - imageClickInfo.y) / 100 * adjustedImageSize.height;
  }

  double _calculateX(Size rawImageSize, ImageClickInfo imageClickInfo) {
    Size adjustedImageSize =
        _getImageToClickAdjustedForScreenSize(rawImageSize);
    bool isPressedAnswerEqualsButton =
        _pressedAnswerEqualsButton(imageClickInfo);
    var showAnswerLabelOnLeftSide = isPressedAnswerEqualsButton &&
            imageClickInfo.x > 50 &&
            _isImageToClickRectangular(rawImageSize)
        ? _getAnswerLabelWidth(imageClickInfo) / 1.5
        : 0;
    return _calculateOriginX(rawImageSize) +
        imageClickInfo.x / 100 * adjustedImageSize.width -
        showAnswerLabelOnLeftSide;
  }

  double _calculateOriginX(Size rawImageSize) {
    return _isImageToClickRectangular(rawImageSize)
        ? _getAnswerBtnSideDimen() / 2 + _getAnswerBtnBorderWidth()
        : -_getPointerDimen() / 2 + _getAnswerBtnBorderWidth();
  }

  double _calculateOriginY(Size rawImageSize) {
    Size adjustedImageSize =
        _getImageToClickAdjustedForScreenSize(rawImageSize);
    return _isImageToClickRectangular(rawImageSize)
        ? (_getImageContainerHeight() - adjustedImageSize.height) / 2 -
            _getAnswerBtnSideDimen() / 2
        : -_getPointerDimen() / 2 +
            ((_getImageContainerHeight() - adjustedImageSize.height) / 2) -
            (_getAnswerBtnSideDimen() / 2 - _getAnswerBtnBorderWidth() * 2);
  }

  bool _pressedAnswerEqualsButton(ImageClickInfo imageClickInfo) {
    return _currentQuestionInfo.pressedAnswers.isNotEmpty &&
        _currentQuestionInfo.pressedAnswers.first == imageClickInfo.answerLabel;
  }

  double _getAnswerBtnBorderWidth() => FontConfig.standardBorderWidth;

  double _getPointerDimen() => _screenDimensions.dimen(2.5);

  double _getAnswerBtnSideDimen() => _screenDimensions.dimen(10);

  Widget _createAnswerPointerPoint(Size rawImageSize) {
    var pointerDimen = _getPointerDimen();
    var answerPointer = _isImageToClickRectangular(rawImageSize)
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

  Widget _createAnswerPointerLine(
      Size rawImageSize, ImageClickInfo imageClickInfo) {
    return _isImageToClickRectangular(rawImageSize)
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
    var answerBtn = Visibility(
        visible: !_pressedAnswerEqualsButton(imageClickInfo),
        child: SizedBox(
            width: btnSide,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Opacity(
                  opacity: 0.75,
                  child: SizedBox(
                      height: btnSide,
                      width: btnSide,
                      child: AnimateZoomInZoomOut(
                          toAnimateWidgetSize: Size(btnSide, btnSide),
                          zoomAmount:
                              AnimateZoomInZoomOut.defaultZoomAmount * 5,
                          toAnimateWidget: MyButton(
                              disabled: _currentQuestionInfo
                                  .pressedAnswers.isNotEmpty,
                              onClick: () {
                                quizQuestionManager.onClickAnswerOptionBtn(
                                  _currentQuestionInfo.question,
                                  imageClickInfo.answerLabel,
                                  refreshSetState,
                                  goToNextScreenAfterPress,
                                );
                              },
                              text: "?",
                              fontConfig: FontConfig(
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  borderColor: Colors.black),
                              size: Size(btnSide, btnSide),
                              buttonSkinConfig: ButtonSkinConfig(
                                  borderRadius:
                                      FontConfig.standardBorderRadius * 4,
                                  borderColor: Colors.red,
                                  backgroundColor: Colors.lightGreenAccent))))),
            ])));
    return answerBtn;
  }

  Visibility _createAnswerLabel(ImageClickInfo imageClickInfo) {
    var answerLabelWidth = _getAnswerLabelWidth(imageClickInfo);
    var answerLabel = Visibility(
        visible: _pressedAnswerEqualsButton(imageClickInfo),
        child: Container(
            clipBehavior: Clip.none,
            width: answerLabelWidth,
            decoration: BoxDecoration(
              color: (quizQuestionManager.isAnswerCorrectInOptionsList(
                          _currentQuestionInfo.question,
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

  Size _getImageToClickAdjustedForScreenSize(Size rawImageSize) {
    var heightGreaterThanWidth = _isImageHeightGreaterThanWidth(rawImageSize);
    var maxImgHeight = _getMaxImgHeight(rawImageSize);
    var maxImgWidth = _getMaxImgWidth();
    double imgHeight = heightGreaterThanWidth
        ? maxImgHeight
        : _screenDimensions.getNewHeightForNewWidth(
            maxImgWidth, rawImageSize.width, rawImageSize.height);
    double imgWidth = heightGreaterThanWidth
        ? _screenDimensions.getNewWidthForNewHeight(
            maxImgHeight, rawImageSize.width, rawImageSize.height)
        : maxImgWidth;

    return Size(imgWidth, imgHeight);
  }

  bool _isImageToClickRectangular(Size rawImageSize) =>
      rawImageSize.height / rawImageSize.width < 1.2;

  double _getImageContainerHeight() => _screenDimensions.h(85);

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

  GestureDetector _createImageContainer(
      Size imageToClickSize, Image categoryImage) {
    return GestureDetector(
        onTapCancel: () {},
        onTapUp: (TapUpDetails details) {},
        onTapDown: (TapDownDetails details) {
          debugPrint("x " +
              (details.localPosition.dx / imageToClickSize.width * 100)
                  .toString() +
              " y " +
              (100 - details.localPosition.dy / imageToClickSize.height * 100)
                  .toString());
        },
        child: categoryImage);
  }

  Image _getImageToClick(Size rawImageSize) {
    var heightGreaterThanWidth = _isImageHeightGreaterThanWidth(rawImageSize);
    Image categoryImage = _imageService.getSpecificImage(
      imageName: _currentQuestionInfo.question.category.index.toString(),
      imageExtension: "png",
      module: "categories",
      maxWidth: heightGreaterThanWidth ? null : _getMaxImgWidth(),
      maxHeight: heightGreaterThanWidth ? _getMaxImgHeight(rawImageSize) : null,
    );
    return categoryImage;
  }

  bool _isImageHeightGreaterThanWidth(Size rawImageSize) =>
      rawImageSize.width < rawImageSize.height;

  double _getMaxImgWidth() => _screenDimensions.w(80);

  double _getMaxImgHeight(Size rawImageSize) => _screenDimensions
      .h((rawImageSize.height / rawImageSize.width < 2) ? 65 : 80);

  double _getAnswerLabelWidth(ImageClickInfo imageClickInfo) =>
      imageClickInfo.arrowWidth + _getAnswerBtnSideDimen();
}
