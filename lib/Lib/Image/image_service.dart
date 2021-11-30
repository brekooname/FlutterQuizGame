import 'dart:ui';

import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class ImageService {
  late MyAppContext myAppContext;

  static final ImageService singleton = ImageService.internal();

  factory ImageService({required MyAppContext myAppContext}) {
    singleton.myAppContext = myAppContext;
    return singleton;
  }

  ImageService.internal();

  String getImagePath(String imageName){
    var appName = myAppContext.appId.appKey;
    return "assets/implementations/$appName/$imageName.png";
  }
}
