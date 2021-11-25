import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateAppLocalStorage {
  late SharedPreferences prefs;

  static final RateAppLocalStorage singleton = RateAppLocalStorage.internal();

  factory RateAppLocalStorage({required MyAppContext myAppContext}) {
    singleton.prefs = myAppContext.localStorage;
    return singleton;
  }

  RateAppLocalStorage.internal();

  int appLaunchedCount() {
    return prefs.getInt(getAppLaunchedCountKey()) ?? 0;
  }

  void incrementAppLaunchedCount() {
    prefs.setInt(getAppLaunchedCountKey(), appLaunchedCount() + 1);
  }

  bool isAlreadyRated() {
    return prefs.getBool(getAlreadyRatedKey()) ?? false;
  }

  void setAlreadyRated() {
    prefs.setBool(getAlreadyRatedKey(), true);
  }

  String getAlreadyRatedKey() {
    return "RateAppLocalStorage_AlreadyRated";
  }

  String getAppLaunchedCountKey() {
    return "RateAppLocalStorage_AppLaunchedCount";
  }
}
