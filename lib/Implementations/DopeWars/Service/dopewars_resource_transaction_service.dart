import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_shop_item.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/int_extension.dart';

import 'dopewars_game_local_storage.dart';
import 'dopewars_location_move_service.dart';

class DopeWarsResourceTransactionService {
  final DopeWarsLocalStorage _dopeWarsLocalStorage = DopeWarsLocalStorage();
  static const int reputationForLocationUnlock = 25;
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

  void unlockShopItem(DopeWarsShopItem item) {
    _dopeWarsLocalStorage.unlockShopItem(item);
    gameContext.inventory.budget = gameContext.inventory.budget - item.price;
    calculateReputation();
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
    var shopItems = DopeWarsShopItem.items;
    for (DopeWarsShopItem i in shopItems) {
      if (_dopeWarsLocalStorage.isShopItemUnlocked(i)) {
        reputation = reputation + i.reputation;
      }
    }
    gameContext.setReputation(reputation);
    updateMaxReputation();
  }

  void updateMaxReputation() {
    var maxReputation = _dopeWarsLocalStorage.getMaxReputation();
    int currentRep = gameContext.reputation;
    if (currentRep > maxReputation) {
      _dopeWarsLocalStorage.setMaxReputation(currentRep);
    }
  }
}
