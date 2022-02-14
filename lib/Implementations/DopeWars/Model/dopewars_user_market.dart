import 'dart:math';

import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';

class DopeWarsUserMarket {
  List<DopeWarsResourceMarket> availableResources = [];

  late DopeWarsLocation currentLocation;

  DopeWarsUserMarket(List<DopeWarsResourceType> resourcesInInventory) {
    setCurrentLocation(DopeWarsLocation.location0, resourcesInInventory);
  }

  void setCurrentLocation(DopeWarsLocation currentLocation,
      List<DopeWarsResourceType> resourcesInInventory) {
    this.currentLocation = currentLocation;
    List<DopeWarsResourceMarket> availableResources = [];
    List<DopeWarsResourceType> randomResources = [];
    randomResources =
        getAvailableResources(randomResources, resourcesInInventory);
    for (DopeWarsResourceType drgType in randomResources) {
      int resourcePrice = getVariableStandardPrice(drgType.standardPrice);
      if (currentLocation.isResourceCheapInThisLocation(drgType)) {
        resourcePrice = getRandomMajorPrice(drgType, false);
      } else if (currentLocation.isResourceExpensiveInThisLocation(drgType)) {
        resourcePrice = getRandomMajorPrice(drgType, true);
      }
      DopeWarsResourceMarket resource =
          DopeWarsResourceMarket(drgType, resourcePrice);
      availableResources.add(resource);
    }
    this.availableResources = availableResources;
  }

  List<DopeWarsResourceType> getAvailableResources(
      List<DopeWarsResourceType> availableResources,
      List<DopeWarsResourceType> resourcesInInventory) {
    for (DopeWarsResourceType resource in DopeWarsResourceType.resources) {
      int randomNr = Random().nextInt(100);
      int range = 50;
      if (resourcesInInventory.contains(resource)) {
        range = 75;
      }
      if (randomNr < range && !availableResources.contains(resource)) {
        availableResources.add(resource);
      }
      if (availableResources.length > 5) {
        break;
      }
    }
    if (availableResources.length < 4) {
      getAvailableResources(availableResources, resourcesInInventory);
    }
    return availableResources;
  }

  int getVariableStandardPrice(int standardPrice) {
    int differencePower =
        Random().nextInt(getDifferencePowerByStandardPrice(standardPrice));
    int variablePrice =
        Random().nextInt(standardPrice ~/ (10 - differencePower));
    bool plusOrMinus = Random().nextBool();
    if (plusOrMinus) {
      return standardPrice + variablePrice;
    } else {
      if (standardPrice - variablePrice < 0) {
        return 0;
      } else {
        return standardPrice - variablePrice;
      }
    }
  }

  DopeWarsResourceType getRandomResource() {
    var resources = DopeWarsResourceType.resources.toList();
    resources.shuffle();
    return resources.first;
  }

  int getRandomMajorPrice(DopeWarsResourceType resource, bool? plus) {
    double price = 0;
    plus ??= Random().nextBool();
    if (plus) {
      int variablePercentage =
          Random().nextInt(getPercentForMaxPrice(resource.standardPrice));
      price = resource.standardPrice +
          (variablePercentage / 100) * resource.standardPrice;
    } else {
      int variablePercentage = 30 - Random().nextInt(15);
      price = resource.standardPrice -
          (variablePercentage / 100) * resource.standardPrice;
    }
    return getVariableStandardPrice(price.toInt());
  }

  int getPercentForMaxPrice(int standardPrice) {
    if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(7)) {
      return 250;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(16)) {
      return 250;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(32)) {
      return 200;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(60)) {
      return 150;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(80)) {
      return 120;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(120)) {
      return 80;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(400)) {
      return 60;
    } else {
      return 60;
    }
  }

  int getDifferencePowerByStandardPrice(int standardPrice) {
    if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(7)) {
      return 9;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(16)) {
      return 9;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(32)) {
      return 8;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(60)) {
      return 7;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(80)) {
      return 7;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(120)) {
      return 5;
    } else if (standardPrice <=
        DopeWarsPriceService.getPriceBasedOnStartingBudgetWithPercent(400)) {
      return 4;
    } else {
      return 4;
    }
  }
}
