import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

mixin QuizHangmanGameScreen<TGameContext extends GameContext> {
  ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  MyAudioPlayer _audioPlayer = MyAudioPlayer();
  ImageService _imageService = ImageService();
  HangmanCategoryQuestionService _hangmanService =
      HangmanCategoryQuestionService();
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
          text: _hangmanService.getQuestionService().getCurrentWordState(
              currentQuestionInfo!.question.questionToBeDisplayed,
              currentQuestionInfo!.pressedAnswers),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget createLettersRows(
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    int nrOfRowsWithLetters = 5;

    List<String> allLetters =
        label.l_a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z.split(",");

    int answerIndex = 0;
    List<Row> allRows = [];
    for (int i = nrOfRowsWithLetters; i >= 0; i--) {
      List<MyButton> rowButtons = [];
      for (int j = 0;
          j < _getNrOfAnswersOnRow(allLetters.length, nrOfRowsWithLetters);
          j++) {
        if (answerIndex < allLetters.length) {
          MyButton button = _createHangmanButton(
              allLetters.elementAt(answerIndex),
              refreshSetState,
              goToNextScreenAfterPress);
          rowButtons.add(button);
          answerIndex++;
        }
      }
      allRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rowButtons,
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: allRows,
    );
  }

  MyButton _createHangmanButton(
    String btnLetter,
    VoidCallback refreshSetState,
    VoidCallback goToNextScreenAfterPress,
  ) {
    var questionService = _hangmanService.getQuestionService();
    var question = currentQuestionInfo!.question;
    var btnSide = _screenDimensions.w(12);
    return MyButton(
      onClick: () {
        if (!questionService.isGameFinishedSuccessful(
            question, currentQuestionInfo!.pressedAnswers)) {
          currentQuestionInfo!.addPressedAnswer(btnLetter);
          if (questionService.isAnswerCorrectInQuestion(question, btnLetter)) {
            _audioPlayer.playSuccess();
            if (questionService.isGameFinishedSuccessful(
                question, currentQuestionInfo!.pressedAnswers)) {
              gameContext.gameUser.setWonQuestion(currentQuestionInfo!);
              quizGameLocalStorage
                  .setWonQuestion(currentQuestionInfo!.question);
              Future.delayed(Duration(milliseconds: 1100),
                  () => goToNextScreenAfterPress.call());
            }
          } else {
            _audioPlayer.playFail();
          }
          refreshSetState.call();
        }
      },
      disabled: currentQuestionInfo!.pressedAnswers.contains(btnLetter),
      allPadding: _screenDimensions.w(2),
      text: btnLetter,
      size: Size(btnSide, btnSide),
    );
  }

  int _getNrOfAnswersOnRow(int nrOfAllLetters, int nrOfRowsWithLetters) {
    return (nrOfAllLetters / nrOfRowsWithLetters).ceil();
  }

  void onHintButtonClick(VoidCallback refreshSetState) {
    refreshSetState.call();
  }
}
