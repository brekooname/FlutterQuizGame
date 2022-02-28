import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

class DopeWarsShopItem {
  static late DopeWarsShopItem item0;
  static late DopeWarsShopItem item1;
  static late DopeWarsShopItem item2;
  static late DopeWarsShopItem item3;
  static late DopeWarsShopItem item4;
  static late DopeWarsShopItem item5;

  static List<DopeWarsShopItem> items = [
    item0 = DopeWarsShopItem(
        0, "sunglasses", LabelMixin.staticLabel.l_sun_glasses, 5, 10),
    item1 = DopeWarsShopItem(
        1, "smartphone", LabelMixin.staticLabel.l_smartphone, 10, 20),
    item2 = DopeWarsShopItem(
        2, "gold_watch", LabelMixin.staticLabel.l_gold_watch, 25, 50),
    item3 = DopeWarsShopItem(
        3, "limousine", LabelMixin.staticLabel.l_limousine, 100, 200),
    item4 = DopeWarsShopItem(
        4, "mansion", LabelMixin.staticLabel.l_mansion, 500, 1000),
    item5 = DopeWarsShopItem(
        5, "yacht", LabelMixin.staticLabel.l_yacht, 2500, 5000),
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
