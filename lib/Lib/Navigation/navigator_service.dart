import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../main.dart';

class NavigatorService {
  static final NavigatorService singleton = NavigatorService.internal();

  factory NavigatorService() {
    return singleton;
  }

  NavigatorService.internal();

  void popAll() {
    BuildContext buildContext = MyApp.globalContext();
    while (Navigator.canPop(buildContext)) {
      Navigator.pop(buildContext);
    }
  }

  void pop() {
    BuildContext buildContext = MyApp.globalContext();
    if (Navigator.canPop(buildContext)) {
      Navigator.pop(buildContext);
    }
  }
}
