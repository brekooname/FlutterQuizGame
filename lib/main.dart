import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Game/Constants/app_id.dart';
import 'Lib/Ads/ad_service.dart';
import 'Lib/Constants/language.dart';
import 'Lib/Image/image_service.dart';
import 'Lib/Screen/game_screen_manager.dart';
import 'Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'Lib/Storage/in_app_purchases_local_storage.dart';
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

  // static const String _appKey = "geoquiz";
  static const Language _language = Language.en;

  ////////////
  //////
  //

  AdService adService = AdService();
  static const platform = MethodChannel('main.flutter');
  static late double screenWidth;
  static late double screenHeight;
  static late SharedPreferences localStorage;
  static late AppLocalizations appLocalizations;
  static late AppId appId;
  static late String appTitle;
  static late String languageCode;
  static late String appRatingPackage;
  static late String adBannerId;
  static late String adInterstitialId;
  static late String adRewardedId;
  static late GameScreenManager gameScreenManager;
  static bool isExtraContentLocked = true;

  BannerAd? bannerAd;
  bool initAsyncCompleted = false;
  late Image backgroundTexture;

  static void extraContentBought(BuildContext context) {
    context.findAncestorStateOfType<MyAppState>()!.extraContentBought();
  }

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    init().then((value) => {
          setState(() {
            widget.initAsyncCompleted = true;
          })
        });
  }

  Future<void> init() async {
    String appTitle;
    String appKey;
    String languageCode;
    bool isPro;
    String appRatingPackage;
    String adBannerId;
    String adInterstitialId;
    String adRewardedId;
    if (kIsWeb) {
      var appId = AppIds().getAppId(MyApp._appKey);
      appTitle = appId.gameConfig.getTitle(MyApp._language);
      appKey = appId.appKey;
      isPro = false;
      // isPro = true;
      languageCode = MyApp._language.name;
      appRatingPackage = "";
      adBannerId = "";
      adInterstitialId = "";
      adRewardedId = "";
    } else {
      appTitle = await MyApp.platform.invokeMethod('getAppTitle');
      appKey = await MyApp.platform.invokeMethod('getAppKey');
      isPro = await MyApp.platform.invokeMethod('isPro');
      appRatingPackage =
          await MyApp.platform.invokeMethod('getAppRatingPackage');
      adBannerId = await MyApp.platform.invokeMethod('getAdBannerId');
      adInterstitialId =
          await MyApp.platform.invokeMethod('getAdInterstitialId');
      adRewardedId = await MyApp.platform.invokeMethod('getAdRewardedId');
      languageCode = await MyApp.platform.invokeMethod('getLanguageCode');
    }
    var appId = AppIds().getAppId(appKey);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      MyApp.appId = appId;
      MyApp.appTitle = appTitle;
      MyApp.languageCode = languageCode;
      MyApp.localStorage = localStorage;
      MyApp.appRatingPackage = appRatingPackage;
      MyApp.adBannerId = adBannerId;
      MyApp.adInterstitialId = adInterstitialId;
      MyApp.adRewardedId = adRewardedId;
      MyApp.isExtraContentLocked = !isPro &&
          !InAppPurchaseLocalStorage()
              .isPurchased(appId.gameConfig.extraContentProductId);
      MyApp.gameScreenManager = appId.gameConfig.gameScreenManager;
      widget.backgroundTexture =
          ImageService().getSpecificImage(imageName: "background_texture");
      if (!kIsWeb && MyApp.isExtraContentLocked) {
        MobileAds.instance.initialize();
        widget.adService.initInterstitialAd();
        widget.bannerAd = widget.adService.initBannerAd();
      }
    });

    RateAppLocalStorage rateAppLocalStorage = RateAppLocalStorage();
    rateAppLocalStorage.incrementAppLaunchedCount();
  }

  void extraContentBought() {
    MyApp.isExtraContentLocked = false;
    MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
        .showMainScreen();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetToShow = _getWidgetToShow();
    var materialApp = _buildMaterialApp(context, widgetToShow);

    return materialApp;
  }

  Widget _getWidgetToShow() {
    Widget widgetToShow;
    if (widget.initAsyncCompleted) {
      //
      ////
      widgetToShow = createScreen(MyApp.gameScreenManager, widget.bannerAd);
      // Future.delayed(Duration(milliseconds: 100), () {
      //   var campaignLevel = HistoryCampaignLevelService().level_0;
      //   MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
      //       .showNewGameScreen(campaignLevel);
      //   widgetToShow = createScreen(MyApp.gameScreenManager, widget.bannerAd);
      // });
      ////
      //
    } else {
      widgetToShow = Container();
    }
    return widgetToShow;
  }

  MaterialApp _buildMaterialApp(BuildContext context, Widget widgetToShow) {
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: _getSupportedLocales(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
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
  }

  List<Locale> _getSupportedLocales() {
    return kIsWeb
        ? [
            Locale(AppLocalizations.supportedLocales
                    .contains(Locale(MyApp._language.name))
                ? MyApp._language.name
                : Language.en.name)
          ]
        : AppLocalizations.supportedLocales;
  }

  Widget createScreen(GameScreenManager gameScreenManager, BannerAd? bannerAd) {
    Container bannerAdContainer = createBannerAdContainer(bannerAd);
    return WillPopScope(
      onWillPop: () async {
        var currentScreen = gameScreenManager.currentScreen;
        return currentScreen!.gameScreenManagerState.goBack(currentScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: widget.backgroundTexture.image,
        )),
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                bannerAdContainer,
                Expanded(
                    child: widget.initAsyncCompleted
                        ? gameScreenManager
                        : Container())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container createBannerAdContainer(BannerAd? bannerAd) {
    Container bannerAdContainer;
    if (kIsWeb && MyApp.isExtraContentLocked) {
      bannerAdContainer = Container(
        color: Colors.red,
        width: AdSize.banner.width.toDouble(),
        height: AdSize.banner.height.toDouble(),
        alignment: Alignment.center,
      );
    } else if (bannerAd != null && MyApp.isExtraContentLocked) {
      bannerAdContainer = Container(
        child: AdWidget(ad: bannerAd),
        width: AdSize.banner.width.toDouble(),
        height: AdSize.banner.height.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      bannerAdContainer = Container();
    }
    return bannerAdContainer;
  }
}
