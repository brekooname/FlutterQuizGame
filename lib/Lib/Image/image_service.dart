import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';

class ImageService {
  late MyAppContext myAppContext;

  static final ImageService singleton = ImageService.internal();

  factory ImageService({required MyAppContext myAppContext}) {
    singleton.myAppContext = myAppContext;
    return singleton;
  }

  ImageService.internal();

  Image getSpecificImage(
      {required String imageName, String? module, Size? size}) {
    String path = getSpecificImagePath(imageName: imageName, module: module);
    return getByImagePath(path, size);
  }

  String getSpecificImagePath({required String imageName, String? module}) {
    var appName = myAppContext.appId.appKey;
    String path = "assets/implementations/$appName";
    path = module != null ? path + "/" + module : path;
    path = path + "/$imageName.png";
    return path;
  }

  Image getMainImage(
      {required String imageName, String? module, Size? size}) {
    String path = "assets/main";
    path = module != null ? path + "/" + module : path;
    path = path + "/$imageName.png";
    return getByImagePath(path, size);
  }

  Image getByImagePath(String imagePath, Size? size) {
    return Image.asset(
      imagePath,
      alignment: Alignment.center,
      height: size?.height,
      width: size?.width,
    );
  }
}
