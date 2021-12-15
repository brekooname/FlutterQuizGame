import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

mixin MyPopup {
  late double width;
  late BuildContext buildContext;
  late NavigatorService _navigatorService;
  LocalizationService localizationService = LocalizationService();
  ImageService imageService = ImageService();
  ButtonSize buttonSize = ButtonSize();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  void initPopup(BuildContext context) {
    this.buildContext = context;
    this._navigatorService = NavigatorService();
    this.width = screenDimensions.w(100);
  }

  double get defaultBackgroundImageWidth => width / 3.4;

  AlertDialog createDialog(Widget mainContent,
      {VoidCallback? onCloseBtnClick}) {
    double margin = screenDimensions.h(3);
    return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        insetPadding: EdgeInsets.all(0),
        actionsPadding: EdgeInsets.all(0),
        buttonPadding: EdgeInsets.all(0),
        titlePadding: EdgeInsets.all(0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        FontConfig.standardBorderRadius),
                    color: Colors.white),
                width: width,
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(margin, margin, margin, margin * 2),
                  child: Column(children: [
                    Container(
                        alignment: Alignment.topRight,
                        child:
                            createClosePopupBtn(buildContext, onCloseBtnClick)),
                    mainContent
                  ]),
                )),
          ],
        ));
  }

  void closePopup(BuildContext context){
    _navigatorService.pop(context);
  }

  MyButton createClosePopupBtn(
      BuildContext context, VoidCallback? onCloseBtnClick) {
    var closeBtnWidth = screenDimensions.w(9);
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

  AppLocalizations get label => MyApp.appLocalizations;

  String formatTextWithOneParam(String labelText, String param) {
    return localizationService.formatTextWithParams(labelText, [param]);
  }

  String formatTextWithTwoParams(
      String labelText, String param1, String param2) {
    return localizationService
        .formatTextWithParams(labelText, [param1, param2]);
  }
}
