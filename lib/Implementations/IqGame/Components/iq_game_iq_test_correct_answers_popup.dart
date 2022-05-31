import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/IqTest/iq_game_iq_test_game_type_creator.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../Questions/iq_game_context.dart';

class IqGameIqTestCorrectAnswersPopup extends StatefulWidget with MyPopup {
  IqGameContext iqGameContext;
  String iqTestQuestionImgModuleName;
  static const double _popupHeightPercent = 100;

  IqGameIqTestCorrectAnswersPopup(
      this.iqGameContext, this.iqTestQuestionImgModuleName,
      {Key? key})
      : super(key: key);

  @override
  State<IqGameIqTestCorrectAnswersPopup> createState() =>
      IqGameIqTestCorrectAnswersPopupState();
}

class IqGameIqTestCorrectAnswersPopupState
    extends State<IqGameIqTestCorrectAnswersPopup> with MyPopup {
  @override
  void initState() {
    initPopup();
    width = screenDimensions.w(90);
    height =
        screenDimensions.h(IqGameIqTestCorrectAnswersPopup._popupHeightPercent);
    super.initState();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      SizedBox(
          width: screenDimensions.w(100),
          height: screenDimensions
              .h(IqGameIqTestCorrectAnswersPopup._popupHeightPercent - 18),
          child: ListView(
            shrinkWrap: true,
            children: _createAnswersRows(),
          )),
      context: context,
    );
  }

  List<Widget> _createAnswersRows() {
    List<Widget> qs = [];
    var allQuestions = widget.iqGameContext.gameUser
        .getAllQuestions([QuestionInfoStatus.won, QuestionInfoStatus.lost]);
    for (int i = 0; i < IqGameIqTestGameTypeCreator.totalQuestions; i++) {
      var questionInfo = allQuestions
          .firstWhere((element) => element.question.rawString.parseToInt == i);
      qs.add(_createAnswersRow(
          i,
          questionInfo.question.correctAnswers.first.parseToInt,
          questionInfo.pressedAnswers.first.parseToInt));
      qs.add(Divider(
        height: screenDimensions.dimen(0.5),
        thickness: screenDimensions.dimen(0.5),
        color: Colors.grey,
      ));
    }
    return qs;
  }

  Widget _createAnswersRow(int questionNr, int correctAnswer, int userAnswer) {
    var answImgDimen = screenDimensions.dimen(20);
    var margin = SizedBox(
      height: screenDimensions.dimen(3),
    );
    List<Widget> answerImgs = [];
    var correctAnswerImg = imageService.getSpecificImage(
      maxWidth: answImgDimen,
      imageName: "q" + questionNr.toString() + "a" + correctAnswer.toString(),
      imageExtension: "png",
      module: widget.iqTestQuestionImgModuleName,
    );
    var infoFontConfig = FontConfig(
        fontSize: FontConfig.getCustomFontSize(0.7), fontColor: Colors.black);
    var correctColor = Colors.green.shade200;
    if (correctAnswer == userAnswer) {
      answerImgs.add(Column(children: [
        MyText(text: "Your answer is correct", fontConfig: infoFontConfig),
        Container(
          color: correctColor,
          child: correctAnswerImg,
        )
      ]));
    } else {
      var userAnswerImg = imageService.getSpecificImage(
        maxWidth: answImgDimen,
        imageName: "q" + questionNr.toString() + "a" + userAnswer.toString(),
        imageExtension: "png",
        module: widget.iqTestQuestionImgModuleName,
      );
      answerImgs.add(Column(children: [
        MyText(text: "Correct answer", fontConfig: infoFontConfig),
        Container(
          color: correctColor,
          child: correctAnswerImg,
        )
      ]));
      answerImgs.add(const Spacer());
      answerImgs.add(Column(children: [
        MyText(text: "Your answer", fontConfig: infoFontConfig),
        Container(
          color: Colors.red.shade200,
          child: userAnswerImg,
        )
      ]));
    }
    return Column(children: [
      margin,
      MyText(
          text: (questionNr + 1).toString(),
          fontConfig: FontConfig(
              fontWeight: FontWeight.w700,
              fontSize: FontConfig.getCustomFontSize(1.0),
              fontColor: Colors.red)),
      margin,
      imageService.getSpecificImage(
          module: widget.iqTestQuestionImgModuleName,
          imageName: "q" + questionNr.toString(),
          imageExtension: "png"),
      margin,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: answerImgs,
      ),
      margin,
    ]);
  }
}
