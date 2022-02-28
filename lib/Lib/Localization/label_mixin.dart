import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

mixin LabelMixin {
  static AppLocalizations get staticLabel => MyApp.appLocalizations;

  AppLocalizations get label => staticLabel;

  String formatTextWithOneParam(String labelText, Object param) {
    return _formatTextWithParams(labelText, [param.toString()]);
  }

  String formatTextWithTwoParams(
      String labelText, String param1, String param2) {
    return _formatTextWithParams(labelText, [param1, param2]);
  }

  String _formatTextWithParams(String labelText, List<String> args) {
    for (int i = 0; i < args.length; ++i) {
      labelText = labelText.replaceAll("{$i}", args[i]);
    }
    return labelText;
  }
}
