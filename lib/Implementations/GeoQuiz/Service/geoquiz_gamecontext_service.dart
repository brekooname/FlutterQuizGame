import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
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
    int questionsToInclude = 5;

    var questions =
        _questionCollectorService.getAllQuestionsForCategoriesAndDifficulties(
      [campaignLevel.difficulty],
      campaignLevel.category,
    );
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            1, questions.sublist(0, questionsToInclude));
    return GeoQuizGameContext(gameContext);
  }
}
