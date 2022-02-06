import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestGameTypeReportBigFive extends PersTestGameTypeReport {
  final int _gameOverMaxScoreVal = 40;
  final PersTestLocalStorage _persTestLocalStorage = PersTestLocalStorage();

  PersTestGameTypeReportBigFive(CampaignLevel campaignLevel)
      : super(campaignLevel);

  @override
  void storeResultsToStorage(PersTestGameContext gameContext) {
    _persTestLocalStorage.storeGameTypeResults(difficulty, category, [
      PersTestGameTypeAttrStorage("e", calculateE(gameContext).toString()),
      PersTestGameTypeAttrStorage("a", calculateA(gameContext).toString()),
      PersTestGameTypeAttrStorage("c", calculateC(gameContext).toString()),
      PersTestGameTypeAttrStorage("n", calculateN(gameContext).toString()),
      PersTestGameTypeAttrStorage("o", calculateO(gameContext).toString()),
    ]);
  }

  @override
  String getInfoText() {
    return "Click on any of the traits to see it's description";
  }

  @override
  int getMaxGraphValue() {
    return _gameOverMaxScoreVal;
  }

  @override
  List<PersAttribute> getPersAttributes() {
    List<PersTestGameTypeAttrStorage> storageAttrs =
        persTestLocalStorage.getGameTypeResults(difficulty, category);
    return [
      PersAttribute(Colors.lightGreenAccent, "Extroversion",
          getAttrIntValue("e", storageAttrs)),
      PersAttribute(
          Colors.red, "Emotional stabielt", getAttrIntValue("a", storageAttrs)),
      PersAttribute(Colors.tealAccent, "Agreeablesnn",
          getAttrIntValue("c", storageAttrs)),
      PersAttribute(Colors.purpleAccent, "Consitoniouss",
          getAttrIntValue("n", storageAttrs)),
      PersAttribute(Colors.blue, "Intellect/Imagination",
          getAttrIntValue("o", storageAttrs)),
    ];
  }

  @override
  bool isPositiveResponseValue() {
    return true;
  }

  int calculateE(PersTestGameContext gameContext) {
    return 20 +
        r(gameContext, 0) -
        r(gameContext, 5) +
        r(gameContext, 10) -
        r(gameContext, 15) +
        r(gameContext, 20) -
        r(gameContext, 25) +
        r(gameContext, 30) -
        r(gameContext, 35) +
        r(gameContext, 40) -
        r(gameContext, 45);
  }

  int calculateA(PersTestGameContext gameContext) {
    return 14 -
        r(gameContext, 1) +
        r(gameContext, 6) -
        r(gameContext, 11) +
        r(gameContext, 16) -
        r(gameContext, 21) +
        r(gameContext, 26) -
        r(gameContext, 31) +
        r(gameContext, 36) +
        r(gameContext, 41) +
        r(gameContext, 46);
  }

  int calculateC(PersTestGameContext gameContext) {
    return 14 +
        r(gameContext, 2) -
        r(gameContext, 7) +
        r(gameContext, 12) -
        r(gameContext, 17) +
        r(gameContext, 22) -
        r(gameContext, 27) +
        r(gameContext, 32) -
        r(gameContext, 37) +
        r(gameContext, 42) +
        r(gameContext, 47);
  }

  int calculateN(PersTestGameContext gameContext) {
    return 38 -
        r(gameContext, 3) +
        r(gameContext, 8) -
        r(gameContext, 13) +
        r(gameContext, 18) -
        r(gameContext, 23) -
        r(gameContext, 28) -
        r(gameContext, 33) -
        r(gameContext, 38) -
        r(gameContext, 43) -
        r(gameContext, 48);
  }

  int calculateO(PersTestGameContext gameContext) {
    return 8 +
        r(gameContext, 4) -
        r(gameContext, 9) +
        r(gameContext, 14) -
        r(gameContext, 19) +
        r(gameContext, 24) -
        r(gameContext, 29) +
        r(gameContext, 34) +
        r(gameContext, 39) +
        r(gameContext, 44) +
        r(gameContext, 49);
  }
}
