import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../Font/font_config.dart';
import '../Font/font_util.dart';
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
  Widget createClosePopupBtn(
      BuildContext context, VoidCallback? onCloseBtnClick) {
    return super.createClosePopupBtn(context, () {
      closePopup(context);
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
        fontWeight: FontWeight.w700,
        fontSize: FontConfig.getCustomFontSize(1.15),
        fontColor: Colors.black);
    var infoText = widget._myTextService.createMyTextWithOneParam(
      "More information{0}",
      widget.title,
      FontConfig(),
      infoParamFontConfig,
      labelWidth: btnWidth / 1.5,
      staticTextMaxLines: 1,
    );
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
      size: Size(btnWidth, screenDimensions.dimen(28)),
      buttonSkinConfig: ButtonSkinConfig(
          backgroundColor: Colors.lightBlueAccent,
          borderColor: Colors.lightBlueAccent.shade700),
      customContent: infoBtnContent,
      onClick: () {
        openExplanationPopup(context);
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
              context, widget.goToNextScreen, this, widget.nextQuestionBtnLabel)
        ],
      ),
      context: context,
    );
  }

  void openExplanationPopup(BuildContext context) {
    closePopup(context);
    MyPopup.showPopup(
        context,
        ExplanationPopup(widget.title, widget.explanation,
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
  Widget createClosePopupBtn(
      BuildContext context, VoidCallback? onCloseBtnClick) {
    return super.createClosePopupBtn(context, () {
      closePopup(context);
      widget.goToNextScreen.call();
    });
  }

  @override
  AlertDialog build(BuildContext context) {
    var title = MyText(
      fontConfig: FontConfig(
          fontColor: Colors.grey.shade300,
          fontSize: FontConfig.getCustomFontSize(1.3)),
      text: widget.title,
    );
    var explanationText = MyText(
      fontConfig:
          FontConfig(fontColor: FontUtil.getFontDefaultColorForContrast()),
      text: widget.explanation,
    );
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            margin,
            title,
            margin,
            SizedBox(
                width: width,
                height: screenDimensions.dimen(100),
                child: ListView(
                  shrinkWrap: true,
                  children: [explanationText],
                )),
            margin,
            widget._nextQuestionWithExplanationService.createNextQuestionBtn(
                context,
                widget.goToNextScreen,
                this,
                widget.nextQuestionBtnLabel),
            margin,
          ]),
      context: context,
    );
  }
}

class NextQuestionWithExplanationService with LabelMixin {
  MyButton createNextQuestionBtn(BuildContext context,
      VoidCallback goToNextScreen, MyPopup myPopup, String btnLabel) {
    return MyButton(
      text: btnLabel,
      backgroundColor: Colors.lightGreenAccent,
      onClick: () {
        myPopup.closePopup(context);
        goToNextScreen.call();
      },
    );
  }
}
