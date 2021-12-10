import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Screens/history_game_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Screens/history_game_timeline_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';

import 'history_gamecontext_service.dart';

class HistoryGameScreenManager {
  late GameContext gameContext;
  static final HistoryGameScreenManager singleton =
      HistoryGameScreenManager.internal();

  factory HistoryGameScreenManager({required GameContext gameContext}) {
    singleton.gameContext = gameContext;
    return singleton;
  }

  HistoryGameScreenManager.internal();

  // void showScreen(QuestionCategory category) {
  //   QuestionCategory category = _notPlayedRandomQuestionCategory;
  //   StatefulWidget goToScreen;
  //
  //   var questionConfig = HistoryGameQuestionConfig();
  //   if ([questionConfig.cat0, questionConfig.cat1].contains(category)) {
  //     goToScreen = HistoryGameTimelineScreen(
  //       gameContext:
  //           HistoryGameContextService().createGameContext(campaignLevel),
  //       difficulty: campaignLevel.difficulty,
  //       category: category,
  //     );
  //   } else {
  //     goToScreen = HistoryGameQuestionScreen(
  //       gameContext:
  //           HistoryGameContextService().createGameContext(campaignLevel),
  //       difficulty: campaignLevel.difficulty,
  //       category: category,
  //     );
  //   }
  //   NavigatorService().goTo(context, goToScreen, () {
  //     setState(() {});
  //   });
  // }

  QuestionCategory get _notPlayedRandomQuestionCategory {
    var availableCategories = gameContext.gameUser
        .getAllQuestions([QuestionInfoStatus.OPEN])
        .map((e) => e.question.category)
        .toList();

    if (availableCategories.isEmpty) {
      //GAME OVER
      return availableCategories.first;
    } else if (availableCategories.length == 1) {
      return availableCategories.first;
    } else {
      var playedQuestions = gameContext.gameUser
          .getAllQuestions([QuestionInfoStatus.WON, QuestionInfoStatus.LOST])
          .where((element) => element.questionAnsweredAt != null)
          .toList();

      playedQuestions.sort(
          (a, b) => a.questionAnsweredAt!.compareTo(b.questionAnsweredAt!));

      var mostRecentPlayedCategory = playedQuestions.first.question.category;

      availableCategories.remove(mostRecentPlayedCategory);
      availableCategories.shuffle();

      return availableCategories.first;
    }
  }
}
