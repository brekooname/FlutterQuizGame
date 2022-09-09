import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Button/my_button.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../Lib/Image/image_service.dart';
import '../../../Lib/ScreenDimensions/screen_dimensions_service.dart';
import '../../../Lib/Text/my_text.dart';

class AstronomyComponentsService {
  final ImageService _imageService = ImageService();
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  static final AstronomyComponentsService singleton =
      AstronomyComponentsService.internal();

  factory AstronomyComponentsService() {
    return singleton;
  }

  AstronomyComponentsService.internal();

  Widget createLevelBtn(
      VoidCallback onClick,
      String btnImageName,
      String btnText,
      int answQ,
      int totalQ,
      bool isContentLocked,
      VoidCallback? refreshScreen) {
    var horizMargin = _screenDimensions.dimen(3);
    var vertMargin = _screenDimensions.dimen(4);
    var allQuestionsAnswered = answQ == totalQ;
    var atLeastOneQuestionAnswered = answQ > 0;
    var fontSize = FontConfig.getCustomFontSize(allQuestionsAnswered
        ? 1.1
        : atLeastOneQuestionAnswered
            ? 1.0
            : 0.9);
    var scoreText = MyText(
      fontConfig: FontConfig(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        borderWidth: FontConfig.standardBorderWidth / 2,
        fontColor: allQuestionsAnswered
            ? Colors.lightGreenAccent
            : atLeastOneQuestionAnswered
                ? Colors.lightBlueAccent.withOpacity(0.9)
                : Colors.grey.shade400.withOpacity(0.3),
      ),
      text: answQ.toString() + "/" + totalQ.toString(),
    );
    var scoreBackgroundOpacity = allQuestionsAnswered
        ? 0.2
        : atLeastOneQuestionAnswered
            ? 0.2
            : 0.1;
    var scoreContainer = Container(
      width: _screenDimensions.dimen(20),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(scoreBackgroundOpacity),
          borderRadius: BorderRadius.circular(FontConfig.standardBorderRadius)),
      child: scoreText,
    );
    var btnIcon = _imageService.getSpecificImage(
        maxWidth: _screenDimensions.dimen(18),
        imageName: btnImageName,
        imageExtension: "png",
        module: "buttons");
    return Padding(
        padding: EdgeInsets.only(
            left: horizMargin,
            right: horizMargin,
            top: vertMargin,
            bottom: vertMargin),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              repeat: ImageRepeat.repeat,
              opacity: 0.2,
              image: _imageService
                  .getSpecificImage(
                      imageName: "title_background", imageExtension: "png")
                  .image,
            )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  scoreContainer,
                  MyButton(
                    onClick: () {
                      onClick.call();
                    },
                    contentLockedConfig: ContentLockedConfig(
                      isContentLocked: isContentLocked,
                      executeAfterPurchase: refreshScreen,
                      lockedIcon: _imageService.getSpecificImage(
                          imageName: "btn_locked",
                          imageExtension: "png",
                          module: "buttons"),
                    ),
                    buttonSkinConfig: ButtonSkinConfig(
                        image: btnIcon,
                        borderRadius: FontConfig.standardBorderRadius * 4),
                    size: Size(_screenDimensions.dimen(40),
                        _screenDimensions.dimen(39)),
                    fontConfig: FontConfig(fontColor: Colors.black),
                    text: btnText,
                    textMaxLines: btnText.length > 11 &&
                            btnText.length < 18 &&
                            !btnText.contains(" ")
                        ? 1
                        : 2,
                  ),
                ])));
  }
}
