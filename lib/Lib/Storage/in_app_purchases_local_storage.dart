
import 'my_local_storage.dart';

class InAppPurchasesPreferencesLocalStorage extends MyLocalStorage {
  static final InAppPurchasesPreferencesLocalStorage singleton =
      InAppPurchasesPreferencesLocalStorage.internal();

  factory InAppPurchasesPreferencesLocalStorage() {
    return singleton;
  }

  InAppPurchasesPreferencesLocalStorage.internal();

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
