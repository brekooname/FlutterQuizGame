import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';

import '../../Lib/Constants/contrast.dart';
import 'Constants/astronomy_game_question_config.dart';
import 'Questions/AllContent/astronomy_all_questions.dart';
import 'Questions/AllContent/astronomy_question_collector_service.dart';

class AstronomyGameConfig extends GameConfig {
  static final AstronomyGameConfig singleton = AstronomyGameConfig.internal();

  factory AstronomyGameConfig() {
    return singleton;
  }

  AstronomyGameConfig.internal();

  @override
  QuestionCollectorService get questionCollectorService =>
      AstronomyQuestionCollectorService();

  @override
  Contrast get screenContrast => Contrast.dark;

  @override
  GameQuestionConfig get gameQuestionConfig => AstronomyGameQuestionConfig();

  @override
  AllQuestionsService get allQuestionsService => AstronomyAllQuestions();

  @override
  GameScreenManager get gameScreenManager =>
      AstronomyScreenManager(key: UniqueKey());

  @override
  ImageRepeat get backgroundTextureRepeat => ImageRepeat.repeat;

  @override
  Color get defaultScreenBackgroundColor => const Color.fromRGBO(198, 236, 255, 1);

  @override
  String get extraContentProductId => "extracontent.astronomy";

  @override
  String getTitle(Language language) {
    switch (language) {
      case Language.ar:
        return "علم الفلك";
      case Language.bg:
        return "Астрономия";
      case Language.cs:
        return "Astronomie";
      case Language.da:
        return "Astronomi";
      case Language.de:
        return "Astronomie";
      case Language.el:
        return "Αστρονομία";
      case Language.en:
        return "Astronomy Game";
      case Language.es:
        return "Astronomía";
      case Language.fi:
        return "Tähtitiede";
      case Language.fr:
        return "Astronomie";
      case Language.he:
        return "אסטרונומיה";
      case Language.hi:
        return "खगोल";
      case Language.hr:
        return "Astronomija";
      case Language.hu:
        return "Csillagászat";
      case Language.id:
        return "Astronomi";
      case Language.it:
        return "Astronomia";
      case Language.ja:
        return "天文学";
      case Language.ko:
        return "천문학";
      case Language.ms:
        return "Astronomi";
      case Language.nl:
        return "Astronomie";
      case Language.nb:
        return "Astronomi";
      case Language.pl:
        return "Astronomia";
      case Language.pt:
        return "Astronomia";
      case Language.ro:
        return "Astronomie";
      case Language.ru:
        return "Астрономия";
      case Language.sk:
        return "Astronómie";
      case Language.sl:
        return "Astronomija";
      case Language.sr:
        return "Астрономија   ";
      case Language.sv:
        return "Astronomi";
      case Language.th:
        return "เกมดาราศาสตร์";
      case Language.tr:
        return "Astronomi";
      case Language.uk:
        return "Астрономія";
      case Language.vi:
        return "Thiên văn học";
      case Language.zh:
        return "天文学";
      default:
        return "Astronomy Game";
    }
  }
}
