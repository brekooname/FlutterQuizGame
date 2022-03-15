import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Components/anatomy_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class AnatomyImageClickScreen
    extends GameScreen<AnatomyGameContext, AnatomyScreenManagerState> {
  AnatomyGameQuestionConfig gameQuestionConfig = AnatomyGameQuestionConfig();

  AnatomyImageClickScreen(
    AnatomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AnatomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AnatomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key);

  @override
  State<AnatomyImageClickScreen> createState() =>
      AnatomyImageClickScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AnatomyImageClickScreenState extends State<AnatomyImageClickScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    var mainColumn = Column(
      children: <Widget>[
        AnatomyLevelHeader(
          questionText:
              widget.currentQuestionInfo.question.questionToBeDisplayed,
        ),
        _getQuestionImage()
      ],
    );

    return mainColumn;
  }

  void setStateCallback() {
    setState(() {});
  }

  Widget _getQuestionImage() {
    var imgDimen = widget.gameQuestionConfig.categoryImgDimen
        .get<QuestionCategory, Size>(widget.category)!;
    var maxImgHeight =
        screenDimensions.h((imgDimen.height / imgDimen.width < 2) ? 65 : 80);
    var maxImgWidth = screenDimensions.w(80);

    var heightGreaterThanWidth = imgDimen.width <= imgDimen.height;
    Image categoryImage = imageService.getSpecificImage(
      imageName: widget.category.index.toString(),
      imageExtension: "png",
      module: "categories",
      maxWidth: heightGreaterThanWidth ? null : maxImgWidth,
      maxHeight: heightGreaterThanWidth ? maxImgHeight : null,
    );

    List<Widget> stackChildren = [];

    double imgHeight = heightGreaterThanWidth
        ? maxImgHeight
        : screenDimensions.getNewHeightForNewWidth(
            maxImgWidth, imgDimen.width, imgDimen.height);
    double imgWidth = heightGreaterThanWidth
        ? screenDimensions.getNewWidthForNewHeight(
            maxImgHeight, imgDimen.width, imgDimen.height)
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
    var question = widget.currentQuestionInfo.question;
    var quizAnswerOptionsCoordinates =
        (question.questionService as ImageClickQuestionService)
            .getQuizAnswerOptionsCoordinates(question);
    quizAnswerOptionsCoordinates.sort((a, b) => a.y.compareTo(b.y));
    quizAnswerOptionsCoordinates =
        quizAnswerOptionsCoordinates.reversed.toList();
    var allWidth = screenDimensions.dimen(100);
    double btnSidePercent = 15;
    var btnSide = screenDimensions.dimen(btnSidePercent);
    //we update the arrow with if two buttons are overlapping
    for (ImageClickInfo info1 in quizAnswerOptionsCoordinates) {
      for (ImageClickInfo info2 in quizAnswerOptionsCoordinates) {
        if (info1.y != info2.y &&
            info1.x != info2.x &&
            (info1.y - info2.y).abs() < (btnSidePercent + 1) &&
            (info1.x - info2.x).abs() < (btnSidePercent + 1) &&
            (info1.arrowWidth - info2.arrowWidth) == 0) {
          info1.arrowWidth = screenDimensions.dimen(Random().nextInt(20) + 5);
        }
      }
    }

    List<Widget> answerPointerStackChildren = [];
    var imageContainerHeight = screenDimensions.h(85);
    answerPointerStackChildren.addAll(quizAnswerOptionsCoordinates
        .map((e) => SizedBox(
            width: allWidth,
            height: imageContainerHeight,
            child: createAnswerPointer(imgHeight, imgWidth, allWidth,
                imageContainerHeight, btnSide, e)))
        .toList());
    stackChildren.add(Container(
        width: allWidth,
        height: imageContainerHeight,
        alignment: Alignment.centerLeft,
        child: Stack(
          children: answerPointerStackChildren,
        )));
    return Expanded(
        child: Stack(
      alignment: Alignment.centerLeft,
      children: stackChildren,
    ));
  }

  Widget createAnswerPointer(
      double imgHeight,
      double imgWidth,
      double allWidth,
      double imageContainerHeight,
      double btnSide,
      ImageClickInfo imageClickInfo) {
    var borderRadius = FontConfig.standardBorderRadius * 4;
    var pointerDimen = screenDimensions.dimen(2.5);
    var originY = -pointerDimen / 2 +
        ((imageContainerHeight - imgHeight) / 2) -
        (btnSide - borderRadius / 2);
    var answerLabelWidth = imageClickInfo.arrowWidth + btnSide;
    // var originX = -pointerDimen / 2 + ((allWidth - imgWidth) / 2);
    var originX = -pointerDimen / 2;
    var leftPad = screenDimensions.w(1);
    bool rectangularImage = imgHeight / imgWidth < 1.2;
    var answerBtn = SizedBox(
        width: btnSide,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Opacity(
              opacity: 0.75,
              child: SizedBox(
                  height: btnSide,
                  width: btnSide,
                  child: AnimateZoomInZoomOut(
                      toAnimateWidgetSize: Size(btnSide, btnSide),
                      zoomAmount: AnimateZoomInZoomOut.defaultZoomAmount * 5,
                      toAnimateWidget: MyButton(
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
        ]));
    var answerLabel = Visibility(
        visible: false,
        child: Container(
            clipBehavior: Clip.none,
            width: answerLabelWidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: MyText(
              maxLines: 1,
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
                              color: Colors.red,
                              width: FontConfig.standardBorderWidth)),
                    ))));
    var answerLine = rectangularImage
        ? Container()
        : Padding(
            padding: EdgeInsets.only(left: leftPad),
            child: Opacity(
                opacity: 0.7,
                child: Container(
                    width: imageClickInfo.arrowWidth,
                    height: screenDimensions.h(1),
                    decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(
                            FontConfig.standardBorderRadius),
                        border: Border.all(
                            color: Colors.red,
                            width: FontConfig.standardBorderWidth)))));
    return Stack(alignment: Alignment.centerLeft, children: [
      Positioned(
          top: originY + (100 - imageClickInfo.y) / 100 * imgHeight,
          left: originX + imageClickInfo.x / 100 * imgWidth,
          // top: originY + imgHeight,
          // left: originX + imgWidth,
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
}
