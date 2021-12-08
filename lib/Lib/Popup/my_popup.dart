import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin MyPopup {
  late Size defaultSize;
  LocalizationService? _localizationService;
  ImageService imageService = ImageService();
  ButtonSize buttonSize = ButtonSize();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  void initPopup(BuildContext buildContext) {
    defaultSize = Size(screenDimensions.w(70), screenDimensions.h(70));
    _localizationService = LocalizationService(buildContext: buildContext);
  }

  LocalizationService get localizationService {
    assert(_localizationService != null);
    return _localizationService!;
  }

  AppLocalizations get label {
    assert(_localizationService != null);
    return _localizationService!.getAppLocalizations();
  }

  String formatTextWithOneParam(String labelText, String param) {
    return localizationService.formatTextWithParams(labelText, [param]);
  }

  String formatTextWithTwoParams(
      String labelText, String param1, String param2) {
    return localizationService
        .formatTextWithParams(labelText, [param1, param2]);
  }
}
