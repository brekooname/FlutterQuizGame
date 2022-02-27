import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';

import 'dopewars_game_local_storage.dart';
import 'dopewars_total_days_service.dart';

class DopeWarsLocationMoveService {
  final DopeWarsTotalDaysService _dopeWarsTotalDaysService =
      DopeWarsTotalDaysService();
  final DopeWarsLocalStorage _dopeWarsLocalStorage = DopeWarsLocalStorage();
  AdService adService = AdService();

  DopeWarsGameContext gameContext;

  DopeWarsLocationMoveService(this.gameContext);

  void passDayAndMoveLocation(
      BuildContext context, DopeWarsLocation newLocation) {
    if (_dopeWarsLocalStorage.isLocationUnlocked(newLocation)) {
      spendMoneyOnTravel(newLocation);
    } else {
      unlockLocation(newLocation);
    }
    DopeWarsResourceTransactionService(gameContext).calculateReputation();
    gameContext.market.setCurrentLocation(
        newLocation, gameContext.inventory.availableResourcesByType);
    increaseDaysPassed(context);
  }

  void unlockLocation(DopeWarsLocation location) {
    _dopeWarsLocalStorage.unlockLocation(location);
    gameContext.inventory.budget =
        gameContext.inventory.budget - location.unlockPrice;
  }

  void spendMoneyOnTravel(DopeWarsLocation newLocation) {
    gameContext.inventory.budget = gameContext.inventory.budget -
        newLocation.getTravelPrice(gameContext.daysPassed);
  }

  int nrOfLocationsUnlocked() {
    int nrOfLocationsUnlocked = 0;
    for (DopeWarsLocation location in DopeWarsLocation.locations) {
      if (_dopeWarsLocalStorage.isLocationUnlocked(location)) {
        nrOfLocationsUnlocked++;
      }
    }
    return nrOfLocationsUnlocked;
  }

  void increaseDaysPassed(BuildContext context) {
    adService.showInterstitialAd(
        context,
        gameContext.daysPassed == 10 ||
            gameContext.daysPassed == 25 ||
            gameContext.daysPassed == 40 ||
            gameContext.daysPassed == 58, executeAfterClose: () {
      _dopeWarsTotalDaysService.increaseDays(gameContext);
      gameContext.resetSelectedResource();
      _dopeWarsTotalDaysService.processGameOver(gameContext);
    });
  }
}
