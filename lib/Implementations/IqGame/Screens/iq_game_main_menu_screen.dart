import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
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
      backgroundImageWidth: screenDimensions.dimen(60),
      textShadow: Shadow(
        blurRadius: FontConfig.standardShadowRadius * 2,
        color: Colors.black.withOpacity(0.3),
      ),
      fontConfig: FontConfig(
          fontColor: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.getCustomFontSize(1.2),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: config.categories.map((e) => _createLevelBtn(e)).toList(),
    );
  }

  Widget _createLevelBtn(QuestionCategory cat) {
    Color categColor = getBtnCategoryColor().get<QuestionCategory, Color>(cat)!;
    var iconPadding = screenDimensions.dimen(1);
    var btnSize = Size(screenDimensions.dimen(60), screenDimensions.dimen(20));
    var iconDimen = btnSize.height / 1.7;
    var maxScoreForCat = widget.iqGameLocalStorage.getMaxScoreForCat(cat);
    var levelIcon = Container(
        height: iconDimen,
        width: iconDimen,
        decoration: BoxDecoration(
            color: categColor,
            borderRadius: BorderRadius.all(
                Radius.circular(FontConfig.standardBorderRadius))),
        child: imageService.getSpecificImage(
            imageName: "btn_level_main_" + cat.index.toString(),
            imageExtension: "png",
            maxWidth: iconDimen,
            maxHeight: iconDimen,
            module: "buttons"));
    var catLabelText = cat.categoryLabel!;
    var levelLabel = MyText(
        text: catLabelText,
        width: btnSize.width - iconDimen * 1.5,
        maxLines: 2,
        textShadow: Shadow(
          blurRadius: FontConfig.standardShadowRadius * 2,
          color: Colors.black.withOpacity(0.3),
        ),
        fontConfig: FontConfig(
            borderColor: Colors.black,
            fontColor: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: FontConfig.getCustomFontSize(1.0)));
    var levelScore = MyText(
      fontConfig: FontConfig(
          borderColor: Colors.black,
          fontColor: maxScoreForCat == -1 ? Colors.white : Colors.greenAccent,
          fontWeight:
              maxScoreForCat == -1 ? FontWeight.normal : FontWeight.w800,
          fontSize: FontConfig.getCustomFontSize(0.8)),
      text: _getScoreText(cat, maxScoreForCat),
    );
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.all(iconPadding),
            child: SizedBox(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(
                    width: screenDimensions.dimen(2),
                  ),
                  levelIcon,
                  const Spacer(),
                  levelLabel,
                  const Spacer(),
                ]))),
        // Container(
        //     decoration: BoxDecoration(
        //         color: Colors.red.shade400,
        //         borderRadius: BorderRadius.vertical(
        //             bottom: Radius.circular(FontConfig.standardBorderRadius))),
        //     height: (btnSize.height - iconContainerSize.height) / 1.2 -
        //         iconPadding * 2,
        //     child: levelScore)
      ],
    );
    return MyButton(
      onClick: () {
        widget.gameScreenManagerState.showNewGameScreen(widget
            ._iqGameCampaignLevelService
            .campaignLevel(widget._iqGameQuestionConfig.diff0, cat));
      },
      size: btnSize,
      buttonAllPadding: screenDimensions.dimen(1.5),
      buttonSkinConfig: ButtonSkinConfig(
          buttonUnpressedShadowColor: Colors.transparent,
          buttonPressedShadowColor: categColor.withOpacity(0.6),
          backgroundColor: categColor.withOpacity(0.9)),
      customContent: content,
    );
  }

  Map<QuestionCategory, Color> getBtnCategoryColor() {
    IqGameQuestionConfig config = IqGameQuestionConfig();
    return {
      config.cat0: Colors.blue,
      config.cat1: Colors.green,
      config.cat2: Colors.orange,
      config.cat3: Colors.purple,
      config.cat4: Colors.red,
      config.cat5: Colors.teal,
    };
  }

  String _getScoreText(QuestionCategory cat, int score) {
    IqGameQuestionConfig config = IqGameQuestionConfig();
    return (cat == config.cat0 ? "IQ " : "Score ") +
        (score == -1 ? "??" : score.toString());
  }
}
