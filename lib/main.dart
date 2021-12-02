import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../Implementations/History/Screens/history_main_menu_screen.dart';
import 'Game/Constants/app_id.dart';
import 'Game/my_app_context.dart';
import 'Lib/Storage/rate_app_local_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  late AppId appId;
  late SharedPreferences localStorage;
  late String appTitle;
  late String languageCode;
  late bool isPro;

  bool initCompleted = false;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static const platform = MethodChannel('main.flutter');

  init(BuildContext context) async {
    String appTitle;
    String appKey;
    bool isPro;
    if (kIsWeb) {
      appTitle = "History Game";
      appKey = AppIds.history.appKey;
      isPro = false;
    } else {
      appTitle = await platform.invokeMethod('getAppTitle');
      appKey = await platform.invokeMethod('getAppKey');
      isPro = await platform.invokeMethod('isPro');
    }
    if (!widget.initCompleted) {
      if (!kIsWeb) {
        MobileAds.instance.initialize();
      }
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      setState(() {
        widget.initCompleted = true;
        widget.appId = AppIds(appKey: appKey).appId;
        widget.localStorage = localStorage;
        widget.appTitle = appTitle;
        widget.isPro = isPro;
        widget.languageCode =
            WidgetsBinding.instance!.window.locale.languageCode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetToShow;
    if (widget.initCompleted) {
      MyAppContext myAppContext = MyAppContext(widget.languageCode,
          widget.localStorage, widget.appTitle, widget.appId, widget.isPro);

      RateAppLocalStorage rateAppLocalStorage =
          RateAppLocalStorage(myAppContext: myAppContext);
      rateAppLocalStorage.incrementAppLaunchedCount();

      widgetToShow = HistoryMainMenuScreen(myAppContext);
    } else {
      init(context);
      widgetToShow = Container();
    }

    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: widgetToShow);
  }
}
