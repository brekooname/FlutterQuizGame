import 'dart:convert';

import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/my_local_storage.dart';

import 'dopewars_gamecontext_service.dart';

class DopeWarsLocalStorage extends MyLocalStorage {
  static const int defaultMaxDays = 999;
  static final DopeWarsLocalStorage singleton = DopeWarsLocalStorage.internal();

  factory DopeWarsLocalStorage() {
    return singleton;
  }

  DopeWarsLocalStorage.internal();

  bool isLocationUnlocked(DopeWarsLocation location) {
    if (location.index == DopeWarsLocation.location0.index) {
      return true;
    }
    return localStorage.getBool(_unlockLocationFieldName(location)) ?? false;
  }

  void saveGame(DopeWarsGameContext gameContext) {
    String json = jsonEncode(gameContext.toJson());
    localStorage.setString(_saveGameFieldName(), json);
  }

  DopeWarsGameContext? getSavedGame() {
    String json = localStorage.getString(_saveGameFieldName()) ?? "";
    if (json.isEmpty) {
      return null;
    }
    return DopeWarsGameContext.fromJson(
        DopeWarsContextService().createGameContext(), jsonDecode(json));
  }

  void unlockLocation(DopeWarsLocation location) {
    localStorage.setBool(_unlockLocationFieldName(location), true);
  }

  int getMaxDays() {
    return localStorage.getInt(_maxDaysFieldName()) ?? defaultMaxDays;
  }

  void setMaxDays(int days) {
    if (days < getMaxDays()) {
      localStorage.setInt(_maxDaysFieldName(), days);
    }
  }

  int getMaxReputation() {
    return localStorage.getInt(_maxRepFieldName()) ?? 0;
  }

  void setMaxReputation(int rep) {
    if (rep > getMaxReputation()) {
      localStorage.setInt(_maxRepFieldName(), rep);
    }
  }

  void clearAll() {
    localStorage.setInt(_maxRepFieldName(), 0);
    localStorage.setInt(_maxDaysFieldName(), defaultMaxDays);
    localStorage.setString(_saveGameFieldName(), "");
    for (DopeWarsLocation l in DopeWarsLocation.locations) {
      localStorage.setBool(_unlockLocationFieldName(l), false);
    }
  }

  String _unlockLocationFieldName(DopeWarsLocation location) {
    return localStorageName +
        "_unlockLocationFieldName_" +
        location.index.toString();
  }

  String _saveGameFieldName() {
    return localStorageName + "_saveGameFieldName";
  }

  String _maxDaysFieldName() {
    return localStorageName + "_maxDaysFieldName";
  }

  String _maxRepFieldName() {
    return localStorageName + "_maxRepFieldName";
  }
}
