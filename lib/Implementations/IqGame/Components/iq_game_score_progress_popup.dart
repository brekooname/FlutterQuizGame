import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_score_progress_bar_chart.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';

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
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: graphWidth,
                height: graphHeight,
                child: IqGameScoreProgressBarChart(scoreInfo))
          ]),
      context: context,
    );
  }
}
