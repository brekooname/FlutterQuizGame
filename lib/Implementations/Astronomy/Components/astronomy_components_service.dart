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

  Widget createLevelBtn(VoidCallback onClick, String btnImageName,
      String btnText, int answQ, int totalQ) {
    var horizMargin = _screenDimensions.dimen(3);
    var vertMargin = _screenDimensions.dimen(4);
    var scoreText = MyText(
      fontConfig: FontConfig(
        fontSize: FontConfig.getCustomFontSize(answQ == totalQ
            ? 1.1
            : answQ > 0
                ? 1.0
                : 0.9),
        fontWeight: FontWeight.w900,
        borderWidth: FontConfig.standardBorderWidth / 2,
        fontColor: answQ == totalQ
            ? Colors.lightGreenAccent
            : answQ > 0
                ? Colors.lightBlueAccent.withOpacity(0.9)
                : Colors.grey.shade400.withOpacity(0.3),
      ),
      text: answQ.toString() + "/" + totalQ.toString(),
    );
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
                  Container(
                    width: _screenDimensions.dimen(20),
                    decoration: BoxDecoration(
                        color:
                            Colors.lightBlueAccent.withOpacity(answQ == totalQ
                                ? 0.2
                                : answQ > 0
                                    ? 0.2
                                    : 0.1),
                        borderRadius: BorderRadius.circular(
                            FontConfig.standardBorderRadius)),
                    child: scoreText,
                  ),
                  MyButton(
                    onClick: () {
                      onClick.call();
                    },
                    buttonSkinConfig: ButtonSkinConfig(
                        image: _imageService.getSpecificImage(
                            maxWidth: _screenDimensions.dimen(18),
                            imageName: btnImageName,
                            imageExtension: "png",
                            module: "buttons"),
                        borderRadius: FontConfig.standardBorderRadius * 4),
                    size: Size(_screenDimensions.dimen(40),
                        _screenDimensions.dimen(39)),
                    fontConfig: FontConfig(fontColor: Colors.black),
                    text: btnText,
                    textMaxLines: 2,
                  ),
                ])));
  }
}
