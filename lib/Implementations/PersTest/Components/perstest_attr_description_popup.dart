import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestDescriptionPopup extends StatefulWidget with MyPopup {
  final String description;

  PersTestDescriptionPopup(this.description, {Key? key}) : super(key: key);

  @override
  State<PersTestDescriptionPopup> createState() =>
      PersTestDescriptionPopupState();
}

class PersTestDescriptionPopupState extends State<PersTestDescriptionPopup>
    with MyPopup {
  @override
  void initState() {
    initPopup(width: screenDimensions.w(90));
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
              text: widget.description,
            ),
            margin,
          ]),
    );
  }
}
