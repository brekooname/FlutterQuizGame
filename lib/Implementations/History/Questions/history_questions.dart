import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class HistoryQuestions extends CategoryDifficultyService {
  static final HistoryQuestions singleton = HistoryQuestions.internal();

  factory HistoryQuestions() {
    return singleton;
  }

  HistoryQuestions.internal();

  Map<CategoryDifficulty, List<Question>> getAllQuestions(String languageCode) {
    Language language =
        Language.values.firstWhere((element) => element.name() == languageCode);

    return getAllQuestionsWithLanguages().get(language);
  }

  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    var questionConfig = HistoryGameQuestionConfig();
    addEN(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        [
          "Mozart writes his first symphony:1764",
          "United States Declaration of Independence:1776",
          "Napoleon is defeated at the Battle of Waterloo:1815",
          "First Steam Locomotive:1825",
          "Great Britain took over the rule of India:1858",
          "Edison invents electric light:1879",
          "Benz develops first petrol-driven car:1885",
          "Einstein announces the theory of relativity:1905",
          "Titanic, world’s biggest ship, sinks in North Atlantic:1912",
          "World War One begins:1914",
          "Russian Revolution:1917",
          "Hitler rises to power in Germany:1933",
          "World War Two begins:1939",
          "End of World War Two:1945",
          "Communist China is founded:1949",
          "Russia sends into space the first satellite, Sputnik 1:1957",
          "Yuri Gagarin becomes the first man to fly in space:1961",
          "Neil Armstrong becomes the first man to set foot on the moon:1969",
          "Chernobyl disaster:1986",
          "Fall of Communism in Eastern Europe:1989",
          "Unification of Germany:1990",
          "Soviet Union breaks up:1991",
          "End of Apartheid in South Africa:1994",
          "Google is founded:1998",
          "September 11 Terrorist Attacks:2001",
          "Introduction of the iPhone:2007"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        [
          "Mughal Empire:1526,1758",
          "Qing Dynasty:1644,1912",
          "Russian Empire:1721,1917",
          "Austro-Hungarian Empire:1867,1918",
          "German Empire:1871,1918",
          "Ottoman Empire:1299,1922",
          "Empire of Japan:1868,1947",
          "Spanish Empire:1402,1975",
          "French empire:1534,1980",
          "Soviet Union:1922,1991",
          "British Empire:1603,1997",
          "Portuguese Empire:1415,1999",
          "United States:1776,x",
          "China:1949,x",
          "European Union:1993,x"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        [
          "Battle of Waterloo:Belgium",
          "Battle of Gettysburg:USA",
          "Siege of Stalingrad:Russia",
          "Invasion of Normandy:France",
          "The Battle of Okinawa:Japan",
          "The Battle of Vienna:Austria",
          "Fall of the Berlin Wall:Germany",
          "Treaty of Versailles:France",
          "Assassination of Archduke Franz Ferdinand:Bosnia and Herzegovina",
          "Chernobyl disaster:Ukraine"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        [
          "Which country was the first one to reach the south pole?::Norway##United Kingdom##Denmark##Russia::0",
          "Which European country still around had the largest land empire in history?::Russia##United Kingdom##Italy##Spain::1",
          "Which one of these African countries at one point was controlled by Germany?::Benin##Angola##Djibouti##Tanzania::3",
          "Who was the first Tsar of Russia?::Tsar Nicholas I##Tsar Alexander II##Tsar Ivan the Terrible##Tsar Paul I::2",
          "What was the battle that effectively ended the Napoleonic Wars?::Battle of Vienna##Battle of Valmy##Battle of Verdun##Battle of Waterloo::3",
          "Which of these countries, at one point, were part of the USSR?::Slovakia##Mongolia##Afghanistan##Azerbaijan::3",
          "Which one of these countries were never controlled by The United Kingdom?::Pakistan##Aghanistan##Nigeria##Jordan::1",
          "What European country was blamed for World War 1?::Russia##the United Kingdom##Germany::2",
          "What country was neutral at the beginning of World War 2?::France##United States##Germany##Poland::1",
          "Which African anti-apartheid leader was released from jail in 1990, after more than 27 years?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1",
          "Which US president was elected to office four times?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [
          "Napoleon",
          "William Shakespeare",
          "Abraham Lincoln",
          "George Washington",
          "Thomas Jefferson",
          "Charles Darwin",
          "Martin Luther",
          "Albert Einstein",
          "Isaac Newton"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        [
          "Birth of Prophet Muhammad, the founder of Islam:570",
          "Printing was invented in China:730",
          "Split of the Christian Church:1054",
          "Magna Carta signed by King John:1215",
          "Bubonic plague spreads to Europe:1347",
          "The Ottoman Turks captured Constantinople:1453",
          "Columbus discovers America:1492",
          "Building of Taj Mahal completed:1643"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        [
          "Sasanian Empire:224,651",
          "Tang Dynasty:618,907",
          "Abbasid Caliphate:750,1258",
          "Pagan Kingdom:849,1297",
          "Mongol Empire:1206,1368",
          "Khmer Empire:802,1431",
          "Roman Empire:-27,1453",
          "Byzantine Empire:395,1453",
          "Inca Empire:1438,1533"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        [
          "Siege of Orleans:France",
          "Fall of Constantinople:Turkey",
          "Battle of Hastings:England",
          "Machu Picchu:Peru",
          "Bagan:Myanmar",
          "Angkor:Cambodia",
          "Taj Mahal:India",
          "The Great Wall:China"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        [
          "The First Crusade had the intended goal of capturing which city?::Jerusalem##Cairo##Mecca##Rome::0",
          "What did the Magna Carta accomplish?::it limited the power of the lords##it limited the power of knights##it increased the power of peasants and serfs##it limited the power of the monarch::3",
          "How did the Bubonic Plague spread?::Bad water##Fleas on rats##Polluted air##Volcano ash::1",
          "This city was on a crossroads between Europe and the Middle East::Cairo##Constantinople##Paris##Moscow::1",
          "What was the cause of the Crusades?::To liberate the Holy land of Jerusalem from the Muslims##A revolt of peasants##The Black Death spreading over Europe##Trading wars along the Silk Road::0",
          "Holy prophet of the Muslim religion?::Jesus Christ##Buddha##Muhammad::2",
          "Social structure of the Middle Ages::Caste System##Feudalism##Manorism::1"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [
          "Christopher Columbus",
          "Charlemagne",
          "Leonardo da Vinci",
          "Genghis Khan",
          "Galileo Galilei",
          "Ferdinand Magellan",
          "Nicolaus Copernicus",
          "Michelangelo"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        [
          "The Pyramids and Great Sphinx were built:-2500",
          "Birth of Buddha:-486",
          "Founding of the Roman Empire:-27",
          "Julius Caesar of Rome was assassinated:-44",
          "Spread of Christianity:1",
          "Split of the the Roman Empire:395"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        [
          "Akkadian Empire:-2300,-2200",
          "Babylonian Empire:-1900,-1600",
          "Egyptian Empire:-1550,-1077",
          "Assyria:-2025,-609",
          "Kingdom of Judah:-1050,-586",
          "Achaemenid Empire:-550,-330",
          "Mauryan Empire:-322,-184",
          "Carthaginian Empire:-814,-146",
          "Seleucid Empire:-312,-63",
          "Han Dynasty:-202,220"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        [
          "Battle of Marathon:Greece",
          "Battle of Zama:Tunisia",
          "Battle of Gaugamela:Iraq",
          "Pyramids of Giza:Egypt",
          "Petra:Jordan",
          "Pompeii:Italy",
          "Library of Alexandria:Egypt"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        [
          "What was the first capital of ancient Egypt?::Memphis##Thebes##Alexandria##Baltimore::0",
          "On what island did ancient Greek civilization originate?::Samos##Crete##Olympia##Rhodes::1",
          "How many of the Seven Wonders of the Ancient World still exist?::3##2##1##0::2",
          "Who is credited with making the first map of the known world?::Archimedes##Anaximander##Euclid##Christopher Columbus::1",
          "In ancient Rome what does a consul's right to reject each other's decisions called?::Tax##Veto##Oversee##Affirm::1",
          "Approximately how old is the great wall of china?::1000 years##2000 years##3000 years##5000 years::2"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [
          "Alexander the Great",
          "Julius Caesar",
          "Plato",
          "Aristotle",
          "Confucius",
          "Socrates"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        [
          "Homo erectus leaves Africa:-1800000",
          "Humans learn to control fire:-400000",
          "Neanderthals become extinct:-40000",
          "Neolithic Revolution:-9000",
          "First civilizations develop in Sumeria:-3500"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        [
          "Venus of Willendorf:Austria",
          "Lascaux cave:France",
          "Sumer:Iraq",
          "Stonehenge:England"
        ]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        [
          "what animal from the stone age is extinct now?::cheetah##mammoth##antelope##Anteater::1",
          "what stage came before the stone age?::Mud Age##Dinosaur Age##Ice Age##The Big Bang::2",
          "What is a hominid?::a tool##an early ancestor of humans ##a collection of ancient bones ##a fishhook::1",
          "Which early hominid migrated out of Africa to Asia and Europe?::Australopithecus##Homo Habilis##Homo Erectus##Homo Sapiens::2",
          "Hominids and humans migrated around the world from what continent?::Africa##Asia##Australia ##Europe::0",
          "Which of the following defines Homo erectus?::thinking man##modern man##wise man##upright man::3"
        ]);
  }
}
