import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';

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
    return label.l_click_on_any_of_the_traits_to_see_their_description;
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
      PersAttribute(
          Colors.lightGreenAccent,
          label.l_extraversion,
          label
              .l_extraversion_is_sometimes_given_other_names_such_as_positive_emotionality_individuals_who_score_hi,
          getAttrIntValue("e", storageAttrs)),
      PersAttribute(
          Colors.tealAccent,
          label.l_agreeableness,
          label
              .l_agreeableness_is_a_personality_trait_that_can_be_described_as_cooperative_polite_and_friendly_peop,
          getAttrIntValue("a", storageAttrs)),
      PersAttribute(
          Colors.purpleAccent,
          label.l_conscientiousness,
          label
              .l_conscientiousness_is_a_fundamental_personality_trait_that_reflects_the_tendency_to_be_responsible_,
          getAttrIntValue("c", storageAttrs)),
      PersAttribute(
          Colors.red,
          label.l_emotional_stability,
          label
              .l_emotional_stability_refers_to_a_persons_ability_to_remain_stable_and_balanced_at_the_other_end_of_,
          getAttrIntValue("n", storageAttrs)),
      PersAttribute(
          Colors.blue,
          label.l_openness_to_experience,
          label
              .l_openness_to_new_experiences_indicates_appreciation_for_art_emotion_adventure_unusual_ideas_imagina,
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
