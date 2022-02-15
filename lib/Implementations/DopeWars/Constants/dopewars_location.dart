import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';

class DopeWarsLocation {
  static late DopeWarsLocation location0;
  static late DopeWarsLocation location1;
  static late DopeWarsLocation location2;
  static late DopeWarsLocation location3;
  static late DopeWarsLocation location4;
  static late DopeWarsLocation location5;

  static List<DopeWarsLocation> locations = [
    location0 = DopeWarsLocation(
        0,
        "New York",
        [
          DopeWarsResourceType.res4,
          DopeWarsResourceType.res5,
        ],
        [
          DopeWarsResourceType.res0,
        ],
        0,
        3),
    location1 = DopeWarsLocation(
        1,
        "Rio de Janeiro",
        [
          DopeWarsResourceType.res11,
          DopeWarsResourceType.res9,
        ],
        [
          DopeWarsResourceType.res0,
          DopeWarsResourceType.res1,
          DopeWarsResourceType.res2,
        ],
        75,
        3),
    location2 = DopeWarsLocation(
        2,
        "Beijing",
        [
          DopeWarsResourceType.res8,
        ],
        [
          DopeWarsResourceType.res6,
          DopeWarsResourceType.res7,
        ],
        150,
        3),
    location3 = DopeWarsLocation(
        3,
        "Sydney",
        [
          DopeWarsResourceType.res8,
          DopeWarsResourceType.res9,
        ],
        [
          DopeWarsResourceType.res10,
        ],
        250,
        3),
    location4 = DopeWarsLocation(
        4,
        "Berlin",
        [
          DopeWarsResourceType.res1,
          DopeWarsResourceType.res10,
        ],
        [
          DopeWarsResourceType.res7,
          DopeWarsResourceType.res9,
        ],
        350,
        3),
    location5 = DopeWarsLocation(
        5,
        "Cape Town",
        [
          DopeWarsResourceType.res0,
          DopeWarsResourceType.res4,
          DopeWarsResourceType.res9,
        ],
        [
          DopeWarsResourceType.res11,
        ],
        800,
        3),
  ];

  int index;
  String locationLabel;
  List<DopeWarsResourceType> cheapResources;
  List<DopeWarsResourceType> expensiveResources;
  final int _unlockPricePercent;
  final int _travelPricePercent;

  DopeWarsLocation(
      this.index,
      this.locationLabel,
      this.cheapResources,
      this.expensiveResources,
      this._unlockPricePercent,
      this._travelPricePercent);

  bool isResourceCheapInThisLocation(DopeWarsResourceType resourceType) {
    return cheapResources.contains(resourceType);
  }

  bool isResourceExpensiveInThisLocation(DopeWarsResourceType resourceType) {
    return expensiveResources.contains(resourceType);
  }

  int get unlockPrice =>
      DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(
          _unlockPricePercent);

  int getTravelPrice(int daysPassed) => DopeWarsPriceService
      .getPriceBasedOnStartingBudgetWithPercentAndDaysPassed(
          _travelPricePercent, daysPassed);
}
