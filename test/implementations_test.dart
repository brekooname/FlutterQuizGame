import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/test_util.dart';

List<TestAppConfig> getAppsToTest() {
  return [
    // TestAppConfig("history", Language.values, HistoryCampaignLevelService()),
    TestAppConfig("geoquiz", [Language.en], GeoQuizCampaignLevelService()),
  ];
}

void main() {
  testWidgets('all game implementations are tested',
      (WidgetTester tester) async {
    for (TestAppConfig testAppConfig in getAppsToTest()) {
      for (Language lang in testAppConfig.languages) {
        await testApp(tester, testAppConfig.appKey, lang,
            testAppConfig.campaignLevelService);
        _startApp();
      }
    }
  });
}

Future<void> testApp(WidgetTester tester, String appKey, Language lang,
    CampaignLevelService campaignLevelService) async {
  for (int i = 0; i < 55; i++) {
    await TestUtil.initApp(lang, appKey, tester);
    debugPrint("testing =======> " +
        appKey +
        " lang: " +
        MyApp.appLocalizations.localeName);
    await testAllCampaignLevels(tester, campaignLevelService);
  }
}

Future<void> testAllCampaignLevels(
    WidgetTester tester, CampaignLevelService campaignLevelService) async {
  for (CampaignLevel campaignLevel in campaignLevelService.allLevels) {
    MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
        .showNewGameScreen(campaignLevel);
    await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);

    for (QuestionCategory category in campaignLevel.category) {
      MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
          .showGameScreenWithConfig(
              campaignLevel.difficulty,
              category,
              (MyApp.gameScreenManager.currentScreen! as GameScreen)
                  .gameContext);
      await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);

      debugPrint("-----" +
          (MyApp.gameScreenManager.currentScreen! as GameScreen)
              .listOfCurrentQuestionInfo
              .first
              .question
              .rawString);
    }
  }
  // MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
  //     .showMainScreen();
}

void _startApp() {
  runApp(
    MyApp(
      key: UniqueKey(),
    ),
  );
}

class TestAppConfig {
  String appKey;
  List<Language> languages;
  CampaignLevelService campaignLevelService;

  TestAppConfig(this.appKey, this.languages, this.campaignLevelService);
}
