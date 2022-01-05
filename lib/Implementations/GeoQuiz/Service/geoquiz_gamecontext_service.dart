
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/main.dart';

class GeoQuizGameContextService {
  GeoQuizLocalStorage geoQuizLocalStorage = GeoQuizLocalStorage();
  final QuestionCollectorService _questionCollectorService =
      QuestionCollectorService();

  static final GeoQuizGameContextService singleton =
      GeoQuizGameContextService.internal();

  factory GeoQuizGameContextService() {
    return singleton;
  }

  GeoQuizGameContextService.internal();

  GeoQuizGameContext createGameContext(CampaignLevel campaignLevel) {
    List<String> wonQuestions =
        geoQuizLocalStorage.getWonQuestions(campaignLevel.difficulty);
    var questions =
        _questionCollectorService.getAllQuestionsForCategoriesAndDifficulties(
      [campaignLevel.difficulty],
      campaignLevel.category,
    ).where((q) {
      var questionStorageKey = geoQuizLocalStorage.getQuestionStorageKey(
          q.category, q.difficulty, q.index);
      return !wonQuestions.contains(questionStorageKey);
    }).toList();
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            calculateNrOfHints(questions.length, campaignLevel), questions);
    return GeoQuizGameContext(gameContext);
  }

  int calculateNrOfHints(int totalNrOfQuestions, CampaignLevel campaignLevel) {
    int currentHints =
        geoQuizLocalStorage.getRemainingHints(campaignLevel.difficulty);
    if (currentHints == -1) {
      geoQuizLocalStorage.setRemainingHints(campaignLevel.difficulty,
          (totalNrOfQuestions / (MyApp.isExtraContentLocked ? 11 : 4)).ceil());
    }
    return geoQuizLocalStorage.getRemainingHints(campaignLevel.difficulty);
  }
}
