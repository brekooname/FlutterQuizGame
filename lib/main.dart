import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Implementations/History/Screens/history_main_menu_screen.dart';
import 'Game/Constants/app_id.dart';
import 'Lib/Constants/language.dart';
import 'Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'Lib/Storage/rate_app_local_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const platform = MethodChannel('main.flutter');
  static late double screenWidth;
  static late double screenHeight;
  static late SharedPreferences localStorage;
  static late AppLocalizations appLocalizations;
  static late AppId appId;
  static late String appTitle;
  static late String languageCode;
  static late bool isPro;

  bool initCompleted = false;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  init(BuildContext context) async {
    String appTitle;
    String appKey;
    bool isPro;
    if (kIsWeb) {
      //
      var appId = AppIds.history;
      //
      appTitle = appId.gameConfig.getTitle(Language.en);
      appKey = appId.appKey;
      isPro = false;
    } else {
      appTitle = await MyApp.platform.invokeMethod('getAppTitle');
      appKey = await MyApp.platform.invokeMethod('getAppKey');
      isPro = await MyApp.platform.invokeMethod('isPro');
    }
    if (!widget.initCompleted) {
      if (!kIsWeb) {
        MobileAds.instance.initialize();
      }
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      setState(() {
        widget.initCompleted = true;
        MyApp.appId = AppIds(appKey: appKey).appId;
        MyApp.appTitle = appTitle;
        MyApp.isPro = isPro;
        MyApp.languageCode =
            WidgetsBinding.instance!.window.locale.languageCode;
        MyApp.localStorage = localStorage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetToShow;
    if (widget.initCompleted) {
      RateAppLocalStorage rateAppLocalStorage = RateAppLocalStorage();
      rateAppLocalStorage.incrementAppLaunchedCount();

      widgetToShow = HistoryMainMenuScreen();
    } else {
      init(context);
      widgetToShow = Container();
    }

    var materialApp = MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Builder(builder: (BuildContext context) {
          MyApp.screenWidth =
              ScreenDimensionsService.calculateScreenWidth(context, true);
          MyApp.screenHeight =
              ScreenDimensionsService.calculateScreenHeight(context, true);
          MyApp.appLocalizations = AppLocalizations.of(context)!;
          return widgetToShow;
        }));

    return materialApp;
  }
}
