import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class HistoryGameLevelHeader extends StatelessWidget {
  String score;
  bool animateScore;
  int availableHints;
  VoidCallback hintButtonOnClick;
  VoidCallback onBackButtonClick;
  bool disableHintBtn;
  CampaignLevel campaignLevel;
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  HistoryGameLevelHeader(
      {Key? key, required this.score,
      required this.campaignLevel,
      this.animateScore = false,
      this.disableHintBtn = false,
      required this.hintButtonOnClick,
      required this.onBackButtonClick,
      required this.availableHints}) : super(key: key);

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

    var scoreTextWidth = screenDimensions.w(60);
    var scoreText = MyText(
      maxLines: 1,
      width: scoreTextWidth,
      text: score.toString(),
      fontConfig: FontConfig(
          textColor: Colors.yellow,
          borderColor: Colors.black,
          fontSize: FontConfig.bigFontSize),
    );

    return Container(
        height: screenDimensions.h(9),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.3),
        ),
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.w(1)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: screenDimensions.w(2)),
                SizedBox(
                    width: scoreTextWidth,
                    child: animateScore
                        ? AnimateZoomInZoomOutText(
                            zoomAmount: 1.4,
                            zoomInZoomOutOnce: true,
                            toAnimateText: scoreText)
                        : scoreText),
                const Spacer(),
                hintBtn,
              ],
            )));
  }
}
