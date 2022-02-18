import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';

class DopeWarsGameContext extends GameContext {
  int _reputation = 0;
  int daysPassed = 0;
  DopeWarsResource? selectedResource;
  int? selectedMoneyChange;
  int selectedAmount = 0;
  bool? reputationChanged;
  bool? daysPassedChanged;

  late DopeWarsUserInventory inventory;
  late DopeWarsUserMarket market;

  DopeWarsGameContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig) {
    DopeWarsResourceType.resources;
    DopeWarsLocation.locations;
    inventory = DopeWarsUserInventory(DopeWarsPriceService.startingBudget);
    market = DopeWarsUserMarket(inventory.availableResourcesByType);
  }

  int get reputation => _reputation;

  setReputation(int reputation) {
    if (reputation > 100) {
      reputation = 100;
    }
    if (_reputation != reputation) {
      reputationChanged = true;
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
        super(gameContext.gameUser, gameContext.questionConfig) {
    market = DopeWarsUserMarket(inventory.availableResourcesByType);
  }

  Map<String, dynamic> toJson() {
    return {
      '_reputation': _reputation,
      'daysPassed': daysPassed,
      'inventory': inventory.toJson(),
    };
  }
}
