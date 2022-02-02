import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/test_util.dart';

List<TestAppConfig> getAppsToTest() {
  return [
    //[Language.he]
    // TestAppConfig("history", Language.values, HistoryCampaignLevelService()),
    TestAppConfig("geoquiz", Language.values, GeoQuizCampaignLevelService()),
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
  for (int i = 0; i < 30; i++) {
    await TestUtil.initApp(lang, appKey, tester);
    debugPrint("testing =======> " +
        appKey +
        " lang: " +
        MyApp.appLocalizations.localeName);
    await testAllCampaignLevels(tester, appKey, campaignLevelService);
  }
}

Future<void> testAllCampaignLevels(WidgetTester tester, String appKey,
    CampaignLevelService campaignLevelService) async {
  for (CampaignLevel campaignLevel in campaignLevelService.allLevels) {
    MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
        .showNewGameScreen(campaignLevel);
    await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);

    for (QuestionCategory category in campaignLevel.categories) {
      var gameContext =
          (MyApp.gameScreenManager.currentScreen! as GameScreen).gameContext;
      if (gameContext.gameUser
              .getOpenQuestions()
              .where((element) => element.question.category == category)
              .isEmpty &&
          appKey == "geoquiz") {
        continue;
      }
      MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
          .showGameScreenWithConfig(
              campaignLevel.difficulty, category, gameContext);
      await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);

      var gameScreen = MyApp.gameScreenManager.currentScreen! as GameScreen;
      var quizOptionsGameScreen =
          MyApp.gameScreenManager.currentScreen! as QuizOptionsGameScreen;
      debugPrint("-----" +
          gameScreen.listOfCurrentQuestionInfo.first.question.rawString);

      expect(gameScreen.listOfCurrentQuestionInfo.isNotEmpty, true);
      expect(quizOptionsGameScreen.possibleAnswers.length >= 4, true);
    }
  }
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
