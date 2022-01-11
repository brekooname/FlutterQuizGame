import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('all game implementations are tested',
      (WidgetTester tester) async {
    initTest();
    for (TestAppConfig testAppConfig in getAppsToTest()) {
      for (Language lang in testAppConfig.languages) {
        await testApp(tester, testAppConfig.appKey, lang,
            testAppConfig.campaignLevelService);
        _startApp();
      }
    }
  });
}

List<TestAppConfig> getAppsToTest() {
  return [
    // TestAppConfig("history", Language.values, HistoryCampaignLevelService()),
    TestAppConfig("geoquiz", [Language.en], GeoQuizCampaignLevelService()),
  ];
}

Future<void> testApp(WidgetTester tester, String appKey, Language lang,
    CampaignLevelService campaignLevelService) async {
  MyApp.webLanguage = lang;
  MyApp.webAppKey = appKey;
  await MyAppState.initAppConfig(MyAppState.createWebAppConfig());
  await pumpWidget(tester, MyApp.gameScreenManager);
  debugPrint("testing =======> " +
      appKey +
      " lang: " +
      MyApp.appLocalizations.localeName);
  await testAllCampaignLevels(tester, campaignLevelService);
}

Future<void> testAllCampaignLevels(
    WidgetTester tester, CampaignLevelService campaignLevelService) async {
  for (CampaignLevel campaignLevel in campaignLevelService.allLevels) {
    MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
        .showNewGameScreen(campaignLevel);
    await pumpWidget(tester, MyApp.gameScreenManager);

    for (QuestionCategory category in campaignLevel.category) {
      MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
          .showGameScreenWithConfig(
              campaignLevel.difficulty,
              category,
              (MyApp.gameScreenManager.currentScreen! as GameScreen)
                  .gameContext);
      await pumpWidget(tester, MyApp.gameScreenManager);
    }
  }
  MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
      .showMainScreen();
}

Future<void> pumpWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(Builder(
    builder: (BuildContext context) {
      return MyAppState.buildMaterialApp(context, widget);
    },
  ));
}

void initTest() {
  MyApp.kIsTest = true;
  SharedPreferences.setMockInitialValues({});
  FontConfig.fontScale = 30;
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
