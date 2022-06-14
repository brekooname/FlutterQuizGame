import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class IqGameAllQuestions extends AllQuestionsService {
  static final IqGameAllQuestions singleton = IqGameAllQuestions.internal();

  factory IqGameAllQuestions() {
    return singleton;
  }

  IqGameAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = IqGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();

    addEN(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        [
          "question_mark_orange,9,90.9,50###e5f1ff###1 * 3 = 3###3 * 3 = 9###9 * 3 = 27###27 * 3 = 81###81 * 3 = 243",
          "question_mark_blue,11,76.4,20###ffc330###9 / 3 = 3###6 / 2 = 3###8 / 4 = 2",
          "question_mark_orange,9,79.8,18.9###97238e###7 - 5 = 2###9 - 6 = 3###8 - 3 = 5",
          "question_mark_blue,6,27,10.44###0ebdbc###1 + 1 = 2###2 + 1 = 3###3 + 2 = 5###5 + 1 = 6###6 + 4 = 10",
          "question_mark_orange,8,62.8,17.16###ffffff###14 + 9 + 6 + 2 = 31###5 + 11 + 4 + 11 = 31###13 + 8 + 7 + 3 = 31",
          "question_mark_orange,12,83.1,49###5c6bc0###0² * 2 = 0###1² * 2 = 2###2² * 2 = 8###3² * 2 = 18###4² * 2 = 32",
          "question_mark_orange,6,56,25.3###595fe4### - 2 + 5 = 3### - 4 + 5 = 1### - 7 + 9 = 2### - 6 + 11 = 5### - 1 + 10 = 9",
          "question_mark_orange,8,69.5,12.6###007994###8 - 2 = 6###9 - 4 = 5###7 - 3 = 4###9 - 6 = 3###8 - 6 = 2###4 - 3 = 1",
          "question_mark_blue,10,82.7,14.85###ff7f26###(6 * 2) + 4 = 16###(16 * 2) + 4 = 36###(36 * 2) + 4 = 76###(76 * 2) + 4 = 156###(156 * 2) + 4 = 316###(316 * 2) + 4 = 636",
          "question_mark_blue,10,78.1,15.8###ea5a79###(2 * 11) - 2 = 20###(4 * 9) - 4 = 32###(7 * 8) - 7 = 49###(4 * 10) - 4 = 36",
          "question_mark_blue,9,50,28.37###7cb342###2 + 3 = 5###5 + 3 = 8###8 + 3 = 11###7 + 4 = 11###11 + 4 = 15###15 + 4 = 19###1 + 6 = 7###7 + 6 = 13###13 + 6 = 19",
          "question_mark_blue,8,68.6,10.5###feaec9###G = 7###P = 16###S = 19###I = 9###Q = 17###E = 5###G + P = 7 + 16 = 23###S + I = 19 + 9 = 28###Q + E = 17 + 5 = 22",
          "question_mark_orange,6,49.2,43.4###23b14d###(5 + 3) * 3 = 24###(4 + 2) * 5 = 30###(1 + 2) * 14 = 42",
          "question_mark_orange,11,23.12,60.63###4caf50###25 + 27 = 52###23 + 30 = 53###21 + 33 = 54###36 + 19 = 55",
          "question_mark_blue,9,52.8,92.8###f9981d###(4 * 2) + 7 = 15###(7 * 2) + 15 = 29###(15 * 2) + 29 = 59###(29 * 2) + 59 = 117###(59 * 2) + 117 = 235###(117 * 2) + 235 = 469",
          "question_mark_orange,8,75.6,23.2###001998###4 * 2 + 2 = 10###1 * 2 + 2 = 4###3 * 2 + 2 = 8###10 * 2 + 2 = 22###4 * 2 + 2 = 10###8 * 2 + 2 = 18###22 * 2 + 2 = 46###10 * 2 + 2 = 22###18 * 2 + 2 = 38",
          "question_mark_blue,8,66.6,11.16###ffc90d###56 - 49 = 7###24 - 16 = 8###75 - 71 = 4###61 - 58 = 3###42 - 36 = 6",
          "question_mark_blue,9,44.4,13.3###c3c3c3###137 - (1 + 3 + 7) = 126###126 - (1 + 2 + 6) = 117###117 - (1 + 1 + 7) = 108###108 - (1 + 0 + 8) = 99###99 - (9 + 9) = 81"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        ["Which planet is the closest to the sun?::Mercury##Venus##Saturn##Jupiter::0", "What is the atomic sign for Helium on the periodic table?::O##He##Fe##Se::1", "Where is the Taj Mahal located?::China##India##France##Japan::1", "Where is Mount Kilimanjaro located?::Tanzania##Brazil##Egypt##Japan::0", "Which painter belongs to the Surrealism movement?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1", "In which country did the Olympics originate?::France##Italy##Greece##Switzerland::2", "How many lobes does the human brain have?::1##2##3##4::3", "Which bird was commonly used by humans to send messages?::Pigeon##Hawk##Eagle##Sparrow::0", "Arachnophobia is the fear of what?::Spiders##Small spaces##Crowd##Airplane::0", "What is the oldest civilization we know of?::The Sumerian civilization##The Egyptian civilization##The Chinese civilization##The Indian civilization::0"]);
  }
}
