import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class LocalizationService {
  late BuildContext buildContext;

  static final LocalizationService singleton = LocalizationService.internal();

  factory LocalizationService() {
    return singleton;
  }

  LocalizationService.internal();

  List<Locale> getAllLocales() {
    return Language.values.map((e) => Locale(e.toString(), "")).toList();
  }

  String formatTextWithParams(String labelText, List<String> args) {
    for (int i = 0; i < args.length; ++i) {
      labelText = labelText.replaceAll("{$i}", args[i]);
    }
    return labelText;
  }
}
