import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';

import '../../../main.dart';
import 'dopewars_game_local_storage.dart';

class DopeWarsTotalDaysService {
  static const int _totalDays = 60;
  final DopeWarsLocalStorage _dopeWarsLocalStorage = DopeWarsLocalStorage();

  static final DopeWarsTotalDaysService singleton =
      DopeWarsTotalDaysService.internal();

  factory DopeWarsTotalDaysService() {
    return singleton;
  }

  DopeWarsTotalDaysService.internal();

  String getTotalDaysLabelText() {
    var unlimitedMode = _dopeWarsLocalStorage.isUnlimitedMode();
    return unlimitedMode ? "Unlimited Mode" : "Days/Total Days";
  }

  String getTotalDaysValueText(DopeWarsGameContext gameContext) {
    var unlimitedMode = _dopeWarsLocalStorage.isUnlimitedMode();
    var daysPassed = gameContext.daysPassed;
    return unlimitedMode
        ? daysPassed.toString()
        : (daysPassed > _totalDays ? _totalDays : daysPassed).toString() +
            "/" +
            _totalDays.toString();
  }

  void processGameOver(DopeWarsGameContext gameContext) {
    int currentDaysPassed = gameContext.daysPassed;
    var unlimitedMode = _dopeWarsLocalStorage.isUnlimitedMode();
    if (!unlimitedMode && currentDaysPassed > _totalDays) {
      _dopeWarsLocalStorage.startNewGame();
      MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
          .showMainScreen();
    }
  }

  void increaseDays(DopeWarsGameContext gameContext) {
    var unlimitedMode = _dopeWarsLocalStorage.isUnlimitedMode();
    if (!unlimitedMode && gameContext.daysPassed <= _totalDays ||
        unlimitedMode) {
      gameContext.daysPassed = gameContext.daysPassed + 1;
      gameContext.daysPassedChanged = true;
      _dopeWarsLocalStorage.saveGame(gameContext);
    }
  }
}
