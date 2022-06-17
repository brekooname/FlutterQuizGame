import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:function_tree/function_tree.dart';

import '../../../../../Lib/Font/font_config.dart';
import '../iq_game_game_type_creator.dart';
import 'iq_game_math_question_service.dart';

class IqGameMathGameTypeCreator extends IqGameGameTypeCreator {
  static const int totalQuestions = 10;
  static const int startSeconds = 3;
  static const List<String> operators = ["+", "-", "*", "/"];
  Map<int, int> randomPosForBtns = {};
  List<int> answersToPress = [];
  Timer? timer;
  int remainingSeconds = startSeconds;
  int? nr1;
  int? nr2;
  String? operator;
  String? pressedOperator;

  IqGameMathGameTypeCreator(IqGameContext gameContext) : super(gameContext);

  @override
  void initGameTypeCreator(QuestionInfo currentQuestionInfo,
      {required VoidCallback refreshScreen,
      required VoidCallback goToNextScreen,
      required VoidCallback goToGameOverScreen}) {
    super.initGameTypeCreator(currentQuestionInfo,
        refreshScreen: refreshScreen,
        goToNextScreen: goToNextScreen,
        goToGameOverScreen: goToGameOverScreen);
    remainingSeconds = startSeconds;
    pressedOperator = null;

    initOperatorAndNrs();

    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (remainingSeconds == 1) {
          timer.cancel();
          answerQuestion(
              IqGameMathQuestionService.notAllAnswersPressedCorrectly
                  .toString(),
              false);
        }
        remainingSeconds--;
        refreshScreen.call();
      },
    );
  }

  void initOperatorAndNrs() {
    Random random = Random();
    operator = operators.elementAt(random.nextInt(operators.length));

    nr1 = random.nextInt(10);
    nr2 = random.nextInt(10);

    var interpret = getNr1Nr2Interpret();
    while (interpret is! int || (nr2 == 0 && operator == "/")) {
      nr1 = random.nextInt(10);
      nr2 = random.nextInt(10);
      interpret = getNr1Nr2Interpret();
    }
  }

  num getNr1Nr2Interpret() {
    return (nr1.toString() + " " + operator! + " " + nr2.toString())
        .interpret();
  }

  @override
  Widget createGameContainer(BuildContext context) {
    var question = currentQuestionInfo.question;
    var margin = SizedBox(
      height: screenDimensionsService.h(2),
      width: screenDimensionsService.dimen(2),
    );
    var questionNr = question.index;

    var nrFontConfig = FontConfig(
        fontWeight: FontWeight.w700,
        borderColor: Colors.black,
        fontSize: FontConfig.getCustomFontSize(1.7),
        fontColor: Colors.white);
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
          createOperationBtn(
              currentQuestionInfo.isQuestionOpen()
                  ? "?"
                  : currentQuestionInfo.status == QuestionInfoStatus.won
                      ? pressedOperator!
                      : operator.toString(),
              true,
              currentQuestionInfo,
              gameContext,
              refreshScreen,
              goToNextScreen,
              nr1!,
              nr2!),
          opMargin,
          MyText(text: nr2.toString(), fontConfig: nrFontConfig),
          opMargin,
          createOperationBtn("=", true, currentQuestionInfo, gameContext,
              refreshScreen, goToNextScreen, nr1!, nr2!),
          opMargin,
          MyText(
              text: getNr1Nr2Interpret().toString(), fontConfig: nrFontConfig),
        ]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createCurrentQuestionNr(questionNr, totalQuestions),
        margin,
        createInfoMyText("Solve the mathematical operation", 1.0),
        margin,
        margin,
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                text: remainingSeconds.toString(),
                fontConfig: FontConfig(
                    fontWeight: FontWeight.w700,
                    borderColor: Colors.black,
                    fontSize: FontConfig.getCustomFontSize(1.7),
                    fontColor: Colors.white),
              ),
              margin,
              imageService.getSpecificImage(
                  imageName: "alarm",
                  imageExtension: "png",
                  maxWidth: screenDimensionsService.dimen(10))
            ]),
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
              createOperationBtns(nr1!, nr2!, currentQuestionInfo, gameContext,
                  refreshScreen, goToNextScreen),
            ],
          ),
        )
      ],
    );
  }

  Widget createOperationBtns(
    int nr1,
    int nr2,
    QuestionInfo currentQuestionInfo,
    IqGameContext gameContext,
    VoidCallback refreshScreen,
    VoidCallback goToNextScreen,
  ) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: operators
            .map((e) => createOperationBtn(e, false, currentQuestionInfo,
                gameContext, refreshScreen, goToNextScreen, nr1, nr2))
            .toList());
  }

  Widget createOperationBtn(
      String operation,
      bool isDisabledOperation,
      QuestionInfo currentQuestionInfo,
      IqGameContext gameContext,
      VoidCallback refreshScreen,
      VoidCallback goToNextScreen,
      int nr1,
      int nr2) {
    var btnSideDimen = screenDimensionsService.dimen(17);
    bool correctAnswerPressed =
        (nr1.toString() + " " + operation + " " + nr2.toString()).interpret() ==
            getNr1Nr2Interpret();
    return MyButton(
      onClick: () {
        int answer;
        pressedOperator = operation;
        if (correctAnswerPressed) {
          answer = IqGameMathQuestionService.allAnswersPressedCorrectly;
        } else {
          answer = IqGameMathQuestionService.notAllAnswersPressedCorrectly;
        }
        answerQuestion(answer.toString(), false);
        timer!.cancel();
        if (correctAnswerPressed) {
          Future.delayed(const Duration(seconds: 1), () {
            goToNextScreen.call();
          });
        }
      },
      textFirstCharUppercase: false,
      disabled: isDisabledOperation || !currentQuestionInfo.isQuestionOpen(),
      disabledBackgroundColor:
          isDisabledOperation && currentQuestionInfo.isQuestionOpen() ||
                  operation == "="
              ? Colors.lightBlueAccent.shade200
              : isDisabledOperation
                  ? currentQuestionInfo.status == QuestionInfoStatus.lost &&
                          operator == operation
                      ? Colors.red.shade400
                      : Colors.green.shade400
                  : null,
      fontConfig: FontConfig(
          fontWeight: FontWeight.w700,
          borderColor: Colors.black,
          fontSize:
              FontConfig.getCustomFontSize(isDisabledOperation ? 1.6 : 1.3),
          fontColor: isDisabledOperation
              ? currentQuestionInfo.status == QuestionInfoStatus.lost &&
                      operator == operation
                  ? Colors.red.shade200
                  : Colors.lightGreenAccent
              : Colors.white),
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
  int getScore() {
    return gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);
  }

  @override
  bool isGameOverOnFirstWrongAnswer() {
    return true;
  }

  @override
  void disposeGameTypeCreator() {
    super.disposeGameTypeCreator();
    timer?.cancel();
    timer = null;
  }
}
