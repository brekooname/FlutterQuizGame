import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/reset_content_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../main.dart';
import '../Font/font_config.dart';
import '../Internet/internet_service.dart';
import '../Text/my_text.dart';
import 'in_app_purchase_popup.dart';
import 'my_popup.dart';

class BuyProPopup extends StatefulWidget {
  InternetService internetService = InternetService();
  MyTextService _myTextService = MyTextService();

  BuyProPopup({Key? key}) : super(key: key);

  @override
  State<BuyProPopup> createState() => BuyProPopupState();
}

class BuyProPopupState extends State<BuyProPopup> with MyPopup, LabelMixin {
  @override
  void initState() {
    super.initState();
    initPopup(backgroundImageName: "popup_in_app_purchases_background");
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          margin,
          Column(
            children: widget._myTextService.createMyTextWithOneParam(
              label.l_download_param0_pro_for_more_levels,
              MyApp.appTitle + " Pro",
              FontConfig(),
              FontConfig(
                  fontWeight: FontWeight.w700,
                  fontSize: FontConfig.getCustomFontSize(1.3),
                  fontColor: Colors.blue.shade700),
            ),
          ),
          margin,
          MyButton(
            text: label.l_download,
            backgroundColor: Colors.lightGreenAccent,
            onClick: () {
              closePopup(context);
              widget.internetService
                  .openAppUrl(MyApp.appRatingPackage, true, context);
            },
          ),
        ],
      ),
      context: context,
    );
  }
}
