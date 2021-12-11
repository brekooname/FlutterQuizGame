import 'dart:math';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../../main.dart';
import 'QuestionCategoryService/question_parser.dart';

class RandomQuestionCreatorService {
  static final RandomQuestionCreatorService singleton =
      RandomQuestionCreatorService.internal();

  factory RandomQuestionCreatorService() {
    return singleton;
  }

  RandomQuestionCreatorService.internal();

  Question createRandomQuestion(CategoryDifficulty categoryAndDifficulty,
      List<Question> allQuestionsWithConfig) {
    int randomLine = Random().nextInt(allQuestionsWithConfig.length);
    return Question(
        randomLine,
        categoryAndDifficulty.difficulty,
        categoryAndDifficulty.category,
        allQuestionsWithConfig[randomLine].rawString.capitalize());
  }

  List<Question> createRandomQuestions(QuestionConfig questionConfig) {
    int questionAmount = questionConfig.amountOfQuestions;
    Set<QuestionCategory> categsToUse = questionConfig.categories;
    Set<QuestionCategory> alreadyUsedCategs = {};
    List<Question> randomQuestions = [];
    for (int i = 0; i < questionAmount; i++) {
      CategoryDifficulty randomCategoryAndDifficulty =
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

      QuestionParser questionParser = randomCategoryAndDifficulty
          .category.questionCategoryService
          .getQuestionParser();
      int repeat2 = 0;
      var allQuestionsWithConfig =
          MyApp.appId.gameConfig.allQuestionsService.allQuestions;
      Question randomQuestion = createRandomQuestion(
          randomCategoryAndDifficulty,
          allQuestionsWithConfig.get<CategoryDifficulty, List<Question>>(
                  randomCategoryAndDifficulty) ??
              []);
      while (randomQuestions.contains(randomQuestion) ||
          !questionParser.isQuestionValid(randomQuestion)
          //try to use all question categories
          ||
          (!configContainsSingleCategAndDiff(questionConfig) &&
              alreadyUsedCategs.contains(randomQuestion.category) &&
              categsToUse.isNotEmpty)) {
        if (repeat2 > 100) {
          break;
        }
        randomQuestion = createRandomQuestion(
            randomCategoryAndDifficulty,
            allQuestionsWithConfig.get<CategoryDifficulty, List<Question>>(
                    randomCategoryAndDifficulty) ??
                []);
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
