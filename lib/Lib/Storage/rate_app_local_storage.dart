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
    return prefs.getInt(_getAppLaunchedCountKey()) ?? 0;
  }

  void incrementAppLaunchedCount() {
    prefs.setInt(_getAppLaunchedCountKey(), appLaunchedCount() + 1);
  }

  bool isAlreadyRated() {
    return prefs.getBool(_getAlreadyRatedKey()) ?? false;
  }

  void setAlreadyRated() {
    prefs.setBool(_getAlreadyRatedKey(), true);
  }

  String _getAlreadyRatedKey() {
    return "RateAppLocalStorage_AlreadyRated";
  }

  String _getAppLaunchedCountKey() {
    return "RateAppLocalStorage_AppLaunchedCount";
  }
}
