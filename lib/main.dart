import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Game/Constants/app_id.dart';
import 'Game/Game/campaign_level.dart';
import 'Lib/Ads/ad_service.dart';
import 'Lib/Constants/language.dart';
import 'Lib/Image/image_service.dart';
import 'Lib/Screen/Game/game_screen_manager.dart';
import 'Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'Lib/Storage/in_app_purchases_local_storage.dart';
import 'Lib/Storage/rate_app_local_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (MyApp.kIsMobile) {
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
  static bool kIsAutomatedTest = false;

  //TODO ---VALUE CHANGED--- should be false
  static bool kIsManualTest = true;

  // static String webAppKey = "history";
  // static String webAppKey = "geoquiz";
  // static String webAppKey = "perstest";
  // static String webAppKey = "dopewars";
  static String webAppKey = "anatomy";
  static CampaignLevel campaignLevel = AnatomyCampaignLevelService().level_0;

  //
  static Language webLanguage = Language.en;
  static bool webIsPro = true;

  // static bool webIsPro = true;

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

  MyApp({Key? key}) : super(key: key);

  static void extraContentBought(BuildContext context) {
    context.findAncestorStateOfType<MyAppState>()!.extraContentBought();
  }

  static bool get kIsMobile => !kIsWeb && !MyApp.kIsAutomatedTest;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _init().then((value) => {
          setState(() {
            widget.initAsyncCompleted = true;
          })
        });
  }

  Future<void> _init() async {
    AppConfig appConfig =
        MyApp.kIsMobile ? await _createMobileAppConfig() : createWebAppConfig();

    await initAppConfig(appConfig);

    widget.backgroundTexture = ImageService().getSpecificImage(
        imageName: "background_texture", imageExtension: "png");
    if (MyApp.kIsMobile && MyApp.isExtraContentLocked) {
      MobileAds.instance.initialize();
      widget.adService.initInterstitialAd();
      widget.bannerAd = widget.adService.initBannerAd();
    }

    setState(() {});

    RateAppLocalStorage rateAppLocalStorage = RateAppLocalStorage();
    rateAppLocalStorage.incrementAppLaunchedCount();
  }

  Future<AppConfig> _createMobileAppConfig() async {
    return AppConfig(
      appTitle: await MyApp.platform.invokeMethod('getAppTitle'),
      appKey: await MyApp.platform.invokeMethod('getAppKey'),
      languageCode: await MyApp.platform.invokeMethod('getLanguageCode'),
      appRatingPackage:
          await MyApp.platform.invokeMethod('getAppRatingPackage'),
      adBannerId: await MyApp.platform.invokeMethod('getAdBannerId'),
      adInterstitialId:
          await MyApp.platform.invokeMethod('getAdInterstitialId'),
      adRewardedId: await MyApp.platform.invokeMethod('getAdRewardedId'),
      isPro: await MyApp.platform.invokeMethod('isPro'),
    );
  }

  static AppConfig createWebAppConfig() {
    var appId = AppIds().getAppId(MyApp.webAppKey);
    return AppConfig(
      appTitle: appId.gameConfig.getTitle(MyApp.webLanguage),
      appKey: appId.appKey,
      languageCode: MyApp.webLanguage.name,
      appRatingPackage: "",
      adBannerId: "",
      adInterstitialId: "",
      adRewardedId: "",
      isPro: MyApp.webIsPro,
    );
  }

  static Future<void> initAppConfig(AppConfig appConfig) async {
    var appId = AppIds().getAppId(appConfig.appKey);
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    MyApp.appId = appId;
    MyApp.appTitle = appConfig.appTitle;
    MyApp.languageCode = appConfig.languageCode;
    MyApp.localStorage = localStorage;
    MyApp.appRatingPackage = appConfig.appRatingPackage;
    MyApp.adBannerId = appConfig.adBannerId;
    MyApp.adInterstitialId = appConfig.adInterstitialId;
    MyApp.adRewardedId = appConfig.adRewardedId;
    MyApp.isExtraContentLocked = !appConfig.isPro &&
        !InAppPurchaseLocalStorage()
            .isPurchased(appId.gameConfig.extraContentProductId);
    MyApp.gameScreenManager = appId.gameConfig.gameScreenManager;
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
    var materialApp =
        buildMaterialApp(context, widgetToShow, widget.initAsyncCompleted);

    return materialApp;
  }

  Widget _getWidgetToShow() {
    Widget widgetToShow;
    if (widget.initAsyncCompleted) {
      //
      ////
      //
      ////
      //
      ////
      // GeoQuizLocalStorage().setExperience(14000);
      widgetToShow = createScreen(MyApp.gameScreenManager, widget.bannerAd);
      // Future.delayed(const Duration(milliseconds: 100), () {
      //   MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
      //       .showNewGameScreen(MyApp.campaignLevel);
      // });
      ////
      //
      ////
      //
      ////
    } else {
      widgetToShow = Container();
    }
    return widgetToShow;
  }

  static MaterialApp buildMaterialApp(
      BuildContext context, Widget widgetToShow, bool initAsyncCompleted) {
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
        home: builder(widgetToShow, initAsyncCompleted));
  }

  static Builder builder(Widget widgetToShow, bool initAsyncCompleted) {
    return Builder(builder: (BuildContext context) {
      if (initAsyncCompleted) {
        var mediaQueryData = MediaQuery.of(context);
        var screenDimensions =
            ScreenDimensionsService.calculateScreenDimensions(mediaQueryData);
        MyApp.screenWidth = screenDimensions.key;
        MyApp.screenHeight = screenDimensions.value;
        MyApp.appLocalizations = AppLocalizations.of(context)!;
      }
      return widgetToShow;
    });
  }

  static List<Locale> _getSupportedLocales() {
    return MyApp.kIsMobile
        ? AppLocalizations.supportedLocales
        : [
            Locale(AppLocalizations.supportedLocales
                    .contains(Locale(MyApp.webLanguage.name))
                ? MyApp.webLanguage.name
                : Language.en.name)
          ];
  }

  Widget createScreen(GameScreenManager gameScreenManager, BannerAd? bannerAd) {
    Container bannerAdContainer = createBannerAdContainer(bannerAd);
    return WillPopScope(
        onWillPop: () async {
          var currentScreen = gameScreenManager.currentScreen;
          return currentScreen!.gameScreenManagerState.goBack(currentScreen);
        },
        child: Container(
          color: MyApp.appId.gameConfig.screenBackgroundColor,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              repeat: MyApp.appId.gameConfig.backgroundTextureRepeat,
              image: widget.backgroundTexture.image,
            )),
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio:
                  ScreenDimensionsService.isPortrait() ? 9 / 16 : 16 / 9,
              child: Container(
                ////
                //
                ////
                //
                ////
                // color: Colors.blue,
                ////
                //
                ////
                //
                ////
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
        ));
  }

  Container createBannerAdContainer(BannerAd? bannerAd) {
    Container bannerAdContainer;
    if (!MyApp.kIsMobile && MyApp.isExtraContentLocked) {
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

class AppConfig {
  String appTitle;
  String appKey;
  String languageCode;
  String appRatingPackage;
  String adBannerId;
  String adInterstitialId;
  String adRewardedId;
  bool isPro;

  AppConfig(
      {required this.appTitle,
      required this.appKey,
      required this.languageCode,
      required this.appRatingPackage,
      required this.adBannerId,
      required this.adInterstitialId,
      required this.adRewardedId,
      required this.isPro});
}
