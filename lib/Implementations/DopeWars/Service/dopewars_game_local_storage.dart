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

  void setMaxReputation(int rep) {
    if (rep > getMaxReputation()) {
      localStorage.setInt(_maxRepFieldName(), rep);
    }
  }

  void clearAll() {
    localStorage.setInt(_maxRepFieldName(), 0);
    localStorage.setString(_saveGameFieldName(), "");
    for (DopeWarsLocation l in DopeWarsLocation.locations) {
      localStorage.setBool(_unlockLocationFieldName(l), false);
    }
    for (DopeWarsShopItem i in DopeWarsShopItem.items) {
      localStorage.setBool(_unlockShopItemFieldName(i), false);
    }
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
}
