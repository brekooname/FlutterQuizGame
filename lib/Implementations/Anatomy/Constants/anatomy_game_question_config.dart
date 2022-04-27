import 'dart:collection';
import 'dart:ui';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

class AnatomyGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;
  late QuestionCategory cat5;
  late QuestionCategory cat6;
  late QuestionCategory cat7;
  late QuestionCategory cat8;
  late QuestionCategory cat9;
  late QuestionCategory cat10;
  late QuestionCategory cat11;

  late QuestionDifficulty diff0;
  late QuestionDifficulty diff1;
  late QuestionDifficulty diff2;
  late QuestionDifficulty diff3;
  late QuestionDifficulty diff4;

  late Map<QuestionCategory, Size> categoryDiagramImgDimen;

  static final AnatomyGameQuestionConfig singleton =
      AnatomyGameQuestionConfig.internal();

  factory AnatomyGameQuestionConfig() {
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
      singleton.diff1 = QuestionDifficulty(index: 1),
      singleton.diff2 = QuestionDifficulty(index: 2),
      singleton.diff3 = QuestionDifficulty(index: 3),
      singleton.diff4 = QuestionDifficulty(index: 4),
    ];
    //
    //
    var questionCategoryServiceMap = {
      singleton.diff0: ImageClickCategoryQuestionService(),
      singleton.diff1: DependentAnswersCategoryQuestionService(),
      singleton.diff2: DependentAnswersCategoryQuestionService(),
      singleton.diff3: DependentAnswersCategoryQuestionService(),
      singleton.diff4: DependentAnswersCategoryQuestionService(),
    };
    var staticLabel = LabelMixin.staticLabel;
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_organs),
      singleton.cat1 = QuestionCategory(
          index: 1,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_bones),
      singleton.cat2 = QuestionCategory(
          index: 2,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_muscles),
      singleton.cat3 = QuestionCategory(
          index: 3,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_circulatory_system),
      singleton.cat4 = QuestionCategory(
          index: 4,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_nervous_system),
      singleton.cat5 = QuestionCategory(
          index: 5,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_mouth),
      singleton.cat6 = QuestionCategory(
          index: 6,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_brain),
      singleton.cat7 = QuestionCategory(
          index: 7,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_ear),
      singleton.cat8 = QuestionCategory(
          index: 8,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_heart),
      singleton.cat9 = QuestionCategory(
          index: 9,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_eye),
      singleton.cat10 = QuestionCategory(
          index: 10,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_cell),
      singleton.cat11 = QuestionCategory(
          index: 11,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: staticLabel.l_chemical_elements_of_the_human_body),
    ];
    singleton.categoryDiagramImgDimen = {
      singleton.cat0: const Size(252, 580),
      singleton.cat1: const Size(252, 580),
      singleton.cat2: const Size(252, 580),
      singleton.cat3: const Size(253, 580),
      singleton.cat4: const Size(252, 580),
      singleton.cat5: const Size(320, 580),
      singleton.cat6: const Size(341, 341),
      singleton.cat7: const Size(396, 396),
      singleton.cat8: const Size(400, 400),
      singleton.cat9: const Size(316, 316),
      singleton.cat10: const Size(400, 383),
      singleton.cat11: const Size(300, 628),
    };
    return singleton;
  }

  AnatomyGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();

    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            category: cat11, difficulty: diff0, prefixCode: 0),
        () => label
            .l_what_percentage_of_this_chemical_element_is_found_in_the_human_body);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            difficulty: diff1, prefixCode: 0),
        () => label.l_general_knowledge);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            difficulty: diff2, prefixCode: 0),
        () => label.l_diseases);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            difficulty: diff3, prefixCode: 0),
        () => label.l_symptoms);

    //
    //Trivia images
    //
    Map<QuestionCategory, String> prefixes = {
      cat0: label.l_identify_this_organ,
      cat1: label.l_identify_this_bone,
      cat2: label.l_identify_this_muscle,
      cat3: label.l_identify_this_part_of_the_circulatory_system,
      cat4: label.l_identify_this_part_of_the_nervous_system,
      cat5: label.l_identify_this_part_of_the_the_mouth,
      cat6: label.l_identify_this_part_of_the_brain,
      cat7: label.l_identify_this_part_of_the_ear,
      cat8: label.l_identify_this_part_of_the_heart,
      cat9: label.l_identify_this_part_of_the_eye,
      cat10: label.l_identify_this_part_of_the_cell,
      cat11: label.l_identify_this_chemical_element,
    };
    for (MapEntry<QuestionCategory, String> e in prefixes.entries) {
      res.putIfAbsent(
          QuestionCategoryDifficultyWithPrefixCode(
              category: e.key, difficulty: diff4, prefixCode: 0),
          () => e.value);
    }
    return res;
  }
}
