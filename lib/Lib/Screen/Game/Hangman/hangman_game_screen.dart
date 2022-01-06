import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_service.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../main.dart';

mixin HangmanGameScreen<TGameContext extends GameContext> {
  ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  MyAudioPlayer _audioPlayer = MyAudioPlayer();
  ImageService _imageService = ImageService();
  HangmanCategoryQuestionService _hangmanCategoryQuestionService =
      HangmanCategoryQuestionService();
  HangmanService _hangmanService = HangmanService();
  late QuestionInfo? currentQuestionInfo;
  late QuizGameLocalStorage quizGameLocalStorage;
  late TGameContext gameContext;
  String? wrongPressedAnswer;
  Set<String> hintDisabledPossibleAnswers = HashSet();

  void initQuizHangmanScreen(
      TGameContext gameContext,
      QuizGameLocalStorage quizGameLocalStorage,
      QuestionDifficulty difficulty,
      QuestionCategory category) {
    this.quizGameLocalStorage = quizGameLocalStorage;
    this.gameContext = gameContext;
    currentQuestionInfo =
        gameContext.gameUser.getRandomQuestion(difficulty, category);
  }

  AppLocalizations get label => MyApp.appLocalizations;

  Widget getHangmanWordContainer() {
    if (currentQuestionInfo != null) {
      return Container(
        height: _screenDimensions.h(15),
        child: MyText(
          maxLines: 1,
          width: _screenDimensions.w(98),
          fontSize: FontConfig.bigFontSize,
          text: _hangmanService.getCurrentWordState(
              currentQuestionInfo!.question.questionToBeDisplayed,
              currentQuestionInfo!.pressedAnswers),
        ),
      );
    } else {
      return Container();
    }
  }

  void clickAnswerBtn(String btnLetter, VoidCallback goToNextScreenAfterPress,
      VoidCallback refreshSetState) {
    var questionService = _hangmanCategoryQuestionService.getQuestionService();
    var question = currentQuestionInfo!.question;
    if (!questionService.isGameFinishedSuccessful(
        question, currentQuestionInfo!.pressedAnswers)) {
      currentQuestionInfo!.addPressedAnswer(btnLetter);
      if (questionService.isAnswerCorrectInQuestion(question, btnLetter)) {
        _audioPlayer.playSuccess();
        if (questionService.isGameFinishedSuccessful(
            question, currentQuestionInfo!.pressedAnswers)) {
          gameContext.gameUser.setWonQuestion(currentQuestionInfo!);
          quizGameLocalStorage.setWonQuestion(currentQuestionInfo!.question);
          Future.delayed(Duration(milliseconds: 1100),
              () => goToNextScreenAfterPress.call());
        }
      } else {
        _audioPlayer.playFail();
      }
      refreshSetState.call();
    }
  }

  void onHintButtonClick(VoidCallback refreshSetState) {
    refreshSetState.call();
  }
}
