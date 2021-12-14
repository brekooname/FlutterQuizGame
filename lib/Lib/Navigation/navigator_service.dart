import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorService {
  static final NavigatorService singleton = NavigatorService.internal();

  factory NavigatorService() {
    return singleton;
  }

  NavigatorService.internal();

  void goTo(BuildContext context, StatefulWidget screen,
      VoidCallback setStateForRefresh) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen))
        .then((value) {
      setStateForRefresh.call();
    });
  }

  void pop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
