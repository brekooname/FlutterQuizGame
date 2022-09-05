import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../main.dart';
import '../Font/font_config.dart';
import '../Font/font_util.dart';
import '../Screen/Game/game_screen.dart';
import 'my_popup.dart';

class NextQuestionWithExplanationPopup extends StatefulWidget {
  final MyTextService _myTextService = MyTextService();
  final NextQuestionWithExplanationService _nextQuestionWithExplanationService =
      NextQuestionWithExplanationService();
  String title;
  String explanation;
  String nextQuestionBtnLabel;
  VoidCallback goToNextScreen;

  NextQuestionWithExplanationPopup(this.title, this.explanation,
      this.goToNextScreen, this.nextQuestionBtnLabel,
      {Key? key})
      : super(key: key);

  @override
  State<NextQuestionWithExplanationPopup> createState() =>
      NextQuestionWithExplanationPopupState();
}

class NextQuestionWithExplanationPopupState
    extends State<NextQuestionWithExplanationPopup> with MyPopup, LabelMixin {
  @override
  void initState() {
    super.initState();
    initPopup();
  }

  @override
  Widget createClosePopupBtn(VoidCallback? onCloseBtnClick) {
    return super.createClosePopupBtn(() {
      closePopup();
      widget.goToNextScreen.call();
    });
  }

  @override
  AlertDialog build(BuildContext context) {
    var iconDimen = screenDimensions.dimen(12);
    var horizMargin = SizedBox(
      width: screenDimensions.dimen(2),
    );
    var btnWidth = screenDimensions.dimen(70);
    var infoParamFontConfig = FontConfig(
        fontWeight: FontWeight.w800,
        fontSize: FontConfig.getCustomFontSize(1.05),
        fontColor: Colors.black);
    var infoText = widget._myTextService.createMyTextWithOneParam(
        label.l_more_information + "{0}",
        widget.title,
        FontConfig(
            fontWeight: FontWeight.w400,
            fontSize: FontConfig.getCustomFontSize(1)),
        infoParamFontConfig,
        labelWidth: btnWidth / 1.5,
        staticTextMaxLines: 1,
        paramTextMaxLines: 2);
    var infoBtnWidgets = [
      horizMargin,
      Icon(Icons.info, color: Colors.blue.shade700, size: iconDimen),
      horizMargin,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: infoText,
      ),
      horizMargin,
    ];
    var infoBtnContent = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: infoBtnWidgets);
    var infoBtn = MyButton(
      contentLockedConfig: ContentLockedConfig(
          executeAfterPurchase: () {
            var currentScreen = MyApp.gameScreenManager.currentScreen!;
            currentScreen.gameScreenManagerState.refreshCurrentScreen();
            (currentScreen as GameScreen).processNextGameScreenCallBack(context);
          },
          isContentLocked: MyApp.isExtraContentLocked),
      size: Size(btnWidth, screenDimensions.dimen(28)),
      buttonSkinConfig: ButtonSkinConfig(
          backgroundColor: Colors.lightBlueAccent,
          borderColor: Colors.lightBlueAccent.shade700),
      customContent: infoBtnContent,
      onClick: () {
        _openExplanationPopup(context);
      },
    );
    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          margin,
          infoBtn,
          margin,
          widget._nextQuestionWithExplanationService.createNextQuestionBtn(
              widget.goToNextScreen, this, widget.nextQuestionBtnLabel)
        ],
      ),
    );
  }

  void _openExplanationPopup(BuildContext context) {
    closePopup();
    MyPopup.showPopup(ExplanationPopup(widget.title, widget.explanation,
        widget.goToNextScreen, widget.nextQuestionBtnLabel));
  }
}

class ExplanationPopup extends StatefulWidget with MyPopup {
  final NextQuestionWithExplanationService _nextQuestionWithExplanationService =
      NextQuestionWithExplanationService();
  String title;
  String explanation;
  String nextQuestionBtnLabel;
  VoidCallback goToNextScreen;

  ExplanationPopup(this.title, this.explanation, this.goToNextScreen,
      this.nextQuestionBtnLabel,
      {Key? key})
      : super(key: key);

  @override
  State<ExplanationPopup> createState() => ExplanationPopupState();
}

class ExplanationPopupState extends State<ExplanationPopup> with MyPopup {
  @override
  void initState() {
    initPopup();
    super.initState();
  }

  @override
  Widget createClosePopupBtn(VoidCallback? onCloseBtnClick) {
    return super.createClosePopupBtn(() {
      closePopup();
      widget.goToNextScreen.call();
    });
  }

  @override
  AlertDialog build(BuildContext context) {
    var title = MyText(
      fontConfig: FontConfig(
          fontColor: Colors.grey.shade300,
          fontSize: FontConfig.getCustomFontSize(1.15)),
      text: widget.title,
    );
    var explanationText = MyText(
      fontConfig: FontConfig(
          fontColor: FontUtil.getFontDefaultColorForContrast(),
          fontSize: FontConfig.getCustomFontSize(0.9)),
      text: widget.explanation,
      maxLines: 17,
      width: screenDimensions.dimen(95),
    );
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            margin,
            title,
            margin,
            explanationText,
            margin,
            widget._nextQuestionWithExplanationService.createNextQuestionBtn(
                widget.goToNextScreen, this, widget.nextQuestionBtnLabel),
            margin,
          ]),
    );
  }
}

class NextQuestionWithExplanationService with LabelMixin {
  MyButton createNextQuestionBtn(
      VoidCallback goToNextScreen, MyPopup myPopup, String btnLabel) {
    return MyButton(
      text: btnLabel,
      backgroundColor: Colors.lightGreenAccent,
      onClick: () {
        myPopup.closePopup();
        goToNextScreen.call();
      },
    );
  }
}
