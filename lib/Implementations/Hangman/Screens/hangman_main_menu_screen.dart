import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
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
import '../../../Lib/ScreenDimensions/screen_dimensions_service.dart';
import '../../../main.dart';

class HangmanMainMenuScreen extends StandardScreen<HangmanScreenManagerState> {
  final HangmanLocalStorage _hangmanLocalStorage = HangmanLocalStorage();
  final HangmanGameQuestionConfig _gameQuestionConfig =
      HangmanGameQuestionConfig();
  final HangmanCampaignLevelService _campaignLevelService =
      HangmanCampaignLevelService();

  HangmanMainMenuScreen(HangmanScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<HangmanMainMenuScreen> createState() => HangmanMainMenuScreenState();
}

class HangmanMainMenuScreenState extends State<HangmanMainMenuScreen>
    with ScreenState, LabelMixin {
  final ScrollController _scrollController = ScrollController();

  late final Map<int, ImageProvider> _diffCampaignLevelBackground = {};
  late final Map<int, Image> _diffBtnBackground = {};
  late final Map<CategoryDifficulty, Image> _catDiffImgs = {};

  @override
  void initState() {
    super.initState();
    initScreenState();

    var difficulties = widget._gameQuestionConfig.difficulties;
    var categories = widget._gameQuestionConfig.categories;
    for (int i = 0; i < difficulties.length; i++) {
      _diffCampaignLevelBackground.putIfAbsent(
          i,
          () => imageService
              .getSpecificImage(
                  imageName: "level_" + i.toString() + "_background",
                  imageExtension: "png",
                  module: "campaign/background",
                  maxHeight: screenDimensions.dimen(50))
              .image);
      _diffBtnBackground.putIfAbsent(
          i,
          () => imageService.getSpecificImage(
              imageName: "btn_" + i.toString() + "_up",
              imageExtension: "png",
              module: "campaign/buttons",
              maxHeight: screenDimensions.dimen(25)));
      for (int j = 0; j < categories.length; j++) {
        var difficulty = difficulties.elementAt(i);
        var category = categories.elementAt(j);
        _catDiffImgs.putIfAbsent(CategoryDifficulty(category, difficulty), () {
          var levelImgName = "level_" +
              difficulty.index.toString() +
              "_" +
              category.index.toString();
          return imageService.getSpecificImage(
              imageName: levelImgName,
              imageExtension: "png",
              module: "campaign/l_" + difficulty.index.toString(),
              maxWidth: screenDimensions.dimen(20));
        });
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _diffCampaignLevelBackground.forEach((key, value) {
      precacheImage(value, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      backgroundImageWidth: screenDimensions.dimen(70),
      fontConfig: FontConfig(
          fontColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.bigFontSize,
          borderColor: Colors.green),
    );

    var mainColumn = SizedBox(
        width: double.infinity,
        child: Container(
            alignment: Alignment.center,
            width: _getListViewAllWidth(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: screenDimensions.dimen(11)),
                  gameTitle,
                  SizedBox(height: screenDimensions.dimen(14)),
                  Expanded(
                    child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: _createConnectingLinesListView()),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: _createButtonsListView())
                          ],
                        )),
                  )
                ])));

    return Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: Row(children: [
          FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContentOnClick: () {
                widget._hangmanLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  List<Widget> _createConnectingLinesListView() {
    var containerSize =
        Size(screenDimensions.dimen(50), screenDimensions.dimen(39));
    var lateralMarginWidth =
        _getListViewItemLateralMargin(screenDimensions.dimen(50));
    List<Widget> res = [];
    var allLevels = widget._campaignLevelService.allLevels;
    for (int index = 0; index < allLevels.length; index++) {
      var elementAt = allLevels.elementAt(index);
      var customPaint = CustomPaint(
        size: containerSize,
        painter: LinesPainter(
          containerSize,
          Size(lateralMarginWidth, containerSize.height),
          _getListViewItemPosition(index),
          index,
        ),
      );
      res.add(_createListViewItemContainer(
          containerSize,
          customPaint,
          BoxDecoration(
              image: DecorationImage(
            repeat: ImageRepeat.repeatX,
            image: _diffCampaignLevelBackground.get(elementAt.difficulty.index),
          ))));
    }

    return res;
  }

  List<Widget> _createButtonsListView() {
    var btnSize = Size(screenDimensions.dimen(50), screenDimensions.dimen(39));
    var lateralMarginWidth = _getListViewItemLateralMargin(btnSize.width);
    SizedBox lateralMargin = SizedBox(
      width: lateralMarginWidth,
      height: btnSize.height,
    );
    var allLevels = widget._campaignLevelService.allLevels;
    List<Widget> res = [];
    for (int index = 0; index < allLevels.length; index++) {
      var elementAt = allLevels.elementAt(index);
      var category = elementAt.categories.first;
      var difficulty = elementAt.difficulty;
      var btnText = category.categoryLabel ?? "";
      var levelBtn = MyButton(
        fontConfig: FontConfig(
            fontColor: Colors.black,
            fontSize: FontConfig.getCustomFontSize(
                btnText.length > 23 && btnText.contains(" ") ? 0.9 : 1)),
        textMaxLines:
            btnText.length > 11 && btnText.length < 18 && !btnText.contains(" ")
                ? 1
                : 2,
        size: btnSize,
        text: btnText,
        onClick: () {
          MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
              .showNewGameScreen(elementAt);
        },
        buttonSkinConfig: ButtonSkinConfig(
            buttonPressedShadowColor: Colors.transparent,
            buttonUnpressedShadowColor: Colors.transparent,
            image: Stack(alignment: Alignment.center, children: [
              _diffBtnBackground.get(difficulty.index),
              _catDiffImgs.get(CategoryDifficulty(category, difficulty))
            ])),
      );
      int itemPosition = _getListViewItemPosition(index);

      List<Widget> rowChildren = [];
      if (itemPosition == 0) {
        rowChildren = [lateralMargin, levelBtn, lateralMargin];
      } else if (itemPosition == -1) {
        rowChildren = [levelBtn, lateralMargin, lateralMargin];
      } else if (itemPosition == 1) {
        rowChildren = [lateralMargin, lateralMargin, levelBtn];
      }

      res.add(_createListViewItemContainer(
        btnSize,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowChildren,
        ),
        null,
      ));
    }

    return res;
  }

  Widget _createListViewItemContainer(
      Size btnSize, Widget item, BoxDecoration? boxDecoration) {
    return Container(
        decoration: boxDecoration,
        width: _getListViewAllWidth(),
        height: btnSize.height,
        child: item);
  }

  double _getListViewItemLateralMargin(double btnWidth) =>
      (_getListViewAllWidth() - btnWidth) / 2;

  double _getListViewAllWidth() => screenDimensions.dimen(95);

  int _getListViewItemPosition(int index) {
    return index % 2 == 0
        ? 0
        : (index - 1) % 4 == 0
            ? -1
            : 1;
  }
}

class LinesPainter extends CustomPainter {
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();

  Size btnSize;
  Size lateralMargin;
  int itemPosition;
  int index;

  LinesPainter(this.btnSize, this.lateralMargin, this.itemPosition, this.index);

  @override
  void paint(Canvas canvas, Size size) {
    //Larger value shows the liner higher
    double variableAngle = -1.3;

    var centerToLeftDisplay = itemPosition == 1 || (index + 2) % 4 == 0;

    var xwLength = btnSize.width / 2 +
        (centerToLeftDisplay
            ? -lateralMargin.width / 0.7
            : lateralMargin.width);

    double xPadding = itemPosition == 0
        ? lateralMargin.width
        : itemPosition == 1
            ? lateralMargin.width * 2
            : 0;

    double x1 = xPadding + btnSize.width / 2;
    double x2 = xPadding + ((centerToLeftDisplay ? -1 : 1) * xwLength);
    double y2 = -btnSize.width /
        (2 - (centerToLeftDisplay ? variableAngle : variableAngle * 0.50));
    if (index != 0) {
      canvas.drawLine(
          Offset(x1, btnSize.height / 2),
          Offset(x2, y2),
          Paint()
            ..strokeWidth = _screenDimensionsService.dimen(10)
            ..color = Colors.redAccent);
    }
  }

  @override
  bool shouldRepaint(LinesPainter oldDelegate) {
    return false;
  }
}
