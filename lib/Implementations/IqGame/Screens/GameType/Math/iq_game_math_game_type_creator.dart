import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:function_tree/function_tree.dart';

import '../../../../../Lib/Font/font_config.dart';
import '../iq_game_game_type_creator.dart';

class IqGameMathGameTypeCreator extends IqGameGameTypeCreator {
  static const int totalQuestions = 10;
  static const int startMaxScore = 5;
  static const List<String> operators = ["+", "-", "*", "/"];
  static final IqGameMathGameTypeCreator singleton =
      IqGameMathGameTypeCreator.internal();
  Map<int, int> randomPosForBtns = {};
  List<int> answersToPress = [];
  Timer? timer;
  int score = startMaxScore;
  int totalScore = 0;

  factory IqGameMathGameTypeCreator() {
    return singleton;
  }

  IqGameMathGameTypeCreator.internal();

  @override
  void initGameTypeCreator(
    QuestionInfo currentQuestionInfo,
    VoidCallback refreshScreen,
  ) {
    score = startMaxScore;
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (score == 0) {
          timer.cancel();
        } else {
          score--;
        }
        refreshScreen.call();
      },
    );
  }

  @override
  Widget createGameContainer(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      IqGameContext gameContext,
      VoidCallback refreshScreen,
      VoidCallback goToNextScreen) {
    var question = currentQuestionInfo.question;
    var margin = SizedBox(
      height: screenDimensionsService.h(2),
    );
    Widget mainContent;

    var questionNr = question.index;

    Random random = Random();
    var operator = operators.elementAt(random.nextInt(operators.length));

    int nr1 = random.nextInt(10);
    int nr2 = random.nextInt(10);

    String expression = nr1.toString() + " " + operator + " " + nr2.toString();

    var interpret = expression.interpret();
    while (interpret is! int || (nr2 == 0 && operator == "/")) {
      nr1 = random.nextInt(10);
      nr2 = random.nextInt(10);
      expression =
          expression = nr1.toString() + " " + operator + " " + nr2.toString();
      interpret = expression.interpret();
    }
    var nrFontConfig = FontConfig(
        fontWeight: FontWeight.w700,
        borderColor: Colors.black,
        fontSize: FontConfig.getCustomFontSize(1.7),
        fontColor: Colors.white);
    var opFontConfig = FontConfig(
        fontWeight: FontWeight.w700,
        borderColor: Colors.black,
        fontSize: FontConfig.getCustomFontSize(1.7),
        fontColor: Colors.blue);
    var opMargin = SizedBox(width: screenDimensionsService.dimen(2));
    var expressionTextRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            text: nr1.toString(),
            fontConfig: nrFontConfig,
          ),
          opMargin,
          createOperationBtn("?", nr1, nr2, interpret),
          opMargin,
          MyText(text: nr2.toString(), fontConfig: nrFontConfig),
          opMargin,
          createOperationBtn("=", nr1, nr2, interpret),
          opMargin,
          MyText(text: interpret.toString(), fontConfig: nrFontConfig),
        ]);

    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createCurrentQuestionNr(questionNr, totalQuestions),
            MyText(
              text: score.toString(),
              fontConfig: FontConfig(
                  fontWeight: FontWeight.w700,
                  borderColor: Colors.black,
                  fontSize: FontConfig.getCustomFontSize(1.7),
                  fontColor: Colors.white),
            ),
            margin,
            MyText(text: "Calculate"),
            margin,
            SizedBox(
              height: screenDimensionsService.h(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: expressionTextRow,
                  ),
                  margin,
                  margin,
                  createOperationBtns(nr1, nr2, interpret),
                ],
              ),
            )
          ],
        ));
  }

  Widget createOperationBtns(int nr1, int nr2, int interpret) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: operators
            .map((e) => createOperationBtn(e, nr1, nr2, interpret))
            .toList());
  }

  Widget createOperationBtn(String operation, int nr1, int nr2, int interpret) {
    var disabledOps = ["?", "="];
    var btnSideDimen = screenDimensionsService.dimen(17);
    var isDisabledOperation = disabledOps.contains(operation);
    return MyButton(
      onClick: () {
        if ((nr1.toString() + " " + operation + " " + nr2.toString())
                .interpret() ==
            interpret) {
          totalScore = totalScore + score;
        } else {}
      },
      textFirstCharUppercase: false,
      disabled: isDisabledOperation,
      disabledBackgroundColor:
          isDisabledOperation ? Colors.lightBlueAccent.shade200 : null,
      fontConfig: FontConfig(
          fontWeight: FontWeight.w700,
          borderColor: Colors.black,
          fontSize:
              FontConfig.getCustomFontSize(isDisabledOperation ? 1.6 : 1.3),
          fontColor:
              isDisabledOperation ? Colors.lightGreenAccent : Colors.white),
      buttonAllPadding: screenDimensionsService.dimen(2),
      size: Size(btnSideDimen, btnSideDimen),
      text: operation == "*"
          ? "×"
          : operation == "/"
              ? "÷"
              : operation,
    );
  }

  bool isAnswerCorrect(int answer) {
    return answer == answersToPress.reduce(min);
  }

  @override
  int? getScore(IqGameContext gameContext) {
    return totalScore;
  }

  @override
  Widget createGameOverContainer(
      BuildContext context, IqGameContext gameContext) {
    return Container();
  }

  @override
  bool hasGoToNextQuestionBtn(QuestionInfo currentQuestionInfo) {
    return !currentQuestionInfo.isQuestionOpen();
  }
}
