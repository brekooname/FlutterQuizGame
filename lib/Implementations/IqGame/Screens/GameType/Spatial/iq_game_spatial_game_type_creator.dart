import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../../Lib/Font/font_config.dart';
import '../../../Questions/AllContent/iq_game_question_collector_service.dart';
import '../iq_game_game_type_creator.dart';

class IqGameSpatialGameTypeCreator extends IqGameGameTypeCreator {
  static final IqGameSpatialGameTypeCreator singleton =
      IqGameSpatialGameTypeCreator.internal();

  factory IqGameSpatialGameTypeCreator() {
    return singleton;
  }

  IqGameSpatialGameTypeCreator.internal();

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
    return Container();
  }
}
