import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';

import 'dopewars_game_local_storage.dart';

class DopeWarsLocationMoveService {
  static const int totalDays = 60;
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
    increaseDaysPassed(context);
    gameContext.market.setCurrentLocation(
        newLocation, gameContext.inventory.availableResourcesByType);
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

  bool areAllLocationsUnlocked() {
    return nrOfLocationsUnlocked() == DopeWarsLocation.locations.length;
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

  DopeWarsLocation? nextLocationToUnlock() {
    DopeWarsLocation? locationToUnlock;
    for (DopeWarsLocation location in DopeWarsLocation.locations) {
      if (!_dopeWarsLocalStorage.isLocationUnlocked(location)) {
        locationToUnlock = location;
        break;
      }
    }
    return locationToUnlock;
  }

  void increaseDaysPassed(BuildContext context) {
    _dopeWarsLocalStorage.saveGame(gameContext);
    adService.showInterstitialAd(
        context,
        gameContext.daysPassed == 10 ||
            gameContext.daysPassed == 25 ||
            gameContext.daysPassed == 40 ||
            gameContext.daysPassed == 58, executeAfterClose: () {
      gameContext.daysPassed = gameContext.daysPassed + 1;
      processGameOver();
    });
  }

  void processGameOver() {
    int currentRep = gameContext.reputation;
    int currentDaysPassed = gameContext.daysPassed;
    if (currentDaysPassed > totalDays || currentRep >= 100) {
      var maxReputation = _dopeWarsLocalStorage.getMaxReputation();
      if (currentRep > maxReputation ||
          (currentRep == maxReputation &&
              currentDaysPassed < _dopeWarsLocalStorage.getMaxDays())) {
        _dopeWarsLocalStorage.clearAll();
        _dopeWarsLocalStorage.setMaxDays(currentDaysPassed);
        _dopeWarsLocalStorage.setMaxReputation(currentRep);
      }
    }
  }
}
