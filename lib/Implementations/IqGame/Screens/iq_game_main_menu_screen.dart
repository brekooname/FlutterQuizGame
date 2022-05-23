import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../Lib/Text/my_text.dart';
import '../../../main.dart';
import '../Constants/iq_game_question_config.dart';
import '../Service/iq_game_local_storage.dart';

class IqGameMainMenuScreen extends StandardScreen<IqGameScreenManagerState> {
  late Image backgroundImage;
  IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();
  final IqGameCampaignLevelService _iqGameCampaignLevelService =
      IqGameCampaignLevelService();
  final IqGameQuestionConfig _iqGameQuestionConfig = IqGameQuestionConfig();

  IqGameMainMenuScreen(IqGameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<IqGameMainMenuScreen> createState() => IqGameMainMenuScreenState();
}

class IqGameMainMenuScreenState extends State<IqGameMainMenuScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    widget.backgroundImage = imageService.getSpecificImage(
        imageName: "main_backgr_img", imageExtension: "png");
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      backgroundImagePath: assetsService.getSpecificAssetPath(
          assetExtension: "png", assetName: "title_clouds_background"),
      backgroundImageWidth: screenDimensions.dimen(70),
      textShadow: Shadow(
        blurRadius: FontConfig.standardShadowRadius * 2,
        color: Colors.black.withOpacity(0.3),
      ),
      fontConfig: FontConfig(
          fontColor: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.getCustomFontSize(1.6),
          borderColor: Colors.red),
    );

    var mainColumn = Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.noRepeat,
          image: widget.backgroundImage.image,
        )),
        alignment: Alignment.center,
        height: screenDimensions.h(94),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenDimensions.dimen(1)),
            gameTitle,
            SizedBox(height: screenDimensions.dimen(1)),
            _createLevelBtns(),
          ],
        ));
    return Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: Align(
          alignment: const Alignment(-1.2, -1),
          child: FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContent: () {
                widget.iqGameLocalStorage.clearAll();
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget _createLevelBtns() {
    var config = IqGameQuestionConfig();
    return SizedBox(
        height: screenDimensions.h(71),
        child: ListView(
          children: config.categories.map((e) => _createLevelBtn(e)).toList(),
        ));
  }

  Widget _createLevelBtn(QuestionCategory cat) {
    var iconPadding = screenDimensions.dimen(1);
    var btnSize = Size(screenDimensions.dimen(80), screenDimensions.dimen(26));
    var iconContainerSize = Size(btnSize.width, btnSize.height / 1.7);
    var iconDimen = iconContainerSize.height / 1.1;
    var maxScoreForCat = widget.iqGameLocalStorage.getMaxScoreForCat(cat);
    var levelIcon = imageService.getSpecificImage(
        imageName: "btn_level_main_" + cat.index.toString(),
        imageExtension: "png",
        maxWidth: iconDimen,
        maxHeight: iconDimen,
        module: "buttons");
    var levelLabel = MyText(
        text: cat.categoryLabel!,
        width: btnSize.width - iconDimen * 1.3,
        maxLines: 2,
        fontConfig: FontConfig(
            borderColor: Colors.black,
            fontColor: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: FontConfig.getCustomFontSize(1.2)));
    var levelScore = MyText(
      fontConfig: FontConfig(
          borderColor: Colors.black,
          fontColor: maxScoreForCat == -1 ? Colors.white : Colors.greenAccent,
          fontWeight:
              maxScoreForCat == -1 ? FontWeight.normal : FontWeight.w800,
          fontSize: FontConfig.normalFontSize),
      text: _getScoreText(cat, maxScoreForCat),
    );
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.all(iconPadding),
            child: SizedBox(
                width: iconContainerSize.width,
                height: iconContainerSize.height,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      levelIcon,
                      const Spacer(),
                      levelLabel,
                      const Spacer(),
                    ]))),
        Container(
            decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(FontConfig.standardBorderRadius))),
            height: (btnSize.height - iconContainerSize.height) / 1.2 -
                iconPadding * 2,
            child: levelScore)
      ],
    );
    return MyButton(
      onClick: () {
        widget.gameScreenManagerState.showNewGameScreen(widget
            ._iqGameCampaignLevelService
            .campaignLevel(widget._iqGameQuestionConfig.diff0, cat));
      },
      size: btnSize,
      buttonAllPadding: screenDimensions.dimen(2),
      buttonSkinConfig: ButtonSkinConfig(
          buttonUnpressedShadowColor: Colors.transparent,
          buttonPressedShadowColor: Colors.blue.withOpacity(0.6),
          backgroundColor: Colors.blue.withOpacity(0.8)),
      customContent: content,
    );
  }

  String _getScoreText(QuestionCategory cat, int score) {
    IqGameQuestionConfig config = IqGameQuestionConfig();
    return (cat == config.cat0 ? "IQ " : "Score ") +
        (score == -1 ? "??" : score.toString());
  }
}
