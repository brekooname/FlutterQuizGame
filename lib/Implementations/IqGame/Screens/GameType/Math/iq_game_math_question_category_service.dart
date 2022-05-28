import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/Math/iq_game_math_question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/Math/iq_game_math_question_service.dart';

class IqGameMathCategoryQuestionService extends QuestionCategoryService {
  static final IqGameMathCategoryQuestionService singleton =
      IqGameMathCategoryQuestionService.internal();

  factory IqGameMathCategoryQuestionService() {
    return singleton;
  }

  IqGameMathCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  IqGameMathQuestionService getQuestionService() {
    return IqGameMathQuestionService();
  }

  @override
  IqGameMathQuestionParser getQuestionParser() {
    return IqGameMathQuestionParser();
  }
}
