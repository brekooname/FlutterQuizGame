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
    item0 = DopeWarsShopItem(0, "Sun Glasses", 15, 10),
    item1 = DopeWarsShopItem(1, "Mobile Phone", 75, 20),
    item2 = DopeWarsShopItem(2, "Gold Watch", 150, 50),
    item3 = DopeWarsShopItem(3, "Limousine", 250, 200),
    item4 = DopeWarsShopItem(4, "Mansion", 350, 1000),
    item5 = DopeWarsShopItem(5, "Private Jet", 800, 5000),
  ];

  int index;
  String itemLabel;
  int reputation;
  final int _pricePercent;

  DopeWarsShopItem(
      this.index, this.itemLabel, this.reputation, this._pricePercent);

  int get price =>
      DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(
          _pricePercent);
}
