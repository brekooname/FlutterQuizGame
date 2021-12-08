class AssetsService {
  static final AssetsService singleton = AssetsService.internal();

  factory AssetsService() {
    return singleton;
  }

  AssetsService.internal();

  String getSpecificAssetPath(
      {required String assetName,
      required String assetExtension,
      required String appKey,
      String? module}) {
    String path = "assets/implementations/$appKey";
    path = module != null ? path + "/" + module : path;
    path = path + "/$assetName.$assetExtension";
    return path;
  }

  String getMainAssetPath(
      {required String assetName,
      required String assetExtension,
      String? module}) {
    String path = "assets/main";
    path = module != null ? path + "/" + module : path;
    path = path + "/$assetName.$assetExtension";
    return path;
  }
}
