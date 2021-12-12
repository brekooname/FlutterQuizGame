
import '../question_parser.dart';

class UniqueAnswersQuestionParser extends QuestionParser {

  static final UniqueAnswersQuestionParser singleton = UniqueAnswersQuestionParser.internal();

  factory UniqueAnswersQuestionParser() {
    return singleton;
  }

  UniqueAnswersQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    return [questionString.split("::")[2].trim()];
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    return questionRawString.split("::")[0];
  }
}
