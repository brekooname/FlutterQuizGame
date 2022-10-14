import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';

import '../../../../../Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import '../../../../../Lib/Screen/Game/Options/quiz_question_container.dart';
import '../../../../../Lib/Screen/Game/Options/quiz_question_manager.dart';
import '../iq_game_game_type_creator.dart';

class IqGameGenKnowGameTypeCreator extends IqGameGameTypeCreator
    with QuizOptionsGameScreen {
  final QuizQuestionContainer _quizQuestionContainer = QuizQuestionContainer();

  IqGameGenKnowGameTypeCreator(IqGameContext gameContext) : super(gameContext);

  @override
  void initGameTypeCreator(QuestionInfo currentQuestionInfo,
      {required VoidCallback refreshState,
        required VoidCallback restartCurrentScreenAfterExtraContentPurchase,
        required VoidCallback goToNextScreen,
        required VoidCallback goToGameOverScreen}) {
    super.initGameTypeCreator(currentQuestionInfo,
        refreshState: refreshState,
        restartCurrentScreenAfterExtraContentPurchase: restartCurrentScreenAfterExtraContentPurchase,
        goToNextScreen: goToNextScreen,
        goToGameOverScreen: goToGameOverScreen);
    initQuizOptionsScreen(
        IqGameGenKnowQuizQuestionManager(
            gameContext, currentQuestionInfo, iqGameLocalStorage, this),
        questionImage: imageService.getSpecificImage(
            module: gameContext.questionConfig.categories.first.name,
            imageExtension: "jpg",
            imageName: "i" + currentQuestionInfo.question.index.toString()));
  }

  @override
  Widget createGameContainer(BuildContext context) {
    Widget questionContainer = _quizQuestionContainer
        .createQuestionTextContainer(currentQuestionInfo.question, 1, 3);
    Widget optionsRows = createOptionRows(refreshState, goToNextScreen,
        questionImageHeightPercent: 33);
    int totalQuestions = gameContext.gameUser.getAllQuestions([]).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        createCurrentQuestionNr(
            gameContext.gameUser
                .getAllQuestions([]).indexOf(currentQuestionInfo),
            totalQuestions),
        questionContainer,
        optionsRows
      ],
    );
  }

  @override
  Widget createGameContainerWithDecoration(BuildContext context) {
    return createGameContainer(context);
  }

  @override
  int getScore() {
    return gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);
  }

  @override
  bool isGameOverOnFirstWrongAnswer() {
    return false;
  }
}

class IqGameGenKnowQuizQuestionManager
    extends QuizQuestionManager<IqGameContext, IqGameLocalStorage> {
  IqGameGenKnowGameTypeCreator iqGameGenKnowGameTypeCreator;

  IqGameGenKnowQuizQuestionManager(
      IqGameContext gameContext,
      QuestionInfo currentQuestionInfo,
      IqGameLocalStorage quizGameLocalStorage,
      this.iqGameGenKnowGameTypeCreator)
      : super(gameContext, currentQuestionInfo, quizGameLocalStorage);

  @override
  void onClickAnswerOptionBtn(String answerBtnText,
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    iqGameGenKnowGameTypeCreator.answerQuestion(answerBtnText, false);
    if (!isAnswerCorrectInOptionsList(answerBtnText)) {
      wrongPressedAnswer.add(answerBtnText);
    }
    Future.delayed(const Duration(seconds: 1), () {
      iqGameGenKnowGameTypeCreator.goToNextScreen.call();
    });
  }
}
