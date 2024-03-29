import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/AllContent/history_all_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/AllContent/history_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';

import 'Constants/history_game_question_config.dart';

class HistoryGameConfig extends GameConfig {
  static final HistoryGameConfig singleton = HistoryGameConfig.internal();

  factory HistoryGameConfig() {
    return singleton;
  }

  HistoryGameConfig.internal();

  @override
  QuestionCollectorService get questionCollectorService =>
      HistoryQuestionCollectorService();

  @override
  GameQuestionConfig get gameQuestionConfig => HistoryGameQuestionConfig();

  @override
  AllQuestionsService get allQuestionsService => HistoryAllQuestions();

  @override
  GameScreenManager get gameScreenManager =>
      HistoryGameScreenManager(key: UniqueKey());

  @override
  Color get defaultScreenBackgroundColor => Colors.amber.shade100;

  @override
  String get extraContentProductId =>
      //Same for Android and iOS
      "extracontent.history";

  @override
  String getTitle(Language language) {
    switch (language) {
      case Language.ar:
        return "لعبة التاريخ";
      case Language.cs:
        return "Dějiny";
      case Language.da:
        return "Historie spil";
      case Language.de:
        return "Geschichtsspiel";
      case Language.el:
        return "Παιχνίδι Ιστορίας";
      case Language.en:
        return "History Game";
      case Language.es:
        return "Juego de historia";
      case Language.fi:
        return "Historiapeli";
      case Language.fr:
        return "Jeu d'histoire";
      case Language.he:
        return "משחק היסטוריה";
      case Language.hi:
        return "इतिहास";
      case Language.hr:
        return "Povijest";
      case Language.hu:
        return "Történelem";
      case Language.id:
        return "Sejarah Game";
      case Language.it:
        return "Gioco di storia";
      case Language.ja:
        return "歴史ゲーム";
      case Language.ko:
        return "역사 게임";
      case Language.ms:
        return "Permainan Sejarah";
      case Language.nl:
        return "Geschiedenis spel";
      case Language.nb:
        return "Historie spill";
      case Language.pl:
        return "Gra Historia";
      case Language.pt:
        return "Jogo de História";
      case Language.ro:
        return "Joc de istorie";
      case Language.ru:
        return "История игры";
      case Language.sk:
        return "História";
      case Language.sv:
        return "Historia spel";
      case Language.th:
        return "ประวัติศาสตร์";
      case Language.tr:
        return "Tarih Oyunu";
      case Language.uk:
        return "Історія гри";
      case Language.vi:
        return "Lịch sử";
      case Language.zh:
        return "历史游戏";
      default:
        return "History Game";
    }
  }
}
