import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../main.dart';

class AnatomyLevelHeader extends StatelessWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  String questionText;
  int availableHints;
  VoidCallback hintButtonOnClick;
  bool disableHintBtn;

  AnatomyLevelHeader(
      {Key? key,
      required this.questionText,
      this.disableHintBtn = false,
      required this.hintButtonOnClick,
      required this.availableHints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  Widget createLevelHeader(BuildContext context) {
    var hintBtn = HintButton(
        onClick: hintButtonOnClick,
        availableHints: availableHints,
        disabled: disableHintBtn,
        watchRewardedAdForHint: MyApp.isExtraContentLocked,
        showAvailableHintsText: true);

    return Container(
        height: screenDimensions.dimen(16),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.3),
        ),
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: screenDimensions.dimen(2)),
                MyText(text: questionText),
                const Spacer(),
                hintBtn,
              ],
            )));
  }
}
