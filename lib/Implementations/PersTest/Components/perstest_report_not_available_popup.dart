import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestReportNotAvailablePopup extends StatefulWidget {
  VoidCallback startTestCallback;

  PersTestReportNotAvailablePopup(this.startTestCallback, {Key? key})
      : super(key: key);

  @override
  State<PersTestReportNotAvailablePopup> createState() =>
      PersTestReportNotAvailablePopupState();
}

class PersTestReportNotAvailablePopupState
    extends State<PersTestReportNotAvailablePopup> with MyPopup, LabelMixin {
  @override
  void initState() {
    initPopup();
    super.initState();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            margin,
            MyText(
                text: label
                    .l_report_not_available_complete_the_personality_test_first),
            margin,
            MyButton(
              text: label.l_start_the_test,
              backgroundColor: Colors.green.shade200,
              onClick: () {
                widget.startTestCallback.call();
                closePopup(context);
              },
            ),
          ]),
      context: context,
    );
  }
}
