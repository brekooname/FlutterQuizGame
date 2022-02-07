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
    persTestLocalStorage.storeGameTypeResults(difficulty, category, [
      PersTestGameTypeAttrStorage("e", esteem),
    ]);
  }

  @override
  List<PersAttribute> getPersAttributes() {
    List<PersTestGameTypeAttrStorage> storageAttrs =
        persTestLocalStorage.getGameTypeResults(difficulty, category);
    var persAttribute = PersAttribute(Colors.lightGreenAccent,
        label.l_self_esteem, "", getAttrIntValue("e", storageAttrs));
    persAttribute.isButton = false;
    return [
      persAttribute,
    ];
  }

  @override
  Widget? createExtraReportContent() {
    var graphHeight = screenDimensions.dimen(50);
    var graphWidth = screenDimensions.w(70);
    var labelWidth = screenDimensions.w(25);
    var fontSize = PersTestSelfEsteemBarChart.fontSize;
    return Material(
        color: Colors.white.withOpacity(0.6),
        textStyle: const TextStyle(decoration: TextDecoration.none),
        child: Row(
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
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: MyText(
                              alignmentInsideContainer: Alignment.centerRight,
                              width: labelWidth,
                              text: label
                                  .l_average_self_esteem_for_the_general_population_,
                              fontConfig: FontConfig(
                                  fontSize: fontSize.toDouble(),
                                  fontColor: Colors.blue.shade700)),
                        )
                      ])),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: graphWidth,
                        height: graphHeight,
                        child: PersTestSelfEsteemBarChart(
                            getAttrPercentValue(getPersAttributes().first)
                                .toInt(),
                            persTestLocalStorage.getUserAge())),
                    SizedBox(
                        width: graphWidth,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, screenDimensions.dimen(1), 0, 0),
                          child: MyText(
                              alignmentInsideContainer: Alignment.center,
                              width: labelWidth,
                              text: label.l_age,
                              fontConfig: FontConfig(
                                  fontSize: fontSize.toDouble(),
                                  fontColor: Colors.green.shade700)),
                        ))
                  ])
            ]));
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
    return label.l_a_score_below_50_indicates_a_low_self_esteem;
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
