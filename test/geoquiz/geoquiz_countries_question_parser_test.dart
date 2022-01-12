import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/CountriesMultipleOptions/geoquiz_countries_multiple_options_question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/test_util.dart';

void main() {
  test('getAllPossibleAnswersForQuestion is tested', () async {
    await TestUtil.initApp(Language.en, "geoquiz");

    GeoQuizCountryUtils geoQuizCountryUtils = GeoQuizCountryUtils();

    GeoQuizCountriesMultipleOptionsQuestionParser geoQuizCountriesQuestionParser =
    GeoQuizCountriesMultipleOptionsQuestionParser();

    int opt1 = 0;
    int opt2 = 0;
    var triesToTest = 20;
    for (int i = 0; i < triesToTest; i++) {
      Set<String> res =
          geoQuizCountriesQuestionParser.getAnswerOptionsForQuestion(
              "Italy", {"Austria", "Germany"}, {"Switzerland"}, false, 4);

      expect(res.length, 4);
      expect(res.contains("Italy"), false);
      expect(res.contains("Switzerland"), false);
      expect(res.contains("Austria") && res.contains("Germany"), false);
      if (res.contains("Austria")) {
        opt1++;
      }
      if (res.contains("Germany")) {
        opt2++;
      }
    }
    expect(opt1 > 5, true);
    expect(opt2 > 5, true);
    expect(opt1 + opt2, triesToTest);

    for (int i = 0; i < triesToTest; i++) {
      Set<String> res =
          geoQuizCountriesQuestionParser.getAnswerOptionsForQuestion(
              "Italy", {"Austria"}, {"Germany"}, false, 4);

      expect(res.length, 4);
      expect(res.contains("Italy"), false);
      expect(res.contains("Germany"), false);
      expect(res.contains("Austria"), true);

      for (String answ in res) {
        expect(geoQuizCountryUtils.getCountryIndexForName(answ) < 30, true);
      }
    }
  });
}
