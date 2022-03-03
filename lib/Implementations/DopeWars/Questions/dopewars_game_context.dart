import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';

class DopeWarsGameContext extends GameContext {
  final DopeWarsLocalStorage _dopeWarsLocalStorage = DopeWarsLocalStorage();
  int _reputation = 0;
  int daysPassed = 0;
  DopeWarsResource? selectedResource;
  int? selectedMoneyChange;
  int selectedAmount = 0;
  int? reputationChange;
  bool? daysPassedChanged;

  late DopeWarsUserInventory inventory;
  late DopeWarsUserMarket market;

  DopeWarsGameContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig) {
    inventory = DopeWarsUserInventory(DopeWarsPriceService.startingBudget);
    market = DopeWarsUserMarket(inventory.availableResourcesByType);
  }

  int get reputation => _reputation;

  setReputation(int reputation) {
    if (_reputation < reputation) {
      reputationChange = reputation - _reputation;
      _dopeWarsLocalStorage.saveGame(this);
    }
    _reputation = reputation;
  }

  resetSelectedResource() {
    selectedResource = null;
    selectedAmount = 0;
    selectedMoneyChange = null;
  }

  DopeWarsGameContext.fromJson(
      GameContext gameContext, Map<String, dynamic> json)
      : _reputation = json['_reputation'],
        daysPassed = json['daysPassed'],
        inventory = DopeWarsUserInventory.fromJson(json['inventory']),
        market = DopeWarsUserMarket.fromJson(json['market']),
        super(gameContext.gameUser, gameContext.questionConfig);

  Map<String, dynamic> toJson() {
    return {
      '_reputation': _reputation,
      'daysPassed': daysPassed,
      'inventory': inventory.toJson(),
      'market': market.toJson(),
    };
  }
}
