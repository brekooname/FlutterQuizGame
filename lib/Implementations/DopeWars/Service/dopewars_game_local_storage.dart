import 'dart:convert';

import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_shop_item.dart';
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

  bool isLocationUnlocked(DopeWarsLocation location) {
    if (location.index == DopeWarsLocation.location0.index) {
      return true;
    }
    return localStorage.getBool(_unlockLocationFieldName(location)) ?? false;
  }

  void unlockLocation(DopeWarsLocation location) {
    localStorage.setBool(_unlockLocationFieldName(location), true);
  }

  bool isShopItemUnlocked(DopeWarsShopItem item) {
    return localStorage.getBool(_unlockShopItemFieldName(item)) ?? false;
  }

  void unlockShopItem(DopeWarsShopItem item) {
    localStorage.setBool(_unlockShopItemFieldName(item), true);
  }

  int getMaxReputation() {
    return localStorage.getInt(_maxRepFieldName()) ?? 0;
  }

  bool isUnlimitedMode() {
    return localStorage.getBool(_unlimitedModeFieldName()) ?? false;
  }

  void toggleUnlimitedMode() {
    localStorage.setBool(_unlimitedModeFieldName(), !isUnlimitedMode());
  }

  void setMaxReputation(int rep) {
    if (rep > getMaxReputation()) {
      localStorage.setInt(_maxRepFieldName(), rep);
      setNewMaxReputation(true);
    }
  }

  void setNewMaxReputation(bool val) {
    localStorage.setBool(_newMaxRepFieldName(), val);
  }

  bool isNewMaxReputation() {
    return localStorage.getBool(_newMaxRepFieldName()) ?? false;
  }

  void startNewGame() {
    localStorage.setBool(_newMaxRepFieldName(), false);
    localStorage.setString(_saveGameFieldName(), "");
    var locations = DopeWarsLocation.locations;
    for (DopeWarsLocation l in locations) {
      localStorage.setBool(_unlockLocationFieldName(l), false);
    }
    var items = DopeWarsShopItem.items;
    for (DopeWarsShopItem i in items) {
      localStorage.setBool(_unlockShopItemFieldName(i), false);
    }
  }

  void clearAll() {
    localStorage.setInt(_maxRepFieldName(), 0);
    startNewGame();
  }

  String _unlockLocationFieldName(DopeWarsLocation location) {
    return localStorageName +
        "_unlockLocationFieldName_" +
        location.index.toString();
  }

  String _unlockShopItemFieldName(DopeWarsShopItem item) {
    return localStorageName +
        "_unlockShopItemFieldName_" +
        item.index.toString();
  }

  String _saveGameFieldName() {
    return localStorageName + "_saveGameFieldName";
  }

  String _maxRepFieldName() {
    return localStorageName + "_maxRepFieldName";
  }

  String _newMaxRepFieldName() {
    return localStorageName + "_newMaxRepFieldName";
  }

  String _unlimitedModeFieldName() {
    return localStorageName + "_unlimitedModeFieldName";
  }
}
