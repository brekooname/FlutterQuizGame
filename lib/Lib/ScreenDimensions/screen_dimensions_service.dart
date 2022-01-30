import 'dart:math';

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

  double h(double percent) {
    return _getValueForPercent(MyApp.screenHeight, percent);
  }

  double w(double percent) {
    return _getValueForPercent(MyApp.screenWidth, percent);
  }

  double dimen(double percent) {
    return isPortrait() ? w(percent) : h(percent);
  }

  double getNewHeightForNewWidth(
      double newWidth, double originalWidth, double originalHeight) {
    return (originalHeight / originalWidth) * newWidth;
  }

  double getNewWidthForNewHeight(
      double newHeight, double originalWidth, double originalHeight) {
    return (originalWidth / originalHeight) * newHeight;
  }

  static MapEntry<double, double> calculateScreenDimensions(
      MediaQueryData mediaQueryData) {
    var width = _calculateScreenWidth(mediaQueryData);
    var height = _calculateScreenHeight(mediaQueryData);
    if (width > height) {
      if (width / height > _standardScreenRatio) {
        width = height * _standardScreenRatio;
      }
    }
    return MapEntry(width, height);
  }

  static double _calculateScreenWidth(MediaQueryData mediaQueryData) {
    var externalDeviceWidth = _getExternalDeviceWidth(mediaQueryData);
    var width = externalDeviceWidth;
    //if FALSE, width is larger, so width must be adjusted
    if (!_isExternalGraphicsRatioGreaterThanStandard(mediaQueryData)) {
      var externalDeviceHeight = _getExternalDeviceHeight(mediaQueryData);
      width = isPortrait()
          ? externalDeviceHeight / _standardScreenRatio
          : externalDeviceHeight * _standardScreenRatio;
    }
    return min(externalDeviceWidth, width);
  }

  static double _calculateScreenHeight(MediaQueryData mediaQueryData) {
    var externalDeviceHeight = _getExternalDeviceHeight(mediaQueryData);
    var height = externalDeviceHeight;
    //if TRUE, width is smaller, so height must be adjusted
    if (_isExternalGraphicsRatioGreaterThanStandard(mediaQueryData)) {
      var externalDeviceWidth = _getExternalDeviceWidth(mediaQueryData);
      height = isPortrait()
          ? externalDeviceWidth * _standardScreenRatio
          : externalDeviceWidth / _standardScreenRatio;
    }
    return min(externalDeviceHeight, height);
  }

  //If return TRUE, means that the WIDTH is lower than the standard
  static bool _isExternalGraphicsRatioGreaterThanStandard(
      MediaQueryData mediaQueryData) {
    return _getExternalScreenRatio(mediaQueryData) > _standardScreenRatio;
  }

  static double _getExternalScreenRatio(MediaQueryData mediaQueryData) {
    return isPortrait()
        ? _getExternalDeviceHeight(mediaQueryData) /
            _getExternalDeviceWidth(mediaQueryData)
        : _getExternalDeviceWidth(mediaQueryData) /
            _getExternalDeviceHeight(mediaQueryData);
  }

  static double _getExternalDeviceHeight(MediaQueryData mediaQueryData) {
    var height = mediaQueryData.size.height;
    if (MyApp.isExtraContentLocked) {
      height = height - AdSize.banner.height;
    }
    return height;
  }

  static double _getExternalDeviceWidth(MediaQueryData mediaQueryData) {
    return mediaQueryData.size.width;
  }

  static bool isPortrait() {
    return MyApp.appId.gameConfig.screenOrientation ==
        ScreenOrientation.portrait;
  }

  static double _getValueForPercent(double val, double percent) {
    return val * (percent / 100);
  }
}
