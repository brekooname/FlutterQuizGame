import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/ImageClick/image_click_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/test_util.dart';

List<TestAppConfig> getAppsToTest() {
  return [
    //[Language.he]
    // TestAppConfig("history", Language.values, HistoryCampaignLevelService(), true),
    // TestAppConfig("geoquiz", Language.values, GeoQuizCampaignLevelService(), true),
    // TestAppConfig(
    //     "perstest", Language.values, PersTestCampaignLevelService(), false),
    // TestAppConfig(
    //     "anatomy", Language.values, AnatomyCampaignLevelService(), true),
    TestAppConfig(
        "astronomy", Language.values, AstronomyCampaignLevelService(), true),
  ];
}

void main() {
  testWidgets('all game implementations are tested',
      (WidgetTester tester) async {
    await TestUtil.initBaseApp(tester);
    for (TestAppConfig testAppConfig in getAppsToTest()) {
      for (Language lang in testAppConfig.languages) {
        await TestUtil.updateAppKeyAndLang(testAppConfig.appKey, lang, tester);
        await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);
        _startApp();
        debugPrint(
            "testing ======================================================================> " +
                testAppConfig.appKey +
                " lang: " +
                MyApp.appLocalizations.localeName);

        await testApp(tester, testAppConfig.appKey,
            testAppConfig.campaignLevelService, testAppConfig.hasQuizScreens);
      }
    }
  });
}

Future<void> testApp(WidgetTester tester, String appKey,
    CampaignLevelService campaignLevelService, bool hasQuizScreens) async {
  for (int i = 0; i < 10; i++) {
    await testAllCampaignLevels(
        tester, appKey, campaignLevelService, hasQuizScreens);
  }
}

Future<void> testAllCampaignLevels(WidgetTester tester, String appKey,
    CampaignLevelService campaignLevelService, bool hasQuizScreens) async {
  await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);
  for (CampaignLevel campaignLevel in campaignLevelService.allLevels) {
    MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
        .showNewGameScreen(campaignLevel);
    await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);

    for (QuestionCategory category in campaignLevel.categories) {
      var gameContext =
          (MyApp.gameScreenManager.currentScreen! as GameScreen).gameContext;
      if (appKey == "geoquiz" &&
          gameContext.gameUser
              .getOpenQuestions()
              .where((element) => element.question.category == category)
              .isEmpty) {
        continue;
      }
      MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
          .showGameScreenWithConfig(
              campaignLevel.difficulty, category, gameContext);
      await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);

      if (hasQuizScreens) {
        QuizQuestionManager? quizQuestionManager;

        if (MyApp.gameScreenManager.currentScreen! is QuizOptionsGameScreen) {
          quizQuestionManager =
              (MyApp.gameScreenManager.currentScreen! as QuizOptionsGameScreen)
                  .quizQuestionManager;
        } else if (MyApp.gameScreenManager.currentScreen! is ImageClickScreen) {
          quizQuestionManager =
              (MyApp.gameScreenManager.currentScreen! as ImageClickScreen)
                  .quizQuestionManager;
        }

        if (quizQuestionManager == null) {
          throw Exception("No QuizQuestionManager set");
        }

        debugPrint("-----" +
            (MyApp.gameScreenManager.currentScreen! as GameScreen)
                .listOfCurrentQuestionInfo
                .first
                .question
                .rawString);
        expect(quizQuestionManager.possibleAnswers.length >= 3, true,
            reason: "actual " +
                quizQuestionManager.possibleAnswers.length.toString());
      }
      expect(
          (MyApp.gameScreenManager.currentScreen! as GameScreen)
              .listOfCurrentQuestionInfo
              .isNotEmpty,
          true);
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
  bool hasQuizScreens;

  TestAppConfig(this.appKey, this.languages, this.campaignLevelService,
      this.hasQuizScreens);
}
