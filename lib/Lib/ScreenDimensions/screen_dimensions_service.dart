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
    var width = _getExternalDeviceWidth(mediaQueryData);
    var height = _getExternalDeviceHeight(mediaQueryData);
    if (isPortrait()) {
      if (height / width > _standardScreenRatio) {
        height = width * _standardScreenRatio;
      } else {
        width = height / _standardScreenRatio;
      }
    } else {
      if (width / height > _standardScreenRatio) {
        width = height * _standardScreenRatio;
      } else {
        height = width / _standardScreenRatio;
      }
    }
    return MapEntry(width, height);
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
