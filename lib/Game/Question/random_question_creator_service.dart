import 'dart:math';

import 'package:flutter_app_quiz_game/Util/string_extension.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_config.dart';

import '../game.dart';
import 'QuestionCreator/question_creator.dart';

class RandomQuestionCreatorService {
  Question createRandomQuestion(
      CategoryAndDifficulty categoryAndDifficulty, List<String> rawStrings) {
    int randomLine = Random().nextInt(rawStrings.length);
    return Question(randomLine, categoryAndDifficulty.difficulty,
        categoryAndDifficulty.category, rawStrings[randomLine].capitalize());
  }

  List<Question> createRandomQuestions(
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
      QuestionConfig questionConfig) {
    int questionAmount = questionConfig.amountOfQuestions;
    Set<QuestionCategory> categsToUse = questionConfig.categories;
    Set<QuestionCategory> alreadyUsedCategs = {};
    List<Question> randomQuestions = [];
    for (int i = 0; i < questionAmount; i++) {
      CategoryAndDifficulty randomCategoryAndDifficulty =
          questionConfig.getRandomCategoryAndDifficulty();
      int repeat1 = 0;
      if (!configContainsSingleCategAndDiff(questionConfig)) {
        while (
            alreadyUsedCategs.contains(randomCategoryAndDifficulty.category)) {
          randomCategoryAndDifficulty =
              questionConfig.getRandomCategoryAndDifficulty();
          if (repeat1 > 100) {
            break;
          }
          repeat1++;
        }
      }

      QuestionCreator questionCreator =
          Game.getGameId().gameConfig.getQuestionCreator();
      int repeat2 = 0;
      Question randomQuestion = createRandomQuestion(
          randomCategoryAndDifficulty,
          allQuestionsWithConfig[randomCategoryAndDifficulty] ?? []);
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
        randomQuestion = createRandomQuestion(randomCategoryAndDifficulty,
            allQuestionsWithConfig[randomCategoryAndDifficulty] ?? []);
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
