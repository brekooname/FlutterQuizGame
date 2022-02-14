import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Service/skel_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';

import 'Constants/skel_game_question_config.dart';
import 'Questions/AllContent/skel_all_questions.dart';
import 'Questions/AllContent/skel_question_collector_service.dart';

class SkelGameConfig extends GameConfig {
  static final SkelGameConfig singleton = SkelGameConfig.internal();

  factory SkelGameConfig() {
    return singleton;
  }

  SkelGameConfig.internal();

  @override
  QuestionCollectorService get questionCollectorService =>
      SkelQuestionCollectorService();

  @override
  GameQuestionConfig get gameQuestionConfig => SkelGameQuestionConfig();

  @override
  AllQuestionsService get allQuestionsService => SkelAllQuestions();

  @override
  GameScreenManager get gameScreenManager =>
      SkelScreenManager(key: UniqueKey());

  @override
  ImageRepeat get backgroundTextureRepeat => ImageRepeat.noRepeat;

  @override
  Color get screenBackgroundColor => const Color.fromRGBO(198, 236, 255, 1);

  //Android
  @override
  String get extraContentProductId => "extracontent.skel";

  @override
  String getTitle(Language language) {
    switch (language) {
      case Language.ar:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.bg:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.cs:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.da:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.de:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.el:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.en:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.es:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.fi:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.fr:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.he:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.hi:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.hr:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.hu:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.id:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.it:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.ja:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.ko:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.ms:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.nl:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.nb:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.pl:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.pt:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.ro:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.ru:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.sk:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.sl:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.sr:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.sv:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.th:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.tr:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.uk:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.vi:
        return "xxxxxxxxxxxxxxxxxxxx";
      case Language.zh:
        return "xxxxxxxxxxxxxxxxxxxx";
      default:
        return "xxxxxxxxxxxxxxxxxxxx";
    }
  }
}
