import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestUtil {
  static Future<void> initApp(
      String appKey, Language lang, WidgetTester tester) async {
    initBaseApp(tester);
    updateAppKeyAndLang(appKey, lang, tester);
  }

  static Future<void> initBaseApp(WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    FontConfig.fontScale = 30;
    MyApp.kIsAutomatedTest = true;
    MyApp.webIsPro = true;
    MyApp.bannerAdContainer = Container();
    await MyAppState.initAppConfig(MyAppState.createWebAppConfig());
    MyApp.initAsyncCompleted = true;
    MyApp.appId.gameConfig.allQuestionsService.clearCache();
    await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);
  }

  static Future<void> updateAppKeyAndLang(
      String appKey, Language lang, WidgetTester tester) async {
    MyApp.languageCode = lang.name;
    MyApp.webLanguage = lang;
    MyApp.webAppKey = appKey;
    MyApp.appId.gameConfig.allQuestionsService.clearCache();
    await TestUtil.pumpWidget(tester, MyApp.gameScreenManager);
  }

  static Future<void> pumpWidget(WidgetTester tester, Widget widget) async {
    await tester.pumpWidget(Builder(
      builder: (BuildContext context) {
        return MyAppState.buildMaterialApp(context, widget, true);
      },
    ));
  }
}
