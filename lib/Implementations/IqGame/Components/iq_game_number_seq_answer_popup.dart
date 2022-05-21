import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';

import '../Questions/iq_game_context.dart';

class IqGameIqNumberSeqAnswerPopup extends StatefulWidget with MyPopup {
  IqGameContext iqGameContext;
  Widget questionImageStack;
  static const double _popupHeightPercent = 80;

  IqGameIqNumberSeqAnswerPopup(this.iqGameContext, this.questionImageStack,
      {Key? key})
      : super(key: key);

  @override
  State<IqGameIqNumberSeqAnswerPopup> createState() =>
      IqGameIqNumberSeqAnswerPopupState();
}

class IqGameIqNumberSeqAnswerPopupState
    extends State<IqGameIqNumberSeqAnswerPopup> with MyPopup {
  @override
  void initState() {
    initPopup();
    width = screenDimensions.w(90);
    height =
        screenDimensions.h(IqGameIqNumberSeqAnswerPopup._popupHeightPercent);
    super.initState();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      SizedBox(
          width: screenDimensions.w(100),
          height: screenDimensions
              .h(IqGameIqNumberSeqAnswerPopup._popupHeightPercent),
          child: widget.questionImageStack),
      context: context,
    );
  }
}
