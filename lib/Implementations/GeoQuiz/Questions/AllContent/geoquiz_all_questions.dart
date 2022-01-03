import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class GeoQuizAllQuestions extends AllQuestionsService {
  static final GeoQuizAllQuestions singleton = GeoQuizAllQuestions.internal();

  factory GeoQuizAllQuestions() {
    return singleton;
  }

  GeoQuizAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    //
    ////
    ///////
    var questionConfig = GeoQuizGameQuestionConfig();
    ///////
    ////
    //
    addEN(result, questionConfig);
    addRO(result, questionConfig);
    return result;
  }
  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Eiffel Tower, Paris‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Colosseum, Rome‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Hollywood Sign, Los Angeles‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Great Pyramid of Giza, Egypt‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Statue of Liberty, New York‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Great Wall of China‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Angkor Wat, Cambodia‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vatican City‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Leaning Tower of Pisa, Italy‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Christ the Redeemer, Rio de Janeiro‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Sydney Opera House, Sydney‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Austria‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Belgium‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Brazil‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Canada‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎China‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎United States‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎France‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Germany‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Italy‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mexico‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Russia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Spain‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Japan‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Netherlands‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎Austria‎‎:‎‎Vienna‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Belgium‎‎:‎‎Brussels‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Brazil‎‎:‎‎Brasilia‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Canada‎‎:‎‎Ottawa‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎China‎‎:‎‎Beijing‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎United States‎‎:‎‎Washington DC‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎France‎‎:‎‎Paris‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Germany‎‎:‎‎Berlin‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Italy‎‎:‎‎Rome‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Mexico‎‎:‎‎Mexico City‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Russia‎‎:‎‎Moscow‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Spain‎‎:‎‎Madrid‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Japan‎‎:‎‎Tokyo‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Netherlands‎‎:‎‎Amsterdam‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Austria‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Belgium‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Brazil‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Canada‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎China‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎France‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Germany‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Italy‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mexico‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Russia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Spain‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎United States‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Japan‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Netherlands‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Ha Long Bay, Vietnam‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Salar de Uyuni, Bolivia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎The Great Blue Hole, Belize‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bali, Indonesia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎The Aurora Borealis, Norway‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mount Fuji, Japan‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Harbor of Rio De Janeiro, Brazil‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Paria Canyon, United States‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mount Everest, Nepal and Tibet‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Niagara Falls, Canada‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Lac Rose, Senegal‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎The Black Forest, Germany‎‎:‎‎‎‎:‎‎4‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Acropolis, Athens‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Taj Mahal, India‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Blue Mosque, Istanbul‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Burj Khalifa, Dubai‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Louvre Museum, Paris‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Machu Picchu, Peru‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Berlin Wall‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Disneyland Resort, California‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Australia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Portugal‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Turkey‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bulgaria‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎India‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Greece‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cyprus‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Colombia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Czech Republic‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Croatia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Denmark‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Egypt‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Switzerland‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎Australia‎‎:‎‎Canberra‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Portugal‎‎:‎‎Lisbon‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Turkey‎‎:‎‎Ankara‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Bulgaria‎‎:‎‎Sofia‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎India‎‎:‎‎New Delhi‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Greece‎‎:‎‎Athens‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Cyprus‎‎:‎‎Nicosia‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Colombia‎‎:‎‎Bogota‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Czech Republic‎‎:‎‎Prague‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Croatia‎‎:‎‎Zagreb‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Denmark‎‎:‎‎Copenhagen‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Egypt‎‎:‎‎Cairo‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Switzerland‎‎:‎‎Bern‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Australia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Portugal‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Turkey‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bulgaria‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎India‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Greece‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cyprus‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Colombia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Czech Republic‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Croatia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Denmark‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Egypt‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Switzerland‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Angel Falls, Venezuela‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mount Kilimanjaro, Tanzania‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Danube Delta, Romania‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Victoria Falls, Zimbabwe and Zambia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Eye of the Sahara, Mauritania‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎The Dead Sea, Israel‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cliffs of Moher, Ireland‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mud volcanoes, Azerbaijan‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Moraine Lake, Canada‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Devil's Marbles, Australia‎‎:‎‎‎‎:‎‎4‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Red Square, Moscow‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Petra, Jordan‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎The Strip, Las Vegas‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Grand Palace, Bangkok‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎La Sagrada Familia, Barcelona‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Terra Cotta Warriors, China‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Times Square, New York‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Forbidden City, Beijing‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Finland‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Morocco‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Iran‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Serbia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Norway‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Belarus‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Sweden‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎South Korea‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Ukraine‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Hungary‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Algeria‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎South Africa‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Iceland‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎Finland‎‎:‎‎Helsinki‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Morocco‎‎:‎‎Rabat‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Iran‎‎:‎‎Tehran‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Serbia‎‎:‎‎Belgrade‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Norway‎‎:‎‎Oslo‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Belarus‎‎:‎‎Minsk‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Sweden‎‎:‎‎Stockholm‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎South Korea‎‎:‎‎Seoul‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Ukraine‎‎:‎‎Kiev‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Hungary‎‎:‎‎Budapest‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Algeria‎‎:‎‎Algiers‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎South Africa‎‎:‎‎Cape Town‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Iceland‎‎:‎‎Reykjavik‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Finland‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Morocco‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Iran‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Serbia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Norway‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Belarus‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Sweden‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎South Korea‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Ukraine‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Hungary‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Algeria‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎South Africa‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Iceland‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Pamukkale, Turkey‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎The River of Five Colors, Colombia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Paricutín Volcano, Mexico‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Moeraki Boulders, New Zealand‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎The Blue Grotto, Italy‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Marble Caves, Chile‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Crystal Cave, Bermuda‎‎:‎‎‎‎:‎‎4‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Borgund Stave Church, Norway‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Sheikh Zayed Mosque, Abu Dhabi‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Neuschwanstein Castle, Germany‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Oriental Pearl Tower, Shanghai‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Petronas Twin Towers, Malaysia‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Victoria Harbour, Hong Kong‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Library of Celsus, Ephesus‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Panama Canal, Panama‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Romania‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Israel‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovakia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovenia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Poland‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Tunisia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Argentina‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vietnam‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Georgia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Nepal‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎Romania‎‎:‎‎Bucharest‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Israel‎‎:‎‎Jerusalem‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Slovakia‎‎:‎‎Bratislava‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Slovenia‎‎:‎‎Ljubljana‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Poland‎‎:‎‎Warsaw‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Tunisia‎‎:‎‎Tunis‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Argentina‎‎:‎‎Buenos Aires‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Vietnam‎‎:‎‎Hanoi‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Georgia‎‎:‎‎Tbilisi‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Nepal‎‎:‎‎Kathmandu‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Romania‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Israel‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovakia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovenia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Poland‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Tunisia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Argentina‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vietnam‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Georgia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Nepal‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Jeju Island, South Korea‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Iguazu Falls, Argentina and Brazil‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Matterhorn, Switzerland‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Table Mountain, South Africa‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bu Tinah, United Arab Emirates‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Sundarbans, Bangladesh‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Verdon Gorge, France‎‎:‎‎‎‎:‎‎4‎"]);
  }void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.ro;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Turnul Eiffel, Paris‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Colosseum, Roma‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Semnul Hollywood, Los Angeles‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Marea Piramidă din Giza, Egipt‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Statuia Libertăţii, New York‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Marele Zid Chinezesc‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Angkor Wat, Cambodgia‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vatican‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Turnul înclinat din Pisa, Italia‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Hristos Răscumpărătorul, Rio de Janeiro‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Sydney Opera House, Sydney‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Austria‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Belgia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Brazilia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Canada‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎China‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Statele Unite‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Franţa‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Germania‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Italia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mexic‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Rusia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Spania‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Japonia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Olanda‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎Austria‎‎:‎‎Viena‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Belgia‎‎:‎‎Bruxelles‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Brazilia‎‎:‎‎Brasilia‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Canada‎‎:‎‎Ottawa‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎China‎‎:‎‎Beijing‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Statele Unite‎‎:‎‎Washington DC‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Franţa‎‎:‎‎Paris‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Germania‎‎:‎‎Berlin‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Italia‎‎:‎‎Roma‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Mexic‎‎:‎‎Mexico City‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Rusia‎‎:‎‎Moscova‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Spania‎‎:‎‎Madrid‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Japonia‎‎:‎‎Tokyo‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Olanda‎‎:‎‎Amsterdam‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Austria‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Belgia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Brazilia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Canada‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎China‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Franţa‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Germania‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Italia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Mexic‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Rusia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Spania‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Statele Unite‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Japonia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Olanda‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Ha Long Bay, Vietnam‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Salar de Uyuni, Bolivia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Marea Gaură Albastră, Belize‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bali, Indonezia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Auroră polară, Norvegia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Muntele Fuji, Japonia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Portul din Rio De Janeiro, Brazilia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Canionul Paria, Statele Unite‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Muntele Everest, Nepal şi Tibet‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cascada Niagara, Canada‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Lac Rose, Senegal‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Pădurea Neagră, Germania‎‎:‎‎‎‎:‎‎4‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Acropola din Atena, Atena‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Taj Mahal, India‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Moscheea Albastră, Istanbul‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Burj Khalifa, Dubai‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Muzeul Luvru, Paris‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Machu Picchu, Peru‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Zidul Berlinului‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Disneyland Resort, California‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Australia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Portugalia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Turcia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bulgaria‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎India‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Grecia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cipru‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Columbia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Republica Cehă‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Croaţia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Danemarca‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Egipt‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Elveţia‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎Australia‎‎:‎‎Canberra‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Portugalia‎‎:‎‎Lisabona‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Turcia‎‎:‎‎Ankara‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Bulgaria‎‎:‎‎Sofia‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎India‎‎:‎‎New Delhi‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Grecia‎‎:‎‎Atena‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Cipru‎‎:‎‎Nicosia‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Columbia‎‎:‎‎Bogota‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Republica Cehă‎‎:‎‎Praga‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Croaţia‎‎:‎‎Zagreb‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Danemarca‎‎:‎‎Copenhaga‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Egipt‎‎:‎‎Cairo‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Elveţia‎‎:‎‎Bern‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Australia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Portugalia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Turcia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bulgaria‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎India‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Grecia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cipru‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Columbia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Republica Cehă‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Croaţia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Danemarca‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Egipt‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Elveţia‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Cascada Angel, Venezuela‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Muntele Kilimanjaro, Tanzania‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Delta Dunării, România‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cascadele din Victoria, Zimbabwe şi Zambia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Ochiul Saharei, Mauritania‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Marea Moartă, Israel‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Stâncile din Moher, Irlanda‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vulcanii noroi, Azerbaijan‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Lacul Moraine, Canada‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Pietrele Diavolului, Australia‎‎:‎‎‎‎:‎‎4‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Piaţa Roşie, Moscova‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Petra, Iordania‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Fâşia, Las Vegas‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Palatul Grand, Bangkok‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎La Sagrada Familia, Barcelona‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Armata de Teracotă, China‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Times Square, New York‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Oraşul interzis, Beijing‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Finlanda‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Maroc‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Iran‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Serbia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Norvegia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bielorusia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Suedia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Coreea de Sud‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Ucraina‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Ungaria‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Algeria‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Africa de Sud‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Islanda‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎Finlanda‎‎:‎‎Helsinki‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Maroc‎‎:‎‎Rabat‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Iran‎‎:‎‎Teheran‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Serbia‎‎:‎‎Belgrad‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Norvegia‎‎:‎‎Oslo‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Bielorusia‎‎:‎‎Minsk‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Suedia‎‎:‎‎Stockholm‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Coreea de Sud‎‎:‎‎Seoul‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Ucraina‎‎:‎‎Kiev‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Ungaria‎‎:‎‎Budapesta‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Algeria‎‎:‎‎Alger‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Africa de Sud‎‎:‎‎Cape Town‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Islanda‎‎:‎‎Reykjavik‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Finlanda‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Maroc‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Iran‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Serbia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Norvegia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bielorusia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Suedia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Coreea de Sud‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Ucraina‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Ungaria‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Algeria‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Africa de Sud‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Islanda‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Pamukkale, Turcia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Râul cu Cinci Culori, Columbia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vulcan Paricutín, Mexic‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bolovanii Moeraki, Noua Zeelandă‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Grota Albastră, Italia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Peştera de marmură, Chile‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Peştera de cristal, Bermuda‎‎:‎‎‎‎:‎‎4‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Biserica Borgund Stave, Norvegia‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Moscheea Șeicului Zayed , Abu Dhabi‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Castelul Neuschwanstein, Germania‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Turnul Pearl Oriental, Shanghai‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Turnurile Petronas, Malaezia‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Portul Victoria, Hong Kong‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Biblioteca lui Celsus, Efes‎‎:‎‎‎‎:‎‎0‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Canalul Panama, Panama‎‎:‎‎‎‎:‎‎0‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎România‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Israel‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovacia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovenia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Polonia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Tunisia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Argentina‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vietnam‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Georgia‎‎:‎‎‎‎:‎‎1‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Nepal‎‎:‎‎‎‎:‎‎1‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎România‎‎:‎‎Bucureşti‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Israel‎‎:‎‎Ierusalim‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Slovacia‎‎:‎‎Bratislava‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Slovenia‎‎:‎‎Ljubljana‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Polonia‎‎:‎‎Varşovia‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Tunisia‎‎:‎‎Tunis‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Argentina‎‎:‎‎Buenos Aires‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Vietnam‎‎:‎‎Hanoi‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Georgia‎‎:‎‎Tbilisi‎‎:‎‎‎‎:‎‎2‎", "‎‎‎‎‎‎‎‎Nepal‎‎:‎‎Kathmandu‎‎:‎‎‎‎:‎‎2‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎România‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Israel‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovacia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Slovenia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Polonia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Tunisia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Argentina‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Vietnam‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Georgia‎‎:‎‎‎‎:‎‎3‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Nepal‎‎:‎‎‎‎:‎‎3‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎Insula Jeju, Coreea de Sud‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cascadele de pe Iguazú, Argentina şi Brazilia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Matterhorn, Elveţia‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Muntele Masa, Africa de Sud‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Bu Tinah, Emiratele Arabe Unite‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Sundarbans, Bangladesh‎‎:‎‎‎‎:‎‎4‎", "‎‎‎‎‎‎‎‎‎‎:‎‎Cheile Verdon, Franţa‎‎:‎‎‎‎:‎‎4‎"]);
  }
}
