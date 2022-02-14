import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';

abstract class DopeWarsResource {
  DopeWarsResourceType resourceType;
  int price;

  DopeWarsResource(this.resourceType, this.price);
}
