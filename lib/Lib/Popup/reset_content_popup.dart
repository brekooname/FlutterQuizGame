import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import 'my_popup.dart';

class ResetContentPopup extends StatefulWidget with MyPopup {
  VoidCallback resetContent;
  VoidCallback _refreshScreenCallback;

  ResetContentPopup(this.resetContent, this._refreshScreenCallback);

  @override
  State<ResetContentPopup> createState() => ResetContentPopupState();
}

class ResetContentPopupState extends State<ResetContentPopup> with MyPopup {
  @override
  AlertDialog build(BuildContext context) {
    initPopup(context);

    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenDimensions.h(5)),
            MyText(text: label.l_delete_all_progress),
            SizedBox(height: screenDimensions.h(5)),
            MyButton(
              text: label.l_yes,
              backgroundColor: Colors.redAccent.shade200,
              onClick: () {
                widget._refreshScreenCallback.call();
                widget.resetContent.call();
                closePopup(context);
              },
            ),
            SizedBox(height: screenDimensions.h(5)),
            MyButton(
              text: label.l_no,
              backgroundColor: Colors.blue.shade300,
              onClick: () {
                closePopup(context);
              },
            ),
          ]),
    );
  }
}
