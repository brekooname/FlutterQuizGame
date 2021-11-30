import 'package:shared_preferences/shared_preferences.dart';

import '../../Lib/Constants/contrast.dart';
import 'Constants/app_id.dart';

class MyAppContext {
  static final Contrast contrast = Contrast.LIGHT;

  String languageCode;
  SharedPreferences localStorage;
  String appTitle;
  AppId appId;
  bool isPro;

  MyAppContext(this.languageCode, this.localStorage, this.appTitle, this.appId,
      this.isPro);
}
