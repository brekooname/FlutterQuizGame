import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_iq_test_correct_answers_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../../Lib/Font/font_config.dart';
import '../../../Questions/AllContent/iq_game_question_collector_service.dart';
import '../iq_game_game_type_creator.dart';

class IqGameIqTestGameTypeCreator extends IqGameGameTypeCreator {
  static final IqGameIqTestGameTypeCreator singleton =
      IqGameIqTestGameTypeCreator.internal();

  factory IqGameIqTestGameTypeCreator() {
    return singleton;
  }

  IqGameIqTestGameTypeCreator.internal();

  @override
  Widget createGameContainer(QuestionInfo currentQuestionInfo,
      IqGameContext gameContext, VoidCallback goToNextScreen) {
    var question = currentQuestionInfo.question;
    var questionImgModule = "cat" + question.category.index.toString();
    var imgHeight = screenDimensionsService.h(40);
    Widget qContainer = SizedBox(
      height: imgHeight,
      child: imageService.getSpecificImage(
          maxHeight: imgHeight,
          imageName: "q" + question.rawString,
          imageExtension: "png",
          module: questionImgModule),
    );

    List<Widget> answRows = [];
    List<Widget> answImgList = [];
    var answImgDimen = screenDimensionsService.dimen(25);
    for (int i = 0; i < 8; i++) {
      var image = imageService.getSpecificImage(
          maxWidth: answImgDimen,
          imageName: "q" + question.rawString + "a" + i.toString(),
          imageExtension: "png",
          module: questionImgModule);
      answImgList.add(MyButton(
        size: Size(answImgDimen, answImgDimen),
        buttonSkinConfig: ButtonSkinConfig(
          buttonUnpressedShadowColor: Colors.transparent,
          buttonPressedShadowColor: Colors.grey.withOpacity(0.3),
          image: image,
        ),
        onClick: () {
          gameContext.answerQuestion(currentQuestionInfo, i.toString());
          goToNextScreen.call();
        },
      ));
      if (i == 3 || i == 7) {
        answRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: answImgList.toList(),
        ));
        answImgList = [];
      }
    }
    Column answerColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: answRows,
    );

    var margin = SizedBox(
      height: screenDimensionsService.h(2),
    );

    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
                fontConfig: FontConfig(
                    fontSize: FontConfig.getCustomFontSize(1.2),
                    fontColor: Colors.white,
                    borderWidth: FontConfig.standardBorderWidth * 1.3,
                    borderColor: Colors.black),
                text: (question.rawString.parseToInt + 1).toString() +
                    "/" +
                    IqGameQuestionCollectorService.iqTestTotalQuestions
                        .toString()),
            margin,
            qContainer,
            margin,
            MyText(text: "Choose an answer"),
            margin,
            answerColumn,
          ],
        ));
  }

  @override
  Widget createGameOverContainer(
      BuildContext context, IqGameContext gameContext) {
    // for (QuestionInfo q in gameContext.gameUser.getOpenQuestions()) {
    //   gameContext.gameUser
    //       .addAnswerToQuestionInfo(q.question, Random().nextInt(8).toString());
    // }
    int minIqVal = 57;
    int maxIqVal = 143;
    int iqValDiff = maxIqVal - minIqVal;

    double ratio = 2.2;
    int iqValue = (minIqVal +
            (gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]) *
                ratio))
        .ceil();
    double xPosIqValue = ((iqValDiff - (maxIqVal - iqValue)) / iqValDiff) * 100;

    var imgWidth = screenDimensionsService.dimen(100);
    var pointerWidth = screenDimensionsService.dimen(2);
    var graphStack = Stack(children: [
      imageService.getSpecificImage(
          maxWidth: imgWidth, imageName: "finalscore", imageExtension: "png"),
      Positioned(
          top: 0,
          left: screenDimensionsService.dimen(xPosIqValue) - pointerWidth / 2,
          child: Container(
            width: pointerWidth,
            height: screenDimensionsService.dimen(41),
            decoration: const BoxDecoration(color: Colors.red),
          ))
    ]);
    return Column(children: [
      graphStack,
      SizedBox(
        height: screenDimensionsService.dimen(5),
      ),
      MyText(
          text: iqValue.toString(),
          fontConfig: FontConfig(
              fontWeight: FontWeight.w700,
              fontSize: FontConfig.getCustomFontSize(1.4),
              fontColor: Colors.red)),
      SizedBox(
        height: screenDimensionsService.dimen(1),
      ),
      MyText(
          text: "(" + _getLevelForScore(iqValue) + ")",
          fontConfig: FontConfig(
              fontWeight: FontWeight.w700,
              fontSize: FontConfig.getCustomFontSize(1.1),
              fontColor: Colors.black)),
      SizedBox(
        height: screenDimensionsService.dimen(2),
      ),
      MyText(
          maxLines: 100,
          width: screenDimensionsService.dimen(95),
          text:
              "The distribution of IQ in the population. The left side of the red line indicates the part of the population with an IQ lower than your own."),
      SizedBox(
        height: screenDimensionsService.dimen(10),
      ),
      MyButton(
        text: "Show correct answers",
        onClick: () {
          MyPopup.showPopup(
              context,
              IqGameIqTestCorrectAnswersPopup(
                  gameContext,
                  "cat" +
                      gameContext.questionConfig.categories.first.index
                          .toString()));
        },
      ),
    ]);
  }

  String _getLevelForScore(int score) {
    if (score < 70) {
      return "Very low";
    } else if (score < 90) {
      return "Low";
    } else if (score < 110) {
      return "Average";
    } else if (score < 130) {
      return "High";
    } else {
      return "Very high";
    }
  }
}