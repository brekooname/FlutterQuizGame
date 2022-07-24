import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Internet/internet_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/rate_app_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../main.dart';
import '../Font/font_config.dart';
import 'my_popup.dart';

class NextQuestionWithExplanationPopup extends StatefulWidget {
  final MyTextService _myTextService = MyTextService();
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
    initPopup(backgroundImageName: "popup_in_app_purchases_background");
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          margin,
          MyButton(
            size: Size(screenDimensions.dimen(70), screenDimensions.dimen(50)),
            customContent: Column(
              children: widget._myTextService.createMyTextWithOneParam(
                "Find out more information about: {0}",
                "Nebula",
                FontConfig(),
                FontConfig(
                    fontWeight: FontWeight.w700,
                    fontSize: FontConfig.getCustomFontSize(1.3),
                    fontColor: Colors.blue.shade700),
              ),
            ),
            onClick: () {
              MyPopup.showPopup(
                  context, ExplanationPopup(widget.title, widget.explanation));
            },
          ),
          margin,
          MyButton(
            text: label.l_next_question,
            backgroundColor: Colors.lightGreenAccent,
            onClick: () {
              closePopup(context);
              widget.goToNextScreen.call();
            },
          ),
        ],
      ),
      context: context,
    );
  }
}

class ExplanationPopup extends StatefulWidget with MyPopup {
  String title;
  String explanation;

  ExplanationPopup(this.title, this.explanation, {Key? key}) : super(key: key);

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
  AlertDialog build(BuildContext context) {
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            margin,
            MyText(
              text: widget.title,
            ),
            margin,
            MyText(
              text: widget.explanation,
            ),
            margin,
          ]),
      context: context,
    );
  }
}
