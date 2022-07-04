import 'package:flutter_app_quiz_game/Lib/Storage/my_local_storage.dart';

import '../../main.dart';

class SettingsLocalStorage extends MyLocalStorage {
  static final SettingsLocalStorage singleton = SettingsLocalStorage.internal();

  factory SettingsLocalStorage() {
    return singleton;
  }

  SettingsLocalStorage.internal();

  bool isSoundOn() {
    return localStorage.getBool(_getToggleSoundKey()) ?? true;
  }

  void toggleSound() {
    localStorage.setBool(_getToggleSoundKey(), !isSoundOn());
  }

  bool isMusicOn() {
    return localStorage.getBool(_getToggleMusicKey()) ??
        MyApp.appId.gameConfig.hasBackgroundMusic;
  }

  void toggleMusic() {
    localStorage.setBool(_getToggleMusicKey(), !isMusicOn());
  }

  String _getToggleSoundKey() {
    return localStorageName + "_ToggleSoundKey";
  }

  String _getToggleMusicKey() {
    return localStorageName + "_ToggleMusicKey";
  }
}
