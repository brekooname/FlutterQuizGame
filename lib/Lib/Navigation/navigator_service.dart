import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorService {
  late BuildContext context;
  static final NavigatorService singleton = NavigatorService.internal();

  factory NavigatorService(BuildContext context) {
    singleton.context = context;
    return singleton;
  }

  NavigatorService.internal();

  void goTo(StatefulWidget screen, VoidCallback setState) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen))
        .then((value) {
      // setState.call();
    });
  }

  void pop() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
