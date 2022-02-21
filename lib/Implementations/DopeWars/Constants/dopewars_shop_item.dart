import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';

class DopeWarsShopItem {
  static late DopeWarsShopItem item0;
  static late DopeWarsShopItem item1;
  static late DopeWarsShopItem item2;
  static late DopeWarsShopItem item3;
  static late DopeWarsShopItem item4;
  static late DopeWarsShopItem item5;

  static List<DopeWarsShopItem> items = [
    item0 = DopeWarsShopItem(0, "sunglasses", "Sun Glasses", 5, 10),
    item1 = DopeWarsShopItem(1, "smartphone", "Smartphone", 10, 20),
    item2 = DopeWarsShopItem(2, "gold_watch", "Gold Watch", 25, 50),
    item3 = DopeWarsShopItem(3, "limousine", "Limousine", 100, 200),
    item4 = DopeWarsShopItem(4, "mansion", "Mansion", 500, 1000),
    item5 = DopeWarsShopItem(5, "yacht", "Yacht", 2500, 5000),
  ];

  int index;
  String itemImgName;
  String itemLabel;
  int reputation;
  final int _pricePercent;

  DopeWarsShopItem(this.index, this.itemImgName, this.itemLabel,
      this.reputation, this._pricePercent);

  int get price =>
      DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(
          _pricePercent);
}
