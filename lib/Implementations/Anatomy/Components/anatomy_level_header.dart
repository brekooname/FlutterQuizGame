import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../../main.dart';

class AnatomyLevelHeader extends StatelessWidget {
  final ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  final int availableHints;
  final int totalWonQuestions;
  final int totalQuestionsLevel;
  final VoidCallback hintButtonOnClick;
  final bool disableHintBtn;

  AnatomyLevelHeader(
      {Key? key,
      required this.totalWonQuestions,
      required this.totalQuestionsLevel,
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

    var checkContainerDimen = screenDimensions.dimen(6);
    var checkContainerBorderRadius = FontConfig.standardBorderRadius / 2;
    for (int i = 0; i < totalQuestionsLevel; i++) {
      checkImgList.add(Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(i == 0 && !FontConfig.isRtlLanguage
                  ? checkContainerBorderRadius
                  : 0),
              right: Radius.circular(
                  (i == totalQuestionsLevel - 1) && !FontConfig.isRtlLanguage
                      ? checkContainerBorderRadius
                      : 0)),
          color: i < totalWonQuestions ? Colors.green : Colors.grey.shade200,
        ),
        height: checkContainerDimen,
        width: checkContainerDimen,
      ));
    }

    var questionsCheckRow = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(checkContainerBorderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: FontConfig.standardShadowRadius,
                blurRadius: FontConfig.standardShadowRadius)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: checkImgList,
        ));

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
                const Spacer(),
                questionsCheckRow,
                const Spacer(),
                hintBtn,
              ],
            )));
  }
}
