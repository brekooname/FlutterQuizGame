import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalStorage {
  late SharedPreferences prefs;

  static final SettingsLocalStorage singleton = SettingsLocalStorage.internal();

  factory SettingsLocalStorage({required MyAppContext myAppContext}) {
    singleton.prefs = myAppContext.localStorage;
    return singleton;
  }

  SettingsLocalStorage.internal();

  bool isSoundOn() {
    return prefs.getBool(_getToggleSoundKey()) ?? true;
  }

  void toggleSound() {
    prefs.setBool(_getToggleSoundKey(), !isSoundOn());
  }

  bool isMusicOn() {
    return prefs.getBool(_getToggleMusicKey()) ?? true;
  }

  void toggleMusic() {
    prefs.setBool(_getToggleMusicKey(), !isMusicOn());
  }

  String _getToggleSoundKey() {
    return "SettingsLocalStorage_ToggleSoundKey";
  }

  String _getToggleMusicKey() {
    return "SettingsLocalStorage_ToggleMusicKey";
  }
}
