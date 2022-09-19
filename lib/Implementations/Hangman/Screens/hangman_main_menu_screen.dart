import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class HangmanMainMenuScreen extends StandardScreen<HangmanScreenManagerState> {
  final HangmanLocalStorage _hangmanLocalStorage = HangmanLocalStorage();

  HangmanMainMenuScreen(HangmanScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<HangmanMainMenuScreen> createState() => HangmanMainMenuScreenState();
}

class HangmanMainMenuScreenState extends State<HangmanMainMenuScreen>
    with ScreenState, LabelMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initScreenState();
    Future.delayed(const Duration(milliseconds: 500), () {
      var btnSize = _createBtnSize();
      _scrollController.animateTo(btnSize.height * 8,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
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

    var mainColumn = Container(
        alignment: Alignment.center,
        width: screenDimensions.dimen(100),
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
                    child: Column(children: _createListView()))),
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
              resetContentOnClick: () {
                widget._hangmanLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  List<Widget> _createListView() {
    var btnSize = _createBtnSize();
    var lateralMarginWidth = (screenDimensions.dimen(100) - btnSize.width) / 2;
    SizedBox lateralMargin = SizedBox(
      width: lateralMarginWidth,
      height: btnSize.height,
    );
    var boxDecoration = BoxDecoration(
        image: DecorationImage(
      repeat: ImageRepeat.repeatX,
      image: MyApp.backgroundTexture.image,
    ));
    List<Widget> res = [];
    for (int index = 0; index < 20; index++) {
      var btnText = index.toString();
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
        buttonSkinConfig: ButtonSkinConfig(
            image: imageService.getSpecificImage(
                module: "buttons",
                imageName: "btn_cat1",
                imageExtension: "png")),
      );
      List<Widget> rowChildren = [];
      int itemPosition = index % 2 == 0
          ? 0
          : (index - 1) % 4 == 0
              ? -1
              : 1;
      if (itemPosition == 0) {
        rowChildren.addAll([lateralMargin, levelBtn, lateralMargin]);
      } else if (itemPosition == -1) {
        rowChildren.addAll([levelBtn, lateralMargin, lateralMargin]);
      } else if (itemPosition == 1) {
        rowChildren.addAll([lateralMargin, lateralMargin, levelBtn]);
      }
      var customPaint = CustomPaint(
        size: btnSize,
        painter: LinesPainter(btnSize, Size(lateralMarginWidth, btnSize.height),
            itemPosition, index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowChildren,
        ),
      );

      res.add(Container(
          decoration: boxDecoration,
          width: screenDimensions.dimen(100),
          height: btnSize.height,
          child: customPaint));
    }

    return res;
  }

  Size _createBtnSize() =>
      Size(screenDimensions.dimen(25), screenDimensions.dimen(39));
}

class LinesPainter extends CustomPainter {
  Size btnSize;
  Size lateralMargin;
  int itemPosition;
  int index;

  LinesPainter(this.btnSize, this.lateralMargin, this.itemPosition, this.index);

  @override
  void paint(Canvas canvas, Size size) {
    double xPadding = itemPosition == 0
        ? lateralMargin.width
        : itemPosition == 1
            ? lateralMargin.width * 2
            : 0;
    double x1 = xPadding + btnSize.width / 2;
    var centerToLeftDisplay = itemPosition == 1 || (index + 2) % 4 == 0;
    var xwLength = (btnSize.width / 2 +
        (centerToLeftDisplay ? btnSize.width / 2 : lateralMargin.width));
    double x2 = xPadding + ((centerToLeftDisplay ? -1 : 1) * xwLength);
    double y2 = -btnSize.width / 2;
    if (index != 0) {
      canvas.drawLine(
          Offset(x1, btnSize.height / 2),
          Offset(x2, y2),
          Paint()
            ..strokeWidth = 14
            ..color = Colors.redAccent);
    }
  }

  @override
  bool shouldRepaint(LinesPainter oldDelegate) {
    return false;
  }
}
