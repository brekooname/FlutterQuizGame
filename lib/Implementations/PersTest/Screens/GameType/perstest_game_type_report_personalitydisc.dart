import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';

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

  @override
  List<PersAttribute> getPersAttributes() {
    List<PersTestGameTypeAttrStorage> storageAttrs =
        persTestLocalStorage.getGameTypeResults(difficulty, category);
    return [
      PersAttribute(
          Colors.lightGreenAccent,
          label.l_dominance,
          label
              .l_someone_with_a_high_score_is_likely_to_be_direct_assertive_independent_and_decisive_they_are_compe,
          getAttrIntValue("d", storageAttrs)),
      PersAttribute(
          Colors.tealAccent,
          label.l_influence,
          label
              .l_someone_with_a_high_score_is_likely_to_be_informal_and_fun_they_tend_to_be_confident_engaging_and_,
          getAttrIntValue("i", storageAttrs)),
      PersAttribute(
          Colors.purpleAccent,
          label.l_steadiness,
          label
              .l_someone_with_a_high_score_is_likely_to_be_reserved_and_is_looking_for_like_minded_and_loyal_indivi,
          getAttrIntValue("s", storageAttrs)),
      PersAttribute(
          Colors.blue,
          label.l_conscientiousness,
          label
              .l_conscientiousness_is_a_fundamental_personality_trait_that_reflects_the_tendency_to_be_responsible_,
          getAttrIntValue("c", storageAttrs)),
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
    return label.l_click_on_any_of_the_traits_to_see_their_description;
  }

  int calculateVal(PersTestGameContext gameContext, int min, int max) {
    int val = 0;
    for (int i = min; i <= max; i++) {
      val = val + r(gameContext, i);
    }
    return val;
  }
}
