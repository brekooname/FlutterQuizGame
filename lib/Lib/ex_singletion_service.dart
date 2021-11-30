import 'dart:ui';

import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class xxxService {
  late MyAppContext myAppContext;

  static final xxxService singleton = xxxService.internal();

  factory xxxService({required MyAppContext myAppContext}) {
    singleton.myAppContext = myAppContext;
    return singleton;
  }

  xxxService.internal();
}
