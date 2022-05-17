import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import '../../../Game/Question/Model/question_info.dart';
import '../../../main.dart';

class IqGameContextService {
  IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();

  static final IqGameContextService singleton = IqGameContextService.internal();

  factory IqGameContextService() {
    return singleton;
  }

  IqGameContextService.internal();

  IqGameContext createGameContext(CampaignLevel campaignLevel) {
    var category = campaignLevel.categories.first;
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            0,
            MyApp.appId.gameConfig.questionCollectorService
                .getAllQuestions(categories: [category]));

    Map<String, Iterable<String>> answeredQuestions =
        iqGameLocalStorage.getAnsweredQuestions(category);
    if (answeredQuestions.isNotEmpty) {
      for (QuestionInfo info in gameContext.gameUser.getOpenQuestions()) {
        var qIndex = info.question.index.toString();
        if (answeredQuestions.containsKey(qIndex)) {
          gameContext.gameUser.addAnswerToQuestionInfo(info.question,
              answeredQuestions.get<String, Iterable<String>>(qIndex)!.first);
        }
      }
    }

    var iqGameContext = IqGameContext(gameContext);
    return iqGameContext;
  }
}
