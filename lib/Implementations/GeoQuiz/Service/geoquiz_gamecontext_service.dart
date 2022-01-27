import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

import '../../../main.dart';

class GeoQuizGameContextService {
  static const int numberOfQuestionsPerGame = 10;
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();

  static final GeoQuizGameContextService singleton =
      GeoQuizGameContextService.internal();

  factory GeoQuizGameContextService() {
    return singleton;
  }

  GeoQuizGameContextService.internal();

  GeoQuizGameContext createGameContext(CampaignLevel campaignLevel) {
    List<Question> questions = getNotWonQuestions(campaignLevel);
    if (questions.length < numberOfQuestionsPerGame) {
      _geoQuizLocalStorage.resetLevelQuestions(campaignLevel.difficulty);
      questions = getNotWonQuestions(campaignLevel);
    }

    questions.shuffle();
    questions = questions.sublist(0, numberOfQuestionsPerGame);

    var amountAvailableHints = MyApp.isExtraContentLocked ? 3 : 6;
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            amountAvailableHints, questions);

    return GeoQuizGameContext(gameContext);
  }

  List<Question> getNotWonQuestions(CampaignLevel campaignLevel) {
    List<QuestionKey> wonQuestions =
        _geoQuizLocalStorage.getWonQuestionsForDiff(campaignLevel.difficulty);

    return MyApp.appId.gameConfig.questionCollectorService
        .getAllQuestionsForCategoriesAndDifficulties(
          [campaignLevel.difficulty],
          campaignLevel.category,
        )
        .where((q) => !wonQuestions
            .contains(QuestionKey(q.category, q.difficulty, q.index)))
        .toList();
  }
}
