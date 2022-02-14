import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_inventory.dart';

class DopeWarsUserInventory {
  final int startingMaxContainer = 99;
  static const int maxItemsInInventory = 6;
  List<DopeWarsResourceInventory> availableResources = [];
  int budget;

  DopeWarsUserInventory(this.budget);

  List<DopeWarsResourceType> get availableResourcesByType {
    return availableResources.map((e) => e.resourceType).toList();
  }

  int get totalAmountOfResources {
    int total = 0;
    for (DopeWarsResourceInventory resource in availableResources) {
      total = total + resource.amount;
    }
    return total;
  }

  int get containerSpaceLeft {
    return startingMaxContainer - totalAmountOfResources;
  }
}
