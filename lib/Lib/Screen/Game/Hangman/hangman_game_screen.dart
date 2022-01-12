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
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final MyAudioPlayer _audioPlayer = MyAudioPlayer();
  final ImageService _imageService = ImageService();
  final HangmanCategoryQuestionService _hangmanCategoryQuestionService =
      HangmanCategoryQuestionService();
  final HangmanService _hangmanService = HangmanService();
  late QuestionInfo _currentQuestionInfo;
  late QuizGameLocalStorage quizGameLocalStorage;
  late TGameContext _gameContext;
  String? wrongPressedAnswer;
  Set<String> hintDisabledPossibleAnswers = HashSet();

  void initQuizHangmanScreen(
      TGameContext gameContext,
      QuizGameLocalStorage quizGameLocalStorage,
      QuestionDifficulty difficulty,
      QuestionCategory category) {
    this.quizGameLocalStorage = quizGameLocalStorage;
    this._gameContext = gameContext;
    _currentQuestionInfo =
        gameContext.gameUser.getRandomQuestion(difficulty, category);
  }

  AppLocalizations get label => MyApp.appLocalizations;

  Widget getHangmanWordContainer() {
    return SizedBox(
      height: _screenDimensions.h(15),
      child: MyText(
        maxLines: 1,
        width: _screenDimensions.w(98),
        fontSize: FontConfig.bigFontSize,
        text: _hangmanService.getCurrentWordState(
            _currentQuestionInfo.question.questionToBeDisplayed,
            _currentQuestionInfo.pressedAnswers),
      ),
    );
  }

  void clickAnswerBtn(String btnLetter, VoidCallback goToNextScreenAfterPress,
      VoidCallback refreshSetState) {
    var questionService = _hangmanCategoryQuestionService.getQuestionService();
    var question = _currentQuestionInfo.question;
    if (!questionService.isGameFinishedSuccessful(
        question, _currentQuestionInfo.pressedAnswers)) {
      _currentQuestionInfo.addPressedAnswer(btnLetter);
      if (questionService.isAnswerCorrectInQuestion(question, btnLetter)) {
        _audioPlayer.playSuccess();
        if (questionService.isGameFinishedSuccessful(
            question, _currentQuestionInfo.pressedAnswers)) {
          _gameContext.gameUser.setWonQuestion(_currentQuestionInfo);
          quizGameLocalStorage.setWonQuestion(_currentQuestionInfo.question);
          Future.delayed(const Duration(milliseconds: 1100),
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
