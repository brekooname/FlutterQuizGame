import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/screen_orientation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../main.dart';

class ScreenDimensionsService {
  static const _standardScreenRatio = 16 / 9;

  static final ScreenDimensionsService singleton =
      ScreenDimensionsService.internal();

  factory ScreenDimensionsService() {
    return singleton;
  }

  ScreenDimensionsService.internal();

  double _h(double percent) {
    return _getValueForPercent(MyApp.screenHeight, percent);
  }

  double _w(double percent) {
    return _getValueForPercent(MyApp.screenWidth, percent);
  }

  double dimen(double percent) {
    return isPortrait() ? _w(percent) : _h(percent);
  }

  double getNewHeightForNewWidth(
      double newWidth, double originalWidth, double originalHeight) {
    return (originalHeight / originalWidth) * newWidth;
  }

  double getNewWidthForNewHeight(
      double newHeight, double originalWidth, double originalHeight) {
    return (originalWidth / originalHeight) * newHeight;
  }

  static double calculateScreenWidth(BuildContext buildContext) {
    var width = _calculateScreenWidth(buildContext);
    return isPortrait() ? width : 1070;
  }

  static double _calculateScreenWidth(BuildContext buildContext) {
    double width = _getExternalDeviceWidth(buildContext);
    //if FALSE, width is larger, so width must be adjusted
    if (!_isExternalGraphicsRatioGreaterThanStandard(buildContext)) {
      var externalDeviceHeight = _getExternalDeviceHeight(buildContext);
      width = isPortrait()
          ? externalDeviceHeight / _standardScreenRatio
          : externalDeviceHeight * _standardScreenRatio;
    }
    return width;
  }

  static double calculateScreenHeight(BuildContext buildContext) {
    var height = _calculateScreenHeight(buildContext);
    return 552;
    return isPortrait() ? height : 552;
  }

  static double _calculateScreenHeight(BuildContext buildContext) {
    double height = _getExternalDeviceHeight(buildContext);
    //if TRUE, width is smaller, so height must be adjusted
    if (_isExternalGraphicsRatioGreaterThanStandard(buildContext)) {
      var externalDeviceWidth = _getExternalDeviceWidth(buildContext);
      height = isPortrait()
          ? externalDeviceWidth * _standardScreenRatio
          : externalDeviceWidth / _standardScreenRatio;
    }
    return height;
  }

  //If return TRUE, means that the WIDTH is lower than the standard
  static bool _isExternalGraphicsRatioGreaterThanStandard(
      BuildContext buildContext) {
    return _getExternalScreenRatio(buildContext) > _standardScreenRatio;
  }

  static double _getExternalScreenRatio(BuildContext buildContext) {
    return isPortrait()
        ? _getExternalDeviceHeight(buildContext) /
            _getExternalDeviceWidth(buildContext)
        : _getExternalDeviceWidth(buildContext) /
            _getExternalDeviceHeight(buildContext);
  }

  static double _getExternalDeviceHeight(BuildContext buildContext) {
    var height = MediaQuery.of(buildContext).size.height;
    if (MyApp.isExtraContentLocked) {
      height = height - AdSize.banner.height;
    }
    return height;
  }

  static double _getExternalDeviceWidth(BuildContext buildContext) {
    return MediaQuery.of(buildContext).size.width;
  }

  static bool isPortrait() {
    return MyApp.appId.gameConfig.screenOrientation ==
        ScreenOrientation.portrait;
  }

  static double _getValueForPercent(double val, double percent) {
    return val * (percent / 100);
  }
}
