import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InAppPurchasesPreferencesLocalStorage {
  late SharedPreferences prefs;

  static final InAppPurchasesPreferencesLocalStorage singleton =
      InAppPurchasesPreferencesLocalStorage.internal();

  factory InAppPurchasesPreferencesLocalStorage(
      {required MyAppContext myAppContext}) {
    singleton.prefs = myAppContext.localStorage;
    return singleton;
  }

  InAppPurchasesPreferencesLocalStorage.internal();

  InAppPurchasesPreferencesService() {
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!! TODO should be disabled !!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    prefs.setBool(_getPurchaseIdKey(""), false);
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  }

  bool isPurchased(String purchaseId) {
    return prefs.getBool(_getPurchaseIdKey(purchaseId)) ?? false;
  }

  void savePurchase(String purchaseId) {
    prefs.setBool(_getPurchaseIdKey(purchaseId), true);
  }

  String _getPurchaseIdKey(String purchaseId) {
    return "InAppPurchasesPreferencesLocalStorage_PurchaseIdKey_" + purchaseId;
  }
}
