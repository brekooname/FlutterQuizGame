import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/random_difficulty_category.dart';

import '../game.dart';
import 'QuestionCreator/question_creator.dart';

class RandomQuestionCreatorService {

  List<Question> createRandomQuestions(QuestionConfig questionConfig) {
    int questionAmount = questionConfig.amountOfQuestions;
    List<QuestionCategory> categsToUse = questionConfig.categories;
    List<QuestionCategory> alreadyUsedCategs = [];
    List<Question> randomQuestions = [];
    for (int i = 0; i < questionAmount; i++) {
      RandomCategoryAndDifficulty randomCategoryAndDifficulty =
          questionConfig.getRandomCategoryAndDifficulty();
      int repeat1 = 0;
      if (!configContainsSingleCategAndDiff(questionConfig)) {
        while (alreadyUsedCategs
            .contains(randomCategoryAndDifficulty.questionCategory)) {
          randomCategoryAndDifficulty =
              questionConfig.getRandomCategoryAndDifficulty();
          if (repeat1 > 100) {
            break;
          }
          repeat1++;
        }
      }

      QuestionCreator questionCreator =
          Game.getGameId().gameType.getQuestionCreator();
      int repeat2 = 0;
      Question randomQuestion = questionCreator.createRandomQuestion(
          randomCategoryAndDifficulty.questionDifficulty,
          randomCategoryAndDifficulty.questionCategory);
      while (randomQuestions.contains(randomQuestion) ||
          !questionCreator.isQuestionValid(randomQuestion)
          //try to use all question categories
          ||
          (!configContainsSingleCategAndDiff(questionConfig) &&
              alreadyUsedCategs.contains(randomQuestion.category) &&
              categsToUse.isNotEmpty)) {
        if (repeat2 > 100) {
          break;
        }
        randomQuestion = questionCreator.createRandomQuestion(
            randomCategoryAndDifficulty.questionDifficulty,
            randomCategoryAndDifficulty.questionCategory);
        repeat2++;
      }
      randomQuestions[i] = randomQuestion;
      alreadyUsedCategs.add(randomQuestion.category);
      categsToUse.remove(randomQuestion.category);
    }
    return randomQuestions;
  }

  bool configContainsSingleCategAndDiff(QuestionConfig questionConfig) {
    return questionConfig.difficulties.length == 1 &&
        questionConfig.categories.length == 1;
  }
}
