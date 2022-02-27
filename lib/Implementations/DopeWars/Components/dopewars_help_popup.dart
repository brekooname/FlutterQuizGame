import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class DopeWarsHelpPopup extends StatefulWidget with MyPopup {
  String helpText;

  DopeWarsHelpPopup(this.helpText, {Key? key}) : super(key: key);

  @override
  State<DopeWarsHelpPopup> createState() =>
      DopeWarsHelpPopupState();
}

class DopeWarsHelpPopupState extends State<DopeWarsHelpPopup>
    with MyPopup {
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
              text: widget.helpText,
            ),
            margin,
          ]),
      context: context,
    );
  }
}
