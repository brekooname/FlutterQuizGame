import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class GeoQuizGameLevelHeader extends StatelessWidget {
  bool animateStepIncrease;
  int availableHints;
  int nrOfCorrectAnsweredQuestions;
  VoidCallback hintButtonOnClick;

  bool disableHintBtn;
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  GeoQuizGameLevelHeader(
      {Key? key,
      this.animateStepIncrease = false,
      this.disableHintBtn = false,
      required this.nrOfCorrectAnsweredQuestions,
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

    var headerHeight = screenDimensions.h(9);
    var container = SizedBox(
        height: headerHeight,
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.w(1)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: screenDimensions.w(2)),
                const Spacer(),
                hintBtn,
              ],
            )));

    var progressBarWidth = screenDimensions.w(65);
    Stack stack = Stack(
      alignment: Alignment.center,
      children: [
        ProgressBar(
          width: progressBarWidth,
          height: headerHeight / 1.5,
          fillBarColor: Colors.purpleAccent.shade100.withOpacity(0.5),
          animateStepIncrease: animateStepIncrease,
          currentStep: nrOfCorrectAnsweredQuestions,
          widthPerStep: progressBarWidth / 3,
        ),
        container
      ],
    );

    return stack;
  }
}
