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

import '../quiz_controls_service.dart';

mixin ImageClickScreen<TQuizControlsService extends QuizControlsService> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();
  late QuestionInfo _currentQuestionInfo;
  late TQuizControlsService quizControlsService;

  void initImageClickScreen(TQuizControlsService quizControlsService,
      QuestionInfo currentQuestionInfo) {
    this.quizControlsService = quizControlsService;
    _currentQuestionInfo = currentQuestionInfo;
  }

  Widget createImageClickContainer(
    Size imageSize,
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    var category = _currentQuestionInfo.question.category;
    var maxImgHeight =
        _screenDimensions.h((imageSize.height / imageSize.width < 2) ? 65 : 80);
    var maxImgWidth = _screenDimensions.w(80);

    var heightGreaterThanWidth = imageSize.width < imageSize.height;
    bool rectangularImage = imageSize.height / imageSize.width < 1.2;
    Image categoryImage = _imageService.getSpecificImage(
      imageName: category.index.toString(),
      imageExtension: "png",
      module: "categories",
      maxWidth: heightGreaterThanWidth ? null : maxImgWidth,
      maxHeight: heightGreaterThanWidth ? maxImgHeight : null,
    );

    List<Widget> stackChildren = [];

    double imgHeight = heightGreaterThanWidth
        ? maxImgHeight
        : _screenDimensions.getNewHeightForNewWidth(
            maxImgWidth, imageSize.width, imageSize.height);
    double imgWidth = heightGreaterThanWidth
        ? _screenDimensions.getNewWidthForNewHeight(
            maxImgHeight, imageSize.width, imageSize.height)
        : maxImgWidth;
    Container imageContainer = Container(
        // color: Colors.red,
        height: imgHeight,
        width: imgWidth,
        child: GestureDetector(
            onTapCancel: () {},
            onTapUp: (TapUpDetails details) {},
            onTapDown: (TapDownDetails details) {
              debugPrint("x " +
                  (details.localPosition.dx / imgWidth * 100).toString() +
                  " y " +
                  (100 - details.localPosition.dy / imgHeight * 100)
                      .toString());
            },
            child: categoryImage));

    stackChildren.add(imageContainer);
    var question = _currentQuestionInfo.question;
    var quizAnswerOptionsCoordinates =
        (question.questionService as ImageClickQuestionService)
            .getQuizAnswerOptionsCoordinates(question);
    quizAnswerOptionsCoordinates.sort((a, b) => -a.x.compareTo(b.x));
    quizAnswerOptionsCoordinates
        .sort((a, b) => pressedAnswerEqualsButton(a) ? 1 : -1);
    var allWidth = _screenDimensions.dimen(100);
    double btnSidePercent = 10;
    var btnSide = _screenDimensions.dimen(btnSidePercent);
    List<Widget> answerPointerStackChildren = [];
    var imageContainerHeight = _screenDimensions.h(85);
    answerPointerStackChildren.addAll(quizAnswerOptionsCoordinates
        .map((e) => SizedBox(
            width: allWidth,
            height: imageContainerHeight,
            child: createAnswerPointer(
                imgHeight,
                imgWidth,
                allWidth,
                imageContainerHeight,
                btnSide,
                rectangularImage,
                e,
                refreshSetState,
                goToNextScreenAfterPress)))
        .toList());
    stackChildren.add(Container(
        width: allWidth,
        height: imageContainerHeight,
        alignment: rectangularImage ? Alignment.center : Alignment.centerLeft,
        child: Stack(
          children: answerPointerStackChildren,
        )));
    return Expanded(
        child: Stack(
      alignment: rectangularImage ? Alignment.center : Alignment.centerLeft,
      children: stackChildren,
    ));
  }

  Widget createAnswerPointer(
    double imgHeight,
    double imgWidth,
    double allWidth,
    double imageContainerHeight,
    double btnSide,
    bool rectangularImage,
    ImageClickInfo imageClickInfo,
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    var pointerDimen = _screenDimensions.dimen(2.5);
    var borderWidth = FontConfig.standardBorderWidth;
    var originY = rectangularImage
        ? (imageContainerHeight - imgHeight) / 2 - btnSide / 2
        : -pointerDimen / 2 +
            ((imageContainerHeight - imgHeight) / 2) -
            (btnSide / 2 - borderWidth * 2);
    var originX = rectangularImage
        ? (allWidth - imgWidth) / 2 + btnSide / 2
        : -pointerDimen / 2 + borderWidth;
    var answerLabelWidth = imageClickInfo.arrowWidth + btnSide;
    var leftPad = _screenDimensions.w(1);
    var borderRadius = FontConfig.standardBorderRadius * 4;
    var pressedAnswerEqualsButtonVal =
        pressedAnswerEqualsButton(imageClickInfo);
    var answerBtn = Visibility(
        visible: !pressedAnswerEqualsButtonVal,
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
                                quizControlsService.onClickAnswerOptionBtn(
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
                                  borderRadius: borderRadius,
                                  borderColor: Colors.red,
                                  backgroundColor: Colors.lightGreenAccent))))),
            ])));
    var answerLabel = Visibility(
        visible: pressedAnswerEqualsButtonVal,
        child: Container(
            clipBehavior: Clip.none,
            width: answerLabelWidth,
            decoration: BoxDecoration(
              color: (quizControlsService.isAnswerCorrectInOptionsList(
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
    var answerPointer = rectangularImage
        ? Container()
        : Opacity(
            opacity: 1.0,
            child: SizedBox(
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
                          borderRadius: BorderRadius.circular(borderRadius),
                          border: Border.all(
                              color: Colors.red, width: borderWidth)),
                    ))));
    var answerLine = rectangularImage
        ? Container()
        : Padding(
            padding: EdgeInsets.only(left: leftPad),
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
                            color: Colors.red, width: borderWidth)))));
    return Stack(alignment: Alignment.centerLeft, children: [
      Positioned(
          top: originY + (100 - imageClickInfo.y) / 100 * imgHeight,
          left: originX + imageClickInfo.x / 100 * imgWidth,
          child: Stack(alignment: Alignment.center, children: [
            Row(children: [
              Stack(alignment: Alignment.centerLeft, children: [
                answerLine,
                answerPointer,
              ]),
              answerBtn,
            ]),
            answerLabel
          ]))
    ]);
  }

  bool pressedAnswerEqualsButton(ImageClickInfo imageClickInfo) {
    return _currentQuestionInfo.pressedAnswers.isNotEmpty &&
        _currentQuestionInfo.pressedAnswers.first == imageClickInfo.answerLabel;
  }
}
