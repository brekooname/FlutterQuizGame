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
      {VoidCallback? onCloseBtnClick}) {
    DecorationImage? decorationImage;
    var lightScreenContrast = MyApp.appId.gameConfig.isLightScreenContrast;
    if (backgroundImage != null) {
      var backgroundColor = (lightScreenContrast ? Colors.white : Colors.black)
          .withOpacity(lightScreenContrast ? 0.175 : 0.05);
      decorationImage = DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(backgroundColor, BlendMode.dstATop),
        image: backgroundImage!,
      );
    }

    var edgeInsets = const EdgeInsets.all(0);
    var closeBtnContainer = Container(
        alignment: Alignment.topRight,
        child: createClosePopupBtn(onCloseBtnClick));
    var contentWithPadding = Padding(
      padding: EdgeInsets.fromLTRB(marginDoubleVal, marginDoubleVal,
          marginDoubleVal, marginDoubleVal * 2),
      child: Column(children: [closeBtnContainer, mainContent]),
    );
    return AlertDialog(
      contentPadding: edgeInsets,
      insetPadding: edgeInsets,
      actionsPadding: edgeInsets,
      buttonPadding: edgeInsets,
      titlePadding: edgeInsets,
      scrollable: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FontConfig.standardBorderRadius)),
      backgroundColor:
          lightScreenContrast ? Colors.white : Colors.grey.shade900,
      content: Container(
          decoration: BoxDecoration(
            image: decorationImage,
          ),
          width: width,
          height: height,
          child: contentWithPadding),
    );
  }

  void closePopup() {
    _navigatorService.pop();
  }

  Widget createClosePopupBtn(VoidCallback? onCloseBtnClick) {
    var closeBtnWidth = screenDimensions.dimen(9);
    return MyButton(
        size: Size(closeBtnWidth, closeBtnWidth),
        onClick: () {
          _executeOnCloseBtnClick(onCloseBtnClick);
        },
        buttonSkinConfig: ButtonSkinConfig(
            icon: Icon(Icons.clear, color: Colors.red, size: closeBtnWidth)));
  }

  void _executeOnCloseBtnClick(VoidCallback? onCloseBtnClick) {
    if (onCloseBtnClick == null) {
      _navigatorService.pop();
    } else {
      onCloseBtnClick.call();
    }
  }

  static void showPopup(Widget popupToShow) {
    Future.delayed(
        Duration.zero,
        () => showDialog(
            barrierDismissible: false,
            context: MyApp.globalKey.currentState!.overlay!.context,
            builder: (BuildContext context) {
              return WillPopScope(
                  onWillPop: () {
                    return Future.value(false);
                  },
                  child: popupToShow);
            }));
  }
}
