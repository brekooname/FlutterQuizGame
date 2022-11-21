import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

import '../../main.dart';
import '../Font/font_config.dart';
import '../Internet/internet_service.dart';
import '../Text/my_text.dart';
import 'my_popup.dart';

class BuyProPopup extends StatefulWidget {
  final InternetService _internetService = InternetService();
  final MyTextService _myTextService = MyTextService();
  final VoidCallback executeAfterClose;

  BuyProPopup(this.executeAfterClose, {Key? key}) : super(key: key);

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
              label.l_download_param0_for_more_levels,
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
              closePopup();
              widget.executeAfterClose.call();
              widget._internetService
                  .openAppUrl(MyApp.appProStoreId, false, context);

            },
          ),
        ],
      ),
    );
  }

  @override
  Widget createClosePopupBtn(VoidCallback? onCloseBtnClick) {
    return super.createClosePopupBtn(() {
      closePopup();
      widget.executeAfterClose.call();
    });
  }
}
