import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestUtil {
  static Future<void> initApp(Language lang, String appKey) async {
    SharedPreferences.setMockInitialValues({});
    FontConfig.fontScale = 30;
    MyApp.kIsTest = true;
    MyApp.webLanguage = lang;
    MyApp.webAppKey = appKey;
    await MyAppState.initAppConfig(MyAppState.createWebAppConfig());
    MyApp.appId.gameConfig.allQuestionsService.clearCache();
  }
}
