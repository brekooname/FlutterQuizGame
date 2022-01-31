import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/test_util.dart';

void main() {
  testWidgets('ScreenDimensionsService is tested', (WidgetTester tester) async {
    //PORTRAIT
    await TestUtil.initApp(Language.en, "geoquiz", tester);
    expectDimensions(const MediaQueryData(size: Size(1280, 552)), 310.5, 552);
    expectDimensions(
        const MediaQueryData(size: Size(552, 1280)), 552.0, 981.3333333333333);
    expectDimensions(const MediaQueryData(size: Size(1000, 1280)), 720, 1280);
    expectDimensions(const MediaQueryData(size: Size(1200, 1280)), 720, 1280);
    expectDimensions(
        const MediaQueryData(size: Size(1000, 1000)), 562.5, 1000.0);

    //LANDSCAPE
    await TestUtil.initApp(Language.en, "perstest", tester);
    expectDimensions(
        const MediaQueryData(size: Size(1280, 552)), 981.3333333333333, 552);
    expectDimensions(const MediaQueryData(size: Size(1280, 1000)), 1280, 720);
    expectDimensions(
        const MediaQueryData(size: Size(1000, 1000)), 1000.0, 562.5);
  });
}

void expectDimensions(MediaQueryData mediaQueryData, double expectedWidth,
    double expectedHeight) {
  var screenDimensions =
      ScreenDimensionsService.calculateScreenDimensions(mediaQueryData);
  var width = screenDimensions.key;
  var height = screenDimensions.value;
  debugPrint("width " + width.toString());
  debugPrint("height " + height.toString());
  expect(width, expectedWidth);
  expect(height, expectedHeight);
}
