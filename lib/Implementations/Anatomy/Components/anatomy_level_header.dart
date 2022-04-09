import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../../main.dart';

class AnatomyLevelHeader extends StatelessWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  int availableHints;
  int totalWonQuestions;
  int totalQuestionsLevel;
  Image checkImg;
  Widget checkImgGrayscale;
  VoidCallback hintButtonOnClick;
  bool disableHintBtn;

  AnatomyLevelHeader(
      {Key? key,
      required this.totalWonQuestions,
      required this.totalQuestionsLevel,
      required this.checkImg,
      required this.checkImgGrayscale,
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

    List<Widget> checkImgList = [];

    for (int i = 0; i < totalQuestionsLevel; i++) {
      checkImgList.add(i < totalWonQuestions ? checkImg : checkImgGrayscale);
    }

    var questionsCheckRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: checkImgList,
    );

    return Container(
        height: screenDimensions.dimen(16),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.3),
        ),
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.dimen(1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: screenDimensions.dimen(2)),
                questionsCheckRow,
                const Spacer(),
                hintBtn,
              ],
            )));
  }
}
