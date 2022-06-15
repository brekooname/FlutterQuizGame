import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';

import '../../../../../Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import '../../../../../Lib/Screen/Game/quiz_question_container.dart';
import '../../../../../Lib/Screen/Game/quiz_question_manager.dart';
import '../iq_game_game_type_creator.dart';

class IqGameGenKnowGameTypeCreator extends IqGameGameTypeCreator
    with QuizQuestionContainer, QuizOptionsGameScreen {
  IqGameGenKnowGameTypeCreator(IqGameContext gameContext) : super(gameContext);

  @override
  void initGameTypeCreator(QuestionInfo currentQuestionInfo,
      {required VoidCallback refreshScreen,
      required VoidCallback goToNextScreen,
      required VoidCallback goToGameOverScreen}) {
    super.initGameTypeCreator(currentQuestionInfo,
        refreshScreen: refreshScreen,
        goToNextScreen: goToNextScreen,
        goToGameOverScreen: goToGameOverScreen);
    initQuizOptionsScreen(
        IqGameGenKnowQuizQuestionManager(
            gameContext, currentQuestionInfo, iqGameLocalStorage, this),
        currentQuestionInfo,
        questionImage: imageService.getSpecificImage(
            module: gameContext.questionConfig.categories.first.name,
            imageExtension: "jpg",
            imageName: "i" + currentQuestionInfo.question.index.toString()));
  }

  @override
  Widget createGameContainer(BuildContext context) {
    Widget questionContainer =
        createQuestionTextContainer(currentQuestionInfo.question, 1, 5);
    Widget optionsRows = createOptionRows(refreshScreen, goToNextScreen);
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
  void onClickAnswerOptionBtn(Question question, String answerBtnText,
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    iqGameGenKnowGameTypeCreator.answerQuestion(answerBtnText, false);
    if (!isAnswerCorrectInOptionsList(question, answerBtnText)) {
      wrongPressedAnswer.add(answerBtnText);
    }
    Future.delayed(const Duration(seconds: 1), () {
      iqGameGenKnowGameTypeCreator.goToNextScreen.call();
    });
  }
}
