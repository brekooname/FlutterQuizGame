import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorService {
  void goTo(
      BuildContext context, StatefulWidget screen, VoidCallback setState) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen))
        .then((value) {
      // setState.call();
    });
  }
}
