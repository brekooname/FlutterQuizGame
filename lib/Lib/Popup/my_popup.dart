import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/SnackBar/snack_bar_service.dart';

import '../../main.dart';
import '../Font/font_config.dart';

mixin MyPopup {
  late double width;
  late SizedBox margin;
  late NavigatorService _navigatorService;
  late double marginDoubleVal;
  double? height;
  SnackBarService snackBarService = SnackBarService();
  ImageService imageService = ImageService();
  ButtonSize buttonSize = ButtonSize();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  AssetImage? backgroundImage;

  void initPopup({String? backgroundImageName}) {
    if (backgroundImageName != null) {
      backgroundImage = imageService.getMainAssetImage(
        imageName: backgroundImageName,
        imageExtension: "png",
        module: "popup",
      );
    }
    _navigatorService = NavigatorService();
    width = ScreenDimensionsService.isPortrait()
        ? screenDimensions.dimen(100)
        : screenDimensions.w(70);
    marginDoubleVal = screenDimensions.dimen(6);
    var marginDimen = marginDoubleVal;
    margin = SizedBox(
      height: marginDimen,
      width: marginDimen,
    );
  }

  double get defaultBackgroundImageWidth => width / 3.4;

  AlertDialog createDialog(Widget mainContent,
      {required BuildContext context, VoidCallback? onCloseBtnClick}) {
    DecorationImage? decorationImage;
    var lightScreenContrast = MyApp.appId.gameConfig.isLightScreenContrast;
    if (backgroundImage != null) {
      decorationImage = DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            (lightScreenContrast ? Colors.white : Colors.black)
                .withOpacity(lightScreenContrast ? 0.175 : 0.05),
            BlendMode.dstATop),
        image: backgroundImage!,
      );
    }

    var edgeInsets = const EdgeInsets.all(0);
    return AlertDialog(
        contentPadding: edgeInsets,
        insetPadding: edgeInsets,
        actionsPadding: edgeInsets,
        buttonPadding: edgeInsets,
        titlePadding: edgeInsets,
        scrollable: true,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius)),
        backgroundColor:
            lightScreenContrast ? Colors.white : Colors.grey.shade900,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: BoxDecoration(
                  image: decorationImage,
                ),
                width: width,
                height: height,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(marginDoubleVal, marginDoubleVal,
                      marginDoubleVal, marginDoubleVal * 2),
                  child: Column(children: [
                    Container(
                        alignment: Alignment.topRight,
                        child: createClosePopupBtn(context, onCloseBtnClick)),
                    mainContent
                  ]),
                )),
          ],
        ));
  }

  void closePopup(BuildContext context) {
    _navigatorService.pop(context);
  }

  Widget createClosePopupBtn(
      BuildContext context, VoidCallback? onCloseBtnClick) {
    var closeBtnWidth = screenDimensions.dimen(9);
    return MyButton(
        size: Size(closeBtnWidth, closeBtnWidth),
        onClick: () {
          if (onCloseBtnClick == null) {
            _navigatorService.pop(context);
          } else {
            onCloseBtnClick.call();
          }
        },
        buttonSkinConfig: ButtonSkinConfig(
            icon: Icon(Icons.clear, color: Colors.red, size: closeBtnWidth)));
  }

  static void showPopup(BuildContext context, Widget popupToShow) {
    Future.delayed(
        Duration.zero,
        () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return popupToShow;
            }));
  }
}
