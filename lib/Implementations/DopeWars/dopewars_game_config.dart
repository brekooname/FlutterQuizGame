import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/AllContent/dopewars_all_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/AllContent/dopewars_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';

import 'Constants/dopewars_game_question_config.dart';
import 'Service/dopewars_screen_manager.dart';

class DopeWarsGameConfig extends GameConfig {
  static final DopeWarsGameConfig singleton = DopeWarsGameConfig.internal();

  factory DopeWarsGameConfig() {
    return singleton;
  }

  DopeWarsGameConfig.internal();

  @override
  QuestionCollectorService get questionCollectorService =>
      DopeWarsQuestionCollectorService();

  @override
  GameQuestionConfig get gameQuestionConfig => DopeWarsGameQuestionConfig();

  @override
  AllQuestionsService get allQuestionsService => DopeWarsAllQuestions();

  @override
  GameScreenManager get gameScreenManager =>
      DopeWarsScreenManager(key: UniqueKey());

  @override
  ImageRepeat get backgroundTextureRepeat => ImageRepeat.repeat;

  @override
  Color get screenBackgroundColor => const Color.fromRGBO(198, 236, 198, 1);

  //Android
  @override
  String get extraContentProductId => "extracontent.skel";

  @override
  String getTitle(Language language) {
    switch (language) {
      case Language.ar:
        return "لعبة الأعمال";
      case Language.bg:
        return "Бизнес игра";
      case Language.cs:
        return "Obchodní Hra";
      case Language.da:
        return "Forretningsspil";
      case Language.de:
        return "Geschäftsspiel";
      case Language.el:
        return "Επιχειρηματικό παιχνίδι";
      case Language.en:
        return "Business Game";
        return "Dope Wars";
      case Language.es:
        return "Juego de Negocios";
      case Language.fi:
        return "Liiketoimintapeli";
      case Language.fr:
        return "Jeu d'affaires";
      case Language.he:
        return "משחק עסקי";
      case Language.hi:
        return "बिजनेस गेम";
      case Language.hr:
        return "Poslovna Igra";
      case Language.hu:
        return "Üzleti Játék";
      case Language.id:
        return "Game Bisnis";
      case Language.it:
        return "Gioco Aziendale";
      case Language.ja:
        return "ビジネスゲーム";
      case Language.ko:
        return "비즈니스 게임";
      case Language.ms:
        return "Permainan Perniagaan";
      case Language.nl:
        return "Zakelijk Spel";
      case Language.nb:
        return "Forretningsspill";
      case Language.pl:
        return "Gra Biznesowa";
      case Language.pt:
        return "Jogo de Negócios";
      case Language.ro:
        return "Joc de Afaceri";
      case Language.ru:
        return "Деловая игра";
      case Language.sk:
        return "Obchodná Hra";
      case Language.sl:
        return "Poslovna Igra";
      case Language.sr:
        return "Пословна игра";
      case Language.sv:
        return "Affärsspel";
      case Language.th:
        return "เกมธุรกิจ";
      case Language.tr:
        return "İş Oyunu";
      case Language.uk:
        return "Ділова гра";
      case Language.vi:
        return "Trò chơi kinh doanh";
      case Language.zh:
        return "商业游戏";
      default:
        return "Business Game";
    }
  }
}
