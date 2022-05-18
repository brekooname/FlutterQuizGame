import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';

import 'iq_game_number_seq_question_parser.dart';
import 'iq_game_number_seq_question_service.dart';

class IqGameNumberSeqCategoryQuestionService extends QuestionCategoryService {
  static final IqGameNumberSeqCategoryQuestionService singleton =
      IqGameNumberSeqCategoryQuestionService.internal();

  factory IqGameNumberSeqCategoryQuestionService() {
    return singleton;
  }

  IqGameNumberSeqCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  IqGameNumberSeqQuestionService getQuestionService() {
    return IqGameNumberSeqQuestionService();
  }

  @override
  IqGameNumberSeqQuestionParser getQuestionParser() {
    return IqGameNumberSeqQuestionParser();
  }
}
