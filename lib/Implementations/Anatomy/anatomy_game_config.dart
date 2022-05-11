import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';

import 'Constants/anatomy_game_question_config.dart';
import 'Questions/AllContent/anatomy_all_questions.dart';
import 'Questions/AllContent/anatomy_question_collector_service.dart';

class AnatomyGameConfig extends GameConfig {
  static final AnatomyGameConfig singleton = AnatomyGameConfig.internal();

  factory AnatomyGameConfig() {
    return singleton;
  }

  AnatomyGameConfig.internal();

  @override
  QuestionCollectorService get questionCollectorService =>
      AnatomyQuestionCollectorService();

  @override
  GameQuestionConfig get gameQuestionConfig => AnatomyGameQuestionConfig();

  @override
  AllQuestionsService get allQuestionsService => AnatomyAllQuestions();

  @override
  GameScreenManager get gameScreenManager =>
      AnatomyScreenManager(key: UniqueKey());

  @override
  ImageRepeat get backgroundTextureRepeat => ImageRepeat.noRepeat;

  @override
  Color get screenBackgroundColor => const Color.fromRGBO(198, 236, 255, 1);

  @override
  String get extraContentProductId {
    if (Platform.isAndroid) {
      return "extracontent.anatomy";
    } else if (Platform.isIOS) {
      return "extraContentAnatomy";
    }
    throw UnsupportedError("Unsupported platform");
  }

  @override
  String getTitle(Language language) {
    switch (language) {
      case Language.ar:
        return "تشريح";
      case Language.bg:
        return "Анатомия";
      case Language.cs:
        return "Anatomie";
      case Language.da:
        return "Anatomi";
      case Language.de:
        return "Anatomie Spiel";
      case Language.el:
        return "Ανατομία";
      case Language.en:
        return "Anatomy Game";
      case Language.es:
        return "Anatomía";
      case Language.fi:
        return "Anatomia";
      case Language.fr:
        return "Anatomie";
      case Language.he:
        return "אֲנָטוֹמִיָה";
      case Language.hi:
        return "एनाटॉमी";
      case Language.hr:
        return "Anatomija";
      case Language.hu:
        return "Anatómia";
      case Language.id:
        return "Anatomi";
      case Language.it:
        return "Anatomia";
      case Language.ja:
        return "解剖学";
      case Language.ko:
        return "해부학";
      case Language.ms:
        return "Anatomi";
      case Language.nl:
        return "Anatomie";
      case Language.nb:
        return "Anatomi-spill";
      case Language.pl:
        return "Anatomia";
      case Language.pt:
        return "Anatomia";
      case Language.ro:
        return "Anatomie";
      case Language.ru:
        return "Игра Анатомия";
      case Language.sk:
        return "Anatómia";
      case Language.sl:
        return "Anatomija";
      case Language.sr:
        return "Анатомија";
      case Language.sv:
        return "Anatomi";
      case Language.th:
        return "กายวิภาคศาสตร์";
      case Language.tr:
        return "Anatomi Oyunu";
      case Language.uk:
        return "Анатомія";
      case Language.vi:
        return "Giải phẫu học";
      case Language.zh:
        return "解剖学";
      default:
        return "Anatomy Game";
    }
  }
}
