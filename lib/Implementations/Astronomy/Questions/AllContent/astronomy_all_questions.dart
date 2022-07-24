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
        ["What is the hottest planet in our solar system?:Venus:1,2,3::", "What is the coldest planet?:Uranus:4,5,6::", "Which planet in our solar system has the most moons?:Saturn:0,3,4::", "Which planet is the largest of the terrestrial planets?:Earth:1,2,5::", "Which planet has the strongest winds?:Neptune:3,5,6::", "Which planet is a rocky planet?:Mercury:1,2,4::", "What is the 4th planet in the solar system?:Mars:1,4,5::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat11, //
        questionConfig.diff0, //
        [":Hubble Telescope:1,3,6::The Hubble Space Telescope (often referred to as HST or Hubble) is a space telescope that was launched into low Earth orbit in 1990 and remains in operation. It was not the first space telescope, but it is one of the largest and most versatile, renowned both as a vital research tool and as a public relations boon for astronomy. The Hubble telescope is named after astronomer Edwin Hubble and is one of NASA's Great Observatories. The Space Telescope Science Institute (STScI) selects Hubble's targets and processes the resulting data, while the Goddard Space Flight Center (GSFC) controls the spacecraft.", ":International Space Station:0,2,4::The International Space Station (ISS) is the largest modular space station currently in low Earth orbit. It is a multinational collaborative project involving five participating space agencies", ":Gran Telescopio Canarias:3,4,5::The Gran Telescopio Canarias (GranTeCan or GTC) is a 10.4 m (410 in) reflecting telescope located at the Roque de los Muchachos Observatory on the island of La Palma, in the Canaries, Spain. It is the world's largest single-aperture optical telescope.", ":Sputnik:1,6,0::Sputnik 1 was the first artificial Earth satellite. It was launched into an elliptical low Earth orbit by the Soviet Union on 4 October 1957 as part of the Soviet space program. It sent a radio signal back to Earth for three weeks before its three silver-zinc batteries ran out, and continued in orbit for two months until atmospheric drag caused it to fall back into the atmosphere on the 4th of January 1958.", ":Apollo 11:5,1,2::Apollo 11 (July 16–24, 1969) was the American spaceflight that first landed humans on the Moon. Commander Neil Armstrong and lunar module pilot Buzz Aldrin landed the Apollo Lunar Module Eagle on July 20, 1969, at 20", ":Mars Rover:4,2,6::A Mars rover is a motor vehicle designed to travel on the surface of Mars. Rovers have several advantages over stationary landers", ":Vostok 1:5,2,0::Vostok 1 (Russian", ":James Webb Telescope:5,2,0::The James Webb Space Telescope (JWST) is a space telescope designed primarily to conduct infrared astronomy. As the largest optical telescope in space, its greatly improved infrared resolution and sensitivity allow it to view objects too early, distant, or faint for the Hubble Space Telescope. This is expected to enable a broad range of investigations across the fields of astronomy and cosmology, such as observation of the first stars and the formation of the first galaxies, and detailed atmospheric characterization of potentially habitable exoplanets."]);
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
        [":Galaxy:1,3,5::A galaxy is a gravitationally bound system of stars, stellar remnants, interstellar gas, dust, and dark matter.[1][2] The word is derived from the Greek galaxias (γαλαξίας), literally 'milky', a reference to the Milky Way galaxy that contains the Solar System.", ":Black Hole:1,3,5::A black hole is a region of spacetime where gravity is so strong that nothing – no particles or even electromagnetic radiation such as light – can escape from it.", ":Nebula:1,3,5::A nebula ('cloud' or 'fog' in Latin; pl. nebulae, nebulæ or nebulas) is a distinct luminescent part of interstellar medium, which can consist of ionized, neutral or molecular hydrogen and also cosmic dust.", ":Quasar:1,3,5::A quasar (/ˈkweɪzɑːr/ KWAY-zar; also known as a quasi-stellar object, abbreviated QSO) is an extremely luminous active galactic nucleus (AGN), powered by a supermassive black hole, with mass ranging from millions to tens of billions of solar masses, surrounded by a gaseous accretion disc.", ":Pulsar:1,3,5::A pulsar (from pulsating radio source) is a highly magnetized rotating neutron star that emits beams of electromagnetic radiation out of its magnetic poles.", ":Planet:1,3,5::A planet is a large, rounded astronomical body that is neither a star nor its remnant.", ":Star Cluster:1,3,5::Star clusters are large groups of stars. Two main types of star clusters can be distinguished", ":Moon:1,3,5::The Moon is Earth's only natural satellite. At about one-quarter the diameter of Earth (comparable to the width of Australia), it is the fifth largest satellite in the Solar System.", ":Comet:1,3,5::A comet is an icy, small Solar System body that, when passing close to the Sun, warms and begins to release gases, a process that is called outgassing."]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat13, //
        questionConfig.diff0, //
        [":Celestial sphere:1,3,5::In astronomy and navigation, the celestial sphere is an abstract sphere that has an arbitrarily large radius and is concentric to Earth. All objects in the sky can be conceived as being projected upon the inner surface of the celestial sphere, which may be centered on Earth or the observer.", ":Sundial:0,2,4::A sundial is a horological device that tells the time of day (referred to as civil time in modern usage) when direct sunlight shines by the apparent position of the Sun in the sky.", ":Telescope:3,4,0::A telescope (from the Ancient Greek τῆλε, romanized tele 'far' and σκοπεῖν, skopein 'to look or see'; τηλεσκόπος, teleskopos 'far-seeing') is an optical instrument using lenses, curved mirrors, or a combination of both to observe distant objects, or various devices used to observe distant objects by their emission, absorption, or reflection of electromagnetic radiation.", ":Astronomical clock:1,2,0::An astronomical clock, horologium, or orloj is a clock with special mechanisms and dials to display astronomical information, such as the relative positions of the Sun, Moon, zodiacal constellations, and sometimes major 69 planets.", ":Photometer:5,1,2::A photometer is an instrument that measures the strength of electromagnetic radiation in the range from ultraviolet to infrared and including the visible spectrum. Most photometers convert light into an electric current using a photoresistor, photodiode, or photomultiplier.", ":Space telescope:4,1,0::A space telescope or space observatory is a telescope in outer space used to observe astronomical objects. Suggested by Lyman Spitzer in 1946, the first operational telescopes were the American Orbiting Astronomical Observatory, OAO-2 launched in 1968, and the Soviet Orion 1 ultraviolet telescope aboard space station Salyut 1 in 1971."]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat14, //
        questionConfig.diff0, //
        ["0##The Big Bang:13.8 billion years ago:4,7,8::", "3##Formation of the first galaxies:400 million years after the Big Bang:8,3,10::", "2##Formation of the first stars:100 million years after the Big Bang:3,4,7::", "1##Formation of the first black holes:During the Big Bang:4,8,9::", "7##Formation of the Earth:4.6 billion years ago:5,6,7::", "9##Earliest life forms appear:3.7 billion years ago:4,7,8::", "8##Formation of the Moon:50 million years after the solar system was born:10,9,8::", "10##Formation of the newest galaxy:500 million years ago:8,1,4::", "5##Formation of the Andromeda galaxy:10 billion years ago:9,10,5::", "4##Formation of the Milky way galaxy:800 million years after the Big Bang:8,2,3::", "6##Formation of the Solar System:4.6 billion years ago:3,0,2::"]);
  }


}
