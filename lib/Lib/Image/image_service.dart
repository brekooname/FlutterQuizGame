import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';

class ImageService {
  static final ImageService singleton = ImageService.internal();

  factory ImageService() {
    return singleton;
  }

  ImageService.internal();

  Image getSpecificImage(
      {required String imageName,
      String? module,
      required String appKey,
      double? maxWidth,
      double? maxHeight}) {
    String path = getSpecificImagePath(
        imageName: imageName, appKey: appKey, module: module);
    return getByImagePath(path, maxWidth, maxHeight);
  }

  String getSpecificImagePath(
      {required String imageName, required String appKey, String? module}) {
    String path = "assets/implementations/$appKey";
    path = module != null ? path + "/" + module : path;
    path = path + "/$imageName.png";
    return path;
  }

  Image getMainImage(
      {required String imageName,
      String? module,
      double? maxWidth,
      double? maxHeight}) {
    String path = "assets/main";
    path = module != null ? path + "/" + module : path;
    path = path + "/$imageName.png";
    return getByImagePath(path, maxWidth, maxHeight);
  }

  Image getByImagePath(String imagePath, double? maxWidth, double? maxHeight) {
    return Image.asset(
      imagePath,
      alignment: Alignment.center,
      height: maxHeight,
      width: maxWidth,
    );
  }
}
