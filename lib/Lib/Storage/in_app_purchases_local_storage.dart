import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_local_storage.dart';

class InAppPurchaseLocalStorage extends MyLocalStorage {

  static final InAppPurchaseLocalStorage singleton =
  InAppPurchaseLocalStorage.internal();

  factory InAppPurchaseLocalStorage() {
    return singleton;
  }

  InAppPurchaseLocalStorage.internal();

  InAppPurchasesPreferencesService() {
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!! TODO should be disabled !!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    localStorage.setBool(_getPurchaseIdKey(""), false);
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  }

  bool isPurchased(String purchaseId) {
    return localStorage.getBool(_getPurchaseIdKey(purchaseId)) ?? false;
  }

  void savePurchase(String purchaseId) {
    localStorage.setBool(_getPurchaseIdKey(purchaseId), true);
  }

  String _getPurchaseIdKey(String purchaseId) {
    return localStorageName + "_PurchaseIdKey_" + purchaseId;
  }
}