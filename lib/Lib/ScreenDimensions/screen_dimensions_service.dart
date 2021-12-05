import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';

import '../../main.dart';

class ScreenDimensionsService {
  static final _standard_screen_ratio = 16 / 9;

  static final ScreenDimensionsService singleton =
      ScreenDimensionsService.internal();

  factory ScreenDimensionsService() {
    return singleton;
  }

  ScreenDimensionsService.internal();

  double h(double percent) {
    return _getValueForPercent(MyAppState.screenHeight, percent);
  }

  double w(double percent) {
    return _getValueForPercent(MyAppState.screenWidth, percent);
  }

  double getNewHeightForNewWidth(
      double newWidth, double originalWidth, double originalHeight) {
    return (originalHeight / originalWidth) * newWidth;
  }

  double getNewWidthForNewHeight(
      double newHeight, double originalWidth, double originalHeight) {
    return (originalWidth / originalHeight) * newHeight;
  }

  static double calculateScreenWidth(
      BuildContext buildContext, bool isPortrait) {
    double width = _getExternalDeviceWidth(buildContext);
    //if FALSE, width is larger, so width must be adjusted
    if (!_isExternalGraphicsRatioGreaterThanStandard(
        buildContext, isPortrait)) {
      width = isPortrait
          ? _getExternalDeviceHeight(buildContext) / _standard_screen_ratio
          : _getExternalDeviceHeight(buildContext) * _standard_screen_ratio;
    }
    return width;
  }

  static double calculateScreenHeight(
      BuildContext buildContext, bool isPortrait) {
    double height = _getExternalDeviceHeight(buildContext);
    //if TRUE, width is smaller, so height must be adjusted
    if (_isExternalGraphicsRatioGreaterThanStandard(buildContext, isPortrait)) {
      height = isPortrait
          ? _getExternalDeviceWidth(buildContext) * _standard_screen_ratio
          : _getExternalDeviceWidth(buildContext) / _standard_screen_ratio;
    }
    return height;
  }

  //If return TRUE, means that the WIDTH is lower than the standard
  static bool _isExternalGraphicsRatioGreaterThanStandard(
      BuildContext buildContext, bool isPortrait) {
    return _getExternalScreenRatio(buildContext, isPortrait) >
        _standard_screen_ratio;
  }

  static double _getExternalScreenRatio(
      BuildContext buildContext, bool isPortrait) {
    return isPortrait
        ? _getExternalDeviceHeight(buildContext) /
            _getExternalDeviceWidth(buildContext)
        : _getExternalDeviceWidth(buildContext) /
            _getExternalDeviceHeight(buildContext);
  }

  static double _getExternalDeviceHeight(BuildContext buildContext) {
    return MediaQuery.of(buildContext).size.height;
  }

  static double _getExternalDeviceWidth(BuildContext buildContext) {
    return MediaQuery.of(buildContext).size.width;
  }

  double _getValueForPercent(double val, double percent) {
    return val * (percent / 100);
  }
}
