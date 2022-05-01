import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/AllContent/history_all_questions.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/test_util.dart';

void main() {
  testWidgets('GameContext is tested', (WidgetTester tester) async {
    await TestUtil.initApp("history", Language.en, tester);
    GameContextService gameContextService = GameContextService();

    var config = HistoryGameQuestionConfig();
    List<QuestionCategory> cats = [config.cat0, config.cat1, config.cat2];
    var questions = getQuestions(cats.elementAt(0));
    questions.addAll(getQuestions(cats.elementAt(1)));
    questions.addAll(getQuestions(cats.elementAt(2)));

    GameContext gameContext =
        gameContextService.createGameContextWithQuestions(questions);

    expect(questions.length > 20, true);
    expect(questions.map((e) => e.category).toSet().length == 3, true);
    expect(questions.map((e) => e.difficulty).toSet().length == 1, true);
    var gameUser = gameContext.gameUser;

    expect(gameUser.getOpenQuestions().length, questions.length);
    expect(
        gameUser
            .getOpenQuestions()
            .where((element) => element.questionAnsweredAt == null)
            .length,
        questions.length);
    expect(gameUser.getMostRecentAnsweredQuestion(), null);

    gameUser.setWonQuestion(gameUser.getOpenQuestions().first);
    var wonQuestions = gameUser.getAllQuestions([QuestionInfoStatus.won]);
    var wonQuestion = wonQuestions.first;
    expect(wonQuestions.length, 1);
    expect(wonQuestion.status, QuestionInfoStatus.won);
    expect(wonQuestion.questionAnsweredAt != null, true);
    expect(gameUser.getOpenQuestions().length, questions.length - 1);
    expect(gameUser.getMostRecentAnsweredQuestion()!.question.index,
        wonQuestion.question.index);
    expect(
        gameUser.getMostRecentAnsweredQuestion(
            questionInfoStatus: [QuestionInfoStatus.open]),
        null);
    expect(
        gameUser.getMostRecentAnsweredQuestion(
            questionInfoStatus: [QuestionInfoStatus.lost]),
        null);
    expect(
        gameUser.getMostRecentAnsweredQuestion(
                questionInfoStatus: [QuestionInfoStatus.won]) !=
            null,
        true);

    int cat0found = 0;
    int cat1found = 0;
    int cat2found = 0;
    expect(wonQuestion.question.category, config.cat0);
    for (int i = 0; i < 100; i++) {
      var cat = gameUser.getNotPlayedRandomQuestionCategory();
      if (cat == config.cat0) {
        cat0found++;
      } else if (cat == config.cat1) {
        cat1found++;
      } else if (cat == config.cat2) {
        cat2found++;
      }
    }
    expect(cat0found == 0, true);
    expect(cat1found > 20, true);
    expect(cat2found > 20, true);

    gameUser.setLostQuestion(gameUser.getOpenQuestions().first);
    expect(gameUser.getOpenQuestions().length, questions.length - 2);
    var lostQuestions = gameUser.getAllQuestions([QuestionInfoStatus.lost]);
    var lostQuestion = lostQuestions.first;
    expect(lostQuestions.length, 1);
    expect(lostQuestion.status, QuestionInfoStatus.lost);
    expect(lostQuestion.questionAnsweredAt != null, true);
    expect(gameUser.getMostRecentAnsweredQuestion()!.question.index,
        lostQuestion.question.index);

    gameUser.resetQuestion(
        gameUser.getAllQuestions([QuestionInfoStatus.lost]).first);
    expect(gameUser.getOpenQuestions().length, questions.length - 1);
    expect(gameUser.getAllQuestions([QuestionInfoStatus.lost]).length, 0);
    expect(lostQuestion.status, QuestionInfoStatus.open);
    expect(lostQuestion.questionAnsweredAt != null, true);
    expect(gameUser.getMostRecentAnsweredQuestion()!.question.index,
        lostQuestion.question.index);
  });
}

List<Question> getQuestions(QuestionCategory cat) {
  return HistoryAllQuestions()
      .allQuestions
      .get<CategoryDifficulty, List<Question>>(
          CategoryDifficulty(cat, HistoryGameQuestionConfig().diff0))!;
}
