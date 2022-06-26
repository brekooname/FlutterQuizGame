import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';

import 'Constants/iq_game_question_config.dart';
import 'Questions/AllContent/iq_game_all_questions.dart';
import 'Questions/AllContent/iq_game_question_collector_service.dart';

class IqGameConfig extends GameConfig {
  static final IqGameConfig singleton = IqGameConfig.internal();

  factory IqGameConfig() {
    return singleton;
  }

  IqGameConfig.internal();

  @override
  QuestionCollectorService get questionCollectorService =>
      IqGameQuestionCollectorService();

  @override
  GameQuestionConfig get gameQuestionConfig => IqGameQuestionConfig();

  @override
  AllQuestionsService get allQuestionsService => IqGameAllQuestions();

  @override
  GameScreenManager get gameScreenManager =>
      IqGameScreenManager(key: UniqueKey());

  @override
  ImageRepeat get backgroundTextureRepeat => ImageRepeat.noRepeat;

  @override
  Color get defaultScreenBackgroundColor => const Color.fromRGBO(198, 236, 255, 1);

  @override
  String get extraContentProductId => "extracontent.iqtest";

  @override
  String getTitle(Language language) {
    switch (language) {
      case Language.ar:
        return "إختبار الذكاء";
      case Language.bg:
        return "Тест за интелигентност";
      case Language.cs:
        return "Zpravodajský Test";
      case Language.da:
        return "Intelligens Test";
      case Language.de:
        return "Intelligenztest";
      case Language.el:
        return "Δοκιμή νοημοσύνης";
      case Language.en:
        return "Intelligence Test";
      case Language.es:
        return "Prueba de inteligencia";
      case Language.fi:
        return "Älykkyystesti";
      case Language.fr:
        return "Test d'intelligence";
      case Language.he:
        return "מבחן אינטליגנציה";
      case Language.hi:
        return "खुफिया परीक्षण";
      case Language.hr:
        return "Test inteligencije";
      case Language.hu:
        return "Intelligencia Teszt";
      case Language.id:
        return "Tes Kecerdasan";
      case Language.it:
        return "Test di intelligenza";
      case Language.ja:
        return "知能テスト";
      case Language.ko:
        return "지능 검사";
      case Language.ms:
        return "Ujian Perisikan";
      case Language.nl:
        return "Intelligentie Test";
      case Language.nb:
        return "Intelligens Test";
      case Language.pl:
        return "Test na inteligencje";
      case Language.pt:
        return "Teste de inteligência";
      case Language.ro:
        return "Test de inteligență";
      case Language.ru:
        return "Тест на интеллект";
      case Language.sk:
        return "Spravodajský test";
      case Language.sl:
        return "Test inteligence";
      case Language.sr:
        return "Тест интелигенције";
      case Language.sv:
        return "Intelligenstest";
      case Language.th:
        return "ทดสอบสติปัญญา";
      case Language.tr:
        return "Dahi Testi";
      case Language.uk:
        return "Тест інтелекту";
      case Language.vi:
        return "Bài kiểm tra trí thông minh";
      case Language.zh:
        return "智力测验";
      default:
        return "Intelligence Test";
    }
  }
}
