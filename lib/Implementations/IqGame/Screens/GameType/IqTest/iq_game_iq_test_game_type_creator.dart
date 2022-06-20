import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_iq_test_correct_answers_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../../Lib/Font/font_config.dart';
import '../iq_game_game_type_creator.dart';

class IqGameIqTestGameTypeCreator extends IqGameGameTypeCreator {
  static const int totalQuestions = 39;

  static const int minIqVal = 57;
  static const int maxIqVal = 143;

  IqGameIqTestGameTypeCreator(IqGameContext gameContext) : super(gameContext);

  @override
  Widget createGameContainer(BuildContext context) {
    var question = currentQuestionInfo.question;
    var questionImgModule = getQuestionImageModuleName(gameContext);
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
        disabled: !currentQuestionInfo.isQuestionOpen(),
        disabledBackgroundColor: Colors.transparent,
        size: Size(answImgDimen, answImgDimen),
        buttonSkinConfig: ButtonSkinConfig(
          buttonUnpressedShadowColor: Colors.transparent,
          buttonPressedShadowColor: Colors.grey.withOpacity(0.3),
          image: image,
        ),
        onClick: () {
          answerQuestion(i.toString(), true);
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
            createCurrentQuestionNr(
                question.rawString.parseToInt, totalQuestions),
            margin,
            qContainer,
            margin,
            createInfoMyText(label.l_choose_an_answer, 1.0),
            margin,
            answerColumn,
          ],
        ));
  }

  @override
  Widget createGameContainerWithDecoration(BuildContext context) {
    return createGameContainer(context);
  }

  @override
  Widget createGameOverContainer(BuildContext context) {
    int iqValDiff = maxIqVal - minIqVal;
    int iqValue = getScore();
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
          text: label.l_the_distribution_of_iq_in_the_population_the_left_side_of_the_red_line_indicates_the_part_of_the_p),
      SizedBox(
        height: screenDimensionsService.dimen(10),
      ),
      MyButton(
        text: label.l_show_correct_answers,
        onClick: () {
          MyPopup.showPopup(
              context,
              IqGameIqTestCorrectAnswersPopup(
                  gameContext, getQuestionImageModuleName(gameContext)));
        },
      ),
    ]);
  }

  @override
  bool hasSkipButton() {
    return true;
  }

  @override
  int getScore() {
    double ratio = 2.2;
    var wonQuestions =
        gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);
    return (minIqVal + (wonQuestions * ratio)).ceil();
  }

  @override
  bool isGameOverOnFirstWrongAnswer() {
    return false;
  }

  @override
  bool showScore() {
    return false;
  }

  String _getLevelForScore(int score) {
    if (score < 70) {
      return label.l_very_low;
    } else if (score < 90) {
      return label.l_low;
    } else if (score < 110) {
      return label.l_normal;
    } else if (score < 130) {
      return label.l_high;
    } else {
      return label.l_very_high;
    }
  }
}
