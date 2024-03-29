import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class HistoryGameLevelHeader extends StatelessWidget {
  final String score;
  final bool animateScore;
  final int availableHints;
  final VoidCallback hintButtonOnClick;
  final bool disableHintBtn;
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  HistoryGameLevelHeader(
      {Key? key,
      required this.score,
      this.animateScore = false,
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

    var scoreTextWidth = _screenDimensions.dimen(60);
    var scoreText = MyText(
      maxLines: 1,
      width: scoreTextWidth,
      text: score.toString(),
      fontConfig: FontConfig(
          fontColor: Colors.yellow,
          borderColor: Colors.black,
          fontSize: FontConfig.bigFontSize),
    );

    return Container(
        height: _screenDimensions.dimen(16),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.3),
        ),
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: _screenDimensions.dimen(2)),
                SizedBox(
                    width: scoreTextWidth,
                    child: animateScore
                        ? AnimateZoomInZoomOutText(
                            zoomAmount: 1.1,
                            executeAnimationOnlyOnce: true,
                            toAnimateText: scoreText)
                        : scoreText),
                const Spacer(),
                hintBtn,
              ],
            )));
  }
}
