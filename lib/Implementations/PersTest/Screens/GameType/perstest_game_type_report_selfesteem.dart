import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perst_test_selfesteem_bar_chart.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestGameTypeReportSelfEsteem extends PersTestGameTypeReport {
  final int _gameOverMaxScoreVal = 30;

  PersTestGameTypeReportSelfEsteem(CampaignLevel campaignLevel)
      : super(campaignLevel);

  @override
  void storeResultsToStorage(PersTestGameContext gameContext) {
    var esteem =
        (calculateEsteem(gameContext) + _gameOverMaxScoreVal).toString();
    print(esteem);
    persTestLocalStorage.storeGameTypeResults(difficulty, category, [
      PersTestGameTypeAttrStorage("e", esteem),
    ]);
  }

  @override
  List<PersAttribute> getPersAttributes() {
    List<PersTestGameTypeAttrStorage> storageAttrs =
        persTestLocalStorage.getGameTypeResults(difficulty, category);
    return [
      PersAttribute(Colors.lightGreenAccent, "Self Esteem",
          getAttrIntValue("e", storageAttrs)),
    ];
  }

  @override
  Widget? createExtraReportContent() {
    var graphHeight = screenDimensions.dimen(40);
    var labelWidth = screenDimensions.w(25);
    var fontSize = PersTestSelfEsteemBarChart.fontSize;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: graphHeight,
              width: labelWidth,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, screenDimensions.dimen(1)),
                      child: MyText(
                          alignmentInsideContainer: Alignment.centerRight,
                          width: labelWidth,
                          text: "Average self esteem for general population",
                          fontConfig: FontConfig(
                              fontSize: fontSize.toDouble(),
                              fontColor: Colors.blue.shade700)),
                    )
                  ])),
          SizedBox(
              width: screenDimensions.w(50),
              height: graphHeight,
              child: PersTestSelfEsteemBarChart()),
          SizedBox(
              height: graphHeight * 1.02,
              width: labelWidth,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    MyText(
                        alignmentInsideContainer: Alignment.bottomLeft,
                        width: labelWidth,
                        text: "Age",
                        fontConfig: FontConfig(
                            fontSize: fontSize.toDouble(),
                            fontColor: Colors.green.shade700)),
                  ]))
        ]);
    // return null;
  }

  @override
  bool isPositiveResponseValue() {
    return false;
  }

  @override
  int getMaxGraphValue() {
    return _gameOverMaxScoreVal * 2;
  }

  @override
  String getInfoText() {
    return "A score below 50% indicate low self esteem";
  }

  int calculateEsteem(PersTestGameContext gameContext) {
    return
        //
        //+
        r(gameContext, 0)
            //
            +
            r(gameContext, 1)
            //
            -
            r(gameContext, 2)
            //
            +
            r(gameContext, 3)
            //
            -
            r(gameContext, 4)
            //
            +
            r(gameContext, 5)
            //
            +
            r(gameContext, 6)
            //
            -
            r(gameContext, 7)
            //
            -
            r(gameContext, 8)
            //
            -
            r(gameContext, 9);
  }
}
