
import 'package:shared_preferences/shared_preferences.dart';

import '../../Lib/Constants/contrast.dart';
import 'Constants/app_id.dart';

class MyAppContext {
  static final Contrast contrast = Contrast.LIGHT;

  SharedPreferences localStorage;
  AppId appId;

  MyAppContext(this.localStorage, this.appId);


}
