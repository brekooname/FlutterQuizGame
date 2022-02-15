import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';

abstract class DopeWarsResource {
  DopeWarsResourceType resourceType;
  int price;

  DopeWarsResource(this.resourceType, this.price);

  DopeWarsResource.fromJson(Map<String, dynamic> json)
      : resourceType = DopeWarsResourceType.fromJson(json['resourceType']),
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType.toJson(),
        'price': price,
      };
}
