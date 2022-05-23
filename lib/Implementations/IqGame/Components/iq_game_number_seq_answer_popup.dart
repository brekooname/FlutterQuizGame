import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Button/my_button.dart';
import '../../../Lib/Font/font_config.dart';

class IqGameIqNumberSeqAnswerPopup extends StatefulWidget with MyPopup {
  QuestionInfo questionInfo;
  Widget questionImage;
  String correctAnswer;
  String userAnswer;
  VoidCallback nextQuestion;
  bool isShowExplanationPopup;

  IqGameIqNumberSeqAnswerPopup(
      this.questionInfo,
      this.questionImage,
      this.correctAnswer,
      this.userAnswer,
      this.nextQuestion,
      this.isShowExplanationPopup,
      {Key? key})
      : super(key: key);

  @override
  State<IqGameIqNumberSeqAnswerPopup> createState() =>
      IqGameIqNumberSeqAnswerPopupState();
}

class IqGameIqNumberSeqAnswerPopupState
    extends State<IqGameIqNumberSeqAnswerPopup> with MyPopup, LabelMixin {
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
      widget.nextQuestion.call();
    });
  }

  @override
  AlertDialog build(BuildContext context) {
    List<Widget> answerInfo = [];
    answerInfo.add(Center(child: widget.questionImage));
    var answerInfoFontConfig = FontConfig(
        fontWeight: FontWeight.w700,
        fontSize: FontConfig.getCustomFontSize(1.4));
    Color correctAnswerColor = Colors.green.shade700;
    Color wrongAnswerColor = Colors.red.shade700;
    if (widget.correctAnswer == widget.userAnswer) {
      answerInfoFontConfig.fontColor = correctAnswerColor;
      answerInfo.add(MyText(
          fontConfig: answerInfoFontConfig,
          text: "Correct answer: " + widget.userAnswer));
    } else {
      answerInfoFontConfig.fontColor = wrongAnswerColor;
      if (!widget.isShowExplanationPopup) {
        answerInfo.add(
            MyText(fontConfig: answerInfoFontConfig, text: "Wrong answer"));
      }
      answerInfo.add(MyText(
          fontConfig: FontConfig(
            fontColor: answerInfoFontConfig.fontColor,
            fontSize: FontConfig.getCustomFontSize(1.1),
          ),
          text: "Your answer: " + widget.userAnswer));
      answerInfo.add(MyText(
          fontConfig: FontConfig(
            fontColor: correctAnswerColor,
            fontSize: FontConfig.getCustomFontSize(1.1),
          ),
          text: "Correct answer: " + widget.correctAnswer));
    }
    var vertMargin = SizedBox(
      height: screenDimensions.h(2.5),
    );
    answerInfo.add(vertMargin);
    if (widget.isShowExplanationPopup) {
      var rawArray = widget.questionInfo.question.rawString.split("###");
      for (int i = 2; i < rawArray.length; i++) {
        answerInfo.add(MyText(
            fontConfig: FontConfig(
              fontColor: Colors.black,
              fontSize: FontConfig.getCustomFontSize(0.9),
            ),
            text: rawArray[i]));
      }
    } else {
      answerInfo.add(MyButton(
        text: "Show explanation",
        onClick: () {
          closePopup(context);
          MyPopup.showPopup(
              context,
              IqGameIqNumberSeqAnswerPopup(
                  widget.questionInfo,
                  widget.questionImage,
                  widget.correctAnswer,
                  widget.userAnswer,
                  widget.nextQuestion,
                  true));
        },
      ));
    }
    answerInfo.add(vertMargin);
    answerInfo.add(MyButton(
      text: "Next question",
      onClick: () {
        closePopup(context);
        widget.nextQuestion.call();
      },
    ));
    return createDialog(
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: answerInfo),
      context: context,
    );
  }
}
