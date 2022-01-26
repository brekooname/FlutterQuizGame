import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

class Question {
  final int _index;
  final QuestionDifficulty _difficulty;
  final QuestionCategory _category;
  final String _rawString;

  Question(this._index, this._difficulty, this._category, this._rawString);

  int get index => _index;

  QuestionDifficulty get difficulty => _difficulty;

  QuestionCategory get category => _category;

  String get rawString => _rawString;

  QuestionService get questionService =>
      _category.getQuestionCategoryService(_difficulty).getQuestionService();

  String get questionToBeDisplayed =>
      questionService.getQuestionToBeDisplayed(this).capitalized;

  List<String> get correctAnswers => questionService.getCorrectAnswers(this);

  String get questionPrefixToBeDisplayed =>
      questionService.getPrefixToBeDisplayedForQuestion(this).capitalized;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question &&
          runtimeType == other.runtimeType &&
          _index == other._index &&
          _difficulty == other._difficulty &&
          _category == other._category &&
          _rawString == other._rawString;

  @override
  int get hashCode =>
      _index.hashCode ^
      _difficulty.hashCode ^
      _category.hashCode ^
      _rawString.hashCode;

  @override
  String toString() {
    return 'Question{_index: $_index, _difficulty: $_difficulty, _category: $_category, _rawString: $_rawString}';
  }
}
