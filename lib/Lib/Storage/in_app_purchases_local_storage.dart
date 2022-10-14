
import 'my_local_storage.dart';

class InAppPurchaseLocalStorage extends MyLocalStorage {

  static final InAppPurchaseLocalStorage singleton =
  InAppPurchaseLocalStorage.internal();

  factory InAppPurchaseLocalStorage() {
    return singleton;
  }

  InAppPurchaseLocalStorage.internal();

  bool isPurchased(String productId) {
    return localStorage.getBool(_getProductIdKey(productId)) ?? false;
  }

  void savePurchase(String productId) {
    localStorage.setBool(_getProductIdKey(productId), true);
  }

  void deletePurchase(String productId) {
    localStorage.setBool(_getProductIdKey(productId), false);
  }

  String _getProductIdKey(String productId) {
    return localStorageName + "_ProductIdKey_" + productId;
  }
}