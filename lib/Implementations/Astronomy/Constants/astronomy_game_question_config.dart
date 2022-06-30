import 'dart:collection';
import 'dart:ui';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

import '../../../Game/Question/QuestionCategoryService/ImageClick/image_click_question_category_service.dart';

class AstronomyGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  late QuestionCategory cat0;

  late QuestionDifficulty diff0;

  late Map<QuestionCategory, Size> categoryDiagramImgDimen;
  static final AstronomyGameQuestionConfig singleton =
      AstronomyGameQuestionConfig.internal();

  factory AstronomyGameQuestionConfig() {
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
    ];
    //
    //
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          questionCategoryService: ImageClickCategoryQuestionService())
    ];

    singleton.categoryDiagramImgDimen = {
      singleton.cat0: const Size(401, 609),
    };
    return singleton;
  }

  AstronomyGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();
    return res;
  }
}
