import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/AllContent/anatomy_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/test_util.dart';

AnatomyGameQuestionConfig questionConfig = AnatomyGameQuestionConfig();
AnatomyQuestionCollectorService collectorService =
    AnatomyQuestionCollectorService();

void main() {
  testWidgets('AnatomyQuestionCollectorService is tested',
      (WidgetTester tester) async {
    await TestUtil.initApp(Language.en, "anatomy", tester);
    questionConfig.categories;
    questionConfig.difficulties;
    testDependentQuestions();
  });
}

void testDependentQuestions() {
  for (QuestionDifficulty diff in [questionConfig.diff1]) {
    for (QuestionCategory cat in [
      questionConfig.cat0,
      questionConfig.cat1,
    ]) {
      List<Question> result =
          collectorService.getAllQuestionsForCategoryAndDifficulty(cat, diff);
      var q1 = result[0];
      expect(q1.correctAnswers, ["Liver"]);
      expect(q1.questionToBeDisplayed,
          "What organ produces bile necessary for digestion?");
      expect(q1.questionService.getCorrectAnswers(q1), ["Liver"]);
      expect(q1.questionService.getQuizAnswerOptions(q1), ["Liver"]);
      expect(q1.questionService.getQuestionToBeDisplayed(q1),
          "What organ produces bile necessary for digestion?");
      var q2 = result[1];
      expect(q2.correctAnswers, ["Mouth"]);
      expect(q2.questionToBeDisplayed,
          "Through which organ food passes from the pharynx to the stomach?");
    }
  }
}
