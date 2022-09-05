import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_score_progress_bar_chart.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';

class IqGameScoreProgressPopup extends StatefulWidget with MyPopup {
  final IqGameLocalStorage _iqGameLocalStorage = IqGameLocalStorage();
  QuestionCategory cat;

  IqGameScoreProgressPopup(this.cat, {Key? key}) : super(key: key);

  @override
  State<IqGameScoreProgressPopup> createState() =>
      IqGameScoreProgressPopupState();
}

class IqGameScoreProgressPopupState extends State<IqGameScoreProgressPopup>
    with MyPopup, LabelMixin {
  @override
  void initState() {
    initPopup();
    super.initState();
  }

  @override
  AlertDialog build(BuildContext context) {
    List<IqGameScoreInfo> scoreInfo =
        widget._iqGameLocalStorage.getScoreForCat(widget.cat.name);
    var graphHeight = screenDimensions.dimen(40);
    var graphWidth = screenDimensions.w(70);
    int maxScore = scoreInfo.isEmpty
        ? -1
        : scoreInfo.reduce((a1, a2) => a1.score > a2.score ? a1 : a2).score;
    var legendFontConfig = FontConfig(
        fontColor: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: FontConfig.getCustomFontSize(0.8));
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
                text: label.l_score_history,
                fontConfig: FontConfig(
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: FontConfig.getCustomFontSize(1.0))),
            scoreInfo.isEmpty
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(bottom: screenDimensions.dimen(5)),
                    child: MyText(
                      text: label.l_maximum_score + ": " + maxScore.toString(),
                      fontColor: Colors.green.shade600,
                    )),
            scoreInfo.isEmpty
                ? MyText(text: label.l_not_available)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: screenDimensions.dimen(5)),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: MyText(
                                text: label.l_score,
                                fontConfig: legendFontConfig,
                              ),
                            )),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: graphWidth,
                                  height: graphHeight,
                                  child: IqGameScoreProgressBarChart(
                                      scoreInfo, maxScore)),
                              MyText(
                                  fontConfig: legendFontConfig,
                                  text: label.l_number_of_games_played)
                            ]),
                      ]),
          ]),
    );
  }
}
