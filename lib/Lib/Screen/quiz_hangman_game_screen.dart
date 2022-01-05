import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

mixin QuizHangmanGameScreen<TGameContext extends GameContext> {
  ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  MyAudioPlayer _audioPlayer = MyAudioPlayer();
  ImageService _imageService = ImageService();
  late QuestionInfo? currentQuestionInfo;
  late QuestionService _questionService;
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

    if (currentQuestionInfo != null) {
      _questionService = currentQuestionInfo!.question.questionService;
    }
  }

  void onHintButtonClick(VoidCallback refreshSetState) {
    refreshSetState.call();
  }
}
