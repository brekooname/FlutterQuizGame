import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';


class PersTestReportNotAvailablePopup extends StatefulWidget with MyPopup {
  VoidCallback startTestCallback;

  PersTestReportNotAvailablePopup(this.startTestCallback, {Key? key})
      : super(key: key);

  @override
  State<PersTestReportNotAvailablePopup> createState() =>
      PersTestReportNotAvailablePopupState();
}

class PersTestReportNotAvailablePopupState
    extends State<PersTestReportNotAvailablePopup> with MyPopup {
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
                text:
                    "Report not available.\nComplete the personality test first."),
            margin,
            MyButton(
              text: "Start test",
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
