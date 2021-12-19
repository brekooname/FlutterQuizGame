import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/in_app_purchases_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import 'my_popup.dart';

class InAppPurchasesPopupService {
  InAppPurchaseLocalStorage _inAppPurchaseLocalStorage =
      InAppPurchaseLocalStorage();
  late BuildContext context;

  static final InAppPurchasesPopupService singleton =
      InAppPurchasesPopupService.internal();

  factory InAppPurchasesPopupService({required BuildContext buildContext}) {
    singleton.context = buildContext;
    return singleton;
  }

  InAppPurchasesPopupService.internal();

  void showPopup({String? inAppPurchaseDescription}) {
    Future.delayed(
        Duration.zero,
        () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return InAppPurchasesPopup(inAppPurchaseDescription);
            }));
  }
}

class InAppPurchasesPopup extends StatelessWidget with MyPopup {
  InAppPurchaseLocalStorage _inAppPurchaseLocalStorage =
      InAppPurchaseLocalStorage();
  String? _inAppPurchaseDescription;

  InAppPurchasesPopup(this._inAppPurchaseDescription);

  @override
  AlertDialog build(BuildContext context) {
    initPopup(context: context);

    return createDialog(Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        imageService.getMainImage(
            imageName: "popup_in_app_purchases_background",
            module: "popup",
            maxWidth: defaultBackgroundImageWidth),
        SizedBox(height: screenDimensions.h(5)),
        MyText(
            fontConfig: FontConfig(fontSize: FontConfig.bigFontSize),
            text: _inAppPurchaseDescription ?? label.l_extra_content_ad_free),
        SizedBox(height: screenDimensions.h(5)),
        MyButton(
          text: label.l_buy,
          backgroundColor: Colors.lightGreenAccent,
          onClick: () {
            closePopup(context);
          },
        ),
        SizedBox(height: screenDimensions.h(5)),
        MyButton(
          text: label.l_restore_purchase,
          backgroundColor: Colors.grey.shade300,
          onClick: () {
            closePopup(context);
          },
        ),
      ],
    ));
  }
}
