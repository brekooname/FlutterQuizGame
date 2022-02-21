import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
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
      {Key? key,
      required BuildContext context,
      required this.myPopupToDisplay,
      required this.iconName})
      : super(key: key) {
    var side = _screenDimensions.dimen(14);
    _buttonSize = Size(side, side);
  }

  @override
  Widget build(BuildContext context) {
    var margin = _screenDimensions.dimen(3);
    var btn = Padding(
        padding: EdgeInsets.all(margin),
        child: SizedBox(
            height: _buttonSize.height,
            width: _buttonSize.width,
            child: FittedBox(
                child: FloatingActionButton(
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
                    child: MyButton(
                        onClick: () {
                          MyPopup.showPopup(context, myPopupToDisplay);
                        },
                        size: _buttonSize,
                        buttonSkinConfig: ButtonSkinConfig(
                          image: (_imageService.getMainImage(
                            imageName: iconName,
                            imageExtension: "png",
                            module: "buttons",
                            maxWidth: _buttonSize.width,
                          )),
                        ),
                        fontConfig: FontConfig())))));

    return btn;
  }
}
