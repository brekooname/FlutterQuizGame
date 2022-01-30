import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';

class ImageService {
  late AssetsService _assetsService;

  static final ImageService singleton = ImageService.internal();

  factory ImageService() {
    singleton._assetsService = AssetsService();
    return singleton;
  }

  ImageService.internal();

  Image getSpecificImage(
      {required String imageName,
      required String imageExtension,
      String? module,
      double? maxWidth,
      double? maxHeight}) {
    String path = _assetsService.getSpecificAssetPath(
        assetName: imageName, assetExtension: imageExtension, module: module);
    return getByImagePath(path, maxWidth, maxHeight);
  }

  Image getMainImage(
      {required String imageName,
      required String imageExtension,
      String? module,
      double? maxWidth,
      double? maxHeight}) {
    return getByImagePath(
        _assetsService.getMainAssetPath(
            module: module,
            assetName: imageName,
            assetExtension: imageExtension),
        maxWidth,
        maxHeight);
  }

  AssetImage getMainAssetImage({
    required String imageName,
    required String imageExtension,
    String? module,
  }) {
    return getAssetByImagePath(
      _assetsService.getMainAssetPath(
          module: module, assetName: imageName, assetExtension: imageExtension),
    );
  }

  AssetImage getAssetByImagePath(String imagePath) {
    return AssetImage(imagePath);
  }

  Image getByImagePath(String imagePath, double? maxWidth, double? maxHeight) {
    return Image.asset(
      imagePath,
      alignment: Alignment.center,
      fit: maxWidth != null && maxWidth == maxHeight ? BoxFit.fitWidth : null,
      height: maxHeight,
      width: maxWidth,
    );
  }
}
