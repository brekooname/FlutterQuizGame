import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constants/hangman_game_question_config.dart';
import 'Questions/AllContent/hangman_all_questions.dart';
import 'Questions/AllContent/hangman_question_collector_service.dart';

class HangmanGameConfig extends GameConfig {
  static final HangmanGameConfig singleton = HangmanGameConfig.internal();

  factory HangmanGameConfig() {
    return singleton;
  }

  HangmanGameConfig.internal();

  @override
  QuestionCollectorService get questionCollectorService =>
      HangmanQuestionCollectorService();

  @override
  GameQuestionConfig get gameQuestionConfig => HangmanGameQuestionConfig();

  @override
  AllQuestionsService get allQuestionsService => HangmanAllQuestions();

  @override
  GameScreenManager get gameScreenManager =>
      HangmanScreenManager(key: UniqueKey());

  @override
  TextStyle googleFonts(TextStyle textStyle) {
    return GoogleFonts.pangolin(textStyle: textStyle);
  }

  @override
  ImageRepeat? get backgroundTextureRepeat => ImageRepeat.repeat;

  @override
  Color get defaultScreenBackgroundColor =>
      const Color.fromRGBO(112, 194, 57, 1.0);

  @override
  String get extraContentProductId {
    if (kIsWeb) {
      return "extraContent";
    } else if (Platform.isIOS || Platform.isAndroid) {
      return "extracontent.hangmanclassic";
    }
    throw UnsupportedError("Unsupported platform");
  }

  @override
  bool get showBuyProPopupAsFirstInterstitial => kIsWeb || Platform.isIOS;

  @override
  String getTitle(Language language) {
    switch (language) {
      case Language.ar:
        return "الجلاد";
      case Language.bg:
        return "Бесеница";
      case Language.cs:
        return "Oběšenec";
      case Language.da:
        return "Galgespil";
      case Language.de:
        return "Galgenmännchen";
      case Language.el:
        return "Κρεμάλα";
      case Language.en:
        return "Hangman";
      case Language.es:
        return "Ahorcado";
      case Language.fi:
        return "Hirsipuu";
      case Language.fr:
        return "Le Pendu";
      case Language.he:
        return "איש תלוי";
      case Language.hi:
        return "हैंगमेन";
      case Language.hr:
        return "Vješala";
      case Language.hu:
        return "Akasztófa";
      case Language.id:
        return "Hangman";
      case Language.it:
        return "L'impiccato";
      case Language.ja:
        return "ハングマン";
      case Language.ko:
        return "행맨";
      case Language.ms:
        return "Hangman";
      case Language.nl:
        return "Galgje";
      case Language.nb:
        return "Hangman Spill";
      case Language.pl:
        return "Wisielec";
      case Language.pt:
        return "Jogo da forca";
      case Language.ro:
        return "Spânzurătoarea";
      case Language.ru:
        return "Виселица";
      case Language.sk:
        return "Obesenec";
      case Language.sl:
        return "Obešenjak";
      case Language.sr:
        return "Обешењака";
      case Language.sv:
        return "Hänga gubbe";
      case Language.th:
        return "แฮงแมน";
      case Language.tr:
        return "Adam asmaca";
      case Language.uk:
        return "Шибениця";
      case Language.vi:
        return "Người treo cổ";
      case Language.zh:
        return "猜單詞遊戲";
      default:
        return "Hangman";
    }
  }
}
