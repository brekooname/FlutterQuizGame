import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Game/Constants/app_id.dart';
import 'Lib/Constants/language.dart';
import 'Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'Lib/Storage/rate_app_local_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      InAppPurchaseAndroidPlatform.registerPlatform();
    } else if (Platform.isIOS) {}
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //
  //////
  ////////////
  static const String _appKey = "history";
  static const Language _language = Language.en;

  ////////////
  //////
  //

  static const double bannerAdHeightPx = 55;
  static const platform = MethodChannel('main.flutter');
  static late double screenWidth;
  static late double screenHeight;
  static late SharedPreferences localStorage;
  static late AppLocalizations appLocalizations;
  static late AppId appId;
  static late String appTitle;
  static late String languageCode;
  static late String extraContentProductId;
  static late bool isPro;
  static late bool isExtraContentLocked = true;

  bool _initCompleted = false;

  static void extraContentBought(BuildContext context) {
    context.findAncestorStateOfType<MyAppState>()!.extraContentBought();
  }

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  void extraContentBought() {
    MyApp.isExtraContentLocked = false;
    setState(() {});
  }

  init(BuildContext context) async {
    String appTitle;
    String appKey;
    String languageCode;
    bool isPro;
    if (kIsWeb) {
      var appId = AppIds().getAppId(MyApp._appKey);
      appTitle = appId.gameConfig.getTitle(MyApp._language);
      appKey = appId.appKey;
      isPro = false;
      languageCode = MyApp._language.name;
    } else {
      appTitle = await MyApp.platform.invokeMethod('getAppTitle');
      appKey = await MyApp.platform.invokeMethod('getAppKey');
      isPro = await MyApp.platform.invokeMethod('isPro');
      languageCode = WidgetsBinding.instance!.window.locale.languageCode;
    }
    if (!widget._initCompleted) {
      GoogleFonts.config.allowRuntimeFetching = false;
      if (!kIsWeb) {
        MobileAds.instance.initialize();
      }
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      setState(() {
        widget._initCompleted = true;
        var appId = AppIds().getAppId(appKey);
        MyApp.appId = appId;
        MyApp.appTitle = appTitle;
        MyApp.isPro = isPro;
        MyApp.languageCode = languageCode;
        MyApp.localStorage = localStorage;
        MyApp.extraContentProductId = appId.gameConfig.extraContentProductId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetToShow;
    if (widget._initCompleted) {
      RateAppLocalStorage rateAppLocalStorage = RateAppLocalStorage();
      rateAppLocalStorage.incrementAppLaunchedCount();

      var historyGameScreenManager =
          HistoryGameScreenManager(buildContext: context);
      //
      ////
      widgetToShow = historyGameScreenManager.getMainScreen();
      // var campaignLevel = HistoryCampaignLevel().level_0;
      // widgetToShow = historyGameScreenManager.getScreen(campaignLevel,
      //     historyGameScreenManager.createGameContext(campaignLevel));
      ////
      //
    } else {
      init(context);
      widgetToShow = Container();
    }

    var materialApp = MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: kIsWeb
            ? [Locale(MyApp._language.name)]
            : AppLocalizations.supportedLocales,
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
