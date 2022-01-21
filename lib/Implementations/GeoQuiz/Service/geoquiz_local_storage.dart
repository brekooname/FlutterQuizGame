import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class GeoQuizLocalStorage extends QuizGameLocalStorage {
  static final GeoQuizLocalStorage singleton = GeoQuizLocalStorage.internal();

  factory GeoQuizLocalStorage() {
    return singleton;
  }

  GeoQuizLocalStorage.internal();

  int getExperience() {
    return localStorage.getInt(_getExperienceFieldName()) ?? 0;
  }

  void setExperience(int value) {
    localStorage.setInt(_getExperienceFieldName(), value);
  }

  void incrementExperience(int value) {
    localStorage.setInt(_getExperienceFieldName(), getExperience() + value);
  }

  int getExperienceBeforeLeavingMainScreen() {
    return localStorage
            .getInt(_getExperienceBeforeLeavingMainScreenFieldName()) ??
        0;
  }

  void setExperienceBeforeLeavingMainScreen(int value) {
    localStorage.setInt(
        _getExperienceBeforeLeavingMainScreenFieldName(), value);
  }

  String _getExperienceFieldName() {
    return localStorageName + "_Experience";
  }

  String _getExperienceBeforeLeavingMainScreenFieldName() {
    return localStorageName + "_ExperienceBeforeLeavingMainScreen";
  }
  @override
  void clearAll() {
    super.clearAll();
    setExperience(0);
    setExperienceBeforeLeavingMainScreen(0);
  }
}
