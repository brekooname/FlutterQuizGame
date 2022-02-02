import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestAttrDescriptionPopup extends StatefulWidget with MyPopup {

  PersTestAttrDescriptionPopup({Key? key}) : super(key: key);

  @override
  State<PersTestAttrDescriptionPopup> createState() =>
      PersTestAttrDescriptionPopupState();
}

class PersTestAttrDescriptionPopupState
    extends State<PersTestAttrDescriptionPopup> with MyPopup {
  @override
  void initState() {
    initPopup();
    width=screenDimensions.w(90);
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
                    "Emotional Stability is often referred to by other names, such as Neruoticism or Negative Emotionality (in these two cases interpretations are inverted, as Neruoticism and Negative Emotionality can be though of as the opposite of Emotional Stability)."),
            margin,
          ]),
      context: context,
    );
  }
}
