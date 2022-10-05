import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Color/color_util.dart';
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

  late final Map<int, ImageProvider> _campaignLevelTexture = {};
  late final Map<int, Image> _levelBtnBackground = {};
  late final Map<int, Color> _campaignLevelColor = {};
  late final Map<CategoryDifficulty, Image> _levelIconImgs = {};
  late final Image _bomb;
  late final Image _flame;
  late final Image _explosion;
  late final Image _wallBackgr;
  late final Image _starScore;

  @override
  void initState() {
    super.initState();
    initScreenState();

    _wallBackgr = _getLevelBtnBackground("btn_campaign_wall_up");
    _explosion = _getCampaignRes("explosion", "campaign", _getLevelIconWidth());
    _bomb = _getCampaignRes("bomb", "campaign", _getLevelIconWidth() / 1.5);
    _flame = _getCampaignRes("flames", "campaign", _getFlameWidth());
    _starScore =
        _getCampaignRes("star_score", "campaign", _getLevelIconWidth() / 3);

    _campaignLevelColor.putIfAbsent(0, () => Colors.green.shade400);
    _campaignLevelColor.putIfAbsent(1, () => Colors.grey);
    _campaignLevelColor.putIfAbsent(2, () => Colors.orange);
    _campaignLevelColor.putIfAbsent(3, () => Colors.yellow);
    _campaignLevelColor.putIfAbsent(4, () => Colors.blue);
    _campaignLevelColor.putIfAbsent(5, () => Colors.red);

    var difficulties = widget._gameQuestionConfig.difficulties;
    var categoriesWithoutMixed = widget._gameQuestionConfig.categories;
    categoriesWithoutMixed.removeWhere(
        (category) => widget._gameQuestionConfig.isMixedCategory(category));
    for (int i = 0; i < difficulties.length; i++) {
      _campaignLevelTexture.putIfAbsent(
          i,
          () => imageService
              .getSpecificImage(
                  imageName: "level_" + i.toString() + "_background",
                  imageExtension: "png",
                  module: "campaign/background",
                  maxHeight: screenDimensions.dimen(50))
              .image);
      _levelBtnBackground.putIfAbsent(i, () {
        return _getLevelBtnBackground("btn_" + i.toString() + "_up");
      });
      for (int j = 0; j < categoriesWithoutMixed.length; j++) {
        var difficulty = difficulties.elementAt(i);
        var category = categoriesWithoutMixed.elementAt(j);
        _levelIconImgs.putIfAbsent(CategoryDifficulty(category, difficulty),
            () {
          var levelImgName = "level_" +
              difficulty.index.toString() +
              "_" +
              category.index.toString();
          return _getCampaignRes(
              levelImgName,
              "campaign/l_" + difficulty.index.toString(),
              _getLevelIconWidth());
        });
      }
    }
  }

  double _getFlameWidth() => _getLevelIconWidth() / 1.75;

  double _getLevelIconWidth() => screenDimensions.dimen(20);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_bomb.image, context);
    precacheImage(_flame.image, context);
    precacheImage(_wallBackgr.image, context);
    precacheImage(_explosion.image, context);
    _campaignLevelTexture.forEach((key, value) {
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
            _campaignLevelColor.get(elementAt.difficulty.index)),
      );
      var cornerRadius =
          Radius.circular(screenDimensions.dimen(index == 0 ? 15 : 0));
      res.add(_createListViewItemContainer(
          containerSize,
          customPaint,
          BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: cornerRadius, topRight: cornerRadius),
              image: DecorationImage(
                repeat: ImageRepeat.repeatX,
                image: _campaignLevelTexture.get(elementAt.difficulty.index),
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
      var campaignLevel = allLevels.elementAt(index);
      var category = campaignLevel.categories.first;
      var difficulty = campaignLevel.difficulty;

      var levelBtn =
          _createLevelButton(btnSize, campaignLevel, difficulty, category);
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

  Widget _createLevelButton(Size btnSize, CampaignLevel campaignLevel,
      QuestionDifficulty difficulty, QuestionCategory category) {
    var isMixedCategory = widget._gameQuestionConfig.isMixedCategory(category);
    var btnText = isMixedCategory ? "" : category.categoryLabel ?? "";
    var buttonSkinConfig = ButtonSkinConfig(
        buttonPressedShadowColor: Colors.transparent,
        buttonUnpressedShadowColor: Colors.transparent,
        image: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              isMixedCategory
                  ? ColorUtil.imageToGreyScale(_wallBackgr)
                  : _levelBtnBackground.get(difficulty.index),
              _createLevelIcon(category, difficulty),
              // _createStarScore()
            ]));
    var fontConfig = FontConfig(
        fontColor: Colors.black,
        fontSize: FontConfig.getCustomFontSize(
            btnText.length > 23 && btnText.contains(" ") ? 0.9 : 1));
    var textMaxLines =
        btnText.length > 11 && btnText.length < 18 && !btnText.contains(" ")
            ? 1
            : 2;
    return MyButton(
      fontConfig: fontConfig,
      textMaxLines: textMaxLines,
      size: btnSize,
      text: btnText,
      buttonSkinConfig: buttonSkinConfig,
      onClick: () {
        MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
            .showNewGameScreen(campaignLevel);
      },
    );
  }

  Widget _createLevelIcon(
      QuestionCategory category, QuestionDifficulty difficulty) {
    var isMixedCategory = widget._gameQuestionConfig.isMixedCategory(category);
    List<Widget> children = [
      isMixedCategory
          ? _createBombIcon()
          : _levelIconImgs.get(CategoryDifficulty(category, difficulty)),
    ];
    if (true) {
      children.add(Opacity(opacity: 0.7, child: _levelBtnBackground.get(0)));
      children.add(Icon(
        Icons.check,
        size: _getLevelIconWidth(),
        color: Colors.green.shade900,
      ));
    }
    return Stack(alignment: Alignment.center, children: children);
  }

  Widget _createStarScore() {
    return Positioned(
        top: screenDimensions.dimen(18),
        child: Row(
          children: [
            _starScore,
            _starScore,
            _starScore,
            _starScore,
            _starScore
          ],
        ));
  }

  Widget _createBombIcon() {
    var flameWidth = _getFlameWidth();
    var levelIconWidth = _getLevelIconWidth();
    var flameMargin = screenDimensions.dimen(12);
    // return _explosion;
    return SizedBox(
        width: levelIconWidth,
        height: levelIconWidth,
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              _bomb,
              Positioned(
                left: flameMargin,
                bottom: flameMargin,
                child: AnimateZoomInZoomOut(
                    toAnimateWidgetSize: Size(flameWidth, flameWidth),
                    toAnimateWidget: _flame),
              )
            ]));
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

  double _getListViewAllWidth() => screenDimensions.dimen(100);

  int _getListViewItemPosition(int index) {
    return index % 2 == 0
        ? 0
        : (index - 1) % 4 == 0
            ? -1
            : 1;
  }

  Image _getCampaignRes(String imgName, String module, double maxWidth) {
    return imageService.getSpecificImage(
        imageName: imgName,
        imageExtension: "png",
        module: module,
        maxWidth: maxWidth);
  }

  Image _getLevelBtnBackground(String imgName) {
    var levelBtnBackgroundMaxHeight = screenDimensions.dimen(25);
    return imageService.getSpecificImage(
        imageName: imgName,
        imageExtension: "png",
        module: "campaign/buttons",
        maxHeight: levelBtnBackgroundMaxHeight);
  }
}

class LinesPainter extends CustomPainter {
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();

  Size btnSize;
  Size lateralMargin;
  int itemPosition;
  int index;
  Color lineColor;

  LinesPainter(this.btnSize, this.lateralMargin, this.itemPosition, this.index,
      this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    //Larger value shows the liner higher
    double variableAngle = 0.1;

    var centerToLeftDisplay = itemPosition == 1 || (index + 2) % 4 == 0;

    var xwLength = btnSize.width / 2 +
        (centerToLeftDisplay
            ? -lateralMargin.width / 1.2
            : lateralMargin.width);

    double xPadding = itemPosition == 0
        ? lateralMargin.width
        : itemPosition == 1
            ? lateralMargin.width * 2
            : 0;

    double x1 = xPadding + btnSize.width / 2;
    double x2 = xPadding + ((centerToLeftDisplay ? -1 : 1) * xwLength);
    double y2 = -btnSize.width /
        (2 - (centerToLeftDisplay ? variableAngle : variableAngle * -5.0));
    if (index != 0) {
      canvas.drawLine(
          Offset(x1, btnSize.height / 2),
          Offset(x2, y2),
          Paint()
            ..strokeWidth = _screenDimensionsService.dimen(10)
            ..color = ColorUtil.colorDarken(lineColor, -0.1));
      canvas.drawLine(
          Offset(x1, btnSize.height / 2),
          Offset(x2, y2),
          Paint()
            ..strokeWidth = _screenDimensionsService.dimen(3)
            ..color = ColorUtil.colorDarken(lineColor, 0.075));
    }
  }

  @override
  bool shouldRepaint(LinesPainter oldDelegate) {
    return false;
  }
}
