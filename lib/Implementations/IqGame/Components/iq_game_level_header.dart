import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

class IqGameLevelHeader extends StatelessWidget {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();
  VoidCallback? skipQuestion;

  IqGameLevelHeader(this.skipQuestion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  Widget createLevelHeader(BuildContext context) {
    var myBackButton = MyBackButton();
    return Container(
        height: _screenDimensions.dimen(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                myBackButton,
                const Spacer(),
                skipQuestion == null
                    ? Container()
                    : MyButton(
                        size: myBackButton.buttonSize,
                        onClick: () {
                          skipQuestion!.call();
                        },
                        buttonSkinConfig: ButtonSkinConfig(
                          image: (_imageService.getSpecificImage(
                              imageName: "btn_next",
                              imageExtension: "png",
                              module: "buttons",
                              maxWidth: myBackButton.buttonSize.width)),
                        ))
              ],
            )));
  }
}
