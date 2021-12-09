import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

abstract class MyLocalStorage {
  late SharedPreferences localStorage;

  MyLocalStorage() {
    localStorage = MyApp.localStorage;
  }

  String get localStorageName => this.runtimeType.toString();
}
