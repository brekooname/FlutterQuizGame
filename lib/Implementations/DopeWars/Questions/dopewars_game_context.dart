import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';

class DopeWarsGameContext extends GameContext {
  int _reputation = 0;
  int daysPassed = 0;

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

  set reputation(int reputation) {
    if (reputation > 100) {
      reputation = 100;
    }
    _reputation = reputation;
  }
}
