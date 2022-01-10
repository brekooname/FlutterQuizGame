import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class FloatingButton extends StatelessWidget {
  final ImageService _imageService = ImageService();
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  StatefulWidget myPopupToDisplay;
  String iconName;
  late Size _buttonSize;

  FloatingButton(
      {Key? key, required BuildContext context,
      required this.myPopupToDisplay,
      required this.iconName}) : super(key: key) {
    var side = _screenDimensions.w(12);
    _buttonSize = Size(side, side);
  }

  @override
  Widget build(BuildContext context) {
    var margin = _screenDimensions.w(1);
    var btn = FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        foregroundColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {},
        child: Padding(
            padding: EdgeInsets.fromLTRB(margin, margin, margin, margin),
            child: MyButton(
                onClick: () {
                  Future.delayed(
                      Duration.zero,
                      () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return myPopupToDisplay;
                          }));
                },
                size: _buttonSize,
                buttonSkinConfig: ButtonSkinConfig(
                  image: (_imageService.getMainImage(
                      imageName: iconName,
                      module: "buttons",
                      maxWidth: _buttonSize.width)),
                ),
                fontConfig: FontConfig())));

    return btn;
  }
}
