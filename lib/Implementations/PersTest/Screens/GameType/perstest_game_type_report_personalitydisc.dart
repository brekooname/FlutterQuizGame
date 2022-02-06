import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';

class PersTestGameTypeReportPersonalityDisc extends PersTestGameTypeReport {
  final int _gameOverMaxScoreVal = 20;

  PersTestGameTypeReportPersonalityDisc(CampaignLevel campaignLevel)
      : super(campaignLevel);

  @override
  void storeResultsToStorage(PersTestGameContext gameContext) {
    persTestLocalStorage.storeGameTypeResults(difficulty, category, [
      PersTestGameTypeAttrStorage(
          "d", calculateVal(gameContext, 0, 3).toString()),
      PersTestGameTypeAttrStorage(
          "i", calculateVal(gameContext, 4, 7).toString()),
      PersTestGameTypeAttrStorage(
          "s", calculateVal(gameContext, 8, 11).toString()),
      PersTestGameTypeAttrStorage(
          "c", calculateVal(gameContext, 12, 15).toString()),
    ]);
  }

  https://situational.com/blog/what-are-the-four-disc-personality-types/
  @override
  List<PersAttribute> getPersAttributes() {
    List<PersTestGameTypeAttrStorage> storageAttrs =
        persTestLocalStorage.getGameTypeResults(difficulty, category);
    return [
      PersAttribute(Colors.lightGreenAccent, "Type D",
          getAttrIntValue("d", storageAttrs)),
      PersAttribute(
          Colors.tealAccent, "Type I", getAttrIntValue("i", storageAttrs)),
      PersAttribute(
          Colors.purpleAccent, "Type S", getAttrIntValue("s", storageAttrs)),
      PersAttribute(Colors.blue, "Type C", getAttrIntValue("c", storageAttrs)),
    ];
  }

  @override
  bool isPositiveResponseValue() {
    return true;
  }

  @override
  int getMaxGraphValue() {
    return _gameOverMaxScoreVal;
  }

  @override
  String getInfoText() {
    return label.l_click_on_any_of_the_traits;
  }

  int calculateVal(PersTestGameContext gameContext, int min, int max) {
    int val = 0;
    for (int i = min; i <= max; i++) {
      val = val + r(gameContext, i);
    }
    return val;
  }
}
