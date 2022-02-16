import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/int_extension.dart';

import 'dopewars_location_move_service.dart';

class DopeWarsResourceTransactionService {
  static const int reputationForLocationUnlock = 15;
  static const int reputationForFinalBudgetReached = 25;
  static const int finalBudgetToReachToWinGame = 1000000;
  DopeWarsGameContext gameContext;
  late DopeWarsLocationMoveService dopeWarsLocationMoveService;

  DopeWarsResourceTransactionService(this.gameContext) {
    dopeWarsLocationMoveService = DopeWarsLocationMoveService(gameContext);
  }

  void buyResource(DopeWarsResource resourceToBuy, int boughtAmount) {
    int priceToPayForThisAmount =
        getAmountToModifyBudget(boughtAmount, resourceToBuy.price);
    gameContext.inventory.budget =
        gameContext.inventory.budget - priceToPayForThisAmount;
    DopeWarsResourceInventory currentResource = DopeWarsResourceInventory(
        boughtAmount, resourceToBuy.resourceType, resourceToBuy.price);
    addBoughtResource(currentResource, boughtAmount);
  }

  void addBoughtResource(
      DopeWarsResourceInventory boughtResource, int boughtAmount) {
    bool resourceFound = false;
    for (DopeWarsResourceInventory resource
        in gameContext.inventory.availableResources) {
      if (resource.resourceType.index == boughtResource.resourceType.index) {
        resource.amount = resource.amount + boughtAmount;
        resourceFound = true;
        break;
      }
    }
    if (!resourceFound) {
      gameContext.inventory.availableResources.add(boughtResource);
    }
  }

  int getAmountToModifyBudget(int resourceAmount, int resourcePrice) {
    return resourceAmount * resourcePrice;
  }

  int getMarketPriceForResource(DopeWarsResource? resource) {
    int marketPrice = 0;
    if (resource != null) {
      for (DopeWarsResource marketResource
          in gameContext.market.availableResources) {
        if (marketResource.resourceType == resource.resourceType) {
          marketPrice = marketResource.price;
        }
      }
    }
    return marketPrice;
  }

  void sellResource(DopeWarsResource resourceToSell, int soldAmount) {
    int moneyWonOnSellingThisResource = getAmountToModifyBudget(
        soldAmount, getMarketPriceForResource(resourceToSell));
    gameContext.inventory.budget =
        gameContext.inventory.budget + moneyWonOnSellingThisResource;
    DopeWarsResourceInventory currentResource = DopeWarsResourceInventory(
        soldAmount,
        resourceToSell.resourceType,
        getMarketPriceForResource(resourceToSell));
    removeSoldResource(gameContext.inventory, currentResource, soldAmount);

    calculateReputation();
  }

  void removeSoldResource(DopeWarsUserInventory inventory,
      DopeWarsResourceInventory soldResource, int soldAmount) {
    for (DopeWarsResourceInventory resource in inventory.availableResources) {
      if (resource.resourceType.index == soldResource.resourceType.index) {
        if (resource.amount - soldAmount <= 0) {
          inventory.availableResources.remove(resource);
          break;
        } else {
          resource.amount = resource.amount - soldAmount;
          break;
        }
      }
    }
  }

  static int getResourceAmountYouAfford(int resourcePrice, int budget) {
    return (budget / resourcePrice).floor();
  }

  static String formatCurrency(int? val) {
    return val?.formatIntEveryChars(3, "\$") ?? "";
  }

  void calculateReputation() {
    int nrOfLocationsUnlocked =
        dopeWarsLocationMoveService.nrOfLocationsUnlocked();
    int reputation = (nrOfLocationsUnlocked - 1) * reputationForLocationUnlock;
    if (dopeWarsLocationMoveService.areAllLocationsUnlocked() &&
        gameContext.inventory.budget >= finalBudgetToReachToWinGame) {
      reputation = reputation + reputationForFinalBudgetReached;
    }
    gameContext.setReputation(reputation);
    dopeWarsLocationMoveService.processGameOver();
  }
}
