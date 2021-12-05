import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class HistoryQuestions extends CategoryDifficultyService {
  static final HistoryQuestions singleton = HistoryQuestions.internal();

  factory HistoryQuestions() {
    return singleton;
  }

  HistoryQuestions.internal();

  Map<CategoryDifficulty, List<Question>> getAllQuestions(String languageCode) {
    Language language =
        Language.values.firstWhere((element) => element.name() == languageCode);

    return getAllQuestionsWithLanguages().get(language);
  }

  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    var questionConfig = HistoryGameQuestionConfig();

    addEN(result, questionConfig);

    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    addQuestions(
        result, //
        Language.en, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        [
          "Homo erectus leaves Africa:-1800000",
          "Humans learn to control fire:-400000",
          "Neanderthals become extinct:-40000",
          "Neolithic Revolution:-9000",
          "First civilizations develop in Sumeria:-3500",
          "The Pyramids and Great Sphinx were built:-2500",
          "Birth of Buddha:-486",
          "Founding of the Roman Empire:-27",
          "Julius Caesar of Rome was assassinated:-44",
          "Spread of Christianity:1",
          "Split of the the Roman Empire:395",
          "Birth of Prophet Muhammad, the founder of Islam:570",
          "Printing was invented in China:730",
          "Split of the Christian Church:1054",
          "Magna Carta signed by King John:1215",
          "Bubonic plague spreads to Europe:1347",
          "The Ottoman Turks captured Constantinople:1453",
          "Columbus discovers America:1492",
          "Building of Taj Mahal completed:1643",
          "Mozart writes his first symphony:1764",
          "United States Declaration of Independence:1776",
          "Napoleon is defeated at the Battle of Waterloo:1815",
          "First Steam Locomotive:1825",
          "Great Britain took over the rule of India:1858",
          "Edison invents electric light:1879",
          "Benz develops first petrol-driven car:1885",
          "Einstein announces the theory of relativity:1905",
          "Titanic, world’s biggest ship, sinks in North Atlantic:1912",
          "World War One begins:1914",
          "Russian Revolution:1917",
          "Hitler rises to power in Germany:1933",
          "World War Two begins:1939",
          "End of World War Two:1945",
          "Communist China is founded:1949",
          "Russia sends into space the first satellite, Sputnik 1:1957",
          "Yuri Gagarin becomes the first man to fly in space:1961",
          "Neil Armstrong becomes the first man to set foot on the moon:1969",
          "Chernobyl disaster:1986",
          "Fall of Communism in Eastern Europe:1989",
          "Unification of Germany:1990",
          "Soviet Union breaks up:1991",
          "End of Apartheid in South Africa:1994",
          "Google is founded:1998",
          "September 11 Terrorist Attacks:2001",
          "Introduction of the iPhone:2007",
        ]);
    //
    addQuestions(
        result, //
        Language.en, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        [
          "Akkadian Empire:-2300,-2200",
          "Babylonian Empire:-1900,-1600",
          "Egyptian Empire:-1550,-1077",
          "Assyria:-2025,-609",
          "Kingdom of Judah:-1050,-586",
          "Achaemenid Empire:-550,-330",
          "Mauryan Empire:-322,-184",
          "Carthaginian Empire:-814,-146",
          "Seleucid Empire:-312,-63",
          "Han Dynasty:-202,220",
          "Sasanian Empire:224,651",
          "Tang Dynasty:618,907",
          "Abbasid Caliphate:750,1258",
          "Pagan Kingdom:849,1297",
          "Mongol Empire:1206,1368",
          "Khmer Empire:802,1431",
          "Roman Empire:-27,1453",
          "Byzantine Empire:395,1453",
          "Inca Empire:1438,1533",
          "Mughal Empire:1526,1758",
          "Qing Dynasty:1644,1912",
          "Russian Empire:1721,1917",
          "Austro-Hungarian Empire:1867,1918",
          "German Empire:1871,1918",
          "Ottoman Empire:1299,1922",
          "Empire of Japan:1868,1947",
          "Spanish Empire:1402,1975",
          "French empire:1534,1980",
          "Soviet Union:1922,1991",
          "British Empire:1603,1997",
          "Portuguese Empire:1415,1999",
          "United States:1776,x",
          "China:1949,x",
          "European Union:1993,x",
        ]);
    //
  }
}
