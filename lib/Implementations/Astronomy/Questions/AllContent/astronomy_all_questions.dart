import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class AstronomyAllQuestions extends AllQuestionsService {
  static final AstronomyAllQuestions singleton = AstronomyAllQuestions.internal();

  factory AstronomyAllQuestions() {
    return singleton;
  }

  AstronomyAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = AstronomyGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    addEN(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      AstronomyGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["The Sun:1,2,3,4,5,6,7,8,9:7,96.2", "Mercury:0,2,3,4,5,6,7,8,9:16,83.4", "Venus:1,0,3,4,5,6,7,8,9:35.9,81.4", "Earth:1,2,0,4,5,6,7,8,9:33.1,64.6", "Mars:1,2,3,0,5,6,7,8,9:55.3,62.64", "Jupiter:1,2,3,4,0,6,7,8,9:42.8,41.15", "Saturn:1,2,3,4,5,0,7,8,9:80.8,49.4", "Uranus:1,2,3,4,5,6,0,8,9:47.7,16.15", "Neptune:1,2,3,4,5,6,7,0,9:85.4,18.74", "Pluto:1,2,3,4,5,6,7,8,0:83.33,5.33"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat7, //
        questionConfig.diff0, //
        ["How many planets are there in the solar system?::8##9##10##11::0", "How far away from Earth is our sun, approximately...?::93 light years##150 million kilometers##150 billion kilometers##150 trillion kilometers::1", "What is the moon?::asteroid##star##natural satellite##planet::2", "Approximately how old is the earth?::6 billion years##4 billion years##1 billion years##4 trillion years::1", "What result does the earth's tilt have?::The seasons##Day and Night##Tsunami##Earthquakes::0", "What is the shape of the earth's orbit around the sun?::Circular##Elliptical##Square##Variable::1", "Where is the asteroid belt located?::beyond Pluto##around the Sun##between Mars and Jupiter##between Earth and Mars::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        ["What is the largest known star?::UY Scuti##Betelgeuse##VY Canis majoris##Pollux::0", "What is the most dense kind of star?::Red giant##Neutron star##Black dwarf##White dwarf::1", "What is the closest galaxy to ours?::Barnard's galaxy##NGC 24 19##Andromeda##Ic 1101::2", "What is our galaxy called?::Earth##Milky Way##Andromeda##Universe::1", "How many stars are in our galaxy?::16 Million##5 Thousand##250 Billion##1 Billion::2", "What is the universe mostly composed of?::Dark matter##Dark energy##Light##Visible matter::1", "What is the brightest star in the sky?::Sirius##Andromeda##Orion##Polaris::0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat9, //
        questionConfig.diff0, //
        ["What is the hottest planet in our solar system?:Venus:1,2,3:", "What is the coldest planet?:Uranus:4,5,6:", "Which planet in our solar system has the most moons?:Saturn:0,3,4:", "Which planet is the largest of the terrestrial planets?:Earth:1,2,5:", "Which planet has the strongest winds?:Neptune:3,5,6:", "Which planet is a rocky planet?:Mercury:1,2,4:", "What is the 4th planet in the solar system?:Mars:1,4,5:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff0, //
        [":Hubble Telescope:1,3,6:", ":International Space Station:0,2,4:", ":Gran Telescopio Canarias:3,4,5:", ":Sputnik:1,6,0:", ":Apollo 11:5,1,2:", ":Mars Rover:4,2,6:", ":Vostok 1:5,2,0:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat10, //
        questionConfig.diff0, //
        ["What is the first spacecraft launched into space?::Voyager##Viking 1##Vostok 1##Sputnik::2", "What probe was sent toward Saturn in 1977?::Pioneer##Huygens##Saturn Cassini##Voyager 1::3", "In what year did Galileo Galilei start using the telescope to explore the sky?::1704##1609##1510##1653::1", "Who was the first person to land on the moon?::Neil Armstrong##Alan Shepard##Buzz Aldrin##Alan Bean::0", "What spacecraft is orbiting around Jupiter?::Juno##Lander##Vostok##Cassini::0", "When was Pluto discovered?::1930##1834##1956##1975::0", "Who was the first man to orbit around earth?::Yuri Gagarin##Neil Armstrong##Buzz Aldrin##Alan Shepard::0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat12, //
        questionConfig.diff0, //
        [":Saturn:1,3,4:", ":The Sun:0,2,4:", ":Galaxy:3,1,5:", ":Jupiter:1,4,0:", ":Mars:0,3,2:", ":Nebula:4,2,1:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat13, //
        questionConfig.diff0, //
        [":Celestial sphere:1,3,5:", ":Sundial:0,2,4:", ":Telescope:3,4,0:", ":Astronomical clock:1,2,0:", ":Photometer:5,1,2:", ":Space telescope:4,1,0:"]);
  }

}
