import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationService {
  late BuildContext buildContext;

  static final LocalizationService singleton = LocalizationService.internal();

  factory LocalizationService({required BuildContext buildContext}) {
    singleton.buildContext = buildContext;
    return singleton;
  }

  LocalizationService.internal();

  AppLocalizations getAppLocalizations() {
    return AppLocalizations.of(buildContext)!;
  }

  List<Locale> getAllLocales() {
    return Language.values.map((e) => Locale(e.toString(), "")).toList();
  }

  String getLabelTextWithParams(String labelText, List<String> args) {
    for (int i = 0; i < args.length; ++i) {
      labelText = labelText.replaceAll("{$i}", args[i]);
    }
    return labelText;
  }
}
