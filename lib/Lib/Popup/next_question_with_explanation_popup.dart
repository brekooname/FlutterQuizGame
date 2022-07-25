import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../Font/font_config.dart';
import 'my_popup.dart';

class NextQuestionWithExplanationPopup extends StatefulWidget {
  final MyTextService _myTextService = MyTextService();
  final NextQuestionWithExplanationService _nextQuestionWithExplanationService =
      NextQuestionWithExplanationService();
  String title;
  String explanation;
  VoidCallback goToNextScreen;

  NextQuestionWithExplanationPopup(
      this.title, this.explanation, this.goToNextScreen,
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
    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          margin,
          MyButton(
            size: Size(btnWidth, screenDimensions.dimen(28)),
            buttonSkinConfig: ButtonSkinConfig(
                backgroundColor: Colors.lightBlueAccent,
                borderColor: Colors.lightBlueAccent.shade700),
            customContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  horizMargin,
                  Icon(Icons.info,
                      color: Colors.blue.shade700, size: iconDimen),
                  horizMargin,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: widget._myTextService.createMyTextWithOneParam(
                      "More information{0}",
                      widget.title,
                      FontConfig(),
                      FontConfig(
                          fontWeight: FontWeight.w700,
                          fontSize: FontConfig.getCustomFontSize(1.15),
                          fontColor: Colors.black),
                      labelWidth: btnWidth / 1.5,
                      staticTextMaxLines: 1,
                    ),
                  ),
                  horizMargin,
                  // SizedBox(
                  //   width: iconDimen,
                  // ),
                  // horizMargin,
                ]),
            onClick: () {
              closePopup(context);
              MyPopup.showPopup(
                  context,
                  ExplanationPopup(
                      widget.title, widget.explanation, widget.goToNextScreen));
            },
          ),
          margin,
          widget._nextQuestionWithExplanationService
              .createNextQuestionBtn(context, widget.goToNextScreen, this)
        ],
      ),
      context: context,
    );
  }
}

class ExplanationPopup extends StatefulWidget with MyPopup {
  final NextQuestionWithExplanationService _nextQuestionWithExplanationService =
      NextQuestionWithExplanationService();
  String title;
  String explanation;
  VoidCallback goToNextScreen;

  ExplanationPopup(this.title, this.explanation, this.goToNextScreen,
      {Key? key})
      : super(key: key);

  @override
  State<ExplanationPopup> createState() => ExplanationPopupState();
}

class ExplanationPopupState extends State<ExplanationPopup> with MyPopup {
  @override
  void initState() {
    initPopup();
    width = screenDimensions.w(90);
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
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            margin,
            MyText(
              fontConfig: FontConfig(
                  fontColor: Colors.grey.shade300,
                  fontSize: FontConfig.getCustomFontSize(1.3)),
              text: widget.title,
            ),
            margin,
            MyText(
              fontConfig: FontConfig(fontColor: Colors.white),
              text: widget.explanation,
            ),
            margin,
            widget._nextQuestionWithExplanationService
                .createNextQuestionBtn(context, widget.goToNextScreen, this),
            margin,
          ]),
      context: context,
    );
  }
}

class NextQuestionWithExplanationService with LabelMixin {
  MyButton createNextQuestionBtn(
      BuildContext context, VoidCallback goToNextScreen, MyPopup myPopup) {
    return MyButton(
      text: label.l_next_question,
      backgroundColor: Colors.lightGreenAccent,
      onClick: () {
        myPopup.closePopup(context);
        goToNextScreen.call();
      },
    );
  }
}
