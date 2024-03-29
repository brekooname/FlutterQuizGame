import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_score_progress_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
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
  late final Image backgroundImage;
  final IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();
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
          opacity: 180,
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
            Container(
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                        FontConfig.standardBorderRadius / 2)),
                child: gameTitle),
            SizedBox(height: screenDimensions.dimen(1)),
            _createLevelBtns(),
          ],
        ));
    return Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: Align(
          alignment: Alignment(FontConfig.isRtlLanguage ? -0.9 : -1.1, -1),
          child: FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContentOnClick: () {
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
    var maxScoreForCat = widget.iqGameLocalStorage.getScoreForCat(cat.name);
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
        maxLines: catLabelText.contains(" ") ? 2 : 1,
        textShadow: Shadow(
          blurRadius: FontConfig.standardShadowRadius * 2,
          color: Colors.black.withOpacity(0.3),
        ),
        fontConfig: FontConfig(
            borderColor: Colors.black,
            fontColor: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: FontConfig.getCustomFontSize(1.0)));
    var scoreBtnSizeDimen = screenDimensions.dimen(15);
    var levelScore = Stack(alignment: Alignment.center, children: [
      Container(
        height: iconDimen,
        width: iconDimen,
        decoration: BoxDecoration(
            color: categColor,
            borderRadius: BorderRadius.all(
                Radius.circular(FontConfig.standardBorderRadius))),
        child: MyText(
            textShadow: Shadow(
              blurRadius: FontConfig.standardShadowRadius * 2,
              color: Colors.black.withOpacity(0.3),
            ),
            fontConfig: FontConfig(
                borderColor: Colors.black,
                fontColor:
                    maxScoreForCat.isEmpty ? Colors.white : Colors.greenAccent,
                fontWeight: maxScoreForCat.isEmpty
                    ? FontWeight.normal
                    : FontWeight.w800,
                fontSize: FontConfig.getCustomFontSize(1.1)),
            text: _getScoreText(
                cat,
                maxScoreForCat.isEmpty
                    ? -1
                    : maxScoreForCat
                        .reduce((a1, a2) => a1.score > a2.score ? a1 : a2)
                        .score)),
      ),
    ]);
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
      ],
    );
    var iqQConfig = IqGameQuestionConfig();
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyButton(
            onClick: () {
              widget.gameScreenManagerState.showNewGameScreen(widget
                  ._iqGameCampaignLevelService
                  .campaignLevel(widget._iqGameQuestionConfig.diff0, cat));
            },
            contentLockedConfig: ContentLockedConfig(
                isContentLocked:
                    cat == iqQConfig.cat5 && MyApp.isExtraContentLocked,
                lockedIcon: imageService.getMainImage(
                    imageName: "btn_locked",
                    imageExtension: "png",
                    module: "buttons")),
            size: btnSize,
            buttonAllPadding: screenDimensions.dimen(1.5),
            buttonSkinConfig: ButtonSkinConfig(
                buttonUnpressedShadowColor: Colors.transparent,
                buttonPressedShadowColor: categColor.withOpacity(0.6),
                backgroundColor: categColor.withOpacity(0.9)),
            customContent: content,
          ),
          MyButton(
            onClick: () {
              MyPopup.showPopup(IqGameScoreProgressPopup(cat));
            },
            size: Size(scoreBtnSizeDimen, scoreBtnSizeDimen),
            buttonAllPadding: screenDimensions.dimen(1.5),
            buttonSkinConfig: ButtonSkinConfig(
                buttonUnpressedShadowColor: Colors.transparent,
                backgroundColor: categColor.withOpacity(0.9)),
            customContent: levelScore,
          )
        ]);
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
    return (cat == config.cat0 ? "" : "") +
        (score == -1 ? "-" : score.toString());
  }
}
