import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Components/dopewars_help_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/in_app_purchase_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class DopeWarsMainMenuScreen extends StandardScreen {
  final DopeWarsLocalStorage _dopeWarsLocalStorage = DopeWarsLocalStorage();

  DopeWarsMainMenuScreen(GameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<DopeWarsMainMenuScreen> createState() => DopeWarsMainMenuScreenState();
}

class DopeWarsMainMenuScreenState extends State<DopeWarsMainMenuScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    DopeWarsResourceType.resources;
    DopeWarsLocation.locations;
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var titleColor = ColorUtil.colorDarken(Colors.green.shade900);
    var gameTitle = GameTitle(
      backgroundImageWidth: screenDimensions.w(80),
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png", assetName: "title_background"),
      text: MyApp.appTitle,
      textWidth: screenDimensions.w(50),
      fontConfig: FontConfig(
        fontColor: titleColor,
        fontWeight: FontWeight.w700,
        fontSize: FontConfig.getCustomFontSize([
          Language.ja.name,
          Language.ms.name,
          Language.pl.name,
          Language.vi.name,
        ].contains(MyApp.languageCode)
            ? 1.3
            : 1.7),
      ),
    );

    var buttonSkinConfig =
        ButtonSkinConfig(backgroundColor: Colors.green.shade400);
    var btnW = screenDimensions.w(65);
    var fontSize = FontConfig.getCustomFontSize(1.2);
    var fontConfig = FontConfig(
      fontSize: fontSize,
      fontColor: titleColor,
    );
    var newGameBtn = MyButton(
      text: label.l_new_game,
      width: btnW,
      fontConfig: fontConfig,
      buttonSkinConfig: buttonSkinConfig,
      onClick: () {
        widget._dopeWarsLocalStorage.startNewGame();
        widget.gameScreenManagerState
            .showNewGameScreen(DopeWarsCampaignLevelService().level_0);
      },
    );
    DopeWarsGameContext? savedGame =
        widget._dopeWarsLocalStorage.getSavedGame();
    var continueBtn = MyButton(
      width: btnW,
      fontConfig: fontConfig,
      visible: savedGame != null,
      buttonSkinConfig: buttonSkinConfig,
      text: label.l_continue,
      onClick: () {
        if (savedGame != null) {
          widget.gameScreenManagerState.showNextGameScreen(
              DopeWarsCampaignLevelService().level_0, savedGame);
        }
      },
    );
    var switchDimen = screenDimensions.dimen(17);
    var unlimitedSwitch = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(text: label.l_unlimited_mode),
          SizedBox(
              height: switchDimen,
              width: switchDimen,
              child: FittedBox(
                  child: CupertinoSwitch(
                value: widget._dopeWarsLocalStorage.isUnlimitedMode(),
                onChanged: (value) {
                  setState(() {
                    if (MyApp.isExtraContentLocked) {
                      InAppPurchasesPopupService(buildContext: context)
                          .showPopup();
                    } else {
                      widget._dopeWarsLocalStorage.toggleUnlimitedMode();
                    }
                  });
                },
              )))
        ]);

    var vertMaring = screenDimensions.dimen(4.0);
    var marginBox = SizedBox(height: vertMaring);
    var mainColumn = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            gameTitle,
            buildHighScore(),
            marginBox,
            newGameBtn,
            marginBox,
            continueBtn,
            marginBox,
            unlimitedSwitch,
            const Spacer(),
          ],
        ));
    return Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: Row(children: [
          FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContent: () {
                widget._dopeWarsLocalStorage.clearAll();
              },
            ),
          ),
          FloatingButton(
            context: context,
            iconName: "btn_help",
            myPopupToDisplay: DopeWarsHelpPopup(label
                .l_buy_cheap_products_from_the_market_and_sell_them_more_expensive_wait_until_the_next_day_or_travel_),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget buildHighScore() {
    var highScoreValue = MyText(
        fontConfig: FontConfig(
            fontColor: Colors.deepOrange,
            borderColor: Colors.orange.shade100,
            fontSize: FontConfig.getCustomFontSize(1.6)),
        text: widget._dopeWarsLocalStorage.getMaxReputation().toString());
    var highScore = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyText(
            fontSize: FontConfig.getCustomFontSize(1.3),
            text: label.l_high_score),
        SizedBox(
          width: screenDimensions.dimen(2),
        ),
        widget._dopeWarsLocalStorage.isNewMaxReputation()
            ? AnimateZoomInZoomOutText(
                executeAnimationOnlyOnce: true,
                toAnimateText: highScoreValue,
              )
            : highScoreValue,
        imageService.getSpecificImage(
            maxWidth: screenDimensions.dimen(10),
            module: "general",
            imageName: "flame",
            imageExtension: "png")
      ],
    );
    widget._dopeWarsLocalStorage.setNewMaxReputation(false);
    return SizedBox(height: screenDimensions.dimen(12), child: highScore);
  }
}
