import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_iq_test_bar_chart.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../Lib/Font/font_config.dart';
import '../../Questions/AllContent/iq_game_question_collector_service.dart';
import 'iq_game_game_type_creator.dart';

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
        unpressedShadow: false,
        size: Size(answImgDimen, answImgDimen),
        buttonSkinConfig: ButtonSkinConfig(
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
  Widget createGameOverContainer(IqGameContext gameContext) {
    var graphHeight = screenDimensionsService.dimen(70);
    var graphWidth = screenDimensionsService.dimen(95);
    return Material(
        color: Colors.white.withOpacity(0.6),
        textStyle: const TextStyle(decoration: TextDecoration.none),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: graphWidth,
                        height: graphHeight,
                        child: IqGameIqTestBarChart(100, 140))
                  ])
            ]));
  }
}
