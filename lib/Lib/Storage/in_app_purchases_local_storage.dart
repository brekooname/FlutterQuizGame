
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
    //!!!!!!!!!!!!! //TODO should be disabled !!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // localStorage.setBool(_getProductIdKey(""), false);
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  }

  bool isPurchased(String productId) {
    return localStorage.getBool(_getProductIdKey(productId)) ?? false;
  }

  void savePurchase(String productId) {
    localStorage.setBool(_getProductIdKey(productId), true);
  }

  String _getProductIdKey(String productId) {
    return localStorageName + "_ProductIdKey_" + productId;
  }
}