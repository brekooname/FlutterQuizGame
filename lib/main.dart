import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Implementations/History/Screens/history_main_menu_screen.dart';
import 'Game/Constants/app_id.dart';
import 'Game/my_app_context.dart';
import 'Lib/Popup/rate_app_popup.dart';
import 'Lib/Storage/rate_app_local_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  late SharedPreferences localStorage;

  bool initCompleted = false;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  init() async {
    if (!widget.initCompleted) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      setState(() {
        widget.initCompleted = true;
        widget.localStorage = localStorage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetToShow;
    if (widget.initCompleted) {
      MyAppContext myAppContext =
          MyAppContext(widget.localStorage, AppIds().history);

      RateAppLocalStorage rateAppLocalStorage =
          RateAppLocalStorage(myAppContext: myAppContext);
      rateAppLocalStorage.incrementAppLaunchedCount();

      widgetToShow = HistoryMainMenuScreen(myAppContext);
    } else {
      init();
      widgetToShow = Container();
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: widgetToShow);
  }
}
