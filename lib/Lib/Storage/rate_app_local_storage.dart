import 'package:flutter_app_quiz_game/Lib/Storage/my_local_storage.dart';

class RateAppLocalStorage extends MyLocalStorage {
  static final RateAppLocalStorage singleton = RateAppLocalStorage.internal();

  factory RateAppLocalStorage() {
    return singleton;
  }

  RateAppLocalStorage.internal();

  int appLaunchedCount() {
    return localStorage.getInt(_getAppLaunchedCountKey()) ?? 0;
  }

  void incrementAppLaunchedCount() {
    localStorage.setInt(_getAppLaunchedCountKey(), appLaunchedCount() + 1);
  }

  bool isAlreadyRated() {
    return localStorage.getBool(_getAlreadyRatedKey()) ?? false;
  }

  void setAlreadyRated() {
    localStorage.setBool(_getAlreadyRatedKey(), true);
  }

  String _getAlreadyRatedKey() {
    return localStorageName + "_AlreadyRated";
  }

  String _getAppLaunchedCountKey() {
    return localStorageName + "_AppLaunchedCount";
  }
}
