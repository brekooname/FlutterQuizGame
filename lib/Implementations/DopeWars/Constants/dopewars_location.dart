import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

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
        LabelMixin.staticLabel.l_new_york,
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
        LabelMixin.staticLabel.l_rio_de_janeiro,
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
        LabelMixin.staticLabel.l_beijing,
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
        LabelMixin.staticLabel.l_sydney,
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
        LabelMixin.staticLabel.l_berlin,
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
        LabelMixin.staticLabel.l_cape_town,
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

  late int index;
  late String locationLabel;
  late List<DopeWarsResourceType> cheapResources;
  late List<DopeWarsResourceType> expensiveResources;
  late int _unlockPricePercent;
  late int _travelPricePercent;

  DopeWarsLocation(
      this.index,
      this.locationLabel,
      this.cheapResources,
      this.expensiveResources,
      this._unlockPricePercent,
      this._travelPricePercent);

  DopeWarsLocation.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    var loc = locations.firstWhere((element) => element.index == index);
    locationLabel = loc.locationLabel;
    cheapResources = loc.cheapResources;
    expensiveResources = loc.expensiveResources;
    _unlockPricePercent = loc._unlockPricePercent;
    _travelPricePercent = loc._travelPricePercent;
  }

  Map<String, dynamic> toJson() => {
        'index': index,
      };

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
