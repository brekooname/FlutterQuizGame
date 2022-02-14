import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';

class DopeWarsResourceType {
  static late DopeWarsResourceType res0;
  static late DopeWarsResourceType res1;
  static late DopeWarsResourceType res2;
  static late DopeWarsResourceType res3;
  static late DopeWarsResourceType res4;
  static late DopeWarsResourceType res5;
  static late DopeWarsResourceType res6;
  static late DopeWarsResourceType res7;
  static late DopeWarsResourceType res8;
  static late DopeWarsResourceType res9;
  static late DopeWarsResourceType res10;
  static late DopeWarsResourceType res11;

  static List<DopeWarsResourceType> resources = [
    res0 = DopeWarsResourceType(0, "Gems", 600),
    res1 = DopeWarsResourceType(1, "Cars", 240),
    res2 = DopeWarsResourceType(2, "Electronics", 100),
    res3 = DopeWarsResourceType(3, "Medicine", 60),
    res4 = DopeWarsResourceType(4, "Iron", 40),
    res5 = DopeWarsResourceType(5, "Perfume", 22),
    res6 = DopeWarsResourceType(6, "Oil", 20),
    res7 = DopeWarsResourceType(7, "Wheat", 18),
    res8 = DopeWarsResourceType(8, "Clothes", 8),
    res9 = DopeWarsResourceType(9, "Fruit", 5),
    res10 = DopeWarsResourceType(10, "Coal", 4),
    res11 = DopeWarsResourceType(11, "Coffee", 3),
  ];

  int index;
  String resourceLabel;
  final int _standardPricePercent;

  DopeWarsResourceType(
      this.index, this.resourceLabel, this._standardPricePercent);

  int get standardPrice =>
      DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(
          _standardPricePercent);
}
