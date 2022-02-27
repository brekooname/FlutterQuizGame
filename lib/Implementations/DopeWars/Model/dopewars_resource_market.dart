import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource.dart';

class DopeWarsResourceMarket extends DopeWarsResource {
  DopeWarsResourceMarket(DopeWarsResourceType resourceType, int price)
      : super(resourceType, price);

  DopeWarsResourceMarket.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
