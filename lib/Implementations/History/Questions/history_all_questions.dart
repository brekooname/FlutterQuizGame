import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class HistoryAllQuestions extends AllQuestionsService {
  static final HistoryAllQuestions singleton = HistoryAllQuestions.internal();

  factory HistoryAllQuestions() {
    return singleton;
  }

  HistoryAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    var questionConfig = HistoryGameQuestionConfig();
    addCS(result, questionConfig);
    addDA(result, questionConfig);
    addDE(result, questionConfig);
    addEL(result, questionConfig);
    addEN(result, questionConfig);
    addES(result, questionConfig);
    addFI(result, questionConfig);
    addFR(result, questionConfig);
    addHI(result, questionConfig);
    addHR(result, questionConfig);
    addHU(result, questionConfig);
    addID(result, questionConfig);
    addIT(result, questionConfig);
    addJA(result, questionConfig);
    addKO(result, questionConfig);
    addMS(result, questionConfig);
    addNL(result, questionConfig);
    addNO(result, questionConfig);
    addPL(result, questionConfig);
    addPT(result, questionConfig);
    addRO(result, questionConfig);
    addRU(result, questionConfig);
    addSK(result, questionConfig);
    addSV(result, questionConfig);
    addTH(result, questionConfig);
    addTR(result, questionConfig);
    addUK(result, questionConfig);
    addVI(result, questionConfig);
    addZH(result, questionConfig);
    return result;
  }
  void addCS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.cs;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart píše svou první symfonii:1764", "Deklarace nezávislosti Spojených států:1776", "Napoleon je poražen v bitvě u Waterloo:1815", "První parní lokomotiva:1825", "Vládu Indie převzala Velká Británie:1858", "Edison vynalezl elektrické světlo:1879", "Benz vyvíjí první benzínový vůz:1885", "Einstein ohlašuje teorii relativity:1905", "Titanic, největší loď na světě, se potápí v severním Atlantiku:1912", "První světová válka začíná:1914", "Ruská revoluce:1917", "Hitler získává moc v Německu:1933", "Druhá světová válka začíná:1939", "Konec druhé světové války:1945", "Komunistická Čína byla založena:1949", "Rusko vysílá do vesmíru první satelit Sputnik 1:1957", "Yuri Gagarin se stal prvním člověkem, který letěl ve vesmíru:1961", "Neil Armstrong se stal prvním mužem, který vstoupil na Měsíc:1969", "Černobylská katastrofa:1986", "Pád komunismu ve východní Evropě:1989", "Sjednocení Německa:1990", "Sovětský svaz se rozpadá:1991", "Konec apartheidu v Jižní Africe:1994", "Google je založen:1998", "Teroristické útoky 11. září:2001", "Představení iPhonu:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mughalská říše:1526,1758", "Dynastie Čching:1644,1912", "Ruská říše:1721,1917", "Rakousko-uherské císařství:1867,1918", "Německá říše:1871,1918", "Osmanská říše:1299,1922", "Japonské císařství:1868,1947", "Španělská říše:1402,1975", "Francouzská říše:1534,1980", "Sovětský svaz:1922,1991", "Britské impérium:1603,1997", "Portugalská říše:1415,1999", "Spojené státy:1776,x", "Čína:1949,x", "Evropská unie:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Bitva u Waterloo:Belgie:2,3,5:0", "Bitva u Gettysburgu:Spojené státy:5,6,7:0", "Obléhání Stalingradu:Rusko:6,8,9:0", "Invaze do Normandie:Francie:5,6,8:0", "Bitva o Okinawu:Japonsko:1,8,9:0", "Bitva o Vídeň:Rakousko:6,0,3:0", "Pád Berlínské zdi:Německo:0,5,3:0", "Versailleská smlouva:Francie:1,0,5:0", "Atentát na arcivévodu Františka Ferdinanda:Bosna a Hercegovina:1,5,6:0", "Černobylská katastrofa:Ukrajina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Která země jako první dosáhla jižního pólu?::Norsko##Spojené království##Dánsko##Rusko::0", "Která evropská země měla největší impérium v ​​historii?::Rusko##Spojené království##Itálie##Španělsko::1", "Kterou z těchto afrických zemí ovládalo Německo?::Benin##Angola##Džibutsko##Tanzanie::3", "Kdo byl prvním ruským carem?::Car Mikuláš I##Car Alexandr II##Car Ivan Hrozný##Car Pavel I::2", "Jaká byla bitva, která ukončila napoleonské války?::Bitva o Vídeň##Bitva o Valmy##Bitva u Verdunu##Bitva u Waterloo::3", "Která z těchto zemí byla součástí SSSR?::Slovensko##Mongolsko##Afghánistán##Ázerbajdžán::3", "Které z těchto zemí nebyly nikdy kontrolovány Spojeným královstvím?::Pákistán##Afghánistán##Nigérie##Jordán::1", "Která evropská země byla obviněna z 1. světové války?::Rusko##Spojené království##Německo::2", "Která země byla na začátku 2. světové války neutrální?::Francie##Spojené státy##Německo##Polsko::1", "Který africký vůdce boje proti apartheidu byl propuštěn z vězení v roce 1990, po více než 27 letech?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Který americký prezident byl zvolen do úřadu čtyřikrát?::George Washington##Geralda Forda##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Narození proroka Muhammada, zakladatele islámu:570", "Tisk byl vynalezen v Číně:730", "Rozdělení křesťanské církve:1054", "Magna Carta podepsaná králem Janem:1215", "Dýmějový mor se šíří do Evropy:1347", "Osmanští Turci dobyli Konstantinopol:1453", "Columbus objeví Ameriku:1492", "Budova Taj Mahal dokončena:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sásánovská říše:224,651", "Dynastie Tchang:618,907", "Abbasid kalifát:750,1258", "Pugamská říše:849,1297", "Mongolská říše:1206,1368", "Khmérská říše:802,1431", "Římská říše:-27,1453", "Byzantská říše:395,1453", "Incká říše:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Obléhání Orleansu:Francie:1,2,6:0", "Pád Konstantinopole:Turecko:0,2,7:0", "Bitva u Hastingsu:Spojené království:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kambodža:3,4,6:1", "Taj Mahal:Indie:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Zamýšleným cílem první křížové výpravy bylo dobytí kterého města?::Jeruzalém##Káhira##Mekka##Řím::0", "Co Magna Charta dokázala?::omezovalo to moc vrchnosti##omezovala moc rytířů##zvýšilo to moc rolníků a nevolníků##omezovalo moc panovníka::3", "Jak se dýmějový mor rozšířil?::Špatná voda##Blechy z krys##Znečištěný vzduch##Sopečný popel::1", "Toto město bylo na křižovatce mezi Evropou a Blízkým východem::Káhira##Konstantinopol##Paříž##Moskva::1", "Co bylo příčinou křížových výprav?::Osvobodit Svatou zemi Jeruzalém od muslimů##Vzpoura rolníků##Černá smrt se šíří Evropou##Obchodní války podél Hedvábné stezky::0", "Svatý prorok muslimského náboženství?::Ježíš Kristus##Buddha##Mohamed::2", "Sociální struktura středověku::Kastovní systém##Feudalismus##Manorismus::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Kryštof Kolumbus::", ":Karla Velikého::", ":Leonardo da Vinci::", ":Čingischán::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Byly postaveny pyramidy a velká sfinga:-2500", "Narození Buddhy:-486", "Založení římské říše:-27", "Julius Caesar z Říma byl zavražděn:-44", "Šíření křesťanství:1", "Rozdělení římské říše:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkadská říše:-2300,-2200", "Babylonská říše:-1900,-1600", "Starověký Egypt:-1550,-1077", "Asýrie:-2025,-609", "Judské království:-1050,-586", "Achaemenidská říše:-550,-330", "Maurjovská říše:-322,-184", "Kartáginská říše:-814,-146", "Seleucidská říše:-312,-63", "Dynastie Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Bitva u Maratonu:Řecko::0", "Bitva u Zamy:Tunisko::0", "Bitva u Gaugamely:Irák::0", "Pyramidy v Gíze:Egypt::1", "Petra:Jordán::1", "Pompeje:Itálie::1", "Alexandrijská knihovna:Egypt::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Jaké bylo první hlavní město starověkého Egypta?::Memphis##Thebes##Alexandrie##Baltimore::0", "Na jakém ostrově vznikla starověká řecká civilizace?::Samos##Kréta##Olympia##Rhodos::1", "Kolik ze sedmi divů starověkého světa ještě existuje?::3##2##1##0::2", "Kdo se zasloužil o vytvoření první mapy známého světa?::Archimedes##Anaximander##Euklides##Kryštof Kolumbus::1", "Jak se ve starém Římě nazývalo právo konzula odmítat vzájemná rozhodnutí?::Daň##Vetovat##Dohlížet##Potvrdit::1", "Jak stará je přibližně Velká čínská zeď?::1000 let##2000 let##3000 let##5000 let::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexandr Veliký::", ":Julius Caesar::", ":Aristoteles::", ":Konfucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus opouští Afriku:-1800000", "Lidé se učí ovládat palbu:-400000", "Neandertálci vyhynuli:-40000", "Neolitická revoluce:-9000", "První civilizace se vyvíjejí na Sumerii:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turecko::1", "jeskyně Lascaux:Francie::1", "Sumer:Irák::1", "Stonehenge:Spojené království::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Které zvíře z doby kamenné je nyní vyhynulé?::Gepard##mamut##antilopa##Mravenečník::1", "Jaká etapa přišla před dobou kamennou?::Bahenní věk##Dinosauří věk##Doba ledová##Velký třesk::2", "Co je to hominid?::nástroj##raný předek lidí##sbírka starověkých kostí##rybí háček::1", "Z jakého kontinentu lidé migrovali po celém světě?::Afrika##Asie##Austrálie##Evropa::0", "Která z následujících možností definuje Homo erectus?::myslící člověk##moderní muž##moudrý muž##vzpřímený muž::3"]);
  }void addDA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.da;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart skriver sin første symfoni:1764", "USAs uafhængighedserklæring:1776", "Napoleon er besejret i slaget ved Waterloo:1815", "Første damplokomotiv:1825", "Storbritannien overtog Indiens styre:1858", "Edison opfinder elektrisk lys:1879", "Benz udvikler den første benzindrevne bil:1885", "Einstein annoncerer relativitetsteorien:1905", "Titanic, verdens største skib, synker i Nordatlanten:1912", "Første verdenskrig begynder:1914", "Russisk revolution:1917", "Hitler stiger til magten i Tyskland:1933", "2. verdenskrig begynder:1939", "Slutningen af ​​2. verdenskrig:1945", "Det kommunistiske Kina blev grundlagt:1949", "Rusland sender den første satellit, Sputnik 1, ud i rummet:1957", "Yuri Gagarin bliver den første mand til at flyve i rummet:1961", "Neil Armstrong bliver den første mand til at sætte foden på månen:1969", "Tjernobylkatastrofe:1986", "Kommunismens fald i Østeuropa:1989", "Tysklands forening:1990", "Sovjetunionen bryder sammen:1991", "Slutningen af ​​apartheid i Sydafrika:1994", "Google blev grundlagt:1998", "11. september Terrorangreb:2001", "Introduktion af iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mogulriget:1526,1758", "Qing-dynastiet:1644,1912", "Det Russiske Kejserrige:1721,1917", "Østrig-Ungarsk:1867,1918", "Det tyske Imperium:1871,1918", "Det Osmanniske Rige:1299,1922", "Kejserriget Japan:1868,1947", "Spanske Imperium:1402,1975", "Fransk Imperium:1534,1980", "Sovjetunionen:1922,1991", "Britiske Imperium:1603,1997", "Portugisisk Imperium:1415,1999", "USA:1776,x", "Kina:1949,x", "Den Europæiske Union:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Slaget ved Waterloo:Belgien:2,3,5:0", "Slaget ved Gettysburg:Forenede Stater:5,6,7:0", "Belejring af Stalingrad:Rusland:6,8,9:0", "Invasion af Normandiet:Frankrig:5,6,8:0", "Slaget ved Okinawa:Japan:1,8,9:0", "Slaget ved Wien:Østrig:6,0,3:0", "Berlinmurens fald:Tyskland:0,5,3:0", "Versailles-traktaten:Frankrig:1,0,5:0", "Mordet på ærkehertug Franz Ferdinand:Bosnien-Hercegovina:1,5,6:0", "Tjernobyl-katastrofen:Ukraine:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Hvilket land var det første, der nåede sydpolen?::Norge##Det Forenede Kongerige##Danmark##Rusland::0", "Hvilket europæisk land havde det største imperium i historien?::Rusland##Det Forenede Kongerige##Italien##Spanien::1", "Hvilket af disse afrikanske lande blev kontrolleret af Tyskland?::Benin##Angola##Djibouti##Tanzania::3", "Hvem var den første zar af Rusland?::Zar Nicholas I##Zar Alexander II##Zar Ivan den Forfærdelige##Zar Paul I::2", "Hvad var slaget, der afsluttede Napoleonskrigene?::Slaget ved Wien##Slaget ved Valmy##Slaget ved Verdun##Slaget ved Waterloo::3", "Hvilket af disse lande var en del af USSR?::Slovakiet##Mongoliet##Afghanistan##Aserbajdsjan::3", "Hvilket af disse lande blev aldrig kontrolleret af Storbritannien?::Pakistan##Afghanistan##Nigeria##Jordan::1", "Hvilket europæisk land fik skylden for 1. Verdenskrig?::Rusland##Det Forenede Kongerige##Tyskland::2", "Hvilket land var neutralt i begyndelsen af ​​Anden Verdenskrig?::Frankrig##Forenede Stater##Tyskland##Polen::1", "Hvilken afrikansk anti-apartheid-leder blev løsladt fra fængslet i 1990 efter mere end 27 år?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Hvilken amerikansk præsident blev valgt til embedet fire gange?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":william Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Fødsel af profeten Muhammad, islams grundlægger:570", "Trykning blev opfundet i Kina:730", "Opdeling af den kristne kirke:1054", "Magna Carta underskrevet af kong John:1215", "Bobepest spredes til Europa:1347", "De osmanniske tyrkere erobrede Konstantinopel:1453", "Columbus opdager Amerika:1492", "Bygningen af ​​Taj Mahal afsluttet:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sassaniderne:224,651", "Tang-dynastiet:618,907", "Abbasidisk kalifat:750,1258", "Kongeriget Pagan:849,1297", "Mongolske kejserdømme:1206,1368", "Khmerriget:802,1431", "Romerriget:-27,1453", "Det Byzantinske Rige:395,1453", "Inkariget:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Belejring af Orleans:Frankrig:1,2,6:0", "Konstantinopels fald:Tyrkiet:0,2,7:0", "Slaget ved Hastings:Det Forenede Kongerige:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Cambodja:3,4,6:1", "Taj Mahal:Indien:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Det første korstog havde det tilsigtede mål at erobre hvilken by?::Jerusalem##Cairo##Mekka##Rom::0", "Hvad udrettede Magna Carta?::det begrænsede herrernes magt##det begrænsede riddernes magt##det øgede bøndernes og livegnes magt##det begrænsede monarkens magt::3", "Hvordan spredte byllepesten sig?::Dårligt vand##Lopper fra rotter##Forurenet luft##Vulkanaske::1", "Denne by var på en korsvej mellem Europa og Mellemøsten::Cairo##Konstantinopel##Paris##Moskva::1", "Hvad var årsagen til korstogene?::At befri det hellige land Jerusalem fra muslimerne##Et oprør af bønder##Den sorte død breder sig over Europa##Handelskrige langs Silkevejen::0", "Den muslimske religions hellige profet?::Jesus Kristus##Buddha##Muhammed::2", "Middelalderens sociale struktur::Kastesystem##Feudalisme##Herregård::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Karl den Store::", ":Leonardo Da Vinci::", ":Genghis khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Pyramiderne og Stor sfinx blev bygget:-2500", "Buddhas fødsel:-486", "Grundlæggelse af det romerske imperium:-27", "Julius Caesar fra Rom blev myrdet:-44", "Spredning af kristendommen:1", "Split af Romerriget:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkadiske Imperium:-2300,-2200", "Babyloniske Imperium:-1900,-1600", "Egyptisk Imperium:-1550,-1077", "Assyrien:-2025,-609", "Kongeriget Juda:-1050,-586", "Achæmenidiske rige:-550,-330", "Mauryan Imperium:-322,-184", "Karthago:-814,-146", "Seleukiderne:-312,-63", "Han-dynastiet:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Slaget ved Marathon:Grækenland::0", "Slaget ved Zama:Tunesien::0", "Slaget ved Gaugamela:Irak::0", "Pyramiderne i Giza:Egypten::1", "Petra:Jordan::1", "Pompeji:Italien::1", "Bibliotek i Alexandria:Egypten::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Hvad var den første hovedstad i det gamle Egypten?::Memphis##Theben##Alexandria##Baltimore::0", "På hvilken ø opstod den antikke græske civilisation?::Samos##Kreta##Olympia##Rhodos::1", "Hvor mange af de syv vidundere i den antikke verden eksisterer stadig?::3##2##1##0::2", "Hvem er krediteret for at lave det første kort over den kendte verden?::Archimedes##Anaximander##Euklid##Christopher Columbus::1", "Hvad hedder en konsuls ret til at afvise hinandens beslutninger i det gamle Rom?::Skat##Veto##Overvåge##Bekræfte::1", "Hvor gammel er den kinesiske mur cirka?::1000 år##2000 år##3000 år##5000 år::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander den Store::", ":Julius Cæsar::", ":Aristoteles::", ":Konfucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus forlader Afrika:-1800000", "Mennesker lærer at kontrollere ild:-400000", "Neandertalere udryddes:-40000", "Neolitisk revolution:-9000", "De første civilisationer udvikler sig i Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Tyrkiet::1", "Lascaux hule:Frankrig::1", "Sumer:Irak::1", "Stonehenge:Det Forenede Kongerige::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Hvilket dyr fra stenalderen er uddødt nu?::gepard##mammut##antilope##Myresluger::1", "Hvilken fase kom før stenalderen?::Mudder Alder##Dinosaurs tidsalder##Istid##Det store brag::2", "Hvad er en hominid?::et værktøj##en tidlig forfader til mennesker##en samling af gamle knogler##en fiskekrog::1", "Mennesker migrerede rundt i verden fra hvilket kontinent?::Afrika##Asien##Australien##Europa::0", "Hvilken af ​​følgende definerer Homo erectus?::tænkende mand##moderne mand##Vis mand##oprejst mand::3"]);
  }void addDE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.de;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart schreibt seine erste Symphonie:1764", "Unabhängigkeitserklärung der Vereinigten Staaten:1776", "Napoleon wird in der Schlacht von Waterloo besiegt:1815", "Erste Dampflokomotive:1825", "Großbritannien übernahm die Herrschaft Indiens:1858", "Edison erfindet elektrisches Licht:1879", "Benz entwickelt das erste benzinbetriebene Auto:1885", "Einstein kündigt die Relativitätstheorie an:1905", "Die Titanic, das größte Schiff der Welt, sinkt im Nordatlantik:1912", "Der 1. Weltkrieg beginnt:1914", "Russische Revolution:1917", "Hitler steigt in Deutschland an die Macht:1933", "Der 2. Weltkrieg beginnt:1939", "Ende des Zweiten Weltkriegs:1945", "Das kommunistische China wird gegründet:1949", "Russland sendet den ersten Satelliten ins All, Sputnik 1:1957", "Yuri Gagarin ist der erste Mann, der im Weltraum fliegt:1961", "Neil Armstrong ist der erste Mann, der den Mond betritt:1969", "Tschernobyl-Katastrophe:1986", "Fall des Kommunismus in Osteuropa:1989", "Vereinigung Deutschlands:1990", "Sowjetunion löst sich auf:1991", "Ende der Apartheid in Südafrika:1994", "Google wird gegründet:1998", "11. September Terroranschläge:2001", "Einführung des iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mogulreich:1526,1758", "Qing-Dynastie:1644,1912", "Russisches Reich:1721,1917", "Österreichisch-Ungarisches Reich:1867,1918", "Deutsches Reich:1871,1918", "Osmanisches Reich:1299,1922", "Japanisches Kaiserreich:1868,1947", "Spanisches Reich:1402,1975", "Französisches Reich:1534,1980", "Sowjetunion:1922,1991", "Britisches Empire:1603,1997", "Portugiesisches Reich:1415,1999", "Vereinigte Staaten:1776,x", "China:1949,x", "Europäische Union:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Schlacht von Waterloo:Belgien:2,3,5:0", "Schlacht von Gettysburg:Vereinigte Staaten:5,6,7:0", "Belagerung von Stalingrad:Russland:6,8,9:0", "Invasion der Normandie:Frankreich:5,6,8:0", "Die Schlacht von Okinawa:Japan:1,8,9:0", "Die Schlacht um Wien:Österreich:6,0,3:0", "Fall der Berliner Mauer:Deutschland:0,5,3:0", "Vertrag von Versailles:Frankreich:1,0,5:0", "Ermordung von Erzherzog Franz Ferdinand:Bosnien und Herzegowina:1,5,6:0", "Tschernobyl Katastrophe:Ukraine:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Welches Land hat als erstes den Südpol erreicht?::Norwegen##Großbritannien##Dänemark##Russland::0", "Welches europäische Land hatte das größte Reich der Geschichte?::Russland##Großbritannien##Italien##Spanien::1", "Welches dieser afrikanischen Länder wurde von Deutschland kontrolliert?::Benin##Angola##Dschibuti##Tansania::3", "Wer war der erste Zar Russlands?::Zar Nikolaus I##Zar Alexander II##Zar Iwan der Schreckliche##Zar Paul I::2", "Was war die Schlacht, die die Napoleonischen Kriege beendete?::Schlacht um Wien##Schlacht von Valmy##Schlacht von Verdun##Schlacht von Waterloo::3", "Welches dieser Länder war Teil der UdSSR?::Slowakei##Mongolei##Afghanistan##Aserbaidschan::3", "Welches dieser Länder wurde nie von Großbritannien kontrolliert?::Pakistan##Afghanistan##Nigeria##Jordanien::1", "Welches europäische Land wurde für den Ersten Weltkrieg verantwortlich gemacht?::Russland##Großbritannien##Deutschland::2", "Welches Land war zu Beginn des Zweiten Weltkriegs neutral?::Frankreich##Vereinigte Staaten##Deutschland##Polen::1", "Welcher afrikanische Anti-Apartheid-Führer wurde 1990 nach mehr als 27 Jahren aus dem Gefängnis entlassen?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Welcher US-Präsident wurde viermal ins Amt gewählt?::George Washington##Gerald Ford##Franklin D. Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Geburt des Propheten Muhammad, des Begründers des Islam:570", "Der Druck wurde in China erfunden:730", "Spaltung der christlichen Kirche:1054", "Magna Carta signiert von König John:1215", "Die Beulenpest breitet sich nach Europa aus:1347", "Die osmanischen Türken eroberten Konstantinopel:1453", "Columbus entdeckt Amerika:1492", "Bau des Taj Mahal abgeschlossen:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sassanidenreich:224,651", "Tang-Dynastie:618,907", "Abbasidisches Kalifat:750,1258", "Königreich Bagan:849,1297", "Mongolisches Reich:1206,1368", "Khmer-Reich:802,1431", "Römisches Reich:-27,1453", "Byzantinisches Reich:395,1453", "Inka-Reich:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Belagerung von Orleans:Frankreich:1,2,6:0", "Untergang von Konstantinopel:Türkei:0,2,7:0", "Schlacht von Hastings:Großbritannien:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kambodscha:3,4,6:1", "Taj Mahal:Indien:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Der Erste Kreuzzug hatte das beabsichtigte Ziel, welche Stadt zu erobern?::Jerusalem##Kairo##Mekka##Rom::0", "Was hat die Magna Carta bewirkt?::es begrenzte die Macht der Herren##es begrenzte die Macht der Ritter##es erhöhte die Macht der Bauern und Leibeigenen##es begrenzte die Macht des Monarchen::3", "Wie hat sich die Beulenpest verbreitet?::Schlechtes Wasser##Flöhe von Ratten##Verschmutzte Luft##Vulkanasche::1", "Diese Stadt lag an einer Kreuzung zwischen Europa und dem Nahen Osten::Kairo##Konstantinopel##Paris##Moskau::1", "Was war die Ursache der Kreuzzüge?::Um das Heilige Land Jerusalem von den Muslimen zu befreien##Ein Aufstand der Bauern##Der Schwarze Tod breitet sich über Europa aus##Handelskriege entlang der Seidenstraße::0", "Heiliger Prophet der muslimischen Religion?::Jesus Christus##Buddha##Muhammad::2", "Sozialstruktur des Mittelalters::Kastensystem##Feudalismus##Herrenhaus::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christoph Kolumbus::", ":Karl der Große::", ":Leonardo da Vinci::", ":Dschinghis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Die Pyramiden und die Große Sphinx wurden gebaut:-2500", "Geburt Buddhas:-486", "Gründung des Römischen Reiches:-27", "Julius Cäsar von Rom wurde ermordet:-44", "Verbreitung des Christentums:1", "Spaltung des Römischen Reiches:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Reich von Akkad:-2300,-2200", "Babylonisches Reich:-1900,-1600", "Ägyptisches Reich:-1550,-1077", "Assyrien:-2025,-609", "Königreich Juda:-1050,-586", "Achämenidenreich:-550,-330", "Maurya Reich:-322,-184", "Karthagisches Reich:-814,-146", "Seleukidenreich:-312,-63", "Han-Dynastie:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Schlacht von Marathon:Griechenland::0", "Schlacht von Zama:Tunesien::0", "Schlacht von Gaugamela:Irak::0", "Pyramiden von Gizeh:Ägypten::1", "Petra:Jordanien::1", "Pompeji:Italien::1", "Bibliothek von Alexandria:Ägypten::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Was war die erste Hauptstadt des alten Ägyptens?::Memphis##Theben##Alexandria##Baltimore::0", "Auf welcher Insel entstand die antike griechische Zivilisation?::Samos##Kreta##Olympia##Rhodos::1", "Wie viele der sieben Weltwunder der Antike existieren noch?::3##2##1##0::2", "Wem wird zugeschrieben, die erste Karte der bekannten Welt gemacht zu haben?::Archimedes##Anaximander##Euklid##Christoph Kolumbus::1", "Wie heißt im alten Rom das Recht eines Konsuls, die Entscheidungen des anderen abzulehnen?::Steuer##Einspruch##Überwachen##Bestätigen::1", "Wie alt ist die Chinesische Mauer ungefähr?::1000 Jahre##2000 Jahre##3000 Jahre##5000 Jahre::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander der Große::", ":Julius Caesar::", ":Aristoteles::", ":Konfuzius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus verlässt Afrika:-1800000", "Menschen lernen, Feuer zu kontrollieren:-400000", "Neandertaler sterben aus:-40000", "Neolithische Revolution:-9000", "Erste Zivilisationen entwickeln sich in Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Türkei::1", "Höhle von Lascaux:Frankreich::1", "Sumer:Irak::1", "Stonehenge:Großbritannien::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Welches Tier aus der Steinzeit ist heute ausgestorben?::Gepard##Mammut-##Antilope##Ameisenbär::1", "Welche Phase kam vor der Steinzeit?::Schlammalter##Dinosaurier-Zeitalter##Eiszeit##Der Urknall::2", "Was ist ein Hominide?::ein Werkzeug##ein früher Vorfahr des Menschen##eine Sammlung alter Knochen##ein Angelhaken::1", "Von welchem ​​Kontinent sind die Menschen um die Welt gewandert?::Afrika##Asien##Australien##Europa::0", "Welche der folgenden Definitionen definiert Homo erectus?::denkender Mann##moderner Mann##weiser Mann##aufrechter Mann::3"]);
  }void addEL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.el;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Ο Μότσαρτ γράφει την πρώτη του συμφωνία:1764", "Διακήρυξη Ανεξαρτησίας των Ηνωμένων Πολιτειών:1776", "Ο Ναπολέων νίκησε στη Μάχη του Βατερλώ:1815", "Πρώτη ατμομηχανή ατμού:1825", "Η Μεγάλη Βρετανία ανέλαβε τον κανόνα της Ινδίας:1858", "Ο Edison εφευρίσκει ηλεκτρικό φως:1879", "Η Benz αναπτύσσει το πρώτο βενζινοκίνητο αυτοκίνητο:1885", "Ο Αϊνστάιν ανακοινώνει τη θεωρία της σχετικότητας:1905", "Ο Τιτανικός, το μεγαλύτερο πλοίο στον κόσμο, βυθίζεται στο Βόρειο Ατλαντικό:1912", "Ο Παγκόσμιος Πόλεμος ξεκινά:1914", "Ρωσική Επανάσταση:1917", "Ο Χίτλερ ανεβαίνει στην εξουσία στη Γερμανία:1933", "Ο Δεύτερος Παγκόσμιος Πόλεμος ξεκινά:1939", "Τέλος του Δεύτερου Παγκόσμιου Πολέμου:1945", "Η Κομμουνιστική Κίνα ιδρύθηκε:1949", "Η Ρωσία στέλνει στο διάστημα τον πρώτο δορυφόρο, Sputnik 1:1957", "Ο Γιούρι Γκαγκάριν γίνεται ο πρώτος άνθρωπος που πέταξε στο διάστημα:1961", "Ο Neil Armstrong γίνεται ο πρώτος άντρας που πήρε πόδι στο φεγγάρι:1969", "Καταστροφή του Τσερνομπίλ:1986", "Πτώση του κομμουνισμού στην Ανατολική Ευρώπη:1989", "Ενοποίηση της Γερμανίας:1990", "Η Σοβιετική Ένωση διαλύεται:1991", "Τέλος του Απαρτχάιντ στη Νότια Αφρική:1994", "Η Google ιδρύθηκε:1998", "Επιθέσεις της 11ης Σεπτεμβρίου:2001", "Εισαγωγή του iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["αυτοκρατορία Μουγκάλ:1526,1758", "Δυναστεία Τσινγκ:1644,1912", "Ρωσική αυτοκρατορία:1721,1917", "Αυστρο-Ουγγρική αυτοκρατορία:1867,1918", "Γερμανική αυτοκρατορία:1871,1918", "Οθωμανική αυτοκρατορία:1299,1922", "αυτοκρατορία της Ιαπωνίας:1868,1947", "Ισπανική αυτοκρατορία:1402,1975", "Γαλλική αυτοκρατορία:1534,1980", "Σοβιετική Ένωση:1922,1991", "Βρετανική αυτοκρατορία:1603,1997", "Πορτογαλική αυτοκρατορία:1415,1999", "Ηνωμένες Πολιτείες:1776,x", "Κίνα:1949,x", "Ευρωπαϊκή Ένωση:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Μάχη του Βατερλώ:Βέλγιο:2,3,5:0", "Μάχη του Γκέτισμπουργκ:Ηνωμένες Πολιτείες:5,6,7:0", "Πολιορκία του Στάλινγκραντ:Ρωσία:6,8,9:0", "Εισβολή στη Νορμανδία:Γαλλία:5,6,8:0", "Η Μάχη της Οκινάουα:Ιαπωνία:1,8,9:0", "Η Μάχη της Βιέννης:Αυστρία:6,0,3:0", "Πτώση του Τείχους του Βερολίνου:Γερμανία:0,5,3:0", "Συνθήκη των Βερσαλλιών:Γαλλία:1,0,5:0", "Δολοφονία του Αρχιδούκα Φραντς Φερδινάνδου:Βοσνία και Ερζεγοβίνη:1,5,6:0", "Η καταστροφή του Τσερνομπίλ:Ουκρανία:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Ποια χώρα ήταν η πρώτη που έφτασε στο νότιο πόλο;::Νορβηγία##Ηνωμένο Βασίλειο##Δανία##Ρωσία::0", "Ποια ευρωπαϊκή χώρα είχε τη μεγαλύτερη αυτοκρατορία στην ιστορία;::Ρωσία##Ηνωμένο Βασίλειο##Ιταλία##Ισπανία::1", "Ποια από αυτές τις αφρικανικές χώρες ελεγχόταν από τη Γερμανία;::Μπενίν##Αγκόλα##Τζιμπουτί##Τανζανία::3", "Ποιος ήταν ο πρώτος Τσάρος της Ρωσίας;::Τσάρος Νικόλαος Α΄##Τσάρος Αλέξανδρος Β&#39;##Ο Τσάρος Ιβάν ο Τρομερός##Τσάρος Παύλος Α&#39;::2", "Ποια ήταν η μάχη που τελείωσε τους Ναπολεόντειους Πολέμους;::Μάχη της Βιέννης##Μάχη του Βάλμι##Μάχη του Βερντέν##Μάχη του Βατερλώ::3", "Ποια από αυτές τις χώρες ήταν μέρος της ΕΣΣΔ;::Σλοβακία##Μογγολία##Αφγανιστάν##Αζερμπαϊτζάν::3", "Ποια από αυτές τις χώρες δεν ελεγχόταν ποτέ από το Ηνωμένο Βασίλειο;::Πακιστάν##Αφγανιστάν##Νιγηρία##Ιορδανία::1", "Ποια ευρωπαϊκή χώρα κατηγορήθηκε για τον Α&#39; Παγκόσμιο Πόλεμο;::Ρωσία##Ηνωμένο Βασίλειο##Γερμανία::2", "Ποια χώρα ήταν ουδέτερη στην αρχή του Β&#39; Παγκοσμίου Πολέμου;::Γαλλία##Ηνωμένες Πολιτείες##Γερμανία##Πολωνία::1", "Ποιος Αφρικανός ηγέτης κατά του απαρτχάιντ απελευθερώθηκε από τη φυλακή το 1990, μετά από περισσότερα από 27 χρόνια;::Ίντι Αμίν##Νέλσον Μαντέλα##Φερδινάνδος Μάρκος##Τζόζεφ Άτκινσον::1", "Ποιος πρόεδρος των ΗΠΑ εξελέγη τέσσερις φορές;::Γιώργος Ουάσιγκτον##Τζέραλντ Φορντ##Franklin D Roosevelt##Αβραάμ Λίνκολν::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Ναπολέων Βοναπάρτης::", ":Ουίλιαμ Σαίξπηρ::", ":Αβραάμ Λίνκολν::", ":Γιώργος Ουάσιγκτον::", ":Κάρολος Δαρβίνος::", ":Ισαάκ Νιούτον::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Γέννηση του Προφήτη Μωάμεθ, ιδρυτή του Ισλάμ:570", "Η εκτύπωση εφευρέθηκε στην Κίνα:730", "Διαίρεση της Χριστιανικής Εκκλησίας:1054", "Η Magna Carta υπογράφηκε από τον King John:1215", "Η πανούκλα Bubonic εξαπλώνεται στην Ευρώπη:1347", "Οι Οθωμανοί Τούρκοι κατέλαβαν την Κωνσταντινούπολη:1453", "Ο Κολόμβος ανακαλύπτει την Αμερική:1492", "Ολοκληρώθηκε το κτίριο του Taj Mahal:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Αυτοκρατορία των Σασσανιδών:224,651", "Δυναστεία Τανγκ:618,907", "Χαλιφάτο των Αββασιδών:750,1258", "βασίλειο της Παγκάν:849,1297", "Μογγολική αυτοκρατορία:1206,1368", "Αυτοκρατορία του Άνγκορ:802,1431", "Ρωμαϊκή αυτοκρατορία:-27,1453", "Βυζαντινή αυτοκρατορία:395,1453", "αυτοκρατορία Inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Πολιορκία της Ορλεάνης:Γαλλία:1,2,6:0", "Άλωση της Κωνσταντινούπολης:Τουρκία:0,2,7:0", "Μάχη του Χέιστινγκς:Ηνωμένο Βασίλειο:0,1,5:0", "Μάτσου Πίτσου:Περού:4,5,6:1", "Bagan:Μιανμάρ:3,5,7:1", "Angkor:Καμπότζη:3,4,6:1", "Ταζ Μαχάλ:Ινδία:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Η Πρώτη Σταυροφορία είχε τον επιδιωκόμενο στόχο να καταλάβει ποια πόλη;::Ιερουσαλήμ##Κάιρο##Μέκκα##Ρώμη::0", "Τι πέτυχε η Magna Carta;::περιόριζε τη δύναμη των αρχόντων##περιόριζε τη δύναμη των ιπποτών##αύξησε τη δύναμη των αγροτών και των δουλοπάροικων##περιόριζε την εξουσία του μονάρχη::3", "Πώς εξαπλώθηκε η βουβωνική πανώλη;::Κακό νερό##Ψύλλοι από αρουραίους##Μολυσμένος αέρας##Τέφρα ηφαιστείου::1", "Αυτή η πόλη βρισκόταν σε ένα σταυροδρόμι μεταξύ Ευρώπης και Μέσης Ανατολής::Κάιρο##Κωνσταντινούπολη##Παρίσι##Μόσχα::1", "Ποια ήταν η αιτία των Σταυροφοριών;::Να απελευθερώσει την Ιερή γη της Ιερουσαλήμ από τους Μουσουλμάνους##Μια εξέγερση των αγροτών##Ο Μαύρος Θάνατος εξαπλώνεται στην Ευρώπη##Εμπορικοί πόλεμοι κατά μήκος του Δρόμου του Μεταξιού::0", "Άγιος προφήτης της μουσουλμανικής θρησκείας;::Ιησούς Χριστός##Βούδας##Μωάμεθ::2", "Κοινωνική δομή του Μεσαίωνα::Σύστημα κάστας##Φεουδαρχία##Μανορισμός::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Χριστόφορος Κολόμβος::", ":Καρλομάγνος::", ":Λεονάρντο Ντα Βίντσι::", ":Τζένγκις Χαν::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Οι Πυραμίδες και η Μεγάλη Σφίγγα χτίστηκαν:-2500", "Γέννηση του Βούδα:-486", "Ίδρυση της Ρωμαϊκής Αυτοκρατορίας:-27", "Ο Ιούλιος Καίσαρας της Ρώμης δολοφονήθηκε:-44", "Διάδοση του Χριστιανισμού:1", "Διαίρεση της Ρωμαϊκής Αυτοκρατορίας:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Ακκαδική αυτοκρατορία:-2300,-2200", "Βαβυλωνιακή αυτοκρατορία:-1900,-1600", "Αιγυπτιακή αυτοκρατορία:-1550,-1077", "Ασσυρία:-2025,-609", "Βασίλειο του Ιούδα:-1050,-586", "Αχαιμενιδική αυτοκρατορία:-550,-330", "Αυτοκρατορία της Μαυριτανίας:-322,-184", "Καρθαγένη αυτοκρατορία:-814,-146", "Αυτοκρατορία των Σελευκιδών:-312,-63", "Δυναστεία Χαν:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Μάχη του Μαραθώνα:Ελλάδα::0", "Μάχη του Ζάμα:Τυνησία::0", "Μάχη των Γαυγαμέλα:Ιράκ::0", "Πυραμίδες της Γκίζας:Αίγυπτος::1", "Πέτρα:Ιορδανία::1", "Πομπηία:Ιταλία::1", "Βιβλιοθήκη Αλεξάνδρειας:Αίγυπτος::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Ποια ήταν η πρώτη πρωτεύουσα της αρχαίας Αιγύπτου;::Μέμφις##Θήβα##Αλεξανδρεία##Βαλτιμόρη::0", "Σε ποιο νησί ξεκίνησε ο αρχαίος ελληνικός πολιτισμός;::Σάμος##Κρήτη##Ολυμπία##Ρόδος::1", "Πόσα από τα Επτά Θαύματα του Αρχαίου Κόσμου υπάρχουν ακόμα;::3##2##1##0::2", "Σε ποιον πιστώνεται η κατασκευή του πρώτου χάρτη του γνωστού κόσμου;::Αρχιμήδης##Αναξίμανδρος##Ευκλείδης##Χριστόφορος Κολόμβος::1", "Στην αρχαία Ρώμη πώς ονομαζόταν το δικαίωμα του προξένου να απορρίπτει ο ένας τις αποφάσεις του άλλου;::Φόρος##Βέτο##Επιβλέπω##Επιβεβαιώνουμε::1", "Πόσο χρονών είναι περίπου το Σινικό Τείχος της Κίνας;::1000 χρόνια##2000 χρόνια##3000 χρόνια##5000 χρόνια::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Μέγας Αλέξανδρος::", ":Ιούλιος Καίσαρας::", ":Αριστοτέλης::", ":Κομφούκιος::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Ο Homo erectus φεύγει από την Αφρική:-1800000", "Οι άνθρωποι μαθαίνουν να ελέγχουν τη φωτιά:-400000", "Οι Νεάντερταλ έχουν εξαφανιστεί:-40000", "Νεολιθική Επανάσταση:-9000", "Οι πρώτοι πολιτισμοί αναπτύσσονται στη Σουμερία:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Τουρκία::1", "Σπήλαιο Lascaux:Γαλλία::1", "Σούμερ:Ιράκ::1", "Στόουνχεντζ:Ηνωμένο Βασίλειο::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Ποιο ζώο από την λίθινη εποχή έχει εξαφανιστεί τώρα;::γατόπαρδος##μαμμούθ##αντιλόπη##Μυρμηγκοφάγος::1", "Ποιο στάδιο ήρθε πριν από την λίθινη εποχή;::Εποχή της Λάσπης##Εποχή Δεινοσαύρων##Εποχή των παγετώνων##Η μεγάλη έκρηξη::2", "Τι είναι ένα ανθρωποειδές;::ένα εργαλείο##ένας πρώιμος πρόγονος των ανθρώπων##μια συλλογή αρχαίων οστών##ένα αγκίστρι::1", "Από ποια ήπειρο μετανάστευσαν οι άνθρωποι σε όλο τον κόσμο;::Αφρική##Ασία##Αυστραλία##Ευρώπη::0", "Ποιο από τα παρακάτω ορίζει τον Homo erectus;::σκεπτόμενος ΑΝΘΡΩΠΟΣ##ΣΥΓΧΡΟΝΟΣ ΑΝΘΡΩΠΟΣ##σοφός άνθρωπος##όρθιος άνθρωπος::3"]);
  }void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart writes his first symphony:1764", "United States Declaration of Independence:1776", "Napoleon is defeated at the Battle of Waterloo:1815", "First Steam Locomotive:1825", "Great Britain took over the rule of India:1858", "Edison invents electric light:1879", "Benz develops first petrol-driven car:1885", "Einstein announces the theory of relativity:1905", "Titanic, world’s biggest ship, sinks in North Atlantic:1912", "World War One begins:1914", "Russian Revolution:1917", "Hitler rises to power in Germany:1933", "World War Two begins:1939", "End of World War Two:1945", "Communist China is founded:1949", "Russia sends into space the first satellite, Sputnik 1:1957", "Yuri Gagarin becomes the first man to fly in space:1961", "Neil Armstrong becomes the first man to set foot on the moon:1969", "Chernobyl disaster:1986", "Fall of Communism in Eastern Europe:1989", "Unification of Germany:1990", "Soviet Union breaks up:1991", "End of Apartheid in South Africa:1994", "Google is founded:1998", "September 11 Terrorist Attacks:2001", "Introduction of the iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mughal Empire:1526,1758", "Qing Dynasty:1644,1912", "Russian Empire:1721,1917", "Austro-Hungarian Empire:1867,1918", "German Empire:1871,1918", "Ottoman Empire:1299,1922", "Empire of Japan:1868,1947", "Spanish Empire:1402,1975", "French empire:1534,1980", "Soviet Union:1922,1991", "British Empire:1603,1997", "Portuguese Empire:1415,1999", "United States:1776,x", "China:1949,x", "European Union:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Battle of Waterloo:Belgium:2,3,5:0", "Battle of Gettysburg:United States:5,6,7:0", "Siege of Stalingrad:Russia:6,8,9:0", "Invasion of Normandy:France:5,6,8:0", "The Battle of Okinawa:Japan:1,8,9:0", "The Battle of Vienna:Austria:6,0,3:0", "Fall of the Berlin Wall:Germany:0,5,3:0", "Treaty of Versailles:France:1,0,5:0", "Assassination of Archduke Franz Ferdinand:Bosnia and Herzegovina:1,5,6:0", "Chernobyl disaster:Ukraine:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Which country was the first one to reach the south pole?::Norway##United Kingdom##Denmark##Russia::0", "Which European country had the largest empire in history?::Russia##United Kingdom##Italy##Spain::1", "Which one of these African countries was controlled by Germany?::Benin##Angola##Djibouti##Tanzania::3", "Who was the first Tsar of Russia?::Tsar Nicholas I##Tsar Alexander II##Tsar Ivan the Terrible##Tsar Paul I::2", "What was the battle that ended the Napoleonic Wars?::Battle of Vienna##Battle of Valmy##Battle of Verdun##Battle of Waterloo::3", "Which of these countries was part of the USSR?::Slovakia##Mongolia##Afghanistan##Azerbaijan::3", "Which one of these countries were never controlled by The United Kingdom?::Pakistan##Afghanistan##Nigeria##Jordan::1", "What European country was blamed for World War 1?::Russia##United Kingdom##Germany::2", "What country was neutral at the beginning of World War 2?::France##United States##Germany##Poland::1", "Which African anti-apartheid leader was released from jail in 1990, after more than 27 years?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Which US president was elected to office four times?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Birth of Prophet Muhammad, the founder of Islam:570", "Printing was invented in China:730", "Split of the Christian Church:1054", "Magna Carta signed by King John:1215", "Bubonic plague spreads to Europe:1347", "The Ottoman Turks captured Constantinople:1453", "Columbus discovers America:1492", "Building of Taj Mahal completed:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sasanian Empire:224,651", "Tang Dynasty:618,907", "Abbasid Caliphate:750,1258", "Pagan Kingdom:849,1297", "Mongol Empire:1206,1368", "Khmer Empire:802,1431", "Roman Empire:-27,1453", "Byzantine Empire:395,1453", "Inca Empire:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Siege of Orleans:France:1,2,6:0", "Fall of Constantinople:Turkey:0,2,7:0", "Battle of Hastings:United Kingdom:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Cambodia:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["The First Crusade had the intended goal of capturing which city?::Jerusalem##Cairo##Mecca##Rome::0", "What did the Magna Carta accomplish?::it limited the power of the lords##it limited the power of knights##it increased the power of peasants and serfs##it limited the power of the monarch::3", "How did the Bubonic Plague spread?::Bad water##Fleas from rats##Polluted air##Volcano ash::1", "This city was on a crossroads between Europe and the Middle East::Cairo##Constantinople##Paris##Moscow::1", "What was the cause of the Crusades?::To liberate the Holy land of Jerusalem from the Muslims##A revolt of peasants##The Black Death spreading over Europe##Trading wars along the Silk Road::0", "Holy prophet of the Muslim religion?::Jesus Christ##Buddha##Muhammad::2", "Social structure of the Middle Ages::Caste System##Feudalism##Manorism::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Charlemagne::", ":Leonardo da Vinci::", ":Genghis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["The Pyramids and Great Sphinx were built:-2500", "Birth of Buddha:-486", "Founding of the Roman Empire:-27", "Julius Caesar of Rome was assassinated:-44", "Spread of Christianity:1", "Split of the the Roman Empire:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkadian Empire:-2300,-2200", "Babylonian Empire:-1900,-1600", "Egyptian Empire:-1550,-1077", "Assyria:-2025,-609", "Kingdom of Judah:-1050,-586", "Achaemenid Empire:-550,-330", "Mauryan Empire:-322,-184", "Carthaginian Empire:-814,-146", "Seleucid Empire:-312,-63", "Han Dynasty:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Battle of Marathon:Greece::0", "Battle of Zama:Tunisia::0", "Battle of Gaugamela:Iraq::0", "Pyramids of Giza:Egypt::1", "Petra:Jordan::1", "Pompeii:Italy::1", "Library of Alexandria:Egypt::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["What was the first capital of ancient Egypt?::Memphis##Thebes##Alexandria##Baltimore::0", "On what island did ancient Greek civilization originate?::Samos##Crete##Olympia##Rhodes::1", "How many of the Seven Wonders of the Ancient World still exist?::3##2##1##0::2", "Who is credited with making the first map of the known world?::Archimedes##Anaximander##Euclid##Christopher Columbus::1", "In ancient Rome what does a consul's right to reject each other's decisions called?::Tax##Veto##Oversee##Affirm::1", "Approximately how old is the Great Wall of China?::1000 years##2000 years##3000 years##5000 years::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander the Great::", ":Julius Caesar::", ":Aristotle::", ":Confucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus leaves Africa:-1800000", "Humans learn to control fire:-400000", "Neanderthals become extinct:-40000", "Neolithic Revolution:-9000", "First civilizations develop in Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turkey::1", "Lascaux cave:France::1", "Sumer:Iraq::1", "Stonehenge:United Kingdom::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["What animal from the stone age is extinct now?::cheetah##mammoth##antelope##Anteater::1", "What stage came before the stone age?::Mud Age##Dinosaur Age##Ice Age##The Big Bang::2", "What is a hominid?::a tool##an early ancestor of humans ##a collection of ancient bones ##a fishhook::1", "Humans migrated around the world from what continent?::Africa##Asia##Australia ##Europe::0", "Which of the following defines Homo erectus?::thinking man##modern man##wise man##upright man::3"]);
  }void addES(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.es;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart escribe su primera sinfonía:1764", "Declaración de Independencia de Estados Unidos:1776", "Napoleón es derrotado en la batalla de Waterloo:1815", "Primera locomotora de vapor:1825", "Gran Bretaña asumió el dominio de la India:1858", "Edison inventa la luz eléctrica:1879", "Benz desarrolla el primer automóvil de gasolina:1885", "Einstein anuncia la teoría de la relatividad:1905", "Titanic, el barco más grande del mundo, se hunde en el Atlántico norte:1912", "Comienza la Primera Guerra Mundial:1914", "Revolución rusa:1917", "Hitler llega al poder en Alemania:1933", "Comienza la Segunda Guerra Mundial:1939", "Fin de la Segunda Guerra Mundial:1945", "Se funda la China comunista:1949", "Rusia envía al espacio el primer satélite, Sputnik 1:1957", "Yuri Gagarin se convierte en el primer hombre en volar al espacio:1961", "Neil Armstrong se convierte en el primer hombre en poner un pie en la luna:1969", "Desastre de Chernobyl:1986", "Caída del comunismo en Europa del Este:1989", "Unificación de Alemania:1990", "Desintegración de la Unión Soviética:1991", "Fin del apartheid en Sudáfrica:1994", "Se funda Google:1998", "Ataques terroristas del 11 de septiembre:2001", "Introducción del iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Imperio mogol:1526,1758", "Dinastía Qing:1644,1912", "Imperio ruso:1721,1917", "Imperio austro-húngaro:1867,1918", "Imperio alemán:1871,1918", "Imperio otomano:1299,1922", "Imperio del Japón:1868,1947", "Imperio español:1402,1975", "Imperio francés:1534,1980", "Unión Soviética:1922,1991", "Imperio británico:1603,1997", "Imperio portugués:1415,1999", "Estados Unidos:1776,x", "China:1949,x", "Unión Europea:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Batalla de Waterloo:Bélgica:2,3,5:0", "Batalla de Gettysburg:Estados Unidos:5,6,7:0", "Asedio de Stalingrado:Rusia:6,8,9:0", "Invasión de normandía:Francia:5,6,8:0", "La batalla de Okinawa:Japón:1,8,9:0", "La batalla de Viena:Austria:6,0,3:0", "Caída del muro de Berlín:Alemania:0,5,3:0", "Tratado de Versalles:Francia:1,0,5:0", "Asesinato del Archiduque Franz Ferdinand:Bosnia y Herzegovina:1,5,6:0", "desastre de Chernobyl:Ucrania:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["¿Qué país fue el primero en llegar al polo sur?::Noruega##Reino Unido##Dinamarca##Rusia::0", "¿Qué país europeo tuvo el imperio más grande de la historia?::Rusia##Reino Unido##Italia##España::1", "¿Cuál de estos países africanos estaba controlado por Alemania?::Benin##Angola##Djibouti##Tanzania::3", "¿Quién fue el primer zar de Rusia?::Zar Nicolás I##Zar Alejandro II##Zar Iván el Terrible##Zar Pablo I::2", "¿Cuál fue la batalla que puso fin a las guerras napoleónicas?::Batalla de Viena##Batalla de Valmy##Batalla de Verdun##Batalla de Waterloo::3", "¿Cuál de estos países formaba parte de la URSS?::Eslovaquia##Mongolia##Afganistán##Azerbaiyán::3", "¿Cuál de estos países nunca estuvo controlado por el Reino Unido?::Pakistán##Afganistán##Nigeria##Jordán::1", "¿A qué país europeo se culpó de la Primera Guerra Mundial?::Rusia##Reino Unido##Alemania::2", "¿Qué país era neutral al comienzo de la Segunda Guerra Mundial?::Francia##Estados Unidos##Alemania##Polonia::1", "¿Qué líder africano anti-apartheid salió de la cárcel en 1990, después de más de 27 años?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "¿Qué presidente de los Estados Unidos fue elegido para el cargo cuatro veces?::George Washington##Gerald Ford##Franklin D. Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleón Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Nacimiento del Profeta Muhammad, el fundador del Islam:570", "La impresión se inventó en China:730", "División de la Iglesia cristiana:1054", "Carta Magna firmada por el Rey Juan:1215", "La peste bubónica se propaga a Europa:1347", "Los turcos otomanos capturaron Constantinopla:1453", "Colón descubre América:1492", "Construcción del Taj Mahal terminado:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Imperio sasánida:224,651", "Dinastía Tang:618,907", "Califato abasí:750,1258", "Reino de Pagan:849,1297", "Imperio mongol:1206,1368", "Imperio jemer:802,1431", "Imperio romano:-27,1453", "Imperio bizantino:395,1453", "Imperio inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Asedio de Orleans:Francia:1,2,6:0", "Caída de Constantinopla:Turquía:0,2,7:0", "Batalla de Hastings:Reino Unido:0,1,5:0", "Machu Picchu:Perú:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Camboya:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["¿La Primera Cruzada tenía el objetivo previsto de capturar qué ciudad?::Jerusalén##El Cairo##la meca##Roma::0", "¿Qué logró la Carta Magna?::limitó el poder de los señores##limitó el poder de los caballeros##aumentó el poder de los campesinos y los siervos##limitó el poder del monarca::3", "¿Cómo se propagó la peste bubónica?::Agua mala##Pulgas de ratas##Aire contaminado##Ceniza de volcán::1", "Esta ciudad estaba en una encrucijada entre Europa y Oriente Medio::El Cairo##Constantinopla##París##Moscú::1", "¿Cuál fue la causa de las Cruzadas?::Liberar la Tierra Santa de Jerusalén de los musulmanes.##Una revuelta de campesinos##La peste negra se extiende por Europa##Guerras comerciales a lo largo de la Ruta de la Seda::0", "¿Santo profeta de la religión musulmana?::Jesucristo##Buda##Mahoma::2", "Estructura social de la Edad Media::Sistema de castas##Feudalismo##Señorío::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Cristobal colon::", ":Carlomagno::", ":Leonardo da vinci::", ":Genghis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Se construyeron las pirámides y la gran esfinge:-2500", "Nacimiento de Buda:-486", "Fundación del Imperio Romano:-27", "Julio César de Roma fue asesinado:-44", "Propagación del cristianismo:1", "División del Imperio Romano:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Imperio acadio:-2300,-2200", "Imperio babilónico:-1900,-1600", "Imperio egipcio:-1550,-1077", "Asiria:-2025,-609", "Reino de Judá:-1050,-586", "Imperio aqueménida:-550,-330", "Imperio maurya:-322,-184", "Imperio cartaginés:-814,-146", "Imperio seléucida:-312,-63", "Dinastía Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Batalla de maratón:Grecia::0", "Batalla de Zama:Túnez::0", "Batalla de Gaugamela:Irak::0", "Pirámides de giza:Egipto::1", "Petra:Jordán::1", "Pompeya:Italia::1", "Biblioteca de Alejandría:Egipto::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["¿Cuál fue la primera capital del antiguo Egipto?::Memphis##Tebas##Alejandría##Baltimore::0", "¿En qué isla se originó la antigua civilización griega?::Samos##Creta##Olimpia##Rodas::1", "¿Cuántas de las Siete Maravillas del Mundo Antiguo aún existen?::3##2##1##0::2", "¿A quién se le atribuye haber realizado el primer mapa del mundo conocido?::Arquímedes##Anaximandro##Euclides##Cristobal colon::1", "En la antigua Roma, ¿cómo se llamaba el derecho de un cónsul a rechazar las decisiones de los demás?::Impuesto##Veto##Supervisar##Afirmar::1", "¿Aproximadamente cuántos años tiene la Gran Muralla China?::1000 años##2000 años##3000 años##5000 años::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alejandro el Grande::", ":Julio César::", ":Aristóteles::", ":Confucio::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus abandona África:-1800000", "Los humanos aprenden a controlar el fuego:-400000", "Los neandertales se extinguen:-40000", "Revolución neolítica:-9000", "Las primeras civilizaciones se desarrollan en Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turquía::1", "Cueva de lascaux:Francia::1", "Sumer:Irak::1", "Stonehenge:Reino Unido::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["¿Qué animal de la edad de piedra está extinto ahora?::leopardo##mamut##antílope##Oso hormiguero::1", "¿Qué etapa llegó antes de la edad de piedra?::Edad del barro##Edad de los dinosaurios##Era de Hielo##El Big Bang::2", "¿Qué es un homínido?::una herramienta##un antepasado temprano de los humanos##una colección de huesos antiguos##un anzuelo::1", "¿Los humanos emigraron alrededor del mundo desde qué continente?::África##Asia##Australia##Europa::0", "¿Cuál de los siguientes define al Homo erectus?::hombre pensante##hombre moderno##hombre sabio##hombre recto::3"]);
  }void addFI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.fi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart kirjoittaa ensimmäisen sinfoniansa:1764", "Yhdysvaltojen itsenäisyysjulistus:1776", "Napoleon kukistetaan Waterloon taistelussa:1815", "Ensimmäinen höyryveturi:1825", "Iso-Britannia otti Intian vallan:1858", "Edison keksi sähkövalon:1879", "Benz kehittää ensimmäisen bensiinikäyttöisen auton:1885", "Einstein julkistaa suhteellisuusteorian:1905", "Titanic, maailman suurin alus, uppoaa Pohjois-Atlantilla:1912", "Ensimmäinen maailmansota alkaa:1914", "Venäjän vallankumous:1917", "Hitler nousee valtaan Saksassa:1933", "Toinen maailmansota alkaa:1939", "Toisen maailmansodan loppu:1945", "Kommunistinen Kiina on perustettu:1949", "Venäjä lähettää avaruuteen ensimmäisen satelliitin, Sputnik 1:1957", "Yuri Gagarinista tulee ensimmäinen ihminen, joka lentää avaruudessa:1961", "Neil Armstrongista tulee ensimmäinen ihminen, joka on asettanut jalkansa kuuhun:1969", "Tšernobylin katastrofi:1986", "Kommunismin kaatuminen Itä-Euroopassa:1989", "Saksan yhdistyminen:1990", "Neuvostoliitto hajoaa:1991", "Apartheidin loppu Etelä-Afrikassa:1994", "Google on perustettu:1998", "Syyskuun 11. päivän terroriteot:2001", "IPhonen esittely:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mughal-imperiumi:1526,1758", "Qing-dynastia:1644,1912", "Venäjän valtakunta:1721,1917", "Itävalta-Unkari:1867,1918", "Saksan valtakunta:1871,1918", "Ottomaanien valtakunta:1299,1922", "Japanin keisarikunta:1868,1947", "Espanjan imperiumi:1402,1975", "Espanjan siirtomaat:1534,1980", "Neuvostoliitto:1922,1991", "Brittiläinen imperiumi:1603,1997", "Portugalin valtakunta:1415,1999", "Yhdysvallat:1776,x", "Kiina:1949,x", "Euroopan unioni:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Waterloon taistelu:Belgia:2,3,5:0", "Gettysburgin taistelu:Yhdysvallat:5,6,7:0", "Stalingradin piiritys:Venäjä:6,8,9:0", "Normandian hyökkäys:Ranska:5,6,8:0", "Okinawan taistelu:Japani:1,8,9:0", "Wienin taistelu:Itävalta:6,0,3:0", "Berliinin muurin murtuminen:Saksa:0,5,3:0", "Versaillesin sopimus:Ranska:1,0,5:0", "Arkkiherttua Franz Ferdinandin salamurha:Bosnia ja Hertsegovina:1,5,6:0", "Tshernobylin katastrofi:Ukraina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Mikä maa pääsi ensimmäisenä etelänavalle?::Norja##Yhdistynyt kuningaskunta##Tanska##Venäjä::0", "Millä Euroopan maalla oli historian suurin imperiumi?::Venäjä##Yhdistynyt kuningaskunta##Italia##Espanja::1", "Mikä näistä Afrikan maista oli Saksan hallinnassa?::Benin##Angola##Djibouti##Tansania::3", "Kuka oli Venäjän ensimmäinen tsaari?::Tsaari Nikolai I##Tsaari Aleksanteri II##Tsaari Ivan Julma##Tsaari Paavali I::2", "Mikä oli taistelu, joka päätti Napoleonin sodat?::Wienin taistelu##Valmyn taistelu##Verdunin taistelu##Waterloon taistelu::3", "Mikä näistä maista oli osa Neuvostoliittoa?::slovakia##Mongolia##Afganistan##azerbaijan::3", "Mikä näistä maista ei ole koskaan ollut Yhdistyneen kuningaskunnan hallinnassa?::Pakistan##Afganistan##Nigeria##Jordania::1", "Mitä Euroopan maata syytettiin ensimmäisestä maailmansodasta?::Venäjä##Yhdistynyt kuningaskunta##Saksa::2", "Mikä maa oli neutraali toisen maailmansodan alussa?::Ranska##Yhdysvallat##Saksa##Puola::1", "Kuka afrikkalainen apartheidin vastainen johtaja vapautettiin vankilasta vuonna 1990 yli 27 vuoden jälkeen?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Kuka Yhdysvaltain presidentistä valittiin virkaan neljä kertaa?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Islamin perustajan profeetta Muhammadin syntymä:570", "Painatus keksittiin Kiinassa:730", "Kristillisen kirkon jako:1054", "Kuningas Johanneksen allekirjoittama Magna Carta:1215", "Buboninen rutto leviää Eurooppaan:1347", "Ottomaanien turkkilaiset valloittivat Konstantinopolin:1453", "Columbus löytää Amerikan:1492", "Taj Mahalin rakennus valmistui:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sassanidit:224,651", "Tang-dynastia:618,907", "Abbasidikalifaatti:750,1258", "Pakanallinen valtakunta:849,1297", "Mongolien valtakunta:1206,1368", "Khmerien valtakunta:802,1431", "Rooman valtakunta:-27,1453", "Bysantin valtakunta:395,1453", "Inkavaltakunta:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Orleansin piiritys:Ranska:1,2,6:0", "Konstantinopolin kukistuminen:Turkki:0,2,7:0", "Hastingsin taistelu:Yhdistynyt kuningaskunta:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kambodza:3,4,6:1", "Taj Mahal:Intia:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Minkä kaupungin ensimmäisen ristiretken tarkoitus oli valloittaa?::Jerusalem##Kairo##Mekka##Rooma::0", "Mitä Magna Carta saavutti?::se rajoitti herrojen valtaa##se rajoitti ritarien valtaa##se lisäsi talonpoikien ja maaorjien valtaa##se rajoitti monarkin valtaa::3", "Miten Bubonic Rutto levisi?::Huono vesi##Kirput rotista##Saastunut ilma##Tulivuoren tuhka::1", "Tämä kaupunki oli Euroopan ja Lähi-idän risteyksessä::Kairo##Konstantinopoli##Pariisi##Moskova::1", "Mikä oli ristiretkien syy?::Vapauttaakseen pyhän maan Jerusalemin muslimeista##Talonpoikien kapina##Musta kuolema leviää Euroopassa##Kauppasodat Silkkitien varrella::0", "Muslimien uskonnon pyhä profeetta?::Jeesus Kristus##Buddha##Muhammed::2", "Keskiajan yhteiskuntarakenne::Kastijärjestelmä##Feodalismi##Manorismi::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Kristoffer Kolumbus::", ":Kaarle Suuri::", ":Leonardo da Vinci::", ":Tšingis-kaani::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Pyramidit ja suuri sfinksi rakennettiin:-2500", "Buddhan syntymä:-486", "Rooman valtakunnan perustaminen:-27", "Roomalainen Julius Caesar murhattiin:-44", "Kristinuskon leviäminen:1", "Rooman valtakunnan jakautuminen:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkadin valtakunta:-2300,-2200", "Babylonia:-1900,-1600", "Muinainen Egypti:-1550,-1077", "Assyria:-2025,-609", "Juudan kuningaskunta:-1050,-586", "Achaemenid-valtakunta:-550,-330", "Maurya-valtakunta:-322,-184", "Karthagonin imperiumi:-814,-146", "Seleucid-imperiumi:-312,-63", "Han-dynastia:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Marathonin taistelu:Kreikka::0", "Zaman taistelu:Tunisia::0", "Gaugamelan taistelu:Irak::0", "Gizan pyramidit:Egypti::1", "Petra:Jordania::1", "Pompeji:Italia::1", "Aleksandrian kirjasto:Egypti::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Mikä oli muinaisen Egyptin ensimmäinen pääkaupunki?::Memphis##Thebes##Aleksandria##Baltimore::0", "Millä saarella antiikin kreikkalainen sivilisaatio syntyi?::Samos##Kreeta##Olympia##Rodos::1", "Kuinka monta muinaisen maailman seitsemästä ihmeestä on vielä olemassa?::3##2##1##0::2", "Kenen ansioksi luetaan ensimmäisen tunnetun maailman kartan tekeminen?::Archimedes##Anaksimander##Euclid##Kristoffer Kolumbus::1", "Mitä kutsutaan muinaisessa Roomassa konsulin oikeudeksi hylätä toistensa päätökset?::Verottaa##Veto##Valvoa##Vahvista::1", "Kuinka vanha Kiinan muuri suunnilleen on?::1000 vuotta##2000 vuotta##3000 vuotta##5000 vuotta::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Aleksanteri Suuri::", ":Julius Caesar::", ":Aristoteles::", ":Konfutse::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus lähtee Afrikasta:-1800000", "Ihmiset oppivat hallitsemaan tulta:-400000", "Neandertalit kuolevat sukupuuttoon:-40000", "Neoliittinen vallankumous:-9000", "Ensimmäiset sivilisaatiot kehittyvät Sumeriassa:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turkki::1", "Lascaux&#39;n luola:Ranska::1", "Sumer:Irak::1", "Stonehenge:Yhdistynyt kuningaskunta::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Mikä kivikauden eläin on nyt kuollut sukupuuttoon?::gepardi##mammutti##antilooppi##Muurahaiskarhu::1", "Mikä vaihe oli ennen kivikautta?::Mudan ikä##Dinosaurusten aikakausi##Jääkausi##Alkuräjähdys::2", "Mikä on hominidi?::työkalu##ihmisen varhainen esi-isä##kokoelma muinaisia ​​luita##kalakoukku::1", "Mistä mantereesta ihmiset muuttivat ympäri maailmaa?::Afrikka##Aasia##Australia##Eurooppa::0", "Mikä seuraavista määrittelee Homo erectuksen?::ajatteleva mies##moderni mies##viisas mies##suora mies::3"]);
  }void addFR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.fr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart écrit sa première symphonie:1764", "Déclaration d'indépendance des États-Unis:1776", "Napoléon est vaincu à la bataille de Waterloo:1815", "Première locomotive à vapeur:1825", "La Grande-Bretagne a repris le règne de l'Inde:1858", "Edison invente la lumière électrique:1879", "Benz développe la première voiture à essence:1885", "Einstein annonce la théorie de la relativité:1905", "Le Titanic, le plus grand navire du monde, coule dans l'Atlantique Nord:1912", "La Première Guerre mondiale commence:1914", "Révolution russe:1917", "Hitler prend le pouvoir en Allemagne:1933", "La Seconde Guerre mondiale commence:1939", "Fin de la Seconde Guerre mondiale:1945", "La Chine communiste est fondée:1949", "La Russie envoie dans l'espace le premier satellite, Spoutnik 1:1957", "Youri Gagarine devient le premier homme à voler dans l'espace:1961", "Neil Armstrong devient le premier homme à poser le pied sur la lune:1969", "Catastrophe de Tchernobyl:1986", "Chute du communisme en Europe de l'Est:1989", "Unification de l'Allemagne:1990", "Rupture de l'Union soviétique:1991", "Fin de l'apartheid en Afrique du Sud:1994", "Google est fondé:1998", "Attaques terroristes du 11 septembre:2001", "Introduction de l'iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Empire moghol:1526,1758", "Dynastie Qing:1644,1912", "Empire russe:1721,1917", "Empire austro-hongrois:1867,1918", "Empire allemand:1871,1918", "Empire ottoman:1299,1922", "Empire du Japon:1868,1947", "Empire espagnol:1402,1975", "Empire français:1534,1980", "Union soviétique:1922,1991", "Empire britannique:1603,1997", "Empire portugais:1415,1999", "États-Unis:1776,x", "Chine:1949,x", "Union européenne:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Bataille de Waterloo:Belgique:2,3,5:0", "Bataille de Gettysburg:États Unis:5,6,7:0", "Siège de Stalingrad:Russie:6,8,9:0", "Invasion de la Normandie:France:5,6,8:0", "La bataille d&#39;Okinawa:Japon:1,8,9:0", "La bataille de Vienne:L'Autriche:6,0,3:0", "Chute du mur de Berlin:Allemagne:0,5,3:0", "Traité de Versailles:France:1,0,5:0", "Assassinat de l&#39;archiduc François-Ferdinand:Bosnie Herzégovine:1,5,6:0", "Catastrophe de Tchernobyl:Ukraine:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Quel pays a été le premier à atteindre le pôle sud ?::Norvège##Royaume-Uni##Danemark##Russie::0", "Quel pays européen avait le plus grand empire de l&#39;histoire ?::Russie##Royaume-Uni##Italie##Espagne::1", "Lequel de ces pays africains était contrôlé par l&#39;Allemagne ?::Bénin##Angola##Djibouti##Tanzanie::3", "Qui fut le premier tsar de Russie ?::Tsar Nicolas Ier##Tsar Alexandre II##Tsar Ivan le Terrible##Tsar Paul Ier::2", "Quelle a été la bataille qui a mis fin aux guerres napoléoniennes ?::Bataille de Vienne##Bataille de Valmy##Bataille de Verdun##Bataille de Waterloo::3", "Lequel de ces pays faisait partie de l&#39;URSS ?::Slovaquie##Mongolie##Afghanistan##Azerbaïdjan::3", "Lequel de ces pays n&#39;a jamais été contrôlé par le Royaume-Uni ?::Pakistan##Afghanistan##Nigeria##Jordan::1", "Quel pays européen a été blâmé pour la Première Guerre mondiale ?::Russie##Royaume-Uni##Allemagne::2", "Quel pays était neutre au début de la Seconde Guerre mondiale ?::France##États Unis##Allemagne##Pologne::1", "Quel leader africain anti-apartheid a été libéré de prison en 1990, après plus de 27 ans ?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Quel président américain a été élu quatre fois ?::George Washington##Gérald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoléon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Naissance du Prophète Muhammad, le fondateur de l'Islam:570", "L'impression a été inventée en Chine:730", "Scission de l'Église chrétienne:1054", "Magna Carta signée par le roi Jean:1215", "La peste bubonique se propage en Europe:1347", "Les Turcs ottomans ont capturé Constantinople:1453", "Colomb découvre l'Amérique:1492", "Construction du Taj Mahal achevée:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sassanides:224,651", "Dynastie Tang:618,907", "Califat abbasside:750,1258", "Royaume de Pagan:849,1297", "Empire mongol:1206,1368", "Empire khmer:802,1431", "Empire romain:-27,1453", "Empire byzantin:395,1453", "Empire inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Siège d&#39;Orléans:France:1,2,6:0", "Chute de Constantinople:Turquie:0,2,7:0", "Bataille de Hastings:Royaume-Uni:0,1,5:0", "Machu Picchu:Pérou:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Cambodge:3,4,6:1", "Taj Mahal:Inde:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["La première croisade avait pour objectif de capturer quelle ville ?::Jérusalem##Caire##Mecque##Rome::0", "Qu&#39;a accompli la Magna Carta ?::il limitait le pouvoir des seigneurs##il a limité le pouvoir des chevaliers##il a augmenté le pouvoir des paysans et des serfs##il a limité le pouvoir du monarque::3", "Comment la peste bubonique s&#39;est-elle propagée ?::Mauvaise eau##Puces de rats##Air pollué##Cendres de volcan::1", "Cette ville était à la croisée des chemins entre l&#39;Europe et le Moyen-Orient::Caire##Constantinople##Paris##Moscou::1", "Quelle était la cause des croisades ?::Libérer la Terre Sainte de Jérusalem des musulmans##Une révolte de paysans##La peste noire se répand en Europe##Guerres commerciales le long de la route de la soie::0", "Saint prophète de la religion musulmane ?::Jésus Christ##Bouddha##Mahomet::2", "Structure sociale du Moyen Âge::Système de castes##Féodalisme##Manoir::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christophe Colomb::", ":Charlemagne::", ":Léonard de Vinci::", ":Gengis Khan::", ":Galilée::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Les Pyramides et le Grand Sphinx ont été construits:-2500", "Naissance de Bouddha:-486", "Fondation de l'Empire romain:-27", "Jules César de Rome a été assassiné:-44", "Propagation du christianisme:1", "Scission de l'Empire romain:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Empire d'Akkad:-2300,-2200", "Empire babylonien:-1900,-1600", "Empire égyptien:-1550,-1077", "Assyrie:-2025,-609", "Royaume d'Israël:-1050,-586", "Empire achéménide:-550,-330", "Empire maurya:-322,-184", "Empire carthaginois:-814,-146", "Empire séleucide:-312,-63", "Dynastie des Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Bataille de Marathon:Grèce::0", "Bataille de Zama:Tunisie::0", "Bataille de Gaugamela:Irak::0", "Pyramides de Gizeh:Egypte::1", "Pétra:Jordan::1", "Pompéi:Italie::1", "Bibliothèque d&#39;Alexandrie:Egypte::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Quelle fut la première capitale de l&#39;Egypte ancienne ?::Memphis##Thèbes##Alexandrie##Baltimore::0", "Sur quelle île est née la civilisation grecque antique ?::Samos##Crète##Olympie##Rhodes::1", "Combien des sept merveilles du monde antique existent encore ?::3##2##1##0::2", "Qui est crédité d&#39;avoir fait la première carte du monde connu ?::Archimède##Anaximandre##Euclide##Christophe Colomb::1", "Dans la Rome antique, comment s&#39;appelait le droit d&#39;un consul de rejeter les décisions de l&#39;autre ?::Impôt##Veto##Superviser##Affirmer::1", "Quel est l&#39;âge approximatif de la Grande Muraille de Chine ?::1000 ans##2000 ans##3000 ans##5000 ans::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexandre le Grand::", ":Jules César::", ":Aristote::", ":Confucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus quitte l'Afrique:-1800000", "Les humains apprennent à contrôler le feu:-400000", "Les néandertaliens s'éteignent:-40000", "Révolution néolithique:-9000", "Les premières civilisations se développent à Sumer:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turquie::1", "Grotte de Lascaux:France::1", "été:Irak::1", "Stonehenge:Royaume-Uni::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Quel animal de l&#39;âge de pierre est éteint maintenant ?::guépard##mammouth##antilope##Fourmilier::1", "Quelle étape a précédé l&#39;âge de pierre ?::Âge de la boue##Âge des dinosaures##Âge de glace##Le Big Bang::2", "Qu&#39;est-ce qu&#39;un hominidé ?::un outil##un ancêtre des humains##une collection d&#39;ossements anciens##un hameçon::1", "Les humains ont migré à travers le monde depuis quel continent ?::Afrique##Asie##Australie##L&#39;Europe ::0", "Lequel des énoncés suivants définit l&#39;Homo erectus ?::Homme qui pense##l&#39;homme moderne##homme sage##homme droit::3"]);
  }void addHI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.hi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["मोजार्ट अपनी पहली सिम्फनी लिखते हैं:1764", "संयुक्त राज्य अमेरिका की स्वतंत्रता की घोषणा:1776", "नेपोलियन को वाटरलू की लड़ाई में पराजित किया गया:1815", "पहला स्टीम लोकोमोटिव:1825", "ग्रेट ब्रिटेन ने भारत का शासन संभाला:1858", "एडीसन विद्युत प्रकाश का आविष्कार करता है:1879", "बेंज पहली पेट्रोल चालित कार विकसित करता है:1885", "आइंस्टीन ने सापेक्षता के सिद्धांत की घोषणा की:1905", "टाइटैनिक, दुनिया का सबसे बड़ा जहाज, उत्तरी अटलांटिक में डूबता है:1912", "विश्व युद्ध एक शुरू होता है:1914", "रूसी क्रांति:1917", "हिटलर ने जर्मनी में सत्ता हासिल की:1933", "विश्व युद्ध दो शुरू होता है:1939", "विश्व युद्ध दो का अंत:1945", "कम्युनिस्ट चीन की स्थापना:1949", "रूस ने अंतरिक्ष में भेजा पहला उपग्रह, स्पुतनिक 1:1957", "यूरी गगारिन अंतरिक्ष में उड़ान भरने वाले पहले व्यक्ति बन गए:1961", "नील आर्मस्ट्रांग चंद्रमा पर पैर स्थापित करने वाले पहले व्यक्ति बन गए:1969", "चेर्नोबिल आपदा:1986", "पूर्वी यूरोप में साम्यवाद का पतन:1989", "जर्मनी का एकीकरण:1990", "सोवियत संघ टूट गया:1991", "दक्षिण अफ्रीका में रंगभेद का अंत:1994", "Google की स्थापना की गई है:1998", "11 सितंबर आतंकवादी हमले:2001", "आई - फ़ोन का परिचय:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["मुगल साम्राज्य:1526,1758", "किंग राजवंश:1644,1912", "रूसी साम्राज्य:1721,1917", "ऑस्ट्रो-हंगेरियन साम्राज्य:1867,1918", "जर्मन साम्राज्य:1871,1918", "ओटोमन साम्राज्य:1299,1922", "जापानी साम्राज्य:1868,1947", "स्पेनिश साम्राज्य:1402,1975", "फ्रांसीसी साम्राज्य:1534,1980", "सोवियत संघ:1922,1991", "ब्रिटिश साम्राज्य:1603,1997", "पुर्तगाली साम्राज्य:1415,1999", "संयुक्त राज्य अमेरिका:1776,x", "चीन:1949,x", "यूरोपीय संघ:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["वाटरलू की लड़ाई:बेल्जियम:2,3,5:0", "गेटिसबर्ग की लड़ाई:संयुक्त राज्य अमेरिका:5,6,7:0", "स्टेलिनग्राद की घेराबंदी:रूस:6,8,9:0", "नॉरमैंडी का आक्रमण:फ्रांस:5,6,8:0", "ओकिनावा की लड़ाई:जापान:1,8,9:0", "वियना की लड़ाई:ऑस्ट्रिया:6,0,3:0", "बर्लिन की दीवार का गिरना:जर्मनी:0,5,3:0", "वर्साय की संधि:फ्रांस:1,0,5:0", "आर्कड्यूक फ्रांज फर्डिनेंड की हत्या:बोस्निया और हर्जेगोविना:1,5,6:0", "चेरनोबिल आपदा:यूक्रेन:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["दक्षिणी ध्रुव पर पहुंचने वाला पहला देश कौन सा था?::नॉर्वे##यूनाइटेड किंगडम##डेनमार्क##रूस::0", "किस यूरोपीय देश का इतिहास में सबसे बड़ा साम्राज्य था?::रूस##यूनाइटेड किंगडम##इटली##स्पेन::1", "इनमें से किस अफ्रीकी देश पर जर्मनी का नियंत्रण था?::बेनिन##अंगोला##जिबूती##तंजानिया::3", "रूस का पहला ज़ार कौन था?::ज़ार निकोलस I##ज़ार अलेक्जेंडर II##ज़ार इवान द टेरिबल##ज़ार पॉल I::2", "वह कौन सा युद्ध था जिसने नेपोलियन के युद्धों को समाप्त कर दिया था?::वियना की लड़ाई##वाल्मी की लड़ाई##वर्दुन की लड़ाई##वाटरलू की लड़ाई::3", "इनमें से कौन सा देश यूएसएसआर का हिस्सा था?::स्लोवाकिया##मंगोलिया##अफ़ग़ानिस्तान##आज़रबाइजान::3", "इनमें से कौन सा देश यूनाइटेड किंगडम द्वारा कभी नियंत्रित नहीं किया गया था?::पाकिस्तान##अफ़ग़ानिस्तान##नाइजीरिया##जॉर्डन::1", "प्रथम विश्व युद्ध के लिए किस यूरोपीय देश को दोषी ठहराया गया था?::रूस##यूनाइटेड किंगडम##जर्मनी::2", "द्वितीय विश्व युद्ध की शुरुआत में कौन सा देश तटस्थ था?::फ्रांस##संयुक्त राज्य अमेरिका##जर्मनी##पोलैंड::1", "किस अफ्रीकी रंगभेद विरोधी नेता को 27 साल से अधिक समय के बाद 1990 में जेल से रिहा किया गया था?::ईदी अमीना##नेल्सन मंडेला##फर्डिनेंड मार्कोस##जोसेफ एटकिंसन::1", "किस अमेरिकी राष्ट्रपति को चार बार कार्यालय के लिए चुना गया था?::जॉर्ज वाशिंगटन##गेराल्ड फोर्ड##फ्रेंकलिन डी रूजवेल्ट##अब्राहम लिंकन::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":नेपोलियन बोनापार्ट::", ":विलियम शेक्सपियर::", ":अब्राहम लिंकन::", ":जॉर्ज वाशिंगटन::", ":चार्ल्स डार्विन::", ":आइजैक न्यूटन::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["पैगंबर मुहम्मद का जन्म, इस्लाम के संस्थापक:570", "मुद्रण का आविष्कार चीन में हुआ था:730", "क्रिश्चियन चर्च का विभाजन:1054", "मैग्ना कार्टा किंग जॉन द्वारा हस्ताक्षरित:1215", "बुबोनिक प्लेग यूरोप में फैलता है:1347", "तुर्क तुर्कों ने कांस्टेंटिनोपल पर कब्जा कर लिया:1453", "कोलंबस को पता चलता है अमेरिका:1492", "ताजमहल का निर्माण पूरा:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["सासानी साम्राज्य:224,651", "तांग राजवंश:618,907", "ख़िलाफ़त ए अब्बासिया:750,1258", "बुतपरस्त साम्राज्य:849,1297", "मंगोल साम्राज्य:1206,1368", "ख्मेर साम्राज्य:802,1431", "रोमन साम्राज्य:-27,1453", "बीजान्टिन साम्राज्य:395,1453", "इंका साम्राज्य:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["ऑरलियन्स की घेराबंदी:फ्रांस:1,2,6:0", "कॉन्स्टेंटिनोपल का पतन:तुर्की:0,2,7:0", "हेस्टिंग्स की लड़ाई:यूनाइटेड किंगडम:0,1,5:0", "माचू पिच्चू:पेरू:4,5,6:1", "बागान:म्यांमार:3,5,7:1", "अंगकोर:कंबोडिया:3,4,6:1", "ताज महल:भारत:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["प्रथम धर्मयुद्ध का उद्देश्य किस शहर पर कब्जा करना था?::यरूशलेम##काहिरा##मक्का##रोम::0", "मैग्ना कार्टा ने क्या हासिल किया?::इसने प्रभुओं की शक्ति को सीमित कर दिया##इसने शूरवीरों की शक्ति को सीमित कर दिया##इसने किसानों और दासों की शक्ति में वृद्धि की##इसने सम्राट की शक्ति को सीमित कर दिया::3", "बुबोनिक प्लेग कैसे फैला?::खराब पानी##चूहों से पिस्सू##प्रदूषित वायु##ज्वालामुखी की राख::1", "यह शहर यूरोप और मध्य पूर्व के बीच एक चौराहे पर था::काहिरा##कांस्टेंटिनोपल##पेरिस##मास्को::1", "धर्मयुद्ध का कारण क्या था?::यरूशलेम की पवित्र भूमि को मुसलमानों से मुक्त कराने के लिए##किसानों का विद्रोह##यूरोप में फैल रही ब्लैक डेथ##सिल्क रोड के साथ व्यापार युद्ध::0", "मुस्लिम धर्म के पवित्र पैगंबर?::ईसा मसीह##बुद्धा##मुहम्मद::2", "मध्य युग की सामाजिक संरचना::जाति प्रथा##सामंतवाद##मनोरवाद::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":क्रिस्टोफर कोलंबस::", ":शारलेमेन::", ":लियोनार्डो दा विंसी::", ":चंगेज़ खां::", ":गैलिलियो गैलिली::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["पिरामिड और महान स्फिंक्स का निर्माण किया गया था:-2500", "बुद्ध का जन्म:-486", "रोमन साम्राज्य की स्थापना:-27", "रोम के जूलियस सीजर की हत्या कर दी गई:-44", "ईसाई धर्म का प्रसार:1", "रोमन साम्राज्य का विभाजन:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["अक्कडियन साम्राज्य:-2300,-2200", "बेबीलोन साम्राज्य:-1900,-1600", "मिस्र का साम्राज्य:-1550,-1077", "अश्शूर:-2025,-609", "यहूदा राज्य:-1050,-586", "हख़ामनी साम्राज्य:-550,-330", "मौर्य राजवंश:-322,-184", "कार्टाजिनियन साम्राज्य:-814,-146", "सेल्यूलाइड साम्राज्य:-312,-63", "हान राजवंश:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["मैराथन की लड़ाई:यूनान::0", "ज़माई की लड़ाई:ट्यूनीशिया::0", "गौगामेला की लड़ाई:इराक::0", "गीज़ा के पिरामिड:मिस्र::1", "पेट्रा:जॉर्डन::1", "पॉम्पी:इटली::1", "अलेक्जेंड्रिया की लाइब्रेरी:मिस्र::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["प्राचीन मिस्र की पहली राजधानी कौन सी थी?::मेम्फिस##थेबेस##सिकंदरिया##बाल्टीमोर::0", "प्राचीन यूनानी सभ्यता की उत्पत्ति किस द्वीप पर हुई थी?::समोसे##क्रेते##ओलम्पिया##रोड्स::1", "प्राचीन विश्व के सात अजूबों में से कितने अभी भी मौजूद हैं?::3##2##1##0::2", "ज्ञात विश्व का प्रथम मानचित्र बनाने का श्रेय किसे जाता है ?::आर्किमिडीज##एनाक्सीमैंडर##यूक्लिड##क्रिस्टोफर कोलंबस::1", "प्राचीन रोम में एक दूसरे के निर्णयों को अस्वीकार करने के कौंसल के अधिकार को क्या कहते हैं?::कर##वीटो##निगरानी##वाणी::1", "चीन की महान दीवार लगभग कितनी पुरानी है?::1000 वर्ष##2000 साल##3000 साल##5000 वर्ष::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":सिकंदर महान::", ":जूलियस सीज़र::", ":अरस्तू::", ":कन्फ्यूशियस::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["होमो इरेक्टस अफ्रीका छोड़ देता है:-1800000", "मनुष्य आग को नियंत्रित करना सीखता है:-400000", "निएंडरथल विलुप्त हो जाते हैं:-40000", "नवपाषाण क्रांति:-9000", "सुमेरिया में पहली सभ्यताएँ विकसित होती हैं:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["गोबेकली टेपे:तुर्की::1", "लास्कॉक्स गुफा:फ्रांस::1", "सुमेर:इराक::1", "स्टोनहेंज:यूनाइटेड किंगडम::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["पाषाण युग का कौन सा जानवर अब विलुप्त हो गया है?::चीता##विशाल##मृग##एंटीटर::1", "पाषाण युग से पहले कौन सी अवस्था आई?::मिट्टी की उम्र##डायनासोर युग##हिम युग##महा विस्फोट::2", "एक होमिनिड क्या है?::एक उपकरण##मनुष्यों का एक प्रारंभिक पूर्वज##प्राचीन हड्डियों का संग्रह##एक फिशहुक::1", "मनुष्य विश्व भर में किस महाद्वीप से प्रवासित हुए हैं?::अफ्रीका##एशिया##ऑस्ट्रेलिया##यूरोप::0", "निम्नलिखित में से कौन होमो इरेक्टस को परिभाषित करता है?::सोचने वाला आदमी##आधुनिक आदमी##ज्ञानी##ईमानदार आदमी::3"]);
  }void addHR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.hr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart piše svoju prvu simfoniju:1764", "Izjava o neovisnosti Sjedinjenih Država:1776", "Napoleon je poražen u bitci kod Waterlooa:1815", "Prva parna lokomotiva:1825", "Velika Britanija preuzela je vlast nad Indijom:1858", "Edison izmišlja električno svjetlo:1879", "Benz razvija prvi automobil na benzinski pogon:1885", "Einstein najavljuje teoriju relativnosti:1905", "Titanic, najveći svjetski brod, tone u sjevernom Atlantiku:1912", "Prvi svjetski rat započinje:1914", "Ruska revolucija:1917", "Hitler se uzdiže na vlast u Njemačkoj:1933", "Drugi svjetski rat započinje:1939", "Kraj drugog svjetskog rata:1945", "Osnovana je komunistička Kina:1949", "Rusija šalje u svemir prvi satelit, Sputnjik 1:1957", "Jurij Gagarin postaje prvi čovjek koji je letio u svemir:1961", "Neil Armstrong postaje prvi čovjek koji je kročio na Mjesec:1969", "Katastrofa u Černobilu:1986", "Pad komunizma u istočnoj Europi:1989", "Ujedinjenje Njemačke:1990", "Raspad Sovjetskog Saveza:1991", "Kraj apartheida u Južnoj Africi:1994", "Google je osnovan:1998", "Teroristički napadi 11. rujna:2001", "Predstavljanje iPhonea:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mogulsko Carstvo:1526,1758", "Dinastija Qing:1644,1912", "Rusko Carstvo:1721,1917", "Austro-Ugarska:1867,1918", "Njemačko Carstvo:1871,1918", "Osmansko Carstvo:1299,1922", "Japansko Carstvo:1868,1947", "Španjolsko Carstvo:1402,1975", "Francusko Carstvo:1534,1980", "Sovjetski Savez:1922,1991", "Britansko Carstvo:1603,1997", "Portugalsko Carstvo:1415,1999", "Sjedinjene Države:1776,x", "Kina:1949,x", "Europska unija:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Bitka kod Waterlooa:Belgija:2,3,5:0", "Bitka kod Gettysburga:Sjedinjene Američke Države:5,6,7:0", "Opsada Staljingrada:Rusija:6,8,9:0", "Invazija na Normandiju:Francuska:5,6,8:0", "Bitka za Okinawu:Japan:1,8,9:0", "Bitka kod Beča:Austrija:6,0,3:0", "Pad Berlinskog zida:Njemačka:0,5,3:0", "Versajski ugovor:Francuska:1,0,5:0", "Ubojstvo nadvojvode Franje Ferdinanda:Bosna i Hercegovina:1,5,6:0", "Černobilska katastrofa:Ukrajina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Koja je država prva stigla do južnog pola?::Norveška##Ujedinjeno Kraljevstvo##Danska##Rusija::0", "Koja je europska država imala najveće carstvo u povijesti?::Rusija##Ujedinjeno Kraljevstvo##Italija##Španija::1", "Koju je od ovih afričkih zemalja kontrolirala Njemačka?::Benin##Angola##Džibuti##Tanzanija::3", "Tko je bio prvi car Rusije?::car Nikola I##Car Aleksandar II##Car Ivan Grozni##Car Pavao I::2", "Koja je bitka kojom su okončani Napoleonovi ratovi?::Bitka kod Beča##Bitka kod Valmyja##Bitka kod Verduna##Bitka kod Waterlooa::3", "Koja je od ovih zemalja bila dio SSSR-a?::Slovačka##Mongolija##Avganistan##Azerbejdžan::3", "Koju od ovih zemalja nikada nije kontrolirala Ujedinjeno Kraljevstvo?::Pakistan##Avganistan##Nigerija##Jordan::1", "Koja je europska država okrivljena za Prvi svjetski rat?::Rusija##Ujedinjeno Kraljevstvo##Njemačka::2", "Koja je država bila neutralna na početku Drugog svjetskog rata?::Francuska##Sjedinjene Američke Države##Njemačka##Poljska::1", "Koji je afrički vođa protiv aparthejda pušten iz zatvora 1990., nakon više od 27 godina?::Idi Amin##Nelson Mandela##Ferdinand Markos##Joseph Atkinson::1", "Koji je američki predsjednik četiri puta biran na dužnost?::George Washington##Gerald Ford##Franklin D. Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Rođenje poslanika Muhammeda, osnivača islama:570", "Tiskanje je izumljeno u Kini:730", "Split kršćanske crkve:1054", "Magna Carta koju je potpisao kralj Ivan:1215", "Bubonska kuga širi se Europom:1347", "Turci Osmanlije zauzeli su Carigrad:1453", "Kolumbo otkriva Ameriku:1492", "Izgradnja Taj Mahala završena:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sasanidsko Carstvo:224,651", "Dinastija Tang:618,907", "Abasidski Kalifat:750,1258", "Pagan Kraljevstvo:849,1297", "Mongolsko Carstvo:1206,1368", "Kmersko Carstvo:802,1431", "Rimsko Carstvo:-27,1453", "Bizantsko Carstvo:395,1453", "Carstvo Inka:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Opsada Orleansa:Francuska:1,2,6:0", "Pad Carigrada:Turska:0,2,7:0", "Bitka kod Hastingsa:Ujedinjeno Kraljevstvo:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Mjanmar:3,5,7:1", "Angkor:Kambodža:3,4,6:1", "Taj Mahal:Indija:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Prvi križarski rat imao je za cilj zauzimanje kojeg grada?::Jeruzalem##Kairo##Meka##Rim::0", "Što je Magna Carta postigla?::ograničavala je vlast gospodara##ograničavala je moć vitezova##povećala je moć seljaka i kmetova##ograničila je moć monarha::3", "Kako se proširila bubonska kuga?::Loša voda##Buhe od štakora##Zagađen zrak##Vulkanski pepeo::1", "Ovaj grad je bio na raskrižju između Europe i Bliskog istoka::Kairo##Carigrad##Pariz##Moskva::1", "Što je bio uzrok križarskih ratova?::Osloboditi Svetu zemlju Jeruzalem od muslimana##Pobuna seljaka##Crna smrt se širi Europom##Trgovački ratovi duž Puta svile::0", "Sveti prorok muslimanske vjere?::Isus Krist##Buda##Muhammed::2", "Društvena struktura srednjeg vijeka::Sustav kasta##Feudalizam##Manorizam::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Kristofer Kolumbo::", ":Karlo Veliki::", ":Leonardo da Vinci::", ":Džingis-kan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Izgrađene su piramide i Velika sfinga:-2500", "Rođenje Bude:-486", "Osnivanje Rimskog Carstva:-27", "Ubijen je Julius Cezar iz Rima:-44", "Širenje kršćanstva:1", "Split Rimskog Carstva:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akadsko Carstvo:-2300,-2200", "Babilonsko Carstvo:-1900,-1600", "Egipatsko Carstvo:-1550,-1077", "Asirija:-2025,-609", "Kraljevstvo Juda:-1050,-586", "Ahemenidsko Carstvo:-550,-330", "Maurijsko Carstvo:-322,-184", "Kartaginsko Carstvo:-814,-146", "Seleukovići:-312,-63", "Dinastija Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Maratonska bitka:Grčka::0", "Bitka kod Zame:Tunis::0", "Bitka kod Gaugamele:Irak::0", "Piramide u Gizi:Egipat::1", "Petra:Jordan::1", "Pompeji:Italija::1", "Aleksandrijska knjižnica:Egipat::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Koji je bio prvi glavni grad starog Egipta?::Memphis##Tebe##Aleksandrija##Baltimore::0", "Na kojem je otoku nastala starogrčka civilizacija?::Samos##Kreta##Olimpija##Rodos::1", "Koliko od sedam svjetskih čuda antičkog svijeta još postoji?::3##2##1##0::2", "Tko je zaslužan za izradu prve karte poznatog svijeta?::Arhimed##Anaksimandra##Euklid##Kristofer Kolumbo::1", "Kako se u starom Rimu zvalo pravo konzula da odbijaju odluke jednog drugog?::Porez##Veto##Nadgledati##Potvrditi::1", "Koliko je otprilike star Kineski zid?::1000 godina##2000 godina##3000 godina##5000 godina::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Aleksandar Veliki::", ":Julije Cezar::", ":Aristotel::", ":Konfucije::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus napušta Afriku:-1800000", "Ljudi nauče kontrolirati vatru:-400000", "Neandertalci izumru:-40000", "Neolitska revolucija:-9000", "U Sumeriji se razvijaju prve civilizacije:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turska::1", "špilja Lascaux:Francuska::1", "Sumer:Irak::1", "Stonehenge:Ujedinjeno Kraljevstvo::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Koja je životinja iz kamenog doba sada izumrla?::gepard##Mamut##antilopa##Mravojed::1", "Koja je faza došla prije kamenog doba?::Doba blata##Doba dinosaura##Ledeno doba##Veliki prasak::2", "Što je hominid?::alat##rani predak ljudi##zbirka drevnih kostiju##udica za ribu::1", "S kojeg su kontinenta ljudi migrirali diljem svijeta?::Afrika##Azija##Australija##Europa::0", "Što od sljedećeg definira Homo erectusa?::misleći čovjek##modernog čovjeka##mudar čovjek##uspravan čovjek::3"]);
  }void addHU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.hu;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart írja első szimfóniáját:1764", "Egyesült Államok Függetlenségi Nyilatkozata:1776", "Napóleon vereséget szenved a waterlooi csatában:1815", "Első gőzmozdony:1825", "Nagy-Britannia átvette India uralmát:1858", "Edison feltalálja az elektromos fényt:1879", "Benz kifejleszti az első benzinüzemű autót:1885", "Einstein bejelenti a relativitáselméletet:1905", "A Titanic, a világ legnagyobb hajója elsüllyed Atlanti-óceán északi részén:1912", "Első világháború kezdődik:1914", "Orosz forradalom:1917", "Hitler hatalomra kerül Németországban:1933", "Megkezdődik a második világháború:1939", "A második világháború vége:1945", "Megalakul a kommunista Kína:1949", "Oroszország elküldi az űrbe az első műholdat, a Sputnik 1-et:1957", "Jurij Gagarin lesz az első ember, aki repül az űrben:1961", "Neil Armstrong lesz az első ember, aki betette a lábát a Holdra:1969", "Csernobil katasztrófa:1986", "A kommunizmus bukása Kelet-Európában:1989", "Németország egyesítése:1990", "A Szovjetunió felbomlik:1991", "Az apartheid vége Dél-Afrikában:1994", "A Google alapítása:1998", "Szeptember 11. terrortámadások:2001", "Az iPhone bemutatása:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mogul Birodalom:1526,1758", "Csing-dinasztia:1644,1912", "Orosz Birodalom:1721,1917", "Osztrák-Magyar Birodalom:1867,1918", "Német Birodalom:1871,1918", "Oszmán Birodalom:1299,1922", "Japán Birodalom:1868,1947", "Spanyol Birodalom:1402,1975", "Francia Birodalom:1534,1980", "Szovjetunió:1922,1991", "Brit Birodalom:1603,1997", "Portugál Birodalom:1415,1999", "Egyesült Államok:1776,x", "Kína:1949,x", "Európai Unió:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Waterloo-i csata:Belgium:2,3,5:0", "Gettysburgi csata:Egyesült Államok:5,6,7:0", "Sztálingrád ostroma:Oroszország:6,8,9:0", "Normandia inváziója:Franciaország:5,6,8:0", "Az okinavai csata:Japán:1,8,9:0", "A bécsi csata:Ausztria:6,0,3:0", "A berlini fal leomlása:Németország:0,5,3:0", "Versailles-i békeszerződés:Franciaország:1,0,5:0", "Ferenc Ferdinánd főherceg meggyilkolása:Bosznia és Hercegovina:1,5,6:0", "csernobili katasztrófa:Ukrajna:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Melyik ország érte el először a déli sarkot?::Norvégia##Egyesült Királyság##Dánia##Oroszország::0", "Melyik európai országnak volt a történelem legnagyobb birodalma?::Oroszország##Egyesült Királyság##Olaszország##Spanyolország::1", "Az afrikai országok közül melyiket irányította Németország?::Benin##Angola##Dzsibuti##Tanzánia::3", "Ki volt Oroszország első cárja?::I. Miklós cár##Sándor cár II##Rettegett Iván cár##I. Pál cár::2", "Mi volt az a csata, amely véget vetett a napóleoni háborúknak?::Bécsi csata##Valmy-i csata##Verduni csata##Waterloo-i csata::3", "Melyik ország volt a Szovjetunió része?::Szlovákia##Mongólia##Afganisztán##Azerbajdzsán::3", "Melyik ország volt soha az Egyesült Királyság ellenőrzése alatt?::Pakisztán##Afganisztán##Nigéria##Jordánia::1", "Melyik európai országot okolták az első világháborúért?::Oroszország##Egyesült Királyság##Németország::2", "Melyik ország volt semleges a második világháború elején?::Franciaország##Egyesült Államok##Németország##Lengyelország::1", "Melyik afrikai apartheidellenes vezetőt engedték ki a börtönből 1990-ben, több mint 27 év után?::Idi Amin##Nelson Mandela##Ferdinánd Marcos##Joseph Atkinson::1", "Melyik amerikai elnököt választották meg négyszer?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Bonaparte Napóleon::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Mohamed próféta, az iszlám megalapítójának születése:570", "A nyomtatást Kínában találták ki:730", "A keresztény egyház felosztása:1054", "Magna Carta János király aláírásával:1215", "A buboni pestis átterjed Európában:1347", "Az oszmán törökök elfoglalták Konstantinápolyt:1453", "Columbus felfedezi Amerikát:1492", "Taj Mahal építése befejeződött:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Szászánida Birodalom:224,651", "Tang-dinasztia:618,907", "Abbászidák:750,1258", "Pagan Birodalom:849,1297", "Mongol Birodalom:1206,1368", "Khmer Birodalom:802,1431", "Római Birodalom:-27,1453", "Bizánci Birodalom:395,1453", "Inka Birodalom:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Orléans ostroma:Franciaország:1,2,6:0", "Konstantinápoly bukása:Törökország:0,2,7:0", "Hastingsi csata:Egyesült Királyság:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kambodzsa:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Melyik város elfoglalása volt az első keresztes hadjárat tervezett célja?::Jeruzsálem##Kairó##Mekka##Róma::0", "Mit ért el a Magna Carta?::korlátozta az urak hatalmát##korlátozta a lovagok hatalmát##növelte a parasztok és jobbágyok hatalmát##korlátozta az uralkodó hatalmát::3", "Hogyan terjedt el a bubópestis?::Rossz víz##Bolhák patkányoktól##Szennyezett levegő##Vulkán hamu::1", "Ez a város Európa és a Közel-Kelet válaszútján volt::Kairó##Konstantinápoly##Párizs##Moszkva::1", "Mi volt a keresztes hadjáratok oka?::Megszabadítani a szent földet, Jeruzsálemet a muszlimoktól##Parasztlázadás##A fekete halál terjed Európára##Kereskedelmi háborúk a Selyemút mentén::0", "A muszlim vallás szent prófétája?::Jézus Krisztus##Buddha##Mohamed::2", "A középkor társadalmi szerkezete::Kaszt rendszer##Feudalizmus##Manorizmus::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Kolumbusz Kristóf::", ":Nagy Károly::", ":Leonardo da Vinci::", ":Dzsingisz kán::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Megépültek a piramisok és a Nagy Szfinx:-2500", "Buddha születése:-486", "A Római Birodalom megalapítása:-27", "Meggyilkolták a római Julius Caesart:-44", "A kereszténység terjedése:1", "A Római Birodalom felosztása:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkád Birodalom:-2300,-2200", "Babiloni Birodalom:-1900,-1600", "Egyiptomi Birodalom:-1550,-1077", "Asszíria:-2025,-609", "Júda Királyság:-1050,-586", "Achaemenid Birodalom:-550,-330", "Maurja Birodalom:-322,-184", "Karthágó:-814,-146", "Szeleukida Birodalom:-312,-63", "Han-dinasztia:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Maratoni csata:Görögország::0", "Zamai csata:Tunézia::0", "Gaugamelai csata:Irak::0", "Gízai piramisok:Egyiptom::1", "Petra:Jordánia::1", "Pompeji:Olaszország::1", "Alexandriai könyvtár:Egyiptom::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Mi volt az ókori Egyiptom első fővárosa?::Memphis##Théba##Alexandria##Baltimore::0", "Melyik szigeten keletkezett az ókori görög civilizáció?::Samos##Kréta##Olympia##Rodosz::1", "Hány létezik még az ókori világ hét csodája közül?::3##2##1##0::2", "Ki nevéhez fűződik az ismert világ első térképének elkészítése?::Archimedes##Anaximander##Eukleidész##Kolumbusz Kristóf::1", "Hogyan nevezték az ókori Rómában a konzulok azon jogát, hogy elutasítsák egymás döntéseit?::Adó##Vétó##Felügyelni##Megerősít::1", "Körülbelül hány éves a Kínai Nagy Fal?::1000 év##2000 év##3000 év##5000 év::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Nagy Sándor::", ":Julius Caesar::", ":Arisztotelész::", ":Konfuciusz::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["A Homo erectus elhagyja Afrikát:-1800000", "Az emberek megtanulják ellenőrizni a tüzet:-400000", "A neandervölgyiek kihalnak:-40000", "Neolit ​​forradalom:-9000", "Az első civilizációk Sumériában alakulnak ki:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Törökország::1", "Lascaux-barlang:Franciaország::1", "Sumer:Irak::1", "Stonehenge:Egyesült Királyság::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Melyik kőkorszaki állat pusztult ki mára?::gepárd##mamut-##antilop##Hangyász::1", "Milyen szakasz következett be a kőkorszak előtt?::Sárkorszak##A dinoszauruszok kora##Jégkorszak##A nagy Bumm::2", "Mi az a hominida?::egy eszköz##az emberek korai őse##ősi csontok gyűjteménye##egy horogot::1", "Melyik kontinensről vándoroltak az emberek a világ körül?::Afrika##Ázsia##Ausztrália##Európa::0", "Az alábbiak közül melyik határozza meg a Homo erectust?::gondolkodó ember##modern ember##bölcs ember##egyenes ember::3"]);
  }void addID(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.id;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart menulis simfoni pertamanya:1764", "Deklarasi Kemerdekaan Amerika Serikat:1776", "Napoleon dikalahkan di Pertempuran Waterloo:1815", "Lokomotif Uap Pertama:1825", "Inggris Raya mengambil alih kekuasaan India:1858", "Edison menciptakan lampu listrik:1879", "Benz mengembangkan mobil berbahan bakar bensin pertama:1885", "Einstein mengumumkan teori relativitas:1905", "Titanic, kapal terbesar di dunia, tenggelam di Atlantik Utara:1912", "Perang Dunia Pertama dimulai:1914", "Revolusi Rusia:1917", "Hitler naik ke tampuk kekuasaan di Jerman:1933", "Perang Dunia Kedua dimulai:1939", "Akhir Perang Dunia Kedua:1945", "Komunis Tiongkok didirikan:1949", "Rusia mengirimkan satelit pertama ke luar angkasa, Sputnik 1:1957", "Yuri Gagarin menjadi orang pertama yang terbang ke luar angkasa:1961", "Neil Armstrong menjadi orang pertama yang menginjakkan kaki di bulan:1969", "Bencana Chernobyl:1986", "Kejatuhan Komunisme di Eropa Timur:1989", "Penyatuan Jerman:1990", "Uni Soviet bubar:1991", "Akhir Apartheid di Afrika Selatan:1994", "Google didirikan:1998", "11 September Serangan Teroris:2001", "Pengenalan iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Kekaisaran Mughal:1526,1758", "Dinasti Qing:1644,1912", "Kekaisaran Rusia:1721,1917", "Kekaisaran Austro-Hongaria:1867,1918", "Kekaisaran Jerman:1871,1918", "Kekaisaran Ottoman:1299,1922", "Kekaisaran Jepang:1868,1947", "Kekaisaran Spanyol:1402,1975", "Kekaisaran Prancis:1534,1980", "Uni Soviet:1922,1991", "Kerajaan Inggris:1603,1997", "Kekaisaran Portugis:1415,1999", "Amerika Serikat:1776,x", "Tiongkok:1949,x", "Uni Eropa:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Pertempuran Waterloo:Belgium:2,3,5:0", "Pertempuran Gettysburg:Amerika Serikat:5,6,7:0", "Pengepungan Stalingrad:Rusia:6,8,9:0", "Invasi Normandia:Perancis:5,6,8:0", "Pertempuran Okinawa:Jepang:1,8,9:0", "Pertempuran Wina:Austria:6,0,3:0", "Runtuhnya Tembok Berlin:Jerman:0,5,3:0", "Perjanjian Versailles:Perancis:1,0,5:0", "Pembunuhan Archduke Franz Ferdinand:Bosnia dan Herzegovina:1,5,6:0", "bencana Chernobyl:Ukraina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Negara mana yang pertama kali mencapai kutub selatan?::Norway##Britania Raya##Denmark##Rusia::0", "Negara Eropa mana yang memiliki kerajaan terbesar dalam sejarah?::Rusia##Britania Raya##Italia##Spanyol::1", "Manakah dari negara-negara Afrika ini yang dikendalikan oleh Jerman?::Benin##Angola##Djibouti##Tanzania::3", "Siapa Tsar Rusia pertama?::Tsar Nicholas I##Tsar Alexander II##Tsar Ivan yang Mengerikan##Tsar Paul I::2", "Apa pertempuran yang mengakhiri Perang Napoleon?::Pertempuran Wina##Pertempuran Valmy##Pertempuran Verdun##Pertempuran Waterloo::3", "Manakah dari negara-negara ini yang merupakan bagian dari Uni Soviet?::Slovakia##Mongolia##Afganistan##Azerbaijan::3", "Manakah dari negara-negara ini yang tidak pernah dikendalikan oleh Inggris?::Pakistan##Afganistan##Nigeria##Yordania::1", "Apa negara Eropa yang disalahkan atas Perang Dunia 1?::Rusia##Britania Raya##Jerman::2", "Negara apa yang netral pada awal Perang Dunia 2?::Perancis##Amerika Serikat##Jerman##Polandia::1", "Pemimpin anti-apartheid Afrika mana yang dibebaskan dari penjara pada tahun 1990, setelah lebih dari 27 tahun?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Presiden AS mana yang terpilih untuk menjabat empat kali?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Kelahiran Nabi Muhammad, pendiri Islam:570", "Pencetakan ditemukan di Cina:730", "Perpecahan Gereja Kristen:1054", "Magna Carta ditandatangani oleh Raja John:1215", "Wabah pes menyebar ke Eropa:1347", "Turki Ottoman merebut Konstantinopel:1453", "Columbus menemukan Amerika:1492", "Bangunan Taj Mahal selesai:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Kekaisaran Sasanian:224,651", "Dinasti Tang:618,907", "Kekhalifahan Abbasiyah:750,1258", "Kerajaan Pagan:849,1297", "Kekaisaran Mongol:1206,1368", "Kerajaan Khmer:802,1431", "Kekaisaran Romawi:-27,1453", "Kekaisaran Bizantium:395,1453", "Kekaisaran Inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Pengepungan Orleans:Perancis:1,2,6:0", "Jatuhnya Konstantinopel:Turki:0,2,7:0", "Pertempuran Hastings:Britania Raya:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kamboja:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Perang Salib Pertama memiliki tujuan yang dimaksudkan untuk merebut kota mana?::Yerusalem##Kairo##Mekah##Roma::0", "Apa yang dicapai Magna Carta?::itu membatasi kekuatan para bangsawan##itu membatasi kekuatan ksatria##itu meningkatkan kekuatan petani dan budak##itu membatasi kekuatan raja::3", "Bagaimana Wabah Bubonic menyebar?::Air yang buruk##Kutu dari tikus##Udara tercemar##abu gunung berapi::1", "Kota ini berada di persimpangan antara Eropa dan Timur Tengah::Kairo##Konstantinopel##Paris##Moskow::1", "Apa penyebab terjadinya Perang Salib?::Untuk membebaskan tanah suci Yerusalem dari kaum Muslim##Pemberontakan petani##Kematian Hitam menyebar ke seluruh Eropa##Perang dagang di sepanjang Jalur Sutra::0", "Nabi suci agama Islam?::Yesus Kristus##Budha##Muhammad::2", "Struktur sosial Abad Pertengahan::Sistem kasta##Feodalisme##Manorisme::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Charlemagne::", ":Leonardo da Vinci::", ":Genghis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Piramida dan Sphinx Agung dibangun:-2500", "Kelahiran Buddha:-486", "Pendirian Kekaisaran Romawi:-27", "Julius Caesar dari Roma dibunuh:-44", "Penyebaran Agama Kristen:1", "Perpecahan Kekaisaran Romawi:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Kekaisaran Akkadia:-2300,-2200", "Kekaisaran Babilonia:-1900,-1600", "Kekaisaran Mesir:-1550,-1077", "Assyria:-2025,-609", "Kerajaan Yehuda:-1050,-586", "Kekaisaran Akhemeniyah:-550,-330", "Kekaisaran Maurya:-322,-184", "Kekaisaran Kartago:-814,-146", "Kekaisaran Seleukia:-312,-63", "Dinasti Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Pertempuran Marathon:Yunani::0", "Pertempuran Zama:Tunisia::0", "Pertempuran Gaugamela:Irak::0", "Piramida Giza:Mesir::1", "petra:Yordania::1", "Pompeii:Italia::1", "Perpustakaan Alexandria:Mesir::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Apa ibu kota pertama Mesir kuno?::Memphis##Thebes##Iskandariyah##Baltimore::0", "Di pulau apa peradaban Yunani kuno berasal?::Samo##Kreta##Olympia##Rhodes::1", "Berapa banyak dari Tujuh Keajaiban Dunia Kuno yang masih ada?::3##2##1##0::2", "Siapa yang dikreditkan dengan membuat peta pertama dari dunia yang dikenal?::Archimedes##Anaximander##Euclid##Christopher Columbus::1", "Di Roma kuno apa yang disebut hak konsul untuk menolak keputusan satu sama lain?::Pajak##Memveto##Mengawasi##Menegaskan::1", "Kira-kira berapa umur Tembok Besar China?::1000 tahun##2000 tahun##3000 tahun##5000 tahun::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander yang Agung::", ":Julius Caesar::", ":Aristoteles::", ":Konfusius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus meninggalkan Afrika:-1800000", "Manusia belajar mengendalikan api:-400000", "Neanderthal punah:-40000", "Revolusi Neolitik:-9000", "Peradaban pertama berkembang di Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turki::1", "Gua Lascaux:Perancis::1", "Sumeria:Irak::1", "Stonehenge:Britania Raya::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Hewan apa dari zaman batu yang sudah punah sekarang?::Cheetah##mamut##kijang##Tenggiling::1", "Tahap apa yang terjadi sebelum zaman batu?::Zaman Lumpur##Zaman Dinosaurus##Zaman Es##Ledakan Besar::2", "Apa itu hominid?::sebuah alat##nenek moyang awal manusia##koleksi tulang kuno##sebuah kail ikan::1", "Manusia bermigrasi ke seluruh dunia dari benua apa?::Afrika##Asia##Australia##Eropa::0", "Manakah dari berikut ini yang mendefinisikan Homo erectus?::pria yang berpikir##pria modern##orang bijak##pria tegak::3"]);
  }void addIT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.it;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart scrive la sua prima sinfonia:1764", "Dichiarazione di indipendenza degli Stati Uniti:1776", "Napoleone viene sconfitto nella battaglia di Waterloo:1815", "Prima locomotiva a vapore:1825", "La Gran Bretagna ha assunto il dominio dell'India:1858", "Edison inventa la luce elettrica:1879", "Benz sviluppa la prima automobile a benzina:1885", "Einstein annuncia la teoria della relatività:1905", "Il Titanic, la nave più grande del mondo, affonda nel Nord Atlantico:1912", "Inizia la prima guerra mondiale:1914", "Rivoluzione russa:1917", "Hitler sale al potere in Germania:1933", "Inizia la seconda guerra mondiale:1939", "Fine della seconda guerra mondiale:1945", "Viene fondata la Cina comunista:1949", "La Russia invia nello spazio il primo satellite, Sputnik 1:1957", "Yuri Gagarin diventa il primo uomo a volare nello spazio:1961", "Neil Armstrong diventa il primo uomo a mettere piede sulla luna:1969", "Disastro di Chernobyl:1986", "Caduta del comunismo nell'Europa orientale:1989", "Unificazione della Germania:1990", "L'Unione Sovietica si scioglie:1991", "Fine dell'apartheid in Sud Africa:1994", "Viene fondata Google:1998", "Attentati dell'11 settembre:2001", "Introduzione dell'iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Impero Moghul:1526,1758", "Dinastia Qing:1644,1912", "Impero russo:1721,1917", "Impero austro-ungarico:1867,1918", "Impero tedesco:1871,1918", "Impero ottomano:1299,1922", "Impero del Giappone:1868,1947", "Impero spagnolo:1402,1975", "Impero francese:1534,1980", "Unione Sovietica:1922,1991", "Impero britannico:1603,1997", "Impero portoghese:1415,1999", "Stati Uniti:1776,x", "Cina:1949,x", "Unione Europea:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Battaglia di Waterloo:Belgio:2,3,5:0", "Battaglia di Gettysburg:Stati Uniti:5,6,7:0", "Assedio di Stalingrado:Russia:6,8,9:0", "Invasione della Normandia:Francia:5,6,8:0", "La battaglia di Okinawa:Giappone:1,8,9:0", "La battaglia di Vienna:Austria:6,0,3:0", "Caduta del muro di Berlino:Germania:0,5,3:0", "Trattato di Versailles:Francia:1,0,5:0", "Assassinio dell&#39;arciduca Francesco Ferdinando:Bosnia Erzegovina:1,5,6:0", "Il disastro di Chernobyl:Ucraina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Quale paese è stato il primo a raggiungere il polo sud?::Norvegia##Regno Unito##Danimarca##Russia::0", "Quale paese europeo ha avuto il più grande impero della storia?::Russia##Regno Unito##Italia##Spagna::1", "Quale di questi paesi africani era controllato dalla Germania?::Benin##angola##Gibuti##Tanzania::3", "Chi fu il primo zar di Russia?::lo zar Nicola I##lo zar Alessandro II##Lo zar Ivan il Terribile##lo zar Paolo I::2", "Qual è stata la battaglia che pose fine alle guerre napoleoniche?::Battaglia di Vienna##Battaglia di Valmy##Battaglia di Verdun##Battaglia di Waterloo::3", "Quale di questi paesi faceva parte dell&#39;URSS?::Slovacchia##Mongolia##afghanistan##Azerbaijan::3", "Quale di questi paesi non è mai stato controllato dal Regno Unito?::Pakistan##afghanistan##Nigeria##Giordania::1", "Quale paese europeo è stato accusato della prima guerra mondiale?::Russia##Regno Unito##Germania::2", "Quale paese era neutrale all&#39;inizio della seconda guerra mondiale?::Francia##Stati Uniti##Germania##Polonia::1", "Quale leader africano anti-apartheid è uscito di prigione nel 1990, dopo più di 27 anni?::Idi Amin##Nelson Mandela##Ferdinando Marcos##Joseph Atkinson::1", "Quale presidente degli Stati Uniti è stato eletto quattro volte?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleone Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Carlo Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Nascita del Profeta Muhammad, il fondatore dell'Islam:570", "La stampa è stata inventata in Cina:730", "Spalato della Chiesa Cristiana:1054", "Magna Carta firmata da Re Giovanni:1215", "La peste bubbonica si diffonde in Europa:1347", "I turchi ottomani conquistarono Costantinopoli:1453", "Colombo scopre l'America:1492", "Costruzione del Taj Mahal completata:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Impero sasanide:224,651", "Dinastia Tang:618,907", "Califfato abbaside:750,1258", "Regno Pagan:849,1297", "Impero mongolo:1206,1368", "Impero Khmer:802,1431", "Impero romano:-27,1453", "Impero bizantino:395,1453", "Impero inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Assedio di Orleans:Francia:1,2,6:0", "Caduta di Costantinopoli:Turchia:0,2,7:0", "Battaglia di Hastings:Regno Unito:0,1,5:0", "Machu Picchu:Perù:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Cambogia:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["La prima crociata aveva l&#39;obiettivo di catturare quale città?::Gerusalemme##Cairo##Mecca##Roma::0", "Cosa ha realizzato la Magna Carta?::limitava il potere dei signori##limitava il potere dei cavalieri##aumentò il potere dei contadini e dei servi##limitava il potere del monarca::3", "Come si è diffusa la peste bubbonica?::Cattive acque##Pulci dai topi##Aria inquinata##cenere di vulcano::1", "Questa città era un crocevia tra Europa e Medio Oriente::Cairo##Costantinopoli##Parigi##Mosca::1", "Qual è stata la causa delle crociate?::Per liberare la Terra Santa di Gerusalemme dai musulmani##Una rivolta di contadini##La peste nera si sta diffondendo in Europa##Guerre commerciali lungo la Via della Seta::0", "Santo profeta della religione musulmana?::Gesù Cristo##Buddha##Maometto::2", "Struttura sociale del Medioevo::Sistema delle caste##Feudalesimo##maniero::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Cristoforo Colombo::", ":Carlo Magno::", ":Leonardo Da Vinci::", ":Gengis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Furono costruite le Piramidi e la Grande Sfinge:-2500", "Nascita di Buddha:-486", "Fondazione dell'Impero Romano:-27", "Giulio Cesare di Roma fu assassinato:-44", "Diffusione del cristianesimo:1", "Spaccatura dell'Impero Romano:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Impero di Akkad:-2300,-2200", "Impero babilonese:-1900,-1600", "Antico Egitto:-1550,-1077", "Assiria:-2025,-609", "Regno di Giuda:-1050,-586", "Impero achemenide:-550,-330", "Impero Maurya:-322,-184", "Impero cartaginese:-814,-146", "Impero seleucide:-312,-63", "Dinastia Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Battaglia di Maratona:Grecia::0", "Battaglia di Zama:Tunisia::0", "Battaglia di Gaugamela:Iraq::0", "Piramidi di Giza:Egitto::1", "Petra:Giordania::1", "Pompei:Italia::1", "Biblioteca di Alessandria:Egitto::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Qual è stata la prima capitale dell&#39;antico Egitto?::Menfi##Tebe##Alessandria##Baltimora::0", "Su quale isola ha avuto origine l&#39;antica civiltà greca?::Samos##Creta##Olimpia##Rodi::1", "Quante delle Sette Meraviglie del Mondo Antico esistono ancora?::3##2##1##0::2", "A chi è attribuito il merito di aver realizzato la prima mappa del mondo conosciuto?::Archimede##Anassimandro##Euclide##Cristoforo Colombo::1", "Nell&#39;antica Roma come si chiamava il diritto di un console di respingere le decisioni dell&#39;altro?::Imposta##Veto##Sorvegliare##Affermare::1", "Quanti anni ha approssimativamente la Grande Muraglia Cinese?::1000 anni##2000 anni##3000 anni##5000 anni::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alessandro Magno::", ":Giulio Cesare::", ":Aristotele::", ":Confucio::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["L'Homo erectus lascia l'Africa:-1800000", "Gli esseri umani imparano a controllare il fuoco:-400000", "Neanderthal si è estinto:-40000", "Rivoluzione neolitica:-9000", "Le prime civiltà si sviluppano in Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turchia::1", "Grotta di Lascaux:Francia::1", "Sumer:Iraq::1", "Stonehenge:Regno Unito::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Quale animale dell&#39;età della pietra è estinto ora?::ghepardo##mammut##antilope##Formichiere::1", "Quale fase veniva prima dell&#39;età della pietra?::Età del fango##Età dei dinosauri##Era glaciale##Il big Bang::2", "Cos&#39;è un ominide?::uno strumento##un primo antenato dell&#39;uomo##una collezione di ossa antiche##un amo da pesca::1", "Gli esseri umani sono migrati in tutto il mondo da quale continente?::Africa##Asia##Australia##Europa::0", "Quale delle seguenti definizioni definisce l&#39;Homo erectus?::uomo pensante##uomo moderno##uomo saggio##uomo retto::3"]);
  }void addJA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.ja;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["モーツァルトは彼の最初の交響曲を書いています:1764", "アメリカ合衆国独立宣言:1776", "ナポレオンはワーテルローの戦いで敗北:1815", "最初の蒸気機関車:1825", "イギリスがインドの支配を引き継いだ:1858", "エジソンが電灯を発明:1879", "ベンツが最初のガソリン駆動車を開発:1885", "アインシュタインが相対性理論を発表:1905", "世界最大の船であるタイタニック号が北大西洋に沈む:1912", "第一次世界大戦が始まる:1914", "ロシア革命:1917", "ヒトラーがドイツで権力を握る:1933", "第二次世界大戦が始まる:1939", "第二次世界大戦の終わり:1945", "共産党中国が設立されました:1949", "ロシアは最初の衛星スプートニク1号を宇宙に送ります:1957", "ユーリイ・ガガーリンが宇宙を飛ぶ最初の男になる:1961", "ニール・アームストロングが月に足を踏み入れた最初の男になる:1969", "チェルノブイリ事故:1986", "東欧における共産主義の崩壊:1989", "ドイツ統一:1990", "ソビエト連邦が崩壊:1991", "南アフリカのアパルトヘイトの終わり:1994", "グーグルが設立されました:1998", "9月11日テロ攻撃:2001", "iPhoneの紹介:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["ムガル帝国:1526,1758", "清王朝:1644,1912", "ロシア帝国:1721,1917", "オーストリア=ハンガリー帝国:1867,1918", "ドイツ帝国:1871,1918", "オスマン帝国:1299,1922", "大日本帝国:1868,1947", "スペイン帝国:1402,1975", "フランス帝国:1534,1980", "ソビエト連邦:1922,1991", "大英帝国:1603,1997", "ポルトガル海上帝国:1415,1999", "アメリカ合衆国:1776,x", "中国:1949,x", "欧州連合:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["ワーテルローの戦い:ベルギー:2,3,5:0", "ゲティスバーグの戦い:アメリカ:5,6,7:0", "スターリングラード攻防戦:ロシア:6,8,9:0", "ノルマンディーの侵略:フランス:5,6,8:0", "沖縄戦:日本:1,8,9:0", "ウィーンの戦い:オーストリア:6,0,3:0", "ベルリンの壁崩壊:ドイツ:0,5,3:0", "ベルサイユ条約:フランス:1,0,5:0", "フランツフェルディナンド大公の暗殺:ボスニア・ヘルツェゴビナ:1,5,6:0", "チェルノブイリ事故:ウクライナ:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["南極に最初に到達した国はどこですか？::ノルウェー##イギリス##デンマーク##ロシア::0", "歴史上最大の帝国を持っていたヨーロッパの国はどれですか？::ロシア##イギリス##イタリア##スペイン::1", "これらのアフリカ諸国のどれがドイツによって支配されていましたか？::ベナン##アンゴラ##ジブチ##タンザニア::3", "ロシアの最初の皇帝は誰でしたか？::皇帝ニコライ1世##皇帝アレクサンドル2世##皇帝イヴァン4世##皇帝パーヴェル1世::2", "ナポレオン戦争を終わらせた戦いは何でしたか？::ウィーンの戦い##ヴァルミーの戦い##ヴェルダンの戦い##ワーテルローの戦い::3", "これらの国のどれがソ連の一部でしたか？::スロバキア##モンゴル##アフガニスタン##アゼルバイジャン::3", "これらの国のうち、英国によって支配されたことのない国はどれですか？::パキスタン##アフガニスタン##ナイジェリア##ヨルダン::1", "第一次世界大戦で非難されたヨーロッパの国はどこですか？::ロシア##イギリス##ドイツ::2", "第二次世界大戦の初めに中立だった国はどこですか？::フランス##アメリカ##ドイツ##ポーランド::1", "27年以上の歳月を経て、1990年にどのアフリカの反アパルトヘイト指導者が刑務所から釈放されましたか。::イディアミン##ネルソン・マンデラ##フェルディナンドマルコス##ジョセフ・アトキンソン::1", "どの米国大統領が4回選出されましたか？::ジョージ・ワシントン##ジェラルドフォード##フランクリンDルーズベルト##アブラハムリンカーン::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":ナポレオン・ボナパルト::", ":ウィリアムシェイクスピア::", ":アブラハムリンカーン::", ":ジョージ・ワシントン::", ":チャールス・ダーウィン::", ":アイザック・ニュートン::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["イスラームの創設者、預言者ムハンマドの誕生:570", "印刷は中国で発明されました:730", "キリスト教会の分裂:1054", "ジョン王が署名したマグナカルタ:1215", "腺ペストがヨーロッパに広がる:1347", "オスマントルコ人がコンスタンティノープル陥落を捕らえた:1453", "コロンバスがアメリカを発見:1492", "タージマハルの建設が完了しました:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["サーサーン朝:224,651", "唐王朝:618,907", "アッバース朝:750,1258", "パガン王朝:849,1297", "モンゴル帝国:1206,1368", "クメール王朝:802,1431", "ローマ帝国:-27,1453", "ビザンチン帝国:395,1453", "インカ帝国:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["オルレアン包囲戦:フランス:1,2,6:0", "コンスタンティノープル陥落:トルコ:0,2,7:0", "ヘイスティングズの戦い:イギリス:0,1,5:0", "マチュピチュ:ペルー:4,5,6:1", "バガン:ミャンマー:3,5,7:1", "アンコール:カンボジア:3,4,6:1", "タージマハル:インド:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["第1回十字軍は、どの都市を占領するかという意図された目標を持っていましたか？::エルサレム##カイロ##メッカ##ローマ::0", "マグナカルタは何を成し遂げましたか？::それは領主の力を制限しました##それは騎士の力を制限しました##それは農民と農奴の力を高めました##それは君主の力を制限しました::3", "腺ペストはどのように広がりましたか？::悪い水##ラットからのノミ##汚染された大気##火山灰::1", "この都市はヨーロッパと中東の交差点にありました::カイロ##コンスタンティノープル##パリ##モスクワ::1", "十字軍の原因は何でしたか？::エルサレムの聖地をイスラム教徒から解放するため##農民の反乱##ヨーロッパに広がる黒死病##シルクロードに沿った貿易戦争::0", "イスラム教の聖なる預言者？::イエス・キリスト##仏##ムハンマド::2", "中世の社会構造::カースト制##封建制##荘園::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":クリストファー・コロンブス::", ":シャルルマーニュ::", ":レオナルド・ダ・ヴィンチ::", ":チンギスカン::", ":ガリレオ・ガリレイ::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["ピラミッドと大スフィンクスが建てられました:-2500", "仏陀の誕生:-486", "ローマ帝国の創設:-27", "ローマのジュリアスシーザーが暗殺された:-44", "キリスト教の普及:1", "ローマ帝国の分裂:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["アッカド帝国:-2300,-2200", "バビロニア帝国:-1900,-1600", "エジプト帝国:-1550,-1077", "アッシリア:-2025,-609", "ユダ王国:-1050,-586", "アケメネス朝:-550,-330", "マウリヤ朝:-322,-184", "カルタゴ帝国:-814,-146", "セレウコス朝:-312,-63", "漢王朝:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["マラトンの戦い:ギリシャ::0", "ザマの戦い:チュニジア::0", "ガウガメラの戦い:イラク::0", "ギザのピラミッド:エジプト::1", "ペトラ:ヨルダン::1", "ポンペイ:イタリア::1", "アレクサンドリア図書館:エジプト::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["古代エジプトの最初の首都はどこでしたか？::メンフィス##テーベ##アレクサンドリア##ボルチモア::0", "古代ギリシャ文明はどの島で生まれましたか？::サモス##クリティ島##オリンピア##ロードス::1", "古代世界の七不思議のうち、まだいくつ存在しますか？::3##2##1##0::2", "既知の世界の最初の地図を作成したのは誰ですか？::アルキメデス##アナクシマンドロス##ユークリッド##クリストファー・コロンブス::1", "古代ローマでは、領事がお互いの決定を拒否する権利は何と呼ばれていましたか？::税##拒否##監督する##断言する::1", "万里の長城はおよそ何歳ですか？::1000年##2000年##3000年##5000年::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":アレキサンダー大王::", ":ジュリアス・シーザー::", ":アリストテレス::", ":孔子::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["ホモ・エレクトスがアフリカを去る:-1800000", "人間は火を制御することを学びます:-400000", "ネアンデルタール人は絶滅する:-40000", "新石器革命:-9000", "最初の文明はシュメールで発展します:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["ギョベクリテペ:トルコ::1", "ラスコー洞窟:フランス::1", "シュメール:イラク::1", "ストーンヘンジ:イギリス::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["石器時代のどの動物が現在絶滅していますか？::チーター##マンモス##アンテロープ##アリクイ::1", "石器時代の前にどの段階が来ましたか？::泥の時代##恐竜時代##氷河期##ビッグバン::2", "類人猿とは何ですか？::道具##人間の初期の祖先##古代の骨のコレクション##釣り針::1", "人間はどの大陸から世界中に移住しましたか？::アフリカ##アジア##オーストラリア##ヨーロッパ::0", "次のうちどれがホモ・エレクトスを定義しますか？::考える人##現代人##賢者##直立した男::3"]);
  }void addKO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.ko;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["모차르트가 첫 번째 교향곡을 쓴다:1764", "미국 독립 선언문:1776", "나폴레옹은 워털루 전투에서 패배:1815", "최초의 증기 기관차:1825", "영국이 인도의 통치를 인수했습니다:1858", "에디슨, 전기 조명 발명:1879", "벤츠, 최초의 가솔린 ​​구동 자동차 개발:1885", "아인슈타인, 상대성 이론 발표:1905", "세계에서 가장 큰 선박 인 타이타닉이 북대서양에서 가라 앉다:1912", "1 차 세계 대전 시작:1914", "러시아 혁명:1917", "히틀러가 독일에서 권력을 잡다:1933", "2 차 세계 대전 시작:1939", "2 차 세계 대전 종료:1945", "공산당 중국 설립:1949", "러시아는 우주로 첫 번째 위성, 스푸트니크를 보냅니다 1:1957", "유리 가가린, 우주 비행을 한 최초의 사람이 됨:1961", "닐 암스트롱이 달에 발을 딛은 최초의 사람이되다:1969", "체르노빌 재해:1986", "동유럽 공산주의의 몰락:1989", "독일 통일:1990", "소련 해체:1991", "남아프리카 공화국의 아파 르트 헤이트 종료:1994", "Google 설립:1998", "9 월 11 일 테러 공격:2001", "iPhone 소개:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["무굴 제국:1526,1758", "청나라:1644,1912", "러시아 제국:1721,1917", "오스트리아-헝가리 제국:1867,1918", "독일 제국:1871,1918", "오스만 제국:1299,1922", "일본 제국:1868,1947", "스페인 제국:1402,1975", "프랑스 제국:1534,1980", "소련:1922,1991", "대영 제국:1603,1997", "포르투갈 제국:1415,1999", "미국:1776,x", "중국:1949,x", "유럽 연합:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["워털루 전투:벨기에:2,3,5:0", "게티즈버그 전투:미국:5,6,7:0", "스탈린그라드 공성전:러시아:6,8,9:0", "노르망디 침공:프랑스:5,6,8:0", "오키나와 전투:일본:1,8,9:0", "비엔나 전투:오스트리아:6,0,3:0", "베를린 장벽의 붕괴:독일:0,5,3:0", "베르사유 조약:프랑스:1,0,5:0", "프란츠 페르디난트 대공 암살:보스니아 헤르체고비나:1,5,6:0", "체르노빌 재해:우크라이나:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["남극에 가장 먼저 도달한 나라는?::노르웨이##영국##덴마크##러시아::0", "역사상 가장 큰 제국을 가진 유럽 국가는?::러시아##영국##이탈리아##스페인::1", "이 아프리카 국가 중 독일이 지배한 국가는 어디입니까?::베냉##앙골라##지부티##탄자니아::3", "러시아의 첫 번째 차르는 누구였습니까?::차르 니콜라스 1세##차르 알렉산더 2세##차르 이반 끔찍한##차르 폴 1세::2", "나폴레옹 전쟁을 종식시킨 전투는 무엇입니까?::비엔나 전투##발미 전투##베르됭 전투##워털루 전투::3", "다음 중 소련의 일부였던 국가는 어디입니까?::슬로바키아##몽골리아##아프가니스탄##아제르바이잔::3", "다음 중 영국의 지배를 받지 않은 국가는 어디입니까?::파키스탄##아프가니스탄##나이지리아##요르단::1", "제1차 세계 대전의 책임이 유럽에 있는 국가는 어디입니까?::러시아##영국##독일::2", "2차 세계대전 초기에 중립국이었던 나라는?::프랑스##미국##독일##폴란드::1", "다음 중 27년이 넘는 기간 동안 1990년에 감옥에서 석방된 아프리카의 반 아파르트헤이트 지도자는 누구입니까?::이디 아민##넬슨 만델라##페르디난드 마르코스##조셉 앳킨슨::1", "4번 선출된 미국 대통령은?::조지 워싱턴##제럴드 포드##프랭클린 D 루즈벨트##아브라함 링컨::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":나폴레옹 보나파르트::", ":윌리엄 셰익스피어::", ":아브라함 링컨::", ":조지 워싱턴::", ":찰스 다윈::", ":아이작 뉴턴::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["이슬람의 창시자, 예언자 무함마드의 탄생:570", "인쇄는 중국에서 발명되었습니다:730", "기독교 교회의 분열:1054", "요한 왕이 서명 한 마그나 카르타:1215", "선 페스트가 유럽으로 퍼짐:1347", "오스만 투르크 인이 콘스탄티노플을 점령했습니다:1453", "콜럼버스는 미국을 발견합니다:1492", "타지 마할 완공:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["사산 제국:224,651", "당나라:618,907", "아바스 칼리파국:750,1258", "이교도 왕국:849,1297", "몽골 제국:1206,1368", "크메르 제국:802,1431", "로마 제국:-27,1453", "비잔틴 제국:395,1453", "잉카 제국:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["오를레앙 공성전:프랑스:1,2,6:0", "콘스탄티노플의 몰락:터키:0,2,7:0", "헤이스팅스 전투:영국:0,1,5:0", "마추 픽추:페루:4,5,6:1", "바간:미얀마:3,5,7:1", "앙코르:캄보디아:3,4,6:1", "타지 마할:인도:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["1차 십자군은 어느 도시를 점령하려는 의도를 가지고 있었습니까?::예루살렘##카이로##메카##로마::0", "마그나 카르타는 무엇을 성취했는가?::그것은 영주의 권력을 제한했다##기사의 힘을 제한했다##그것은 농민과 농노의 힘을 증가시켰다.##그것은 군주의 권력을 제한했다::3", "선 페스트는 어떻게 퍼졌습니까?::나쁜 물##쥐의 벼룩##오염 된 공기##화산재::1", "이 도시는 유럽과 중동의 교차로에 있었다::카이로##콘스탄티노플##파리##모스크바::1", "십자군 전쟁의 원인은 무엇입니까?::이슬람교로부터 예루살렘의 성지를 해방하기 위해##농민의 반란##유럽 ​​전역에 퍼지는 흑사병##실크로드를 따라 무역 전쟁::0", "이슬람 종교의 신성한 예언자?::예수 그리스도##불##무함마드::2", "중세의 사회 구조::카스트 제도##봉건 제도##매너리즘::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":크리스토퍼 콜럼버스::", ":샤를마뉴::", ":레오나르도 다빈치::", ":징기스칸::", ":갈릴레오 갈릴레이::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["피라미드와 대 스핑크스가 지어졌습니다:-2500", "부처의 탄생:-486", "로마 제국의 건국:-27", "로마의 율리우스 카이사르가 암살당했습니다:-44", "기독교의 전파:1", "로마 제국의 분열:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["아카드_제국:-2300,-2200", "바빌로니아 제국:-1900,-1600", "이집트 제국:-1550,-1077", "아시리아:-2025,-609", "유다 왕국:-1050,-586", "아케메네스 제국:-550,-330", "마우리아 제국:-322,-184", "카르타고 제국:-814,-146", "셀레우코스 제국:-312,-63", "한 왕조:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["마라톤 전투:그리스::0", "자마 전투:튀니지::0", "가우가멜라 전투:이라크::0", "기자의 피라미드:이집트::1", "페트라:요르단::1", "폼페이:이탈리아::1", "알렉산드리아 도서관:이집트::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["고대 이집트 최초의 수도는?::멤피스##테베##알렉산드리아##볼티모어::0", "고대 그리스 문명은 어느 섬에서 시작되었습니까?::사모스##크레타 섬##올림피아##로도스::1", "고대 세계의 7대 불가사의 중 아직 몇 개나 존재합니까?::3##2##1##0::2", "알려진 세계의 첫 번째 지도를 만든 사람은 누구입니까?::아르키메데스##아낙시만더##유클리드##크리스토퍼 콜럼버스::1", "고대 로마에서 서로의 결정을 거부할 수 있는 영사의 권리를 무엇이라고 합니까?::세##거부권##감독하다##확인::1", "중국의 만리장성은 대략 몇 살입니까?::1000년##2000년##3000년##5000년::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":알렉산더 대왕::", ":줄리어스 시저::", ":아리스토텔레스::", ":공자::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["호모 에렉투스는 아프리카를 떠납니다:-1800000", "인간은 불을 통제하는 법을 배웁니다:-400000", "네안데르탈 인이 멸종 됨:-40000", "신석기 혁명:-9000", "수메르에서 최초의 문명 개발:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["괴베클리 테페:터키::1", "라스코 동굴:프랑스::1", "수메르:이라크::1", "스톤헨지:영국::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["석기 시대의 어떤 동물이 지금 멸종되었습니까?::치타##거대한##영양##개미핥기::1", "석기 시대 이전에는 어떤 단계가 있었습니까?::진흙 시대##공룡시대##빙하 시대##빅뱅::2", "유인원이란 무엇입니까?::도구##인간의 초기 조상##고대 뼈 수집품##낚시 바늘::1", "인류는 어느 대륙에서 전 세계로 이주했습니까?::아프리카##아시아##호주##유럽::0", "다음 중 호모 에렉투스를 정의하는 것은?::생각하는 사람##현대인##현인##똑바른 사람::3"]);
  }void addMS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.ms;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart menulis simfoni pertamanya:1764", "Pengisytiharan Kemerdekaan Amerika Syarikat:1776", "Napoleon dikalahkan pada Pertempuran Waterloo:1815", "Lokomotif Steam Pertama:1825", "Great Britain mengambil alih pemerintahan India:1858", "Edison mencipta lampu elektrik:1879", "Benz membangunkan kereta api petrol pertama:1885", "Einstein mengumumkan teori relativiti:1905", "Titanic, kapal terbesar di dunia, tenggelam di Atlantik Utara:1912", "Perang Dunia Pertama bermula:1914", "Revolusi Rusia:1917", "Hitler berkuasa di Jerman:1933", "Perang Dunia Kedua bermula:1939", "Akhir Perang Dunia Kedua:1945", "Komunis China ditubuhkan:1949", "Rusia menghantar ke angkasa satelit pertama, Sputnik 1:1957", "Yuri Gagarin menjadi lelaki pertama yang terbang di angkasa:1961", "Neil Armstrong menjadi lelaki pertama yang menjejakkan kaki di bulan:1969", "Bencana Chernobyl:1986", "Kejatuhan Komunisme di Eropah Timur:1989", "Penyatuan Jerman:1990", "Kesatuan Soviet pecah:1991", "Akhir Apartheid di Afrika Selatan:1994", "Google ditubuhkan:1998", "11 September Serangan Pengganas:2001", "Pengenalan iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Empayar Mughal:1526,1758", "Dinasti Qing:1644,1912", "Empayar Rusia:1721,1917", "Empayar Austria-Hungary:1867,1918", "Empayar Jerman:1871,1918", "Kerajaan Uthmaniyyah:1299,1922", "Empayar Jepun:1868,1947", "Empayar Sepanyol:1402,1975", "Empayar Perancis:1534,1980", "Kesatuan Soviet:1922,1991", "Empayar Inggeris:1603,1997", "Empayar Portugis:1415,1999", "Amerika Syarikat:1776,x", "China:1949,x", "Kesatuan Eropah:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Pertempuran Waterloo:Belgium:2,3,5:0", "Pertempuran Gettysburg:Amerika Syarikat:5,6,7:0", "Pengepungan Stalingrad:Rusia:6,8,9:0", "Pencerobohan Normandy:Perancis:5,6,8:0", "Pertempuran Okinawa:Jepun:1,8,9:0", "Pertempuran Vienna:Austria:6,0,3:0", "Kejatuhan Tembok Berlin:Jerman:0,5,3:0", "Perjanjian Versailles:Perancis:1,0,5:0", "Pembunuhan Archduke Franz Ferdinand:Bosnia dan Herzegovina:1,5,6:0", "Bencana Chernobyl:Ukraine:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Negara manakah yang pertama sampai ke kutub selatan?::Norway##Inggeris##Denmark##Rusia::0", "Negara Eropah manakah yang mempunyai empayar terbesar dalam sejarah?::Rusia##Inggeris##Itali##Sepanyol::1", "Antara negara Afrika yang manakah dikuasai oleh Jerman?::Benin##Angola##Djibouti##Tanzania::3", "Siapa Tsar pertama Rusia?::Tsar Nicholas I##Tsar Alexander II##Tsar Ivan the Terrible##Tsar Paul I::2", "Apakah pertempuran yang menamatkan Perang Napoleon?::Pertempuran Vienna##Pertempuran Valmy##Pertempuran Verdun##Pertempuran Waterloo::3", "Antara negara ini yang manakah merupakan sebahagian daripada USSR?::Slovakia##Mongolia##Afghanistan##Azerbaijan::3", "Mana satu antara negara ini yang tidak pernah dikawal oleh United Kingdom?::Pakistan##Afghanistan##Nigeria##Jordan::1", "Apakah negara Eropah yang dipersalahkan untuk Perang Dunia 1?::Rusia##Inggeris##Jerman::2", "Negara manakah yang berkecuali pada permulaan Perang Dunia Kedua?::Perancis##Amerika Syarikat##Jerman##Poland::1", "Pemimpin anti-apartheid Afrika mana yang dibebaskan dari penjara pada 1990, selepas lebih 27 tahun?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Presiden AS manakah yang dipilih untuk memegang jawatan empat kali?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Kelahiran Nabi Muhammad, pengasas Islam:570", "Percetakan dicipta di China:730", "Perpecahan Gereja Kristian:1054", "Magna Carta ditandatangani oleh Raja John:1215", "Wabak Bubonic merebak ke Eropah:1347", "Turki Uthmaniyyah menawan Konstantinopel:1453", "Columbus menemui Amerika:1492", "Bangunan Taj Mahal selesai:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Empayar Sasan:224,651", "Dinasti Tang:618,907", "Kekhalifahan Abbasiyah:750,1258", "Kerajaan Pagan:849,1297", "Empayar Mongol:1206,1368", "Empayar Khmer:802,1431", "Empayar Rom:-27,1453", "Empayar Byzantine:395,1453", "Empayar Inka:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Pengepungan Orleans:Perancis:1,2,6:0", "Kejatuhan Konstantinopel:Turki:0,2,7:0", "Pertempuran Hastings:Inggeris:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kemboja:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Perang Salib Pertama mempunyai matlamat yang dimaksudkan untuk menawan kota mana?::Baitulmaqdis##Kaherah##Mekah##Rom::0", "Apakah yang dicapai oleh Magna Carta?::ia mengehadkan kuasa tuan-tuan##ia mengehadkan kuasa kesatria##ia meningkatkan kuasa petani dan hamba##ia mengehadkan kuasa raja::3", "Bagaimanakah Wabak Bubonik merebak?::Air buruk##Kutu daripada tikus##Udara tercemar##Abu gunung berapi::1", "Bandar ini berada di persimpangan antara Eropah dan Timur Tengah::Kaherah##Konstantinopel##Paris##Moscow::1", "Apakah punca Perang Salib?::Membebaskan tanah suci Baitulmaqdis daripada orang Islam##Pemberontakan petani##Kematian Hitam merebak ke seluruh Eropah##Peperangan perdagangan di sepanjang Jalan Sutera::0", "Nabi suci agama Islam?::Nabi Isa##Buddha##Muhammad::2", "Struktur sosial Zaman Pertengahan::Sistem kasta##Feudalisme##Manorisme::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Charlemagne::", ":Leonardo da Vinci::", ":Genghis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Piramid dan Sphinx Besar dibina:-2500", "Kelahiran Buddha:-486", "Penubuhan Empayar Rom:-27", "Julius Caesar dari Rom dibunuh:-44", "Penyebaran agama Kristian:1", "Perpecahan Empayar Rom:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Empayar Akkadia:-2300,-2200", "Empayar Babylon:-1900,-1600", "Empayar Mesir:-1550,-1077", "Assyria:-2025,-609", "Kerajaan Yehuda:-1050,-586", "Empayar Achaemenid:-550,-330", "Empayar Maurya:-322,-184", "Empayar Carthage:-814,-146", "Empayar Seleucid:-312,-63", "Dinasti Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Pertempuran Marathon:Yunani::0", "Pertempuran Zama:Tunisia::0", "Pertempuran Gaugamela:Iraq::0", "Piramid Giza:Mesir::1", "Petra:Jordan::1", "Pompeii:Itali::1", "Perpustakaan Iskandariah:Mesir::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Apakah ibu kota pertama Mesir kuno?::Memphis##Thebes##Iskandariah##Baltimore::0", "Di pulau apakah tamadun Yunani kuno berasal?::Samos##Crete##Olympia##Rhodes::1", "Berapa banyak daripada Tujuh Keajaiban Dunia Purba yang masih wujud?::3##2##1##0::2", "Siapa yang dikreditkan dengan membuat peta pertama dunia yang diketahui?::Archimedes##Anaximander##Euclid##Christopher Columbus::1", "Di Rom kuno, apakah hak konsul untuk menolak keputusan masing-masing?::Cukai##Veto##Mengawasi##Mengesahkan::1", "Kira-kira berapa umur Tembok Besar China?::1000 tahun##2000 tahun##3000 tahun##5000 tahun::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander the Great::", ":Julius Caesar::", ":Aristotle::", ":Confucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus meninggalkan Afrika:-1800000", "Manusia belajar mengawal api:-400000", "Neanderthal menjadi pupus:-40000", "Revolusi Neolitik:-9000", "Tamadun pertama berkembang di Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turki::1", "Gua Lascaux:Perancis::1", "Sumer:Iraq::1", "Stonehenge:Inggeris::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Apakah haiwan dari zaman batu yang telah pupus sekarang?::cheetah##raksasa##antelop##Anteater::1", "Tahap apakah yang datang sebelum zaman batu?::Zaman Lumpur##Zaman Dinosaur##Zaman ais##Letupan Besar::2", "Apakah hominid?::sebuah alat##nenek moyang awal manusia##koleksi tulang purba##mata kail::1", "Manusia berhijrah ke seluruh dunia dari benua apakah?::Afrika##Asia##Australia##Eropah::0", "Antara berikut, yang manakah mentakrifkan Homo erectus?::lelaki yang berfikir##manusia moden##lelaki bijak##lelaki tegak::3"]);
  }void addNL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.nl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart schrijft zijn eerste symfonie:1764", "Onafhankelijkheidsverklaring van de Verenigde Staten:1776", "Napoleon wordt verslagen in de Slag bij Waterloo:1815", "Eerste stoomlocomotief:1825", "Groot-Brittannië nam de heerschappij van India over:1858", "Edison vindt elektrisch licht uit:1879", "Benz ontwikkelt eerste benzineauto:1885", "Einstein kondigt de relativiteitstheorie aan:1905", "Titanic, het grootste schip ter wereld, zinkt in de Noord-Atlantische Oceaan:1912", "De Eerste Wereldoorlog begint:1914", "Russische revolutie:1917", "Hitler komt aan de macht in Duitsland:1933", "De Tweede Wereldoorlog begint:1939", "Einde van de Tweede Wereldoorlog:1945", "Communistisch China wordt opgericht:1949", "Rusland stuurt de eerste satelliet, Spoetnik 1, de ruimte in:1957", "Yuri Gagarin wordt de eerste man die door de ruimte vliegt:1961", "Neil Armstrong wordt de eerste man die voet op de maan zet:1969", "Ramp in Tsjernobyl:1986", "Val van het communisme in Oost-Europa:1989", "Eenwording van Duitsland:1990", "Sovjet-Unie valt uiteen:1991", "Einde van de apartheid in Zuid-Afrika:1994", "Google is opgericht:1998", "Aanslagen op 11 september:2001", "Introductie van de iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mogolrijk:1526,1758", "Qing-dynastie:1644,1912", "Russische Rijk:1721,1917", "Oostenrijk-Hongarije:1867,1918", "Duitse Rijk:1871,1918", "Ottomaanse Rijk:1299,1922", "Japans Keizerrijk:1868,1947", "Spaanse Rijk:1402,1975", "Frans Rijk:1534,1980", "Sovjet-Unie:1922,1991", "Britse Rijk:1603,1997", "Portugese Rijk:1415,1999", "Verenigde Staten:1776,x", "China:1949,x", "Europese Unie:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Slag bij Waterloo:België:2,3,5:0", "Slag bij Gettysburg:Verenigde Staten:5,6,7:0", "Beleg van Stalingrad:Rusland:6,8,9:0", "Invasie van Normandië:Frankrijk:5,6,8:0", "De slag om Okinawa:Japan:1,8,9:0", "De slag om Wenen:Oostenrijk:6,0,3:0", "Val van de Berlijnse Muur:Duitsland:0,5,3:0", "Verdrag van Versailles:Frankrijk:1,0,5:0", "Moord op aartshertog Franz Ferdinand:Bosnië-Herzegovina:1,5,6:0", "ramp in Tsjernobyl:Oekraïne:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Welk land bereikte als eerste de zuidpool?::Noorwegen##Verenigd Koningkrijk##Denemarken##Rusland::0", "Welk Europees land had het grootste rijk in de geschiedenis?::Rusland##Verenigd Koningkrijk##Italië##Spanje::1", "Welk van deze Afrikaanse landen werd gecontroleerd door Duitsland?::Benin##Angola##Djibouti##Tanzania::3", "Wie was de eerste tsaar van Rusland?::tsaar Nicolaas I##Tsaar Alexander II##Tsaar Ivan de Verschrikkelijke##Tsaar Paul I::2", "Wat was de slag die een einde maakte aan de Napoleontische oorlogen?::Slag om Wenen##Slag bij Valmy##Slag bij Verdun##Slag bij Waterloo::3", "Welke van deze landen maakte deel uit van de USSR?::Slowakije##Mongolië##Afghanistan##Azerbeidzjan::3", "Welke van deze landen werd nooit gecontroleerd door het Verenigd Koninkrijk?::Pakistan##Afghanistan##Nigeria##Jordanië::1", "Welk Europees land kreeg de schuld van de Eerste Wereldoorlog?::Rusland##Verenigd Koningkrijk##Duitsland::2", "Welk land was neutraal aan het begin van de Tweede Wereldoorlog?::Frankrijk##Verenigde Staten##Duitsland##Polen::1", "Welke Afrikaanse anti-apartheidsleider werd in 1990 na meer dan 27 jaar vrijgelaten uit de gevangenis?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Welke Amerikaanse president werd vier keer verkozen?::George Washington##Gerard Ford##Franklin D. Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Geboorte van profeet Mohammed, de grondlegger van de islam:570", "Het drukken is uitgevonden in China:730", "Splitsing van de christelijke kerk:1054", "Magna Carta gesigneerd door King John:1215", "De builenpest verspreidt zich naar Europa:1347", "De Ottomaanse Turken veroverden Constantinopel:1453", "Columbus ontdekt Amerika:1492", "Bouw van Taj Mahal voltooid:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sassaniden:224,651", "Tang-dynastie:618,907", "Kalifaat van de Abbasiden:750,1258", "Pagan Rijk:849,1297", "Mongoolse Rijk:1206,1368", "Khmer-rijk:802,1431", "Romeinse Rijk:-27,1453", "Byzantijnse Rijk:395,1453", "Inca-rijk:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Beleg van Orléans:Frankrijk:1,2,6:0", "Val van Constantinopel:Turkije:0,2,7:0", "Slag bij Hastings:Verenigd Koningkrijk:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Cambodja:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["De Eerste Kruistocht had als doel om welke stad te veroveren?::Jeruzalem##Cairo##Mekka##Rome::0", "Wat heeft de Magna Carta bereikt?::het beperkte de macht van de heren##het beperkte de kracht van ridders##het verhoogde de macht van boeren en lijfeigenen##het beperkte de macht van de monarch::3", "Hoe verspreidde de builenpest zich?::Slecht water##Vlooien van ratten##Vervuilde lucht##Vulkaan as::1", "Deze stad lag op een kruispunt tussen Europa en het Midden-Oosten::Cairo##constant in Opel##Parijs##Moskou::1", "Wat was de oorzaak van de kruistochten?::Om het heilige land Jeruzalem te bevrijden van de moslims##Een opstand van boeren##De Zwarte Dood verspreidt zich over Europa##Oorlogen ruilen langs de Zijderoute::0", "Heilige profeet van de moslimreligie?::Jezus Christus##Boeddha##Mohammed::2", "Sociale structuur van de Middeleeuwen::Kastenstelsel##feodalisme##Manorisme::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Karel de grote::", ":Leonardo da Vinci::", ":Dzjengis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["De piramides en de Grote Sfinx werden gebouwd:-2500", "Geboorte van Boeddha:-486", "Oprichting van het Romeinse rijk:-27", "Julius Caesar van Rome werd vermoord:-44", "Verspreiding van het christendom:1", "Splitsing van het Romeinse rijk:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkadisch Rijk:-2300,-2200", "Babylonische Rijk:-1900,-1600", "Egyptisch Rijk:-1550,-1077", "Assyrië:-2025,-609", "Koninkrijk Juda:-1050,-586", "Achaemenidisch Rijk:-550,-330", "Mauryadynastie:-322,-184", "Carthaagse Rijk:-814,-146", "Seleucidische Rijk:-312,-63", "Han-dynastie:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Slag bij Marathon:Griekenland::0", "Slag bij Zama:Tunesië::0", "Slag bij Gaugamela:Irak::0", "Piramides van Gizeh:Egypte::1", "Petra:Jordanië::1", "Pompei:Italië::1", "Bibliotheek van Alexandrië:Egypte::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Wat was de eerste hoofdstad van het oude Egypte?::Memphis##Thebe##Alexandrië##Baltimore::0", "Op welk eiland is de oude Griekse beschaving ontstaan?::Samos##Kreta##Olympia##Rhodos::1", "Hoeveel van de zeven wereldwonderen bestaan ​​er nog?::3##2##1##0::2", "Wie wordt gecrediteerd met het maken van de eerste kaart van de bekende wereld?::Archimedes##Anaximander##Euclides##Christopher Columbus::1", "Hoe heet in het oude Rome het recht van een consul om elkaars beslissingen te verwerpen?::Belasting##Veto##toezicht houden op##Bevestigen::1", "Hoe oud is de Chinese Muur ongeveer?::1000 jaar##2000 jaar##3000 jaar##5000 jaar::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander de Grote::", ":Julius Caesar::", ":Aristoteles::", ":Confucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus verlaat Afrika:-1800000", "Mensen leren vuur te beheersen:-400000", "Neanderthalers sterven uit:-40000", "Neolithische revolutie:-9000", "De eerste beschavingen ontwikkelen zich in Sumerië:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turkije::1", "Grot van Lascaux:Frankrijk::1", "Zomer:Irak::1", "Stonehenge:Verenigd Koningkrijk::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Welk dier uit het stenen tijdperk is nu uitgestorven?::Jachtluipaard##mammoet-##antilope##Miereneter::1", "Welk stadium kwam er vóór het stenen tijdperk?::Moddertijd:##dinosaurus tijdperk##Ijstijd##De oerknal::2", "Wat is een hominide?::een gereedschap##een vroege voorouder van de mens##een verzameling oude botten##een vishaak::1", "Vanuit welk continent migreerden mensen over de hele wereld?::Afrika##Azië##Australië##Europa::0", "Welke van de volgende definieert Homo erectus?::denkende man##moderne man##wijze man##oprechte man::3"]);
  }void addNO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.no;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart skriver sin første symfoni:1764", "USAs uavhengighetserklæring:1776", "Napoleon blir beseiret i slaget ved Waterloo:1815", "Første damplokomotiv:1825", "Storbritannia overtok Indias styre:1858", "Edison oppfinner elektrisk lys:1879", "Benz utvikler den første bensindrevne bilen:1885", "Einstein kunngjør relativitetsteorien:1905", "Titanic, verdens største skip, synker i Nord-Atlanteren:1912", "Første verdenskrig begynner:1914", "Russisk revolusjon:1917", "Hitler stiger til makten i Tyskland:1933", "Andre verdenskrig begynner:1939", "Slutten av andre verdenskrig:1945", "Det kommunistiske Kina ble grunnlagt:1949", "Russland sender den første satellitten, Sputnik 1, ut i verdensrommet:1957", "Yuri Gagarin blir den første mannen som flyr i verdensrommet:1961", "Neil Armstrong blir det første mennesket som setter foten på månen:1969", "Tsjernobyl-katastrofen:1986", "Kommunismens fall i Øst-Europa:1989", "Forening av Tyskland:1990", "Sovjetunionen går i stykker:1991", "Slutten på apartheid i Sør-Afrika:1994", "Google ble grunnlagt:1998", "11. september Terrorangrep:2001", "Introduksjon av iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mogulriket:1526,1758", "Qing-dynastiet:1644,1912", "Det russiske imperiet:1721,1917", "Østerrike-Ungarn:1867,1918", "Det tyske imperiet:1871,1918", "Det osmanske riket:1299,1922", "Keiserriket Japan:1868,1947", "Det spanske imperiet:1402,1975", "Det franske koloniriket:1534,1980", "Sovjetunionen:1922,1991", "Det britiske imperiet:1603,1997", "Det portugisiske imperiet:1415,1999", "USA:1776,x", "Kina:1949,x", "Den Europeiske Union:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Slaget ved Waterloo:Belgia:2,3,5:0", "Slaget ved Gettysburg:Forente Stater:5,6,7:0", "Beleiring av Stalingrad:Russland:6,8,9:0", "Invasjon av Normandie:Frankrike:5,6,8:0", "Slaget ved Okinawa:Japan:1,8,9:0", "Slaget ved Wien:Østerrike:6,0,3:0", "Berlinmurens fall:Tyskland:0,5,3:0", "Versailles-traktaten:Frankrike:1,0,5:0", "Attentatet på erkehertug Franz Ferdinand:Bosnia og Herzegovina:1,5,6:0", "Tsjernobyl-katastrofen:Ukraina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Hvilket land var det første som nådde sørpolen?::Norge##Storbritannia##Danmark##Russland::0", "Hvilket europeisk land hadde det største imperiet i historien?::Russland##Storbritannia##Italia##Spania::1", "Hvilket av disse afrikanske landene ble kontrollert av Tyskland?::Benin##Angola##Djibouti##Tanzania::3", "Hvem var den første tsaren i Russland?::Tsar Nicholas I##Tsar Alexander II##Tsar Ivan den grusomme##Tsar Paul I::2", "Hva var slaget som avsluttet Napoleonskrigene?::Slaget ved Wien##Slaget ved Valmy##Slaget ved Verdun##Slaget ved Waterloo::3", "Hvilket av disse landene var en del av USSR?::Slovakia##Mongolia##Afghanistan##Aserbajdsjan::3", "Hvilket av disse landene ble aldri kontrollert av Storbritannia?::Pakistan##Afghanistan##Nigeria##Jordan::1", "Hvilket europeisk land fikk skylden for første verdenskrig?::Russland##Storbritannia##Tyskland::2", "Hvilket land var nøytralt i begynnelsen av andre verdenskrig?::Frankrike##Forente Stater##Tyskland##Polen::1", "Hvilken afrikansk anti-apartheid-leder ble løslatt fra fengsel i 1990, etter mer enn 27 år?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Hvilken amerikansk president ble valgt til vervet fire ganger?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Fødsel av profeten Muhammad, grunnleggeren av Islam:570", "Utskrift ble oppfunnet i Kina:730", "Splitt av den kristne kirken:1054", "Magna Carta signert av King John:1215", "Bubonic pest sprer seg til Europa:1347", "De osmanske tyrkerne erobret Konstantinopel:1453", "Columbus oppdager Amerika:1492", "Bygningen av Taj Mahal fullført:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sasanideriket:224,651", "Tang-dynastiet:618,907", "Abbasidene:750,1258", "Paganriket:849,1297", "Mongolriket:1206,1368", "Khmerriket:802,1431", "Romerriket:-27,1453", "Det bysantinske riket:395,1453", "Inkariket:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Beleiring av Orleans:Frankrike:1,2,6:0", "Konstantinopels fall:Tyrkia:0,2,7:0", "Slaget ved Hastings:Storbritannia:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kambodsja:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Det første korstoget hadde som mål å erobre hvilken by?::Jerusalem##Kairo##Mekka##Roma::0", "Hva oppnådde Magna Carta?::det begrenset herrenes makt##det begrenset makten til riddere##det økte makten til bønder og livegne##det begrenset monarkens makt::3", "Hvordan spredte byllepesten seg?::Dårlig vann##Lopper fra rotter##Forurenset luft##Vulkanaske::1", "Denne byen var på et veiskille mellom Europa og Midtøsten::Kairo##Konstantinopel##Paris##Moskva::1", "Hva var årsaken til korstogene?::For å frigjøre det hellige landet Jerusalem fra muslimene##Et opprør av bønder##Svartedauden sprer seg over Europa##Handelskriger langs Silkeveien::0", "Den muslimske religionens hellige profet?::Jesus Kristus##Buddha##Muhammed::2", "Sosial struktur i middelalderen::Kastesystem##Føydalisme##Herregård::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Karl den Store::", ":Leonardo da Vinci::", ":Genghis khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Pyramidene og Great Sphinx ble bygget:-2500", "Buddhas fødsel:-486", "Grunnleggende av Romerriket:-27", "Julius Caesar fra Roma ble myrdet:-44", "Spredning av kristendommen:1", "Splitt av Romerriket:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Det akkadiske rike:-2300,-2200", "Babylonia:-1900,-1600", "Egyptisk imperium:-1550,-1077", "Assyria:-2025,-609", "Riket Juda:-1050,-586", "Akamenidedynastiet:-550,-330", "Mauryariket:-322,-184", "Kartago:-814,-146", "Selevkideriket:-312,-63", "Han-dynastiet:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Slaget ved Marathon:Hellas::0", "Slaget ved Zama:Tunisia::0", "Slaget ved Gaugamela:Irak::0", "Pyramidene i Giza:Egypt::1", "Petra:Jordan::1", "Pompeii:Italia::1", "Biblioteket i Alexandria:Egypt::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Hva var den første hovedstaden i det gamle Egypt?::Memphis##Theben##Alexandria##Baltimore::0", "På hvilken øy oppsto den gamle greske sivilisasjonen?::Samos##Kreta##Olympia##Rhodos::1", "Hvor mange av de syv underverkene i den antikke verden eksisterer fortsatt?::3##2##1##0::2", "Hvem er kreditert med å lage det første kartet over den kjente verden?::Arkimedes##Anaximander##Euklid##Christopher Columbus::1", "Hva kalles en konsuls rett til å avvise hverandres beslutninger i det gamle Roma?::Avgift##Veto##Overvåke##Bekrefte::1", "Omtrent hvor gammel er den kinesiske mur?::1000 år##2000 år##3000 år##5000 år::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander den store::", ":Julius Cæsar::", ":Aristoteles::", ":Konfucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus forlater Afrika:-1800000", "Mennesker lærer å kontrollere brann:-400000", "Neandertalerne blir utryddet:-40000", "Neolitisk revolusjon:-9000", "De første sivilisasjonene utvikler seg i Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Tyrkia::1", "Lascaux-hulen:Frankrike::1", "Sumer:Irak::1", "Stone henge:Storbritannia::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Hvilket dyr fra steinalderen er utryddet nå?::gepard##mammut##antilope##Myrsluker::1", "Hvilket stadium kom før steinalderen?::Mud Age##Dinosaurens alder##Istid##Det store smellet::2", "Hva er en hominid?::et verktøy##en tidlig stamfar til mennesker##en samling av eldgamle bein##en fiskekrok::1", "Mennesker migrerte rundt i verden fra hvilket kontinent?::Afrika##Asia##Australia##Europa::0", "Hvilket av følgende definerer Homo erectus?::tenkende mann##moderne mann##Vis mann##oppreist mann::3"]);
  }void addPL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.pl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart pisze swoją pierwszą symfonię:1764", "Deklaracja niepodległości Stanów Zjednoczonych:1776", "Napoleon zostaje pokonany w bitwie pod Waterloo:1815", "Pierwsza lokomotywa parowa:1825", "Wielka Brytania przejęła rządy Indii:1858", "Edison wynalazł światło elektryczne:1879", "Benz opracowuje pierwszy samochód benzynowy:1885", "Einstein ogłasza teorię względności:1905", "Titanic, największy statek świata, tonie na północnym Atlantyku:1912", "Początek I wojny światowej:1914", "Rewolucja rosyjska:1917", "Hitler dochodzi do władzy w Niemczech:1933", "Rozpoczyna się druga wojna światowa:1939", "Koniec drugiej wojny światowej:1945", "Powstanie komunistycznych Chin:1949", "Rosja wysyła w kosmos pierwszego satelitę, Sputnika 1:1957", "Yuri Gagarin jako pierwszy człowiek leci w kosmos:1961", "Neil Armstrong jako pierwszy człowiek postawił stopę na Księżycu:1969", "Katastrofa w Czarnobylu:1986", "Upadek komunizmu w Europie Wschodniej:1989", "Zjednoczenie Niemiec:1990", "Rozpad Związku Radzieckiego:1991", "Koniec apartheidu w RPA:1994", "Założenie Google:1998", "Ataki terrorystyczne z 11 września:2001", "Wprowadzenie iPhone'a:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Wielcy Mogołowie:1526,1758", "Dynastia Qing:1644,1912", "Imperium Rosyjskie:1721,1917", "Cesarstwo austro-węgierskie:1867,1918", "Cesarstwo Niemieckie:1871,1918", "Imperium Osmańskie:1299,1922", "Cesarstwo Japonii:1868,1947", "Imperium hiszpańskie:1402,1975", "Cesarstwo francuskie:1534,1980", "Związek Radziecki:1922,1991", "Imperium brytyjskie:1603,1997", "Imperium portugalskie:1415,1999", "Stany Zjednoczone:1776,x", "Chiny:1949,x", "Unia Europejska:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Bitwa pod Waterloo:Belgia:2,3,5:0", "Bitwa pod Gettysburgiem:Stany Zjednoczone:5,6,7:0", "Oblężenie Stalingradu:Rosja:6,8,9:0", "Inwazja Normandii:Francja:5,6,8:0", "Bitwa pod Okinawą:Japonia:1,8,9:0", "Bitwa pod Wiedniem:Austria:6,0,3:0", "Upadek muru berlińskiego:Niemcy:0,5,3:0", "Traktat wersalski:Francja:1,0,5:0", "Zabójstwo arcyksięcia Franciszka Ferdynanda:Bośnia i Hercegowina:1,5,6:0", "Katastrofa w Czarnobylu:Ukraina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Który kraj jako pierwszy dotarł do bieguna południowego?::Norwegia##Zjednoczone Królestwo##Dania##Rosja::0", "Który kraj europejski miał największe imperium w historii?::Rosja##Zjednoczone Królestwo##Włochy##Hiszpania::1", "Który z tych krajów afrykańskich był kontrolowany przez Niemcy?::Benin##Angola##Dżibuti##Tanzania::3", "Kto był pierwszym carem Rosji?::Car Mikołaj I##car Aleksander II##Car Iwan Groźny##Car Paweł I::2", "Jaka była bitwa, która zakończyła wojny napoleońskie?::Bitwa pod Wiedniem##Bitwa pod Valmy##Bitwa pod Verdun##Bitwa pod Waterloo::3", "Który z tych krajów był częścią ZSRR?::Słowacja##Mongolia##Afganistan##Azerbejdżan::3", "Który z tych krajów nigdy nie był kontrolowany przez Wielką Brytanię?::Pakistan##Afganistan##Nigeria##Jordania::1", "Jaki kraj europejski został obwiniony za I wojnę światową?::Rosja##Zjednoczone Królestwo##Niemcy::2", "Który kraj był neutralny na początku II wojny światowej?::Francja##Stany Zjednoczone##Niemcy##Polska::1", "Który afrykański przywódca walczący z apartheidem został zwolniony z więzienia w 1990 roku, po ponad 27 latach?::Idi Amin##Nelson Mandela##Ferdynand Marcos##Joseph Atkinson::1", "Który prezydent USA został wybrany na urząd cztery razy?::Jerzy Waszyngton##Geralda Forda##Franklin D. Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Szekspir::", ":Abraham Lincoln::", ":Jerzy Waszyngton::", ":Karol Darwin::", ":Izaak Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Narodziny Proroka Mahometa, założyciela islamu:570", "Druk został wynaleziony w Chinach:730", "Podział kościoła chrześcijańskiego:1054", "Magna Carta podpisana przez króla Jana:1215", "Dżuma dymienicza rozprzestrzenia się w Europie:1347", "Turcy osmańscy zdobyli Konstantynopol:1453", "Columbus odkrywa Amerykę:1492", "Ukończenie budowy Tadż Mahal:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sasanidzi:224,651", "Dynastia Tang:618,907", "Abbasydzi:750,1258", "Królestwo Paganu:849,1297", "Imperium mongolskie:1206,1368", "Imperium Khmerów:802,1431", "Cesarstwo Rzymskie:-27,1453", "Cesarstwo Bizantyjskie:395,1453", "Imperium Inków:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Oblężenie Orleanu:Francja:1,2,6:0", "Upadek Konstantynopola:Turcja:0,2,7:0", "Bitwa pod Hastings:Zjednoczone Królestwo:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kambodża:3,4,6:1", "Taj Mahal:Indie:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Pierwsza krucjata miała na celu zdobycie którego miasta?::Jerozolima##Kair##Mekka##Rzym::0", "Co osiągnęła Magna Carta?::ograniczył władzę panów##ograniczyło moc rycerzy##zwiększył potęgę chłopów i chłopów pańszczyźnianych##ograniczyło władzę monarchy::3", "Jak rozprzestrzeniła się dżuma dymienicza?::Zła woda##Pchły od szczurów##Zanieczyszczone powietrze##Popiół wulkaniczny::1", "To miasto znajdowało się na skrzyżowaniu dróg między Europą a Bliskim Wschodem::Kair##Konstantynopol##Paryż##Moskwa::1", "Jaka była przyczyna wypraw krzyżowych?::Aby wyzwolić Ziemię Świętą Jerozolimę od muzułmanów##Bunt chłopów##Czarna śmierć rozprzestrzeniająca się po Europie##Wojny handlowe wzdłuż Jedwabnego Szlaku::0", "Święty prorok religii muzułmańskiej?::Jezus Chrystus##Budda##Mahomet::2", "Struktura społeczna średniowiecza::System kastowy##Feudalizm##Dworek::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Krzysztof Kolumb::", ":Karol Wielki::", ":Leonardo da Vinci::", ":Czyngis-chan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Zbudowano piramidy i Wielki Sfinks:-2500", "Narodziny Buddy:-486", "Powstanie Cesarstwa Rzymskiego:-27", "Juliusz Cezar z Rzymu został zamordowany:-44", "Rozprzestrzenianie się chrześcijaństwa:1", "Podział Cesarstwa Rzymskiego:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Imperium akadyjskie:-2300,-2200", "Imperium Babilońskie:-1900,-1600", "Imperium Egipskie:-1550,-1077", "Asyria:-2025,-609", "Królestwo Judy:-1050,-586", "Imperium Achemenidów:-550,-330", "Dynastia Maurjów:-322,-184", "Imperium Kartagińskie:-814,-146", "Seleucydzi:-312,-63", "Dynastia Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Bitwa o Maraton:Grecja::0", "Bitwa pod Zama:Tunezja::0", "Bitwa pod Gaugamelą:Irak::0", "Piramidy w Gizie:Egipt::1", "Petra:Jordania::1", "Pompeje:Włochy::1", "Biblioteka Aleksandryjska:Egipt::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Jaka była pierwsza stolica starożytnego Egiptu?::Memphis##Teby##Aleksandria##Baltimore::0", "Na jakiej wyspie powstała starożytna cywilizacja grecka?::Samos##Kreta##Olimpia##Rodos::1", "Ile z siedmiu cudów starożytnego świata nadal istnieje?::3##2##1##0::2", "Komu przypisuje się wykonanie pierwszej mapy znanego świata?::Archimedesa##Anaksymander##Euklides##Krzysztof Kolumb::1", "Jak nazywa się w starożytnym Rzymie prawo konsula do wzajemnego odrzucania swoich decyzji?::Podatek##Weto##Nadzorować##Potwierdzać::1", "Ile lat ma w przybliżeniu Wielki Mur Chiński?::1000 lat##2000 lat##3000 lat##5000 lat::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Aleksander Wielki::", ":Juliusz Cezar::", ":Arystoteles::", ":Konfucjusz::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus opuszcza Afrykę:-1800000", "Ludzie uczą się kontrolować ogień:-400000", "Neandertalczycy wymarli:-40000", "Rewolucja neolityczna:-9000", "W Sumerii rozwijają się pierwsze cywilizacje:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turcja::1", "Jaskinia Lascaux:Francja::1", "Sumer:Irak::1", "Stonehenge:Zjednoczone Królestwo::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Jakie zwierzę z epoki kamienia wymarło teraz?::gepard##mamut##antylopa##Mrówkojad::1", "Jaki etap nastąpił przed epoką kamienia łupanego?::Epoka błotna##Epoka dinozaurów##Epoka lodowcowa##Big Bang::2", "Czym jest hominid?::narzędzie##wczesny przodek człowieka##zbiór starożytnych kości##haczyk wędkarski::1", "Z jakiego kontynentu ludzie migrowali na całym świecie?::Afryka##Azja##Australia##Europa::0", "Które z poniższych określa Homo erectus?::myślący człowiek##nowoczesny mężczyzna##mądry człowiek##wyprostowany człowiek::3"]);
  }void addPT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.pt;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart escreve sua primeira sinfonia:1764", "Declaração de Independência dos Estados Unidos:1776", "Napoleão é derrotado na Batalha de Waterloo:1815", "Primeira locomotiva a vapor:1825", "A Grã-Bretanha assumiu o governo da Índia:1858", "Edison inventa a luz elétrica:1879", "Benz desenvolve o primeiro carro movido a gasolina:1885", "Einstein anuncia a teoria da relatividade:1905", "Titanic, o maior navio do mundo, afunda no Atlântico Norte:1912", "Começa a Primeira Guerra Mundial:1914", "Revolução Russa:1917", "Hitler sobe ao poder na Alemanha:1933", "Começa a Segunda Guerra Mundial:1939", "Fim da Segunda Guerra Mundial:1945", "China comunista é fundada:1949", "A Rússia envia ao espaço o primeiro satélite, Sputnik 1:1957", "Yuri Gagarin se torna o primeiro homem a voar no espaço:1961", "Neil Armstrong se torna o primeiro homem a pisar na lua:1969", "Desastre de Chernobyl:1986", "Queda do comunismo na Europa Oriental:1989", "Unificação da Alemanha:1990", "A União Soviética se separa:1991", "Fim do Apartheid na África do Sul:1994", "Google é fundado:1998", "Ataques terroristas de 11 de setembro:2001", "Introdução do iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Império Mogol:1526,1758", "Dinastia Qing:1644,1912", "Império Russo:1721,1917", "Império Austro-Húngaro:1867,1918", "Império Alemão:1871,1918", "Império Otomano:1299,1922", "Império do Japão:1868,1947", "Império Espanhol:1402,1975", "Império Francês:1534,1980", "União Soviética:1922,1991", "Império Britânico:1603,1997", "Império Português:1415,1999", "Estados Unidos:1776,x", "China:1949,x", "União Europeia:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Batalha de Waterloo:Bélgica:2,3,5:0", "Batalha de Gettysburg:Estados Unidos:5,6,7:0", "Cerco de stalingrado:Rússia:6,8,9:0", "Invasão da Normandia:França:5,6,8:0", "A Batalha de Okinawa:Japão:1,8,9:0", "A batalha de viena:Áustria:6,0,3:0", "Queda do Muro de Berlim:Alemanha:0,5,3:0", "Tratado de Versalhes:França:1,0,5:0", "Assassinato do arquiduque Franz Ferdinand:Bósnia e Herzegovina:1,5,6:0", "Desastre de Chernobyl:Ucrânia:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Qual país foi o primeiro a chegar ao pólo sul?::Noruega##Reino Unido##Dinamarca##Rússia::0", "Qual país europeu teve o maior império da história?::Rússia##Reino Unido##Itália##Espanha::1", "Qual desses países africanos era controlado pela Alemanha?::Benin##Angola##Djibuti##Tanzânia::3", "Quem foi o primeiro czar da Rússia?::Czar Nicolau I##Czar Alexandre II##Czar ivan, o terrível##Czar Paulo I::2", "Qual foi a batalha que encerrou as Guerras Napoleônicas?::Batalha de viena##Batalha de Valmy##Batalha de Verdun##Batalha de Waterloo::3", "Qual desses países fez parte da URSS?::Eslováquia##Mongólia##Afeganistão##Azerbaijão::3", "Qual desses países nunca foi controlado pelo Reino Unido?::Paquistão##Afeganistão##Nigéria##Jordânia::1", "Qual país europeu foi culpado pela Primeira Guerra Mundial?::Rússia##Reino Unido##Alemanha::2", "Que país era neutro no início da 2ª Guerra Mundial?::França##Estados Unidos##Alemanha##Polônia::1", "Qual líder africano anti-apartheid foi libertado da prisão em 1990, depois de mais de 27 anos?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Qual presidente dos EUA foi eleito quatro vezes?::George washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleão Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Nascimento do Profeta Muhammad, o fundador do Islã:570", "A impressão foi inventada na China:730", "Divisão da Igreja Cristã:1054", "Carta Magna assinada pelo Rei João:1215", "A peste bubônica se espalha para a Europa:1347", "Os turcos otomanos capturaram Constantinopla:1453", "Colombo descobre a América:1492", "Construção do Taj Mahal concluída:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Império Sassânida:224,651", "Dinastia Tang:618,907", "Califado Abássida:750,1258", "Reino Pagão:849,1297", "Império Mongol:1206,1368", "Império Quemer:802,1431", "Império Romano:-27,1453", "Império Bizantino:395,1453", "Império Inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Cerco de orleães:França:1,2,6:0", "Queda de Constantinopla:Turquia:0,2,7:0", "Batalha de Hastings:Reino Unido:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Camboja:3,4,6:1", "Taj Mahal:Índia:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["A Primeira Cruzada tinha como objetivo capturar qual cidade?::Jerusalém##Cairo##Meca##Roma::0", "O que a Magna Carta conseguiu?::limitou o poder dos senhores##limitou o poder dos cavaleiros##aumentou o poder dos camponeses e servos##limitou o poder do monarca::3", "Como a Peste Bubônica se espalhou?::Água ruim##Pulgas de ratos##Ar poluído##Cinza vulcânica::1", "Esta cidade estava em uma encruzilhada entre a Europa e o Oriente Médio::Cairo##Constantinopla##Paris##Moscou::1", "Qual foi a causa das Cruzadas?::Para libertar a Terra Santa de Jerusalém dos muçulmanos##Uma revolta de camponeses##A Peste Negra se espalhando pela Europa##Guerras comerciais ao longo da Rota da Seda::0", "Santo profeta da religião muçulmana?::Jesus Cristo##Buda##Maomé::2", "Estrutura social da Idade Média::Sistema de castas##Feudalismo##Manorismo::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Cristóvão Colombo::", ":Carlos Magno::", ":Leonardo da Vinci::", ":Genghis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["As Pirâmides e a Grande Esfinge foram construídas:-2500", "Nascimento de Buda:-486", "Fundação do Império Romano:-27", "Júlio César de Roma foi assassinado:-44", "Propagação do Cristianismo:1", "Divisão do Império Romano:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Império Acádio:-2300,-2200", "Império Babilônico:-1900,-1600", "Império Egípcio:-1550,-1077", "Assíria:-2025,-609", "Reino de Judá:-1050,-586", "Império Aquemênida:-550,-330", "Império Máuria:-322,-184", "Império Cartaginês:-814,-146", "Império Selêucida:-312,-63", "Dinastia Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Batalha de Maratona:Grécia::0", "Batalha de Zama:Tunísia::0", "Batalha de Gaugamela:Iraque::0", "Pirâmides de Gizé:Egito::1", "Petra:Jordânia::1", "Pompéia:Itália::1", "Biblioteca de Alexandria:Egito::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Qual foi a primeira capital do antigo Egito?::Memphis##Tebas##Alexandria##Baltimore::0", "Em que ilha se originou a antiga civilização grega?::Samos##Creta##Olympia##Rodes::1", "Quantas das Sete Maravilhas do Mundo Antigo ainda existem?::3##2##1##0::2", "Quem é responsável por fazer o primeiro mapa do mundo conhecido?::Arquimedes##Anaximandro##Euclides##Cristóvão Colombo::1", "Na Roma antiga, o que significava o direito de um cônsul de rejeitar as decisões uns dos outros?::Imposto##Veto##Vigiar##Afirmar::1", "Aproximadamente quantos anos tem a Grande Muralha da China?::1000 anos##2000 anos##3000 anos##5000 anos::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexandre o grande::", ":Júlio César::", ":Aristóteles::", ":Confucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus deixa a África:-1800000", "Humanos aprendem a controlar o fogo:-400000", "Neandertais são extintos:-40000", "Revolução Neolítica:-9000", "As primeiras civilizações se desenvolvem na Suméria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turquia::1", "Caverna Lascaux:França::1", "verão:Iraque::1", "Stonehenge:Reino Unido::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Que animal da idade da pedra está extinto agora?::guepardo##mamute##antílope##Tamanduá::1", "Qual fase veio antes da idade da pedra?::Idade da lama##Idade dos Dinossauros##Era do Gelo##A grande explosão::2", "O que é um hominídeo?::uma ferramenta##um ancestral dos humanos##uma coleção de ossos antigos##um anzol::1", "Os humanos migraram ao redor do mundo de que continente?::África##Ásia##Austrália##Europa::0", "Qual das alternativas a seguir define o Homo erectus?::homem pensante##homem moderno##homem sábio##homem justo::3"]);
  }void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.ro;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart scrie prima sa simfonie:1764", "Declarația de independență a Statelor Unite:1776", "Napoleon este învins la bătălia de la Waterloo:1815", "Prima locomotivă cu aburi:1825", "Marea Britanie a preluat stăpânirea Indiei:1858", "Edison inventează lumina electrică:1879", "Benz dezvoltă prima mașină pe benzină:1885", "Einstein anunță teoria relativității:1905", "Titanic, cea mai mare navă din lume, se scufundă în Atlanticul de Nord:1912", "Începe primul război mondial:1914", "Revoluția Rusă:1917", "Hitler ajunge la putere în Germania:1933", "Începe al doilea război mondial:1939", "Sfârșitul celui de-al doilea război mondial:1945", "China comunistă este fondată:1949", "Rusia trimite în spațiu primul satelit, Sputnik 1:1957", "Yuri Gagarin devine primul om care zboară în spațiu:1961", "Neil Armstrong devine primul om care a pus piciorul pe Lună:1969", "Dezastrul de la Cernobîl:1986", "Căderea comunismului în Europa de Est:1989", "Unificarea Germaniei:1990", "Uniunea Sovietică se destramă:1991", "Sfârșitul apartheidului în Africa de Sud:1994", "Google este fondat:1998", "Atacurile teroriste din 11 Septembrie:2001", "Introducere iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Imperiul Mogul:1526,1758", "Dinastia Qing:1644,1912", "Imperiul Rus:1721,1917", "Imperiul Austro-Ungar:1867,1918", "Imperiul German:1871,1918", "Imperiul Otoman:1299,1922", "Imperiul Japoniei:1868,1947", "Imperiul Spaniol:1402,1975", "Imperiul Francez:1534,1980", "Uniunea Sovietică:1922,1991", "Imperiul Britanic:1603,1997", "Imperiul Portughez:1415,1999", "Statele Unite:1776,x", "China:1949,x", "Uniunea Europeană:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Bătălia de la Waterloo:Belgia:2,3,5:0", "Bătălia de la Gettysburg:Statele Unite:5,6,7:0", "Asediul Stalingradului:Rusia:6,8,9:0", "Invazia Normandiei:Franţa:5,6,8:0", "Bătălia de la Okinawa:Japonia:1,8,9:0", "Bătălia de la Viena:Austria:6,0,3:0", "Căderea Zidului Berlinului:Germania:0,5,3:0", "Tratatul De La Versailles:Franţa:1,0,5:0", "Asasinarea arhiducelui Franz Ferdinand:Bosnia si Hertegovina:1,5,6:0", "Dezastrul de la Cernobîl:Ucraina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Care țară a ajuns prima la polul sud?::Norvegia##Regatul Unit##Danemarca##Rusia::0", "Care țară europeană a avut cel mai mare imperiu din istorie?::Rusia##Regatul Unit##Italia##Spania::1", "Care dintre aceste țări africane era controlată de Germania?::Benin##Angola##Djibouti##Tanzania::3", "Cine a fost primul țar al Rusiei?::Țarul Nicolae I##Țarul Alexandru al II-lea##Țarul Ivan cel Groaznic##Țarul Paul I::2", "Care a fost bătălia care a pus capăt războaielor napoleoniene?::Bătălia de la Viena##Bătălia de la Valmy##Bătălia de la Verdun##Bătălia de la Waterloo::3", "Care dintre aceste țări făcea parte din URSS?::Slovacia##Mongolia##Afganistan##Azerbaidjan::3", "Care dintre aceste țări nu a fost niciodată controlată de Regatul Unit?::Pakistan##Afganistan##Nigeria##Iordania::1", "Ce țară europeană a fost învinuită pentru Primul Război Mondial?::Rusia##Regatul Unit##Germania::2", "Ce țară a fost neutră la începutul celui de-al Doilea Război Mondial?::Franţa##Statele Unite##Germania##Polonia::1", "Care lider african anti-apartheid a fost eliberat din închisoare în 1990, după mai bine de 27 de ani?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Care președinte american a fost ales în funcție de patru ori?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Nașterea profetului Muhammad, fondatorul Islamului:570", "Tipărirea a fost inventată în China:730", "Despărțirea Bisericii Creștine:1054", "Magna Carta semnată de regele Ioan:1215", "Ciuma bubonică se răspândește în Europa:1347", "Turcii otomani au capturat Constantinopolul:1453", "Columb descoperă America:1492", "Clădirea Taj Mahal finalizată:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Imperiul Sasanid:224,651", "Dinastia Tang:618,907", "Califatul Abbasid:750,1258", "Regatul Pagan:849,1297", "Imperiul Mongol:1206,1368", "Imperiul Khmer:802,1431", "Imperiul Roman:-27,1453", "Imperiul Bizantin:395,1453", "Imperiul Inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Asediul Orleansului:Franţa:1,2,6:0", "Căderea Constantinopolului:Turcia:0,2,7:0", "Bătălia de la Hastings:Regatul Unit:0,1,5:0", "Machu Picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Cambogia:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Prima Cruciadă a avut scopul de a captura ce oraș?::Ierusalim##Cairo##Mecca##Roma::0", "Ce a realizat Magna Carta?::limita puterea domnilor##limita puterea cavalerilor##a sporit puterea țăranilor și a iobagilor##a limitat puterea monarhului::3", "Cum s-a răspândit Ciuma Bubonică?::Apă proastă##Purici de la șobolani##Aer poluat##Cenușă de vulcan::1", "Acest oraș se afla la o răscruce între Europa și Orientul Mijlociu::Cairo##Constantinopol##Paris##Moscova::1", "Care a fost cauza cruciadelor?::Pentru a elibera pământul sfânt al Ierusalimului de musulmani##O revoltă a țăranilor##Moartea Neagră s-a răspândit în Europa##Războaie comerciale de-a lungul Drumului Mătăsii::0", "Sfânt profet al religiei musulmane?::Iisus Hristos##Buddha##Muhammad::2", "Structura socială a Evului Mediu::Sistemul de caste##Feudalism##Manorism::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Cristofor Columb::", ":Carol cel Mare::", ":Leonardo da Vinci::", ":Genghis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["S-au construit Piramidele și Marele Sfinx:-2500", "Nașterea lui Buddha:-486", "Întemeierea Imperiului Roman:-27", "Iulius Cezar al Romei a fost asasinat:-44", "Răspândirea creștinismului:1", "Divizarea Imperiului Roman:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Imperiul Akkadian:-2300,-2200", "Imperiul Babilonian:-1900,-1600", "Imperiul Egiptean:-1550,-1077", "Asiria:-2025,-609", "Regatul Iuda:-1050,-586", "Imperiul Ahemenid:-550,-330", "Dinastia Maurya:-322,-184", "Imperiul Cartaginei:-814,-146", "Imperiul Seleucid:-312,-63", "Dinastia Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Bătălia de la Maraton:Grecia::0", "Bătălia de la Zama:Tunisia::0", "Bătălia de la Gaugamela:Irak::0", "Piramidele din Giza:Egipt::1", "Petra:Iordania::1", "Pompeii:Italia::1", "Biblioteca din Alexandria:Egipt::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Care a fost prima capitală a Egiptului antic?::Memphis##Teba##Alexandria##Baltimore::0", "Pe ce insulă și-a luat naștere civilizația greacă antică?::Samos##Creta##Olimpia##Rodos::1", "Câte dintre cele șapte minuni ale lumii antice mai există?::3##2##1##0::2", "Cui i se atribuie prima hartă a lumii cunoscute?::Arhimede##Anaximandru##Euclid##Cristofor Columb::1", "În Roma antică, cum se numește dreptul unui consul de a respinge deciziile celuilalt?::Impozit##Veto##Supraveghea##Afirma::1", "Aproximativ câți ani are Marele Zid Chinezesc?::1000 de ani##2000 de ani##3000 de ani##5000 de ani::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexandru cel Mare::", ":Iulius Cezar::", ":Aristotel::", ":Confucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus părăsește Africa:-1800000", "Oamenii învață să controleze focul:-400000", "Neanderthalienii dispar:-40000", "Revoluția neolitică:-9000", "Primele civilizații se dezvoltă în Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turcia::1", "pestera Lascaux:Franţa::1", "Sumer:Irak::1", "Stonehenge:Regatul Unit::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Ce animal din epoca de piatră a dispărut acum?::ghepard##mamut##antilope##Furnic::1", "Ce etapă a venit înainte de epoca de piatră?::Epoca noroiului##Epoca dinozaurilor##Epoca de gheata##Big Bang-ul::2", "Ce este un hominid?::o unealta##un strămoș timpuriu al oamenilor ##o colecție de oase antice ##un cârlig::1", "Oamenii au migrat în jurul lumii de pe ce continent?::Africa##Asia##Australia ##Europa::0", "Care dintre următoarele definește Homo erectus?::om gânditor##omul modern##om înțelept##om drept::3"]);
  }void addRU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.ru;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Моцарт пишет свою первую симфонию:1764", "Декларация независимости США:1776", "Наполеон побежден в битве при Ватерлоо:1815", "Первый паровоз:1825", "Великобритания захватила власть в Индии:1858", "Эдисон изобретает электрический свет:1879", "Benz разрабатывает первый автомобиль с бензиновым двигателем:1885", "Эйнштейн объявляет о теории относительности:1905", "Титаник, самый большой корабль в мире, тонет в Северной Атлантике:1912", "Начало Первой мировой войны:1914", "Русская революция:1917", "Гитлер приходит к власти в Германии:1933", "Начало Второй мировой войны:1939", "Конец Второй мировой войны:1945", "Коммунистический Китай основан:1949", "Россия отправляет в космос первый спутник, Спутник 1:1957", "Юрий Гагарин становится первым человеком в космосе:1961", "Нил Армстронг становится первым человеком, ступившим на Луну:1969", "Чернобыльская катастрофа:1986", "Падение коммунизма в Восточной Европе:1989", "Объединение Германии:1990", "Распад Советского Союза:1991", "Конец апартеида в Южной Африке:1994", "Компания Google основана:1998", "Террористические атаки 11 сентября:2001", "Представление iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Империя Великих Моголов:1526,1758", "Династия Цин:1644,1912", "Российская империя:1721,1917", "Австро-Венгерская империя:1867,1918", "Германская империя:1871,1918", "Османская империя:1299,1922", "Японская империя:1868,1947", "Испанская империя:1402,1975", "Французская империя:1534,1980", "Советский Союз:1922,1991", "Британская империя:1603,1997", "Португальская империя:1415,1999", "США:1776,x", "Китай:1949,x", "Европейский Союз:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Битва при Ватерлоо:Бельгия:2,3,5:0", "Битва при Геттисберге:Соединенные Штаты:5,6,7:0", "Осада Сталинграда:Россия:6,8,9:0", "Вторжение в Нормандию:Франция:5,6,8:0", "Битва за Окинаву:Япония:1,8,9:0", "Битва за Вену:Австрия:6,0,3:0", "Падение Берлинской стены:Германия:0,5,3:0", "Версальский договор:Франция:1,0,5:0", "Убийство эрцгерцога Франца Фердинанда:Босния и Герцеговина:1,5,6:0", "Чернобыльская катастрофа:Украина:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Какая страна первой достигла южного полюса?::Норвегия##объединенное Королевство##Дания##Россия::0", "Какая европейская страна имела самую большую империю в истории?::Россия##объединенное Королевство##Италия##Испания::1", "Какая из этих африканских стран находилась под контролем Германии?::Бенин##Ангола##Джибути##Танзания::3", "Кто был первым царем России?::Царь Николай I##Царь Александр II##Царь Иван Грозный##Царь Павел I::2", "Какая битва завершила наполеоновские войны?::Битва за вену##Битва при Валми##Битва при Вердене##Битва при Ватерлоо::3", "Какая из этих стран входила в состав СССР?::Словакия##Монголия##Афганистан##Азербайджан::3", "Какая из этих стран никогда не контролировалась Соединенным Королевством?::Пакистан##Афганистан##Нигерия##Иордания::1", "Какую европейскую страну обвинили в Первой мировой войне?::Россия##объединенное Королевство##Германия::2", "Какая страна была нейтральной в начале Второй мировой войны?::Франция##Соединенные Штаты##Германия##Польша::1", "Какой африканский лидер, выступающий против апартеида, был освобожден из тюрьмы в 1990 году, спустя более 27 лет?::Иди Амин##Нельсон Мандела##Фердинанд Маркос##Джозеф Аткинсон::1", "Какой президент США избирался на этот пост четыре раза?::Джордж Вашингтон##Джеральд Форд##Франклин Д. Рузвельт##Абрахам Линкольн::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Наполеон Бонапарт::", ":Вильям Шекспир::", ":Абрахам Линкольн::", ":Джордж Вашингтон::", ":Чарльз Дарвин::", ":Исаак Ньютон::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Рождение Пророка Мухаммеда, основателя ислама:570", "В Китае изобрели печать:730", "Раскол христианской церкви:1054", "Великая хартия вольностей, подписанная королем Иоанном:1215", "Бубонная чума распространяется по Европе:1347", "Османские турки захватили Константинополь:1453", "Колумб открывает Америку:1492", "Строительство Тадж-Махала завершено:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Государство Сасанидов:224,651", "Династия Тан:618,907", "Аббасидский халифат:750,1258", "Династия Паган:849,1297", "Монгольская империя:1206,1368", "Кхмерская империя:802,1431", "Римская империя:-27,1453", "Византийская империя:395,1453", "Империя инков:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Осада Орлеана:Франция:1,2,6:0", "Падение Константинополя:Турция:0,2,7:0", "Битва при Гастингсе:объединенное Королевство:0,1,5:0", "Мачу-Пикчу:Перу:4,5,6:1", "Баган:Мьянма:3,5,7:1", "Ангкор:Камбоджа:3,4,6:1", "Тадж-Махал:Индия:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Первый крестовый поход преследовал цель захватить какой город?::Иерусалим##Каир##Мекка##Рим::0", "Чего достигла Великая хартия вольностей?::это ограничивало власть лордов##это ограничивало силу рыцарей##это увеличило власть крестьян и крепостных##это ограничивало власть монарха::3", "Как распространилась бубонная чума?::Плохая вода##Блохи от крыс##Загрязненный воздух##Вулкан пепел::1", "Этот город находился на перекрестке дорог между Европой и Ближним Востоком.::Каир##Константинополь##Париж##Москва::1", "Что послужило причиной крестовых походов?::Освободить Святую землю Иерусалима от мусульман##Восстание крестьян##Черная смерть распространяется по Европе##Торговые войны на Шелковом пути::0", "Святой пророк мусульманской религии?::Иисус Христос##Будда##Мухаммад::2", "Социальная структура средневековья::Кастовая система##Феодализм##Поместье::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Христофор Колумб::", ":Карл Великий::", ":Леонардо да Винчи::", ":Чингисхан::", ":Галилео Галилей::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Пирамиды и Большой Сфинкс построены:-2500", "Рождение Будды:-486", "Основание Римской империи:-27", "Юлий Цезарь Римский был убит:-44", "Распространение христианства:1", "Разделение Римской империи:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Аккадская империя:-2300,-2200", "Вавилонская империя:-1900,-1600", "Египетская империя:-1550,-1077", "Ассирия:-2025,-609", "Иудейское царство:-1050,-586", "Держа́ва Ахемени́дов:-550,-330", "Империя Маурьев:-322,-184", "Карфагенская империя:-814,-146", "Государство Селевкидов:-312,-63", "Династия Хань:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Марафонская битва:Греция::0", "Битва при Заме:Тунис::0", "Битва при Гавгамеле:Ирак::0", "Пирамиды Гизы:Египет::1", "Петра:Иордания::1", "Помпеи:Италия::1", "Библиотека Александрии:Египет::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Какая была первая столица Древнего Египта?::Мемфис##Фивы##Александрия##Балтимор::0", "На каком острове зародилась древнегреческая цивилизация?::Самос##Крит##Олимпия##Родос::1", "Сколько из семи чудес древнего мира все еще существует?::3##2##1##0::2", "Кому приписывают создание первой карты известного мира?::Архимед##Анаксимандр##Евклид##Христофор Колумб::1", "Как в Древнем Риме называлось право консула отклонять решения друг друга?::Налог##Вето##Наблюдать##Подтвердить::1", "Сколько примерно лет Великой Китайской стене?::1000 лет##2000 лет##3000 лет##5000 лет::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Александр Великий::", ":Юлий Цезарь::", ":Аристотель::", ":Конфуций::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["человек прямоходящий покидает Африку:-1800000", "Люди учатся управлять огнем:-400000", "Вымирают неандертальцы:-40000", "Неолитическая революция:-9000", "Первые цивилизации развиваются в Шумере:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Гёбекли Тепе:Турция::1", "Пещера Ласко:Франция::1", "Шумер:Ирак::1", "Стоунхендж:объединенное Королевство::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Какое животное из каменного века вымерло сейчас?::гепард##мамонт##антилопа##Муравьед::1", "Какой этап предшествовал каменному веку?::Возраст грязи##Возраст динозавров##Ледниковый период##Большой взрыв::2", "Что такое гоминид?::инструмент##ранний предок людей##коллекция древних костей##рыболовный крючок::1", "С какого континента люди мигрировали по всему миру?::Африке##Азия##Австралия##Европа::0", "Что из перечисленного определяет Homo erectus?::думающий человек##современный человек##мудрец##честный человек::3"]);
  }void addSK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.sk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart píše svoju prvú symfóniu:1764", "Deklarácia nezávislosti USA:1776", "Napoleon je porazený v bitke pri Waterloo:1815", "Prvá parná lokomotíva:1825", "Vládu nad Indiou prevzala Veľká Británia:1858", "Edison vynašiel elektrické svetlo:1879", "Benz vyvíja prvé auto na benzín:1885", "Einstein ohlasuje teóriu relativity:1905", "Titanic, najväčšia loď na svete, sa potápa v severnom Atlantiku:1912", "Prvá svetová vojna sa začína:1914", "Ruská revolúcia:1917", "Hitler získava moc v Nemecku:1933", "Druhá svetová vojna sa začína:1939", "Koniec druhej svetovej vojny:1945", "Komunistická Čína bola založená:1949", "Rusko vysiela do vesmíru prvý satelit Sputnik 1:1957", "Jurij Gagarin sa stal prvým človekom, ktorý letel vo vesmíre:1961", "Neil Armstrong sa stáva prvým človekom, ktorý vstúpil na Mesiac:1969", "Černobyľská katastrofa:1986", "Pád komunizmu vo východnej Európe:1989", "Zjednotenie Nemecka:1990", "Rozpad Sovietskeho zväzu:1991", "Koniec apartheidu v Južnej Afrike:1994", "Google je založený:1998", "11. september Teroristické útoky:2001", "Predstavenie iPhonu:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mughalská ríša:1526,1758", "Dynastia Čching:1644,1912", "Ruská ríša:1721,1917", "Rakúsko-uhorské cisárstvo:1867,1918", "Nemecká ríša:1871,1918", "Osmanská ríša:1299,1922", "Japonské cisárstvo:1868,1947", "Španielska ríša:1402,1975", "Francúzska ríša:1534,1980", "Sovietsky zväz:1922,1991", "Britské impérium:1603,1997", "Portugalská ríša:1415,1999", "USA:1776,x", "Čína:1949,x", "Európska únia:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Bitka pri Waterloo:Belgicko:2,3,5:0", "Bitka pri Gettysburgu:Spojené štáty:5,6,7:0", "Obliehanie Stalingradu:Rusko:6,8,9:0", "Invázia v Normandii:Francúzsko:5,6,8:0", "Bitka o Okinawu:Japonsko:1,8,9:0", "Bitka pri Viedni:Rakúsko:6,0,3:0", "Pád Berlínskeho múru:Nemecko:0,5,3:0", "Versaillská zmluva:Francúzsko:1,0,5:0", "Atentát na arcivojvodu Františka Ferdinanda:Bosna a Hercegovina:1,5,6:0", "Černobyľská katastrofa:Ukrajina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Ktorá krajina ako prvá dosiahla južný pól?::Nórsko##Spojene kralovstvo##Dánsko##Rusko::0", "Ktorá európska krajina mala najväčšie impérium v ​​histórii?::Rusko##Spojene kralovstvo##Taliansko##španielsko::1", "Ktorú z týchto afrických krajín ovládalo Nemecko?::Benin##Angola##Džibutsko##Tanzánia::3", "Kto bol prvým ruským cárom?::Cár Mikuláš I##Cár Alexander II##Cár Ivan Hrozný##Cár Pavol I::2", "Aká bola bitka, ktorá ukončila napoleonské vojny?::Bitka pri Viedni##Bitka o Valmy##Bitka pri Verdune##Bitka pri Waterloo::3", "Ktorá z týchto krajín bola súčasťou ZSSR?::Slovensko##Mongolsko##Afganistan##Azerbajdžan::3", "Ktorú z týchto krajín nikdy nekontrolovalo Spojené kráľovstvo?::Pakistan##Afganistan##Nigéria##Jordán::1", "Ktorá európska krajina bola obvinená z 1. svetovej vojny?::Rusko##Spojene kralovstvo##Nemecko::2", "Ktorá krajina bola neutrálna na začiatku 2. svetovej vojny?::Francúzsko##Spojené štáty##Nemecko##Poľsko::1", "Ktorý africký vodca boja proti apartheidu bol prepustený z väzenia v roku 1990, po viac ako 27 rokoch?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Ktorý prezident USA bol zvolený do úradu štyrikrát?::George Washington##Gerald Ford##Franklin D Roosevelt##Abrahám Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abrahám Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Narodenie proroka Mohameda, zakladateľa islamu:570", "Tlač bola vynájdená v Číne:730", "Rozdelenie kresťanskej cirkvi:1054", "Magna Carta podpísaná kráľom Janom:1215", "Dýmějový mor sa šíri do Európy:1347", "Osmanskí Turci zajali Konštantínopol:1453", "Kolumbus objavuje Ameriku:1492", "Budova Taj Mahal dokončená:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Novoperzská ríša:224,651", "Dynastia Tchang:618,907", "Abbásid Kalifát:750,1258", "Pagansko kraljevstvo:849,1297", "Mongolská ríša:1206,1368", "Khmérska ríša:802,1431", "Rímska ríša:-27,1453", "Byzantská ríša:395,1453", "Inkská ríša:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Obliehanie Orleansu:Francúzsko:1,2,6:0", "Pád Konštantínopolu:Turecko:0,2,7:0", "Bitka pri Hastingse:Spojene kralovstvo:0,1,5:0", "Machu Picchu:peru:4,5,6:1", "Bagan:Mjanmarsko:3,5,7:1", "Angkor:Kambodža:3,4,6:1", "Taj Mahal:India:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Cieľom prvej križiackej výpravy bolo dobyť ktoré mesto?::Jeruzalem##Káhira##Mekka##Rím::0", "Čo dokázala Magna Charta?::obmedzovala moc vrchnosti##obmedzovala moc rytierov##zvýšila moc roľníkov a nevoľníkov##obmedzovala moc panovníka::3", "Ako sa šíril bubonický mor?::Zlá voda##Blchy z potkanov##Znečistený vzduch##Sopečný popol::1", "Toto mesto bolo na križovatke medzi Európou a Blízkym východom::Káhira##Konštantínopol##Paríž##Moskva::1", "Čo bolo príčinou križiackych výprav?::Oslobodiť Svätú zem Jeruzalem od moslimov##Vzbura roľníkov##Čierna smrť sa šíri Európou##Obchodné vojny pozdĺž Hodvábnej cesty::0", "Svätý prorok moslimského náboženstva?::Ježiš Kristus##Budha##Mohamed::2", "Sociálna štruktúra stredoveku::Kastový systém##feudalizmus##Manorizmus::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Krištof Kolumbus::", ":Karol Veľký::", ":Leonardo da Vinci::", ":Džingischán::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Boli postavené pyramídy a veľká sfinga:-2500", "Narodenie Budhu:-486", "Založenie Rímskej ríše:-27", "Július Cézar z Ríma bol zavraždený:-44", "Šírenie kresťanstva:1", "Rozdelenie Rímskej ríše:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkadská ríša:-2300,-2200", "Babylonské impérium:-1900,-1600", "Egyptská ríša:-1550,-1077", "Asýria:-2025,-609", "Judské kráľovstvo:-1050,-586", "Achajmenovská ríša:-550,-330", "Mauryanská ríša:-322,-184", "Kartágo:-814,-146", "Seleukovská ríša:-312,-63", "Dynastia Han:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Bitka pri Maratóne:Grécko::0", "Bitka pri Zame:Tunisko::0", "Bitka pri Gaugamele:Irak::0", "Pyramídy v Gíze:egypt::1", "Petra:Jordán::1", "Pompeje:Taliansko::1", "Alexandrijská knižnica:egypt::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Aké bolo prvé hlavné mesto starovekého Egypta?::Memphis##Théby##Alexandria##Baltimore::0", "Na ktorom ostrove vznikla staroveká grécka civilizácia?::Samos##Kréta##Olympia##Rhodos::1", "Koľko zo siedmich divov starovekého sveta ešte existuje?::3##2##1##0::2", "Kto sa zaslúžil o vytvorenie prvej mapy známeho sveta?::Archimedes##Anaximander##Euklides##Krištof Kolumbus::1", "Ako sa v starovekom Ríme nazývalo právo konzula odmietnuť vzájomné rozhodnutia?::daň##Veto##Dohliadať##Potvrdiť::1", "Aký starý je približne Čínsky múr?::1000 rokov##2000 rokov##3000 rokov##5000 rokov::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander Veľký::", ":Július Caesar::", ":Aristoteles::", ":Konfucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus opúšťa Afriku:-1800000", "Ľudia sa naučia ovládať oheň:-400000", "Neandertálci vyhynuli:-40000", "Neolitická revolúcia:-9000", "Prvé civilizácie sa rozvíjajú na Sumérii:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turecko::1", "Jaskyňa Lascaux:Francúzsko::1", "Sumer:Irak::1", "Stonehenge:Spojene kralovstvo::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Ktoré zviera z doby kamennej je už vyhynuté?::gepard##mamut##antilopa##mravčiar::1", "Aké štádium bolo pred dobou kamennou?::Bahenný vek##Vek dinosaurov##Doba ľadová##Veľký tresk::2", "Čo je to hominid?::nástroj##raný predchodca ľudí##zbierka starých kostí##háčik na ryby::1", "Z akého kontinentu ľudia migrovali do celého sveta?::Afriky##Ázie##Austrália##Európe::0", "Ktorá z nasledujúcich možností definuje Homo erectus?::mysliaci človek##moderný človek##múdry muž##vzpriamený človek::3"]);
  }void addSV(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.sv;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart skriver sin första symfoni:1764", "USA s självständighetsförklaring:1776", "Napoleon besegras i slaget vid Waterloo:1815", "Första ånglok:1825", "Storbritannien tog över Indiens styre:1858", "Edison uppfinner elektriskt ljus:1879", "Benz utvecklar sin första bensindrivna bil:1885", "Einstein tillkännager relativitetsteorin:1905", "Titanic, världens största fartyg, sjunker i Nordatlanten:1912", "Världskriget börjar:1914", "Ryska revolutionen:1917", "Hitler stiger till makten i Tyskland:1933", "Andra världskriget börjar:1939", "Slutet av andra världskriget:1945", "Kommunistiska Kina grundades:1949", "Ryssland skickar ut den första satelliten, Sputnik 1, i rymden:1957", "Yuri Gagarin blir den första mannen som flyger i rymden:1961", "Neil Armstrong blir den första mannen som sätter sin fot på månen:1969", "Tjernobylkatastrofen:1986", "Kommunismens fall i Östeuropa:1989", "Tysklands enande:1990", "Sovjetunionen går sönder:1991", "Slutet på apartheid i Sydafrika:1994", "Google grundades:1998", "11 september Terrorattacker:2001", "Introduktion av iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mogulriket:1526,1758", "Qing-dynastin:1644,1912", "Ryska imperiet:1721,1917", "Österrike-Ungern:1867,1918", "Tyska riket:1871,1918", "Osmanska riket:1299,1922", "Japanska imperiet:1868,1947", "Spanska imperiet:1402,1975", "Franska imperiet:1534,1980", "Sovjetunionen:1922,1991", "Brittiska imperiet:1603,1997", "Portugisiska riket:1415,1999", "USA:1776,x", "Kina:1949,x", "Europeiska unionen:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Slaget vid Waterloo:belgien:2,3,5:0", "Slaget vid Gettysburg:Förenta staterna:5,6,7:0", "Belägring av Stalingrad:ryssland:6,8,9:0", "Invasion av Normandie:Frankrike:5,6,8:0", "Slaget vid Okinawa:Japan:1,8,9:0", "Slaget om Wien:österrike:6,0,3:0", "Berlinmurens fall:Tyskland:0,5,3:0", "Fördraget i Versailles:Frankrike:1,0,5:0", "Mordet på ärkehertig Franz Ferdinand:Bosnien och Hercegovina:1,5,6:0", "Tjernobyl-katastrofen:Ukraina:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Vilket land var det första som nådde sydpolen?::Norge##Storbritannien##Danmark##ryssland::0", "Vilket europeiskt land hade historiens största imperium?::ryssland##Storbritannien##Italien##Spanien::1", "Vilket av dessa afrikanska länder kontrollerades av Tyskland?::Benin##Angola##Djibouti##Tanzania::3", "Vem var den första tsaren i Ryssland?::Tsar Nicholas I##Tsar Alexander II##Tsar Ivan den förskräcklige##Tsar Paul I::2", "Vad var slaget som avslutade Napoleonkrigen?::Slaget vid Wien##Slaget vid Valmy##Slaget vid Verdun##Slaget vid Waterloo::3", "Vilket av dessa länder var en del av Sovjetunionen?::Slovakien##mongoliet##Afghanistan##Azerbajdzjan::3", "Vilket av dessa länder kontrollerades aldrig av Storbritannien?::pakistan##Afghanistan##nigeria##Jordanien::1", "Vilket europeiskt land fick skulden för första världskriget?::ryssland##Storbritannien##Tyskland::2", "Vilket land var neutralt i början av andra världskriget?::Frankrike##Förenta staterna##Tyskland##polen::1", "Vilken afrikansk anti-apartheidledare släpptes från fängelset 1990, efter mer än 27 år?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Vilken amerikansk president valdes in fyra gånger?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoleon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Födelse av profeten Muhammad, grundaren av Islam:570", "Utskrift uppfanns i Kina:730", "Split of the Christian Church:1054", "Magna Carta signerad av King John:1215", "Bubonpesten sprider sig till Europa:1347", "De ottomanska turkarna erövrade Konstantinopel:1453", "Columbus upptäcker Amerika:1492", "Byggnaden av Taj Mahal färdigställd:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sasaniderna:224,651", "Tang-dynastin:618,907", "Abbasidkalifatet:750,1258", "Kungariket Pagan:849,1297", "Mongolväldet:1206,1368", "Khmerriket:802,1431", "Romerska riket:-27,1453", "Bysantinska riket:395,1453", "Inkariket:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Belägring av Orleans:Frankrike:1,2,6:0", "Konstantinopels fall:Turkiet:0,2,7:0", "Slaget vid Hastings:Storbritannien:0,1,5:0", "Machu Picchu:peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kambodja:3,4,6:1", "Taj Mahal:Indien:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Det första korståget hade det avsedda målet att erövra vilken stad?::Jerusalem##Kairo##Mecka##Rom::0", "Vad åstadkom Magna Carta?::det begränsade herrarnas makt##det begränsade riddares makt##det ökade böndernas och livegnas makt##det begränsade monarkens makt::3", "Hur spred sig böldpesten?::Dåligt vatten##Loppor från råttor##Förorenad luft##Vulkanaska::1", "Denna stad stod i en korsväg mellan Europa och Mellanöstern::Kairo##Konstantinopel##Paris##Moskva::1", "Vad var orsaken till korstågen?::Att befria det heliga landet Jerusalem från muslimerna##En revolt av bönder##Svartedöden sprider sig över Europa##Handelskrig längs sidenvägen::0", "Den muslimska religionens helige profet?::Jesus Kristus##Buddha##Muhammed::2", "Medeltidens sociala struktur::Kastsystem##Feodalism##Manorism::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Karl den Store::", ":Leonardo Da Vinci::", ":Djingis Khan::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Pyramiderna och Great Sphinx byggdes:-2500", "Buddhas födelse:-486", "Grundandet av det romerska riket:-27", "Julius Caesar från Rom mördades:-44", "Spridning av kristendomen:1", "Split av Romarriket:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akkadiska imperiet:-2300,-2200", "Babylonien:-1900,-1600", "Egyptiska riket:-1550,-1077", "Assyrien:-2025,-609", "Juda rike:-1050,-586", "Akemeniderna:-550,-330", "Mauryariket:-322,-184", "Karthago:-814,-146", "Seleukiderriket:-312,-63", "Han-dynastin:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Slaget vid Marathon:Grekland::0", "Slaget vid Zama:tunisien::0", "Slaget vid Gaugamela:irak::0", "Pyramiderna i Giza:egypten::1", "Petra:Jordanien::1", "Pompeji:Italien::1", "Alexandrias bibliotek:egypten::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Vilken var den första huvudstaden i det antika Egypten?::Memphis##Thebe##Alexandria##Baltimore::0", "På vilken ö uppstod den antika grekiska civilisationen?::Samos##Kreta##Olympia##Rhodos::1", "Hur många av den antika världens sju underverk finns fortfarande?::3##2##1##0::2", "Vem är krediterad för att göra den första kartan över den kända världen?::Arkimedes##Anaximander##Euklid##Christopher Columbus::1", "Vad kallas en konsuls rätt att avslå varandras beslut i det antika Rom?::Beskatta##Veto##Övervaka##Bekräfta::1", "Ungefär hur gammal är den kinesiska muren?::1000 år##2000 år##3000 år##5000 år::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander den store::", ":Julius Caesar::", ":Aristoteles::", ":Konfucius::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus lämnar Afrika:-1800000", "Människor lär sig att kontrollera eld:-400000", "Neandertalarna utrotas:-40000", "Neolitisk revolution:-9000", "De första civilisationerna utvecklas i Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Turkiet::1", "Lascaux grotta:Frankrike::1", "Sumer:irak::1", "Stonehenge:Storbritannien::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Vilket djur från stenåldern är utrotat nu?::gepard##mammut##antilop##Myrslok::1", "Vilket skede kom före stenåldern?::Mud Age##Dinosaurieåldern##Istid##Big Bang::2", "Vad är en hominid?::ett verktyg##en tidig förfader till människor##en samling gamla ben##en fiskkrok::1", "Människor migrerade runt i världen från vilken kontinent?::Afrika##Asien##Australien##Europa::0", "Vilket av följande definierar Homo erectus?::tänkande människa##modern man##vis man##upprätt man::3"]);
  }void addTH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.th;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["โมซาร์ทเขียนซิมโฟนีครั้งแรกของเขา:1764", "คำประกาศอิสรภาพของสหรัฐอเมริกา:1776", "นโปเลียนพ่ายแพ้ในการรบแห่งวอเตอร์ลู:1815", "รถจักรไอน้ำคันแรก:1825", "บริเตนใหญ่เข้าปกครองอินเดีย:1858", "เอดิสันประดิษฐ์แสงไฟฟ้า:1879", "เบนซ์พัฒนารถยนต์ขับเคลื่อนด้วยน้ำมันคันแรก:1885", "ไอน์สไตน์ประกาศทฤษฎีสัมพัทธภาพ:1905", "ไททานิคเรือที่ใหญ่ที่สุดในโลกจมในแอตแลนติกเหนือ:1912", "สงครามโลกครั้งที่หนึ่งเริ่มต้น:1914", "การปฏิวัติรัสเซีย:1917", "ฮิตเลอร์ขึ้นสู่อำนาจในเยอรมนี:1933", "สงครามโลกครั้งที่สองเริ่มต้น:1939", "สิ้นสุดสงครามโลกครั้งที่สอง:1945", "คอมมิวนิสต์จีนก่อตั้งขึ้น:1949", "รัสเซียส่งดาวเทียมดวงแรกขึ้นสู่อวกาศ Sputnik 1:1957", "ยูริกาการินกลายเป็นผู้ชายคนแรกที่บินในอวกาศ:1961", "นีลอาร์มสตรองกลายเป็นชายคนแรกที่เหยียบดวงจันทร์:1969", "ภัยพิบัติเชอร์โนบิล:1986", "การล่มสลายของลัทธิคอมมิวนิสต์ในยุโรปตะวันออก:1989", "การรวมประเทศเยอรมนี:1990", "สหภาพโซเวียตแตก:1991", "จุดจบของการแบ่งแยกสีผิวในแอฟริกาใต้:1994", "Google ก่อตั้งขึ้น:1998", "11 กันยายนการโจมตีของผู้ก่อการร้าย:2001", "แนะนำ iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["จักรวรรดิโมกุล:1526,1758", "ราชวงศ์ชิง:1644,1912", "จักรวรรดิรัสเซีย:1721,1917", "จักรวรรดิออสเตรีย - ฮังการี:1867,1918", "จักรวรรดิเยอรมัน:1871,1918", "จักรวรรดิออตโตมัน:1299,1922", "จักรวรรดิญี่ปุ่น:1868,1947", "จักรวรรดิสเปน:1402,1975", "จักรวรรดิฝรั่งเศส:1534,1980", "สหภาพโซเวียต:1922,1991", "จักรวรรดิอังกฤษ:1603,1997", "จักรวรรดิโปรตุเกส:1415,1999", "สหรัฐอเมริกา:1776,x", "จีน:1949,x", "สหภาพยุโรป:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["การต่อสู้ของวอเตอร์ลู:เบลเยียม:2,3,5:0", "การต่อสู้ของเก็ตตี้สเบิร์ก:สหรัฐ:5,6,7:0", "ล้อมสตาลินกราด:รัสเซีย:6,8,9:0", "การรุกรานนอร์มังดี:ฝรั่งเศส:5,6,8:0", "การต่อสู้ของโอกินาว่า:ประเทศญี่ปุ่น:1,8,9:0", "การรบแห่งเวียนนา:ออสเตรีย:6,0,3:0", "การล่มสลายของกำแพงเบอร์ลิน:ประเทศเยอรมัน:0,5,3:0", "สนธิสัญญาแวร์ซาย:ฝรั่งเศส:1,0,5:0", "การลอบสังหารท่านดยุคฟรานซ์ เฟอร์ดินานด์:บอสเนียและเฮอร์เซโก:1,5,6:0", "ภัยพิบัติเชอร์โนบิล:ยูเครน:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["ประเทศใดเป็นประเทศแรกที่ไปถึงขั้วโลกใต้::นอร์เวย์##ประเทศอังกฤษ##เดนมาร์ก##รัสเซีย::0", "ประเทศในยุโรปใดมีอาณาจักรที่ใหญ่ที่สุดในประวัติศาสตร์::รัสเซีย##ประเทศอังกฤษ##อิตาลี##สเปน::1", "ประเทศใดในแอฟริกาเหล่านี้ถูกควบคุมโดยเยอรมนี::ประเทศเบนิน##แองโกลา##จิบูตี##ประเทศแทนซาเนีย::3", "ใครคือซาร์คนแรกของรัสเซีย?::พระเจ้าซาร์นิโคลัสที่ 1##พระเจ้าซาร์อเล็กซานเดอร์ที่ 2##ซาร์อีวานผู้น่ากลัว##พระเจ้าซาร์ปอลที่ 1::2", "อะไรคือการต่อสู้ที่ยุติสงครามนโปเลียน?::การต่อสู้ของเวียนนา##การต่อสู้ของ Valmy##การต่อสู้ของ Verdun##การต่อสู้ของวอเตอร์ลู::3", "ประเทศใดต่อไปนี้เป็นส่วนหนึ่งของสหภาพโซเวียต::สโลวะเกีย##ประเทศมองโกเลีย##อัฟกานิสถาน##อาเซอร์ไบจาน::3", "ประเทศใดเหล่านี้ไม่เคยถูกควบคุมโดยสหราชอาณาจักร::ปากีสถาน##อัฟกานิสถาน##ประเทศไนจีเรีย##จอร์แดน::1", "ประเทศใดในยุโรปที่ถูกตำหนิสำหรับสงครามโลกครั้งที่ 1?::รัสเซีย##ประเทศอังกฤษ##ประเทศเยอรมัน::2", "ประเทศใดเป็นกลางในตอนต้นของสงครามโลกครั้งที่ 2?::ฝรั่งเศส##สหรัฐ##ประเทศเยอรมัน##โปแลนด์::1", "ผู้นำต่อต้านการแบ่งแยกสีผิวชาวแอฟริกันคนใดที่ได้รับการปล่อยตัวจากคุกในปี 1990 หลังจากผ่านไปกว่า 27 ปี::Idi Amin##เนลสัน แมนเดลา##เฟอร์ดินานด์ มาร์กอส##โจเซฟ แอตกินสัน::1", "ประธานาธิบดีสหรัฐคนใดได้รับเลือกให้ดำรงตำแหน่งสี่ครั้ง?::จอร์จวอชิงตัน##เจอรัลด์ฟอร์ด##แฟรงคลิน ดี รูสเวลต์##อับราฮัมลินคอล์น::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":นโปเลียน โบนาปาร์ต::", ":วิลเลี่ยมเชคสเปียร์::", ":อับราฮัมลินคอล์น::", ":จอร์จวอชิงตัน::", ":Charles Darwin::", ":ไอแซกนิวตัน::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["กำเนิดศาสดามูฮัมหมัดผู้ก่อตั้งศาสนาอิสลาม:570", "การพิมพ์ถูกประดิษฐ์ขึ้นในประเทศจีน:730", "แยกคริสตจักรคริสเตียน:1054", "มหากฎบัตรลงนามโดยกษัตริย์จอห์น:1215", "กาฬโรคแพร่กระจายไปยังยุโรป:1347", "ชาวเติร์กออตโตมันยึดคอนสแตนติโนเปิลได้:1453", "โคลัมบัสค้นพบอเมริกา:1492", "การสร้างทัชมาฮาลแล้วเสร็จ:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["จักรวรรดิซาซาเนียน:224,651", "ราชวงศ์ถัง:618,907", "อับบาซิดหัวหน้าศาสนาอิสลาม:750,1258", "อาณาจักรพุกาม:849,1297", "จักรวรรดิมองโกล:1206,1368", "อาณาจักรเขมร:802,1431", "จักรวรรดิโรมัน:-27,1453", "จักรวรรดิไบแซนไทน์:395,1453", "อาณาจักรอินคา:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["ล้อมเมืองออร์เลอองส์:ฝรั่งเศส:1,2,6:0", "การล่มสลายของกรุงคอนสแตนติโนเปิล:ประเทศตุรกี:0,2,7:0", "การต่อสู้ของเฮสติ้งส์:ประเทศอังกฤษ:0,1,5:0", "มาชูปิกชู:เปรู:4,5,6:1", "พุกาม:พม่า:3,5,7:1", "อังกอร์:กัมพูชา:3,4,6:1", "ทัชมาฮาล:อินเดีย:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["สงครามครูเสดครั้งแรกมีเป้าหมายในการยึดเมืองใด::เยรูซาเลม##ไคโร##เมกกะ##โรม::0", "Magna Carta ทำอะไรสำเร็จ?::มันจำกัดอำนาจของขุนนาง##มันจำกัดพลังของอัศวิน##มันเพิ่มพลังของชาวนาและข้ารับใช้##มันจำกัดอำนาจของพระมหากษัตริย์::3", "กาฬโรคแพร่กระจายได้อย่างไร?::น้ำไม่ดี##หมัดจากหนู##อากาศเสีย##เถ้าภูเขาไฟ::1", "เมืองนี้อยู่บนทางแยกระหว่างยุโรปและตะวันออกกลาง::ไคโร##คอนสแตนติโนเปิล##ปารีส##มอสโก::1", "อะไรคือสาเหตุของสงครามครูเสด?::เพื่อปลดปล่อยดินแดนศักดิ์สิทธิ์แห่งเยรูซาเลมจากชาวมุสลิม##กบฏชาวนา##กาฬโรคแพร่กระจายไปทั่วยุโรป##สงครามการค้าบนเส้นทางสายไหม::0", "ผู้เผยพระวจนะศักดิ์สิทธิ์ของศาสนามุสลิม?::พระเยซูคริสต์##พระพุทธเจ้า##มูฮัมหมัด::2", "โครงสร้างทางสังคมของยุคกลาง::ระบบวรรณะ##ศักดินา##Manorism::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":คริสโตเฟอร์โคลัมบัส::", ":ชาร์ลมาญ::", ":เลโอนาร์โด ดา วินชี::", ":เจงกี๊สข่าน::", ":กาลิเลโอ กาลิเลอี::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["ปิรามิดและสฟิงซ์ใหญ่ถูกสร้างขึ้น:-2500", "กำเนิดพระพุทธเจ้า:-486", "การก่อตั้งอาณาจักรโรมัน:-27", "จูเลียสซีซาร์แห่งโรมถูกลอบสังหาร:-44", "การแพร่กระจายของศาสนาคริสต์:1", "การแยกอาณาจักรโรมัน:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["จักรวรรดิอัคคาเดียน:-2300,-2200", "จักรวรรดิบาบิโลน:-1900,-1600", "จักรวรรดิอียิปต์:-1550,-1077", "อัสซีเรีย:-2025,-609", "ราชอาณาจักรยูดาห์:-1050,-586", "จักรวรรดิอะคีเมนิด:-550,-330", "จักรวรรดิโมรียัน:-322,-184", "คาร์เธจ:-814,-146", "จักรวรรดิซิลูซิด:-312,-63", "ราชวงศ์ฮั่น:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["ศึกมาราธอน:กรีซ::0", "การต่อสู้ของซามา:ตูนิเซีย::0", "การต่อสู้ของ Gaugamela:อิรัก::0", "ปิรามิดแห่งกิซ่า:อียิปต์::1", "เปตรา:จอร์แดน::1", "ปอมเปอี:อิตาลี::1", "ห้องสมุดอเล็กซานเดรีย:อียิปต์::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["เมืองหลวงแห่งแรกของอียิปต์โบราณคือเมืองใด::เมมฟิส##ธีบส์##อเล็กซานเดรีย##บัลติมอร์::0", "อารยธรรมกรีกโบราณเกิดขึ้นที่เกาะใด::ซามอส##เกาะครีต##โอลิมเปีย##โรดส์::1", "เจ็ดสิ่งมหัศจรรย์ของโลกโบราณยังคงมีอยู่กี่แห่ง?::3##2##1##0::2", "ใครบ้างที่เป็นผู้จัดทำแผนที่แรกของโลกที่รู้จัก?::อาร์คิมิดีส##อนาซิแมนเดอร์##ยูคลิด##คริสโตเฟอร์โคลัมบัส::1", "ในกรุงโรมโบราณ สิทธิของกงสุลในการปฏิเสธการตัดสินใจของกันและกันเรียกว่าอะไร?::ภาษี##วีโต้##ดูแล##ยืนยัน::1", "กำแพงเมืองจีนอายุประมาณเท่าไร::1,000 ปี##2,000 ปี##3000 ปี##5000 ปี::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":อเล็กซานเดอร์มหาราช::", ":จูเลียส ซีซาร์::", ":อริสโตเติล::", ":ขงจื๊อ::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["โฮโมอีเร็กตัส ออกจากแอฟริกา:-1800000", "มนุษย์เรียนรู้ที่จะควบคุมไฟ:-400000", "มนุษย์ยุคหินสูญพันธุ์:-40000", "การปฏิวัติยุคหินใหม่:-9000", "อารยธรรมแรกพัฒนาในสุเมเรีย:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:ประเทศตุรกี::1", "ถ้ำลาสโกซ์:ฝรั่งเศส::1", "สุเมเรียน:อิรัก::1", "สโตนเฮนจ์:ประเทศอังกฤษ::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["สัตว์อะไรจากยุคหินที่สูญพันธุ์ไปแล้ว?::เสือชีตาห์##แมมมอธ##ละมั่ง##ตัวกินมด::1", "ยุคไหนมาก่อนยุคหิน?::ยุคโคลน##ยุคไดโนเสาร์##ยุคน้ำแข็ง##บิ๊กแบง::2", "โฮมินิดคืออะไร?::เครื่องมือ##บรรพบุรุษของมนุษย์ยุคแรก##ของสะสมกระดูกโบราณ##เบ็ดตกปลา::1", "มนุษย์อพยพมาจากทวีปใดทั่วโลก?::แอฟริกา##เอเชีย##ออสเตรเลีย##ยุโรป::0", "ข้อใดต่อไปนี้กำหนด Homo erectus::คนคิด##ผู้ชายสมัยใหม่##คนฉลาด##คนซื่อตรง::3"]);
  }void addTR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.tr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart ilk senfonisini yazıyor:1764", "Amerika Birleşik Devletleri Bağımsızlık Bildirgesi:1776", "Napolyon, Waterloo Savaşı'nda yenildi:1815", "İlk Buharlı Lokomotif:1825", "İngiltere, Hindistan'ın yönetimini ele geçirdi:1858", "Edison elektrik ışığını icat etti:1879", "Benz, ilk benzinli arabayı geliştirdi:1885", "Einstein, görelilik teorisini açıkladı:1905", "Dünyanın en büyük gemisi Titanic, Kuzey Atlantik'te battı:1912", "Birinci Dünya Savaşı başlıyor:1914", "Rus Devrimi:1917", "Hitler Almanya'da iktidara geliyor:1933", "İkinci Dünya Savaşı başlıyor:1939", "İkinci Dünya Savaşının Sonu:1945", "Komünist Çin kuruldu:1949", "Rusya uzaya ilk uydu olan Sputnik 1'i gönderdi:1957", "Yuri Gagarin, uzayda uçan ilk insan oldu:1961", "Neil Armstrong, aya ayak basan ilk insan oldu:1969", "Çernobil felaketi:1986", "Doğu Avrupa'da Komünizmin Çöküşü:1989", "Almanya'nın Birleşmesi:1990", "Sovyetler Birliği dağıldı:1991", "Güney Afrika'da Apartheid'in Sonu:1994", "Google'ın kuruluş tarihi:1998", "11 Eylül Terör Saldırıları:2001", "İPhone'un Tanıtımı:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Babür İmparatorluğu:1526,1758", "Qing Hanedanı:1644,1912", "Rusya İmparatorluğu:1721,1917", "Avusturya-Macaristan İmparatorluğu:1867,1918", "Alman İmparatorluğu:1871,1918", "Osmanlı İmparatorluğu:1299,1922", "Japonya İmparatorluğu:1868,1947", "İspanyol İmparatorluğu:1402,1975", "Fransız imparatorluğu:1534,1980", "Sovyetler Birliği:1922,1991", "İngiliz İmparatorluğu:1603,1997", "Portekiz İmparatorluğu:1415,1999", "Amerika Birleşik Devletleri:1776,x", "Çin:1949,x", "Avrupa Birliği:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Waterloo Savaşı:Belçika:2,3,5:0", "Gettysburg Savaşı:Amerika Birleşik Devletleri:5,6,7:0", "Stalingrad Kuşatması:Rusya:6,8,9:0", "Normandiya&#39;nın işgali:Fransa:5,6,8:0", "Okinawa Savaşı:Japonya:1,8,9:0", "Viyana Savaşı:Avusturya:6,0,3:0", "Berlin Duvarı&#39;nın Yıkılışı:Almanya:0,5,3:0", "Versay antlaşması:Fransa:1,0,5:0", "Arşidük Franz Ferdinand suikastı:Bosna Hersek:1,5,6:0", "Çernobil felaketi:Ukrayna:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Güney kutbuna ilk ulaşan ülke hangisidir?::Norveç##Birleşik Krallık##Danimarka##Rusya::0", "Hangi Avrupa ülkesi tarihteki en büyük imparatorluğa sahipti?::Rusya##Birleşik Krallık##İtalya##ispanya::1", "Aşağıdaki Afrika ülkelerinden hangisi Almanya&#39;nın kontrolündeydi?::Benin##Angora##Cibuti##Tanzanya::3", "Rusya&#39;nın ilk Çarı kimdi?::Çar Nicholas I##Çar İskender II##Korkunç Çar İvan##Çar Paul I::2", "Napolyon Savaşlarını sona erdiren savaş hangisidir?::Viyana Savaşı##Valmy Savaşı##Verdun Savaşı##Waterloo Savaşı::3", "Bu ülkelerden hangisi SSCB&#39;nin bir parçasıydı?::Slovakya##Moğolistan##Afganistan##Azerbeycan::3", "Aşağıdaki ülkelerden hangisi Birleşik Krallık tarafından hiçbir zaman kontrol edilmemiştir?::Pakistan##Afganistan##Nijerya##Ürdün::1", "Birinci Dünya Savaşı&#39;ndan hangi Avrupa ülkesi sorumlu tutuldu?::Rusya##Birleşik Krallık##Almanya::2", "2. dünya savaşının başında hangi ülke tarafsızdı?::Fransa##Amerika Birleşik Devletleri##Almanya##Polonya::1", "Hangi Afrikalı apartheid karşıtı lider, 27 yıldan fazla bir süre sonra 1990&#39;da hapisten çıktı?::İdi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Hangi ABD başkanı dört kez göreve seçildi?::George Washington##Gerald Ford&#39;un##Franklin D. Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napolyon Bonapart::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["İslam'ın kurucusu Hz.Muhammed'in Doğuşu:570", "Çin'de baskı icat edildi:730", "Hıristiyan Kilisesi'nin Bölünmesi:1054", "Kral John tarafından imzalanan Magna Carta:1215", "Hıyarcıklı veba Avrupa'ya yayılıyor:1347", "Osmanlı Türkleri Konstantinopolis'i ele geçirdi:1453", "Columbus Amerika'yı keşfeder:1492", "Tac Mahal binası tamamlandı:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Sasani İmparatorluğu:224,651", "Tang Hanedanı:618,907", "Abbasi Halifeliği:750,1258", "Pagan Krallık:849,1297", "Moğol İmparatorluğu:1206,1368", "Khmer İmparatorluğu:802,1431", "Roma İmparatorluğu:-27,1453", "Bizans İmparatorluğu:395,1453", "İnka İmparatorluğu:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Orleans Kuşatması:Fransa:1,2,6:0", "Konstantinopolis&#39;in Düşüşü:Türkiye:0,2,7:0", "Hastings Savaşı:Birleşik Krallık:0,1,5:0", "maçu picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Kamboçya:3,4,6:1", "taç Mahal:Hindistan:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Birinci Haçlı Seferinin amacı hangi şehri ele geçirmekti?::Kudüs##Kahire##Mekke##Roma::0", "Magna Carta neyi başardı?::lordların gücünü sınırladı##şövalyelerin gücünü sınırladı##köylülerin ve serflerin gücünü artırdı##hükümdarın gücünü sınırladı::3", "Hıyarcıklı Veba nasıl yayıldı?::Kötü su##Farelerden gelen pireler##Kirli hava##volkan külü::1", "Bu şehir, Avrupa ile Orta Doğu arasında bir yol ayrımındaydı.::Kahire##İstanbul##Paris##Moskova::1", "Haçlı Seferlerinin nedeni neydi?::Kudüs&#39;ün kutsal topraklarını Müslümanlardan kurtarmak için##Köylülerin isyanı##Avrupa&#39;ya yayılan Kara Ölüm##İpek Yolu boyunca ticaret savaşları::0", "İslam dininin kutsal peygamberi?::İsa Mesih##Buda##Muhammed::2", "Ortaçağ&#39;ın sosyal yapısı::Kast sistemi##feodalizm##malikane::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Kristof Kolomb::", ":Şarlman::", ":Leonardo da Vinci::", ":Cengiz han::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Piramitler ve Büyük Sfenks inşa edildi:-2500", "Buddha'nın Doğuşu:-486", "Roma İmparatorluğu'nun Kuruluşu:-27", "Julius Caesar of Rome suikasta kurban gitti:-44", "Hıristiyanlığın Yayılması:1", "Roma İmparatorluğu'nun Bölünmesi:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Akad İmparatorluğu:-2300,-2200", "Babil İmparatorluğu:-1900,-1600", "Mısır İmparatorluğu:-1550,-1077", "Asur:-2025,-609", "Yahuda Krallığı:-1050,-586", "Ahameniş İmparatorluğu:-550,-330", "Maurya İmparatorluğu:-322,-184", "Kartaca İmparatorluğu:-814,-146", "Selevkos İmparatorluğu:-312,-63", "Han Hanedanı:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Maraton Savaşı:Yunanistan::0", "Zama Savaşı:Tunus::0", "Gaugamela Savaşı:Irak::0", "Giza piramitleri:Mısır::1", "Petra:Ürdün::1", "Pompei:İtalya::1", "İskenderiye Kütüphanesi:Mısır::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Eski Mısır&#39;ın ilk başkenti neresiydi?::Memphis##Teb##İskenderiye##Baltimore::0", "Antik Yunan uygarlığı hangi adada ortaya çıkmıştır?::Samos##Girit##olimpiya##Rodos::1", "Antik Dünyanın Yedi Harikasından kaç tanesi hala var?::3##2##1##0::2", "Bilinen dünyanın ilk haritasını yapan kişi kimdir?::Arşimet##Anaksimandros##Öklid##Kristof Kolomb::1", "Antik Roma&#39;da konsolosların birbirlerinin kararlarını reddetme hakkına ne denir?::Vergi##Veto##nezaret##onayla::1", "Çin Seddi yaklaşık olarak kaç yaşındadır?::1000 yıl##2000 yıl##3000 yıl##5000 yıl::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Büyük İskender::", ":julius Sezar::", ":Aristo::", ":Konfüçyüs::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus Afrika'dan ayrıldı:-1800000", "İnsanlar ateşi kontrol etmeyi öğrenir:-400000", "Neandertallerin nesli tükendi:-40000", "Neolitik Devrim:-9000", "Sümer'de ilk medeniyetler gelişir:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbeklitepe:Türkiye::1", "Lascaux mağarası:Fransa::1", "Sümer:Irak::1", "Stonehenge:Birleşik Krallık::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Taş devrinden hangi hayvanın soyu şimdi tükendi?::çita##mamut##antilop##karıncayiyen::1", "Taş devrinden önce hangi aşama geldi?::Çamur Çağı##dinozor yaşı##Buz Devri##Büyük patlama::2", "hominid nedir?::bir araç##insanların erken atası##antik kemikler topluluğu##bir olta::1", "İnsanlar dünyaya hangi kıtadan göç etmiştir?::Afrika##Asya##Avustralya##Avrupa::0", "Aşağıdakilerden hangisi Homo erectus&#39;u tanımlar?::düşünen Adam##modern adam##Bilge Adam##dürüst adam::3"]);
  }void addUK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.uk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Моцарт пише свою першу симфонію:1764", "Декларація незалежності США:1776", "Наполеон зазнав поразки в битві при Ватерлоо:1815", "Перший паровий локомотив:1825", "Великобританія взяла на себе управління Індією:1858", "Едісон винаходить електричне світло:1879", "Benz розробляє перший бензиновий автомобіль:1885", "Ейнштейн оголошує теорію відносності:1905", "Титанік, найбільший у світі корабель, тоне в Північній Атлантиці:1912", "Перша світова війна починається:1914", "Російська революція:1917", "Гітлер піднімається до влади в Німеччині:1933", "Друга світова війна починається:1939", "Кінець Другої світової війни:1945", "Комуністичний Китай заснований:1949", "Росія відправляє в космос перший супутник, Супутник 1:1957", "Юрій Гагарін стає першою людиною, яка здійснила політ у космосі:1961", "Ніл Армстронг стає першою людиною, яка ступила на Місяць:1969", "Чорнобильська катастрофа:1986", "Падіння комунізму у Східній Європі:1989", "Об’єднання Німеччини:1990", "Радянський Союз розпадається:1991", "Кінець апартеїду в Південній Африці:1994", "Google заснований:1998", "Терористичні атаки 11 вересня:2001", "Представлення iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Імперія Великих Моголів:1526,1758", "Династія Цін:1644,1912", "Російська імперія:1721,1917", "Австро-Угорська імперія:1867,1918", "Німецька імперія:1871,1918", "Османська імперія:1299,1922", "Японська імперія:1868,1947", "Іспанська імперія:1402,1975", "Французька імперія:1534,1980", "Радянський Союз:1922,1991", "Британська імперія:1603,1997", "Португальська імперія:1415,1999", "США:1776,x", "Китай:1949,x", "Європейський Союз:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Битва при Ватерлоо:Бельгія:2,3,5:0", "Битва під Геттісбергом:Сполучені Штати:5,6,7:0", "Облога Сталінграда:Росія:6,8,9:0", "Вторгнення в Нормандію:Франція:5,6,8:0", "Битва за Окінаву:Японія:1,8,9:0", "Битва під Віднем:Австрія:6,0,3:0", "Падіння Берлінської стіни:Німеччина:0,5,3:0", "Версальський договір:Франція:1,0,5:0", "Вбивство ерцгерцога Франца Фердинанда:Боснія і Герцеговина:1,5,6:0", "Чорнобильська катастрофа:Україна:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Яка країна першою досягла південного полюса?::Норвегія##Велика Британія##Данія##Росія::0", "Яка європейська країна мала найбільшу імперію в історії?::Росія##Велика Британія##Італія##Іспанія::1", "Яку з цих африканських країн контролювала Німеччина?::Бенін##Ангола##Джибуті##Танзанія::3", "Хто був першим царем Росії?::цар Микола І##цар Олександр II##Цар Іван Грозний##цар Павло І::2", "Яка битва завершила наполеонівські війни?::Битва під Віднем##Битва при Валмі##Битва під Верденом##Битва при Ватерлоо::3", "Яка з цих країн входила до складу СРСР?::Словаччина##Монголія##Афганістан##Азербайджан::3", "Яка з цих країн ніколи не була під контролем Сполученого Королівства?::Пакистан##Афганістан##Нігерія##Йорданія::1", "Яку європейську країну звинувачували у Першій світовій війні?::Росія##Велика Британія##Німеччина::2", "Яка країна була нейтральною на початку Другої світової війни?::Франція##Сполучені Штати##Німеччина##Польща::1", "Який африканський лідер проти апартеїду був звільнений з в’язниці в 1990 році через понад 27 років?::Іді Амін##Нельсон Мандела##Фердинанд Маркос##Джозеф Аткінсон::1", "Який президент США обирався на посаду чотири рази?::Джордж Вашингтон##Джеральд Форд##Франклін Д. Рузвельт##Абрахам Лінкольн::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Наполеон Бонапарт::", ":Вільям Шекспір::", ":Абрахам Лінкольн::", ":Джордж Вашингтон::", ":Чарльз Дарвін::", ":Ісаак Ньютон::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Народження пророка Мухаммеда, засновника ісламу:570", "Друк було винайдено в Китаї:730", "Розкол християнської церкви:1054", "Велика харта, підписана королем Іоанном:1215", "Бубонна чума поширюється в Європі:1347", "Турки-османи захопили Константинополь:1453", "Колумб відкриває Америку:1492", "Будівництво Тадж-Махалу завершено:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Сасанійська імперія:224,651", "Династія Тан:618,907", "Халіфат Аббасидів:750,1258", "Королівство Паган:849,1297", "Монгольська імперія:1206,1368", "Кхмерська імперія:802,1431", "Римська імперія:-27,1453", "Візантійська імперія:395,1453", "Імперія інків:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Облога Орлеана:Франція:1,2,6:0", "Падіння Константинополя:Туреччина:0,2,7:0", "Битва під Гастінгсом:Велика Британія:0,1,5:0", "Мачу Пікчу:Перу:4,5,6:1", "Баган:М'янма:3,5,7:1", "Ангкор:Камбоджа:3,4,6:1", "Тадж-Махал:Індія:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Перший хрестовий похід мав на меті захоплення якого міста?::Єрусалим##Каїр##Мекка##Рим::0", "Чого досягла Велика хартія вольностей?::воно обмежувало владу панів##воно обмежувало владу лицарів##це посилило владу селян і кріпаків##воно обмежувало владу монарха::3", "Як поширилася бубонна чума?::Погана вода##Блохи від щурів##Забруднене повітря##Вулканний попіл::1", "Це місто було на перехресті між Європою та Близьким Сходом::Каїр##Константинополь##Париж##Москва::1", "Що стало причиною хрестових походів?::Звільнити Єрусалимську Святу землю від мусульман##Повстання селян##Чорна смерть поширюється Європою##Торгові війни на Шовковому шляху::0", "Священний пророк мусульманської релігії?::Ісус Христос##Будда##Мухаммед::2", "Соціальна структура Середньовіччя::Кастова система##Феодалізм##Садибність::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Христофор Колумб::", ":Карл Великий::", ":Леонардо да Вінчі::", ":Чингісхан::", ":Галілео Галілей::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Було побудовано Піраміди та Великий Сфінкс:-2500", "Народження Будди:-486", "Заснування Римської імперії:-27", "На Юлія Цезаря з Риму було вбито:-44", "Поширення християнства:1", "Розкол Римської імперії:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Аккад:-2300,-2200", "Вавилонська імперія:-1900,-1600", "Єгипетська імперія:-1550,-1077", "Ассирія:-2025,-609", "Юдейське царство:-1050,-586", "Імперія Ахеменідів:-550,-330", "Імперія Маур'ян:-322,-184", "Карфагенська імперія:-814,-146", "Імперія Селевкідів:-312,-63", "Династія Хань:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Марафонська битва:Греція::0", "Битва при Замі:Туніс::0", "Битва при Гавгамелі:Ірак::0", "Піраміди Гізи:Єгипет::1", "Петра:Йорданія::1", "Помпеї:Італія::1", "Олександрійська бібліотека:Єгипет::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Яка була перша столиця Стародавнього Єгипту?::Мемфіс##Фіви##Олександрія##Балтимор::0", "На якому острові виникла давньогрецька цивілізація?::Самос##Крит##Олімпія##Родос::1", "Скільки із семи чудес стародавнього світу все ще існує?::3##2##1##0::2", "Кому приписують створення першої карти відомого світу?::Архімед##Анаксимандр##Евклід##Христофор Колумб::1", "Як у Стародавньому Римі називалося право консула відкидати рішення один одного?::податок##Вето##Наглядати##Підтвердити::1", "Скільки приблизно років Великій Китайській стіні?::1000 років##2000 років##3000 років##5000 років::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Олександр Великий::", ":Юлій Цезар::", ":Аристотель::", ":Конфуцій::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Листя хомо еректуса залишає Африку:-1800000", "Люди вчаться керувати вогнем:-400000", "Неандертальці вимерли:-40000", "Неолітична революція:-9000", "Перші цивілізації розвиваються в Шумері:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Гебеклі-Тепе:Туреччина::1", "Печера Ласко:Франція::1", "Шумер:Ірак::1", "Стоунхендж:Велика Британія::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Яка тварина кам’яного віку зараз вимерла?::гепард##мамонта##антилопа##мурахоїд::1", "Який етап був до кам’яного віку?::Вік грязі##Вік динозаврів##Льодовиковий період##Великий вибух::2", "Що таке гомінід?::інструмент##ранній предок людей##колекція стародавніх кісток##рибальський гачок::1", "З якого континенту люди мігрували по всьому світу?::Африка##Азії##Австралія##Європа::0", "Що з наведеного нижче визначає Homo erectus?::мисляча людина##сучасна людина##мудра людина##прямий чоловік::3"]);
  }void addVI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.vi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Mozart viết bản giao hưởng đầu tiên của mình:1764", "Tuyên ngôn độc lập của Hoa Kỳ:1776", "Napoléon bị đánh bại trong trận Waterloo:1815", "Đầu máy hơi nước đầu tiên:1825", "Anh Quốc nắm quyền thống trị Ấn Độ:1858", "Edison phát minh ra đèn điện:1879", "Benz phát triển chiếc ô tô chạy bằng xăng đầu tiên:1885", "Einstein công bố thuyết tương đối:1905", "Titanic, con tàu lớn nhất thế giới, chìm ở Bắc Đại Tây Dương:1912", "Chiến tranh thế giới thứ nhất bắt đầu:1914", "Cách mạng Nga:1917", "Hitler lên nắm quyền ở Đức:1933", "Chiến tranh thế giới thứ hai bắt đầu:1939", "Kết thúc Chiến tranh thế giới thứ hai:1945", "Trung Quốc Cộng sản được thành lập:1949", "Nga gửi vệ tinh đầu tiên vào vũ trụ, Sputnik 1:1957", "Yuri Gagarin trở thành người đầu tiên bay vào vũ trụ:1961", "Neil Armstrong trở thành người đầu tiên đặt chân lên mặt trăng:1969", "Thảm họa Chernobyl:1986", "Sự sụp đổ của chủ nghĩa cộng sản ở Đông Âu:1989", "Thống nhất nước Đức:1990", "Liên Xô tan rã:1991", "Kết thúc chế độ Apartheid ở Nam Phi:1994", "Google được thành lập:1998", "Các cuộc tấn công khủng bố ngày 11 tháng 9:2001", "Giới thiệu iPhone:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Đế quốc Mogul:1526,1758", "Nhà Thanh:1644,1912", "Đế quốc Nga:1721,1917", "Đế quốc Áo-Hung:1867,1918", "Đế quốc Đức:1871,1918", "Đế quốc Ottoman:1299,1922", "Đế quốc Nhật Bản:1868,1947", "Đế quốc Tây Ban Nha:1402,1975", "Đế quốc Pháp:1534,1980", "Liên Xô:1922,1991", "Đế quốc Anh:1603,1997", "Đế quốc Bồ Đào Nha:1415,1999", "Hoa Kỳ:1776,x", "Trung Quốc:1949,x", "Liên minh Châu Âu:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Trận Waterloo:nước Bỉ:2,3,5:0", "Trận Gettysburg:Hoa Kỳ:5,6,7:0", "Cuộc vây hãm Stalingrad:Nga:6,8,9:0", "Xâm lược Normandy:Pháp:5,6,8:0", "Trận chiến Okinawa:Nhật Bản:1,8,9:0", "Trận chiến Vienna:Áo:6,0,3:0", "Sự sụp đổ của bức tường Berlin:nước Đức:0,5,3:0", "Hiệp ước Versailles:Pháp:1,0,5:0", "Vụ ám sát Archduke Franz Ferdinand:Bosnia và Herzegovina:1,5,6:0", "Thảm họa Chernobyl:Ukraine:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Nước nào đầu tiên đến cực nam?::Na Uy##Vương quốc Anh##Đan mạch##Nga::0", "Quốc gia Châu Âu nào có đế chế lớn nhất trong lịch sử?::Nga##Vương quốc Anh##Nước Ý##Tây Ban Nha::1", "Đức nào trong số các quốc gia châu Phi này do Đức kiểm soát?::Bénin##Ăng-gô##Djibouti##Tanzania::3", "Sa hoàng đầu tiên của Nga là ai?::Sa hoàng Nicholas I##Sa hoàng Alexander II##Sa hoàng Ivan Bạo chúa##Sa hoàng Paul I::2", "Trận chiến kết thúc Chiến tranh Napoléon là gì?::Trận chiến Vienna##Trận chiến của Valmy##Trận Verdun##Trận Waterloo::3", "Quốc gia nào sau đây là một phần của Liên Xô?::Slovakia##Mông Cổ##Afghanistan##Ailen::3", "Quốc gia nào trong số những quốc gia này chưa từng bị Vương quốc Anh kiểm soát?::Pakistan##Afghanistan##Nigeria##Jordan::1", "Quốc gia châu Âu nào bị đổ lỗi cho Thế chiến 1?::Nga##Vương quốc Anh##nước Đức::2", "Nước nào trung lập vào đầu Thế chiến 2?::Pháp##Hoa Kỳ##nước Đức##Ba Lan::1", "Nhà lãnh đạo chống chủ nghĩa phân biệt chủng tộc Châu Phi nào đã được ra tù vào năm 1990, sau hơn 27 năm?::Idi Amin##Nelson Mandela##Ferdinand Marcos##Joseph Atkinson::1", "Tổng thống Mỹ nào đã được bầu vào chức vụ bốn lần?::George Washington##Gerald Ford##Franklin D Roosevelt##Abraham Lincoln::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":Napoléon Bonaparte::", ":William Shakespeare::", ":Abraham Lincoln::", ":George Washington::", ":Charles Darwin::", ":Isaac Newton::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["Ngày sinh của nhà tiên tri Muhammad, người sáng lập đạo Hồi:570", "In ấn được phát minh ở Trung Quốc:730", "Sự chia cắt của Nhà thờ Thiên chúa giáo:1054", "Magna Carta do Vua John ký:1215", "Bệnh dịch hạch lây lan sang châu Âu:1347", "Người Thổ Ottoman chiếm Constantinople:1453", "Columbus khám phá ra Châu Mỹ:1492", "Tòa nhà Taj Mahal hoàn thành:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["Đế quốc Sasan:224,651", "Nhà Đường:618,907", "Nhà Abbas:750,1258", "Triều Pagan:849,1297", "Đế quốc Mông Cổ:1206,1368", "Đế quốc Khmer:802,1431", "Đế quốc La Mã:-27,1453", "Đế quốc Byzantine:395,1453", "Đế quốc Inca:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["Cuộc vây hãm Orleans:Pháp:1,2,6:0", "Sự sụp đổ của Constantinople:Thổ Nhĩ Kỳ:0,2,7:0", "Trận chiến Hastings:Vương quốc Anh:0,1,5:0", "Machu picchu:Peru:4,5,6:1", "Bagan:Myanmar:3,5,7:1", "Angkor:Campuchia:3,4,6:1", "Taj Mahal:Ấn Độ:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["Cuộc Thập tự chinh thứ nhất có mục tiêu đánh chiếm thành phố nào?::Jerusalem##Cairo##Thánh địa##la Mã::0", "Magna Carta đã làm được gì?::nó hạn chế quyền lực của các lãnh chúa##nó hạn chế sức mạnh của các hiệp sĩ##nó làm tăng sức mạnh của nông dân và nông nô##nó hạn chế quyền lực của quân vương::3", "Làm thế nào mà bệnh dịch hạch lây lan?::Nước xấu##Bọ chét từ chuột##Ô nhiễm không khí##Tro núi lửa::1", "Thành phố này nằm trên ngã tư giữa Châu Âu và Trung Đông::Cairo##Constantinople##Paris##Matxcova::1", "Nguyên nhân của các cuộc Thập tự chinh là gì?::Giải phóng Thánh địa Jerusalem khỏi người Hồi giáo##Một cuộc nổi dậy của nông dân##Cái chết đen lan rộng khắp châu Âu##Các cuộc chiến tranh thương mại dọc theo Con đường Tơ lụa::0", "Thánh tiên tri của đạo Hồi?::Chúa giêsu##Đức phật##Muhammad::2", "Cơ cấu xã hội thời Trung cổ::Hệ thống đẳng cấp##Chế độ phong kiến##Manorism::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":Christopher Columbus::", ":Charlemagne::", ":Leonardo da Vinci::", ":Thành Cát Tư Hãn::", ":Galileo Galilei::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["Kim tự tháp và tượng Nhân sư lớn được xây dựng:-2500", "Ngày sinh của Đức Phật:-486", "Thành lập Đế chế La Mã:-27", "Julius Caesar của Rome bị ám sát:-44", "Truyền bá đạo Cơ đốc:1", "Sự chia cắt của Đế chế La Mã:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["Đế quốc Akkad:-2300,-2200", "Đế quốc Babylon:-1900,-1600", "Đế quốc Ai Cập:-1550,-1077", "Assyria:-2025,-609", "Vương quốc Judah:-1050,-586", "Đế quốc Achaemenes:-550,-330", "Đế quốc Maurya:-322,-184", "Carthage cổ đại:-814,-146", "Vương quốc Seleukos:-312,-63", "Thời Hán:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["Trận marathon:Hy Lạp::0", "Trận Zama:Tunisia::0", "Trận chiến Gaugamela:Irac::0", "Kim tự tháp Giza:Ai Cập::1", "Petra:Jordan::1", "Pompeii:Nước Ý::1", "Thư viện Alexandria:Ai Cập::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["Thủ đô đầu tiên của Ai Cập cổ đại là gì?::Memphis##Thebes##Alexandria##Baltimore::0", "Nền văn minh Hy Lạp cổ đại bắt nguồn trên hòn đảo nào?::Samos##Crete##Olympia##Rhodes::1", "Có bao nhiêu trong số bảy kỳ quan của thế giới cổ đại vẫn còn tồn tại?::3##2##1##0::2", "Ai là người có công tạo ra bản đồ đầu tiên của thế giới được biết đến?::Archimedes##Anaximander##Euclid##Christopher Columbus::1", "Ở La Mã cổ đại, quyền từ chối quyết định của nhau của các lãnh sự được gọi là gì?::Thuế##Phủ quyết##Giám sát##Xác nhận::1", "Vạn Lý Trường Thành của Trung Quốc khoảng bao nhiêu tuổi?::1000 năm##2000 năm##3000 năm##5000 năm::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":Alexander vĩ đại::", ":Julius Caesar::", ":Aristotle::", ":nho giáo::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["Homo erectus rời châu Phi:-1800000", "Con người học cách kiểm soát lửa:-400000", "Người Neanderthal tuyệt chủng:-40000", "Cách mạng đồ đá mới:-9000", "Các nền văn minh đầu tiên phát triển ở Sumeria:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["Göbekli Tepe:Thổ Nhĩ Kỳ::1", "Hang động Lascaux:Pháp::1", "Sumer:Irac::1", "Stonehenge:Vương quốc Anh::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["Con vật nào từ thời kỳ đồ đá đã tuyệt chủng bây giờ?::con báo##voi ma mút##con linh dương##Thú ăn kiến::1", "Giai đoạn nào đến trước thời kỳ đồ đá?::Tuổi bùn##Thời đại khủng long##Kỷ băng hà##Các vụ nổ lớn::2", "Hominid là gì?::một công cụ##tổ tiên ban đầu của con người##một bộ sưu tập xương cổ đại##một lưỡi câu::1", "Con người di cư trên khắp thế giới từ lục địa nào?::Châu phi##Châu Á##Châu Úc##Châu Âu::0", "Điều nào sau đây xác định Homo erectus?::người đàn ông suy nghĩ##người đàn ông hiện đại##người đàn ông thông minh##người thẳng đứng::3"]);
  }void addZH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HistoryGameQuestionConfig questionConfig) {
    var language = Language.zh;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["莫扎特写他的第一交响曲:1764", "美国独立宣言:1776", "拿破仑在滑铁卢战役中被击败:1815", "第一次蒸汽机车:1825", "英国接管印度的统治:1858", "爱迪生发明电灯:1879", "奔驰研发出第一款汽油驱动汽车:1885", "爱因斯坦宣布相对论:1905", "泰坦尼克号是世界上最大的船只, 沉没在北大西洋:1912", "第一次世界大战开始:1914", "俄国革命:1917", "希特勒在德国上台:1933", "第二次世界大战开始:1939", "第二次世界大战结束:1945", "中国共产党成立:1949", "俄罗斯将第一颗人造卫星Sputnik 1送入太空:1957", "尤里·加加林（Yuri Gagarin）成为第一个在太空飞行的人:1961", "尼尔·阿姆斯特朗（Neil Armstrong）成为第一个踏上月球的人:1969", "切尔诺贝利灾难:1986", "东欧共产主义的衰落:1989", "德国统一:1990", "苏联解体:1991", "南非种族隔离结束:1994", "Google成立:1998", "9月11日恐怖袭击:2001", "iPhone简介:2007"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["莫卧儿帝国:1526,1758", "清朝:1644,1912", "俄罗斯帝国:1721,1917", "奥匈帝国:1867,1918", "德意志帝国:1871,1918", "鄂圖曼帝國:1299,1922", "大日本帝國:1868,1947", "西班牙帝国:1402,1975", "法国帝国:1534,1980", "苏联:1922,1991", "大英帝国:1603,1997", "葡萄牙帝國:1415,1999", "美国:1776,x", "中国:1949,x", "歐洲聯盟:1993,x"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["滑铁卢战役:比利时:2,3,5:0", "葛底斯堡战役:美国:5,6,7:0", "斯大林格勒围城战:俄国:6,8,9:0", "诺曼底登陆:法国:5,6,8:0", "冲绳之战:日本:1,8,9:0", "维也纳之战:奥地利:6,0,3:0", "柏林墙倒塌:德国:0,5,3:0", "凡尔赛和约:法国:1,0,5:0", "暗杀弗朗茨·斐迪南大公:波斯尼亚和黑塞哥维那:1,5,6:0", "切尔诺贝利灾难:乌克兰:1,2,8:0"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["哪个国家是第一个到达南极的国家？::挪威##英国##丹麦##俄国::0", "欧洲哪个国家拥有历史上最大的帝国？::俄国##英国##意大利##西班牙::1", "这些非洲国家中哪一个被德国控制？::贝宁##安哥拉##吉布地##坦桑尼亚::3", "谁是俄罗斯的第一位沙皇？::沙皇尼古拉一世##沙皇亚历山大二世##沙皇伊凡雷帝##沙皇保罗一世::2", "结束拿破仑战争的战役是什么？::维也纳之战##瓦尔米之战##凡尔登战役##滑铁卢战役::3", "这些国家中哪些是苏联的一部分？::斯洛伐克##蒙古##阿富汗##阿塞拜疆::3", "以下哪个国家从未受英国控制？::巴基斯坦##阿富汗##奈及利亚##约旦::1", "第一次世界大战的罪魁祸首是哪个欧洲国家？::俄国##英国##德国::2", "第二次世界大战开始时哪个国家是中立的？::法国##美国##德国##波兰::1", "哪个非洲反种族隔离领导人在 1990 年被释放超过 27 年？::伊迪·阿明##纳尔逊·曼德拉##费迪南德·马科斯##约瑟夫·阿特金森::1", "Which US president was elected to office four times?::乔治华盛顿##杰拉尔德福特##富兰克林·D·罗斯福##亚伯拉罕·林肯::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        [":拿破仑·波拿巴::", ":威廉·莎士比亚::", ":亚伯拉罕·林肯::", ":乔治华盛顿::", ":查尔斯·达尔文::", ":艾萨克·牛顿::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff1, //
        ["先知穆罕默德的诞生, 伊斯兰教的创始人:570", "印刷是在中国发明的:730", "基督教会的分裂:1054", "约翰国王签署的《大宪章》:1215", "鼠疫传播到欧洲:1347", "奥斯曼帝国土耳其人占领君士坦丁堡:1453", "哥伦布发现美国:1492", "泰姬陵建筑竣工:1643"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff1, //
        ["萨珊王朝:224,651", "唐朝:618,907", "阿拔斯王朝:750,1258", "蒲甘王國:849,1297", "蒙古帝国:1206,1368", "高棉帝国:802,1431", "罗马帝国:-27,1453", "拜占庭帝国:395,1453", "印加帝國:1438,1533"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff1, //
        ["奥尔良之围:法国:1,2,6:0", "君士坦丁堡陷落:土耳其:0,2,7:0", "黑斯廷斯之战:英国:0,1,5:0", "马丘比丘:秘鲁:4,5,6:1", "蒲甘:缅甸:3,5,7:1", "吴哥:柬埔寨:3,4,6:1", "泰姬陵:印度:4,5,7:1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff1, //
        ["第一次十字军东征的预定目标是占领哪个城市？::耶路撒冷##开罗##麦加##罗马::0", "大宪章实现了什么？::它限制了领主的权力##它限制了骑士的力量##它增加了农民和农奴的权力##它限制了君主的权力::3", "黑死病是如何传播的？::坏水##老鼠身上的跳蚤##被污染的空气##火山灰::1", "这座城市位于欧洲和中东之间的十字路口::开罗##君士坦丁堡##巴黎##莫斯科::1", "十字军东征的起因是什么？::从穆斯林手中解放耶路撒冷圣地##农民起义##黑死病在欧洲蔓延##丝绸之路上的贸易战::0", "穆斯林宗教的神圣先知？::耶稣基督##佛##穆罕默德::2", "中世纪的社会结构::种姓制度##封建##庄园主义::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff1, //
        [":克里斯托弗·哥伦布::", ":查理曼大帝::", ":列奥纳多·达·芬奇::", ":成吉思汗::", ":伽利略·伽利雷::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff2, //
        ["金字塔和狮身人面像的建成时间:-2500", "佛诞:-486", "罗马帝国的建立:-27", "罗马的凯撒大帝被暗杀:-44", "基督教传播:1", "罗马帝国分裂:395"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff2, //
        ["阿卡德帝国:-2300,-2200", "巴比伦帝国:-1900,-1600", "埃及帝国:-1550,-1077", "亚述:-2025,-609", "犹大王国:-1050,-586", "阿契美尼德王朝:-550,-330", "孔雀王朝:-322,-184", "迦太基帝国:-814,-146", "塞琉古帝国:-312,-63", "汉朝:-202,220"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff2, //
        ["马拉松之战:希腊::0", "扎马之战:突尼斯::0", "高加米拉之战:伊拉克::0", "吉萨金字塔:埃及::1", "佩特拉:约旦::1", "庞贝:意大利::1", "亚历山大图书馆:埃及::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff2, //
        ["古埃及的第一个首都是哪里？::孟菲斯##底比斯##亚历山大##巴尔的摩::0", "古希腊文明起源于哪个岛屿？::萨摩斯##克里特岛##奥林匹亚##罗德::1", "古代世界七大奇迹还有多少？::3##2##1##0::2", "谁被认为制作了已知世界的第一张地图？::阿基米德##阿那克西曼德##欧几里得##克里斯托弗·哥伦布::1", "在古罗马，领事拒绝彼此决定的权利被称为什么？::税##否决##监督##确认::1", "中国的长城大约有多少年的历史？::1000年##2000年##3000年##5000年::2"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff2, //
        [":亚历山大大帝::", ":凯撒大帝::", ":亚里士多德::", ":孔子::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff3, //
        ["直立人离开非洲:-1800000", "人类学会控制火力:-400000", "尼安德特人灭绝:-40000", "新石器时代革命:-9000", "萨穆里亚发展出第一个文明:-3500"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff3, //
        ["哥贝克力石阵:土耳其::1", "拉斯科洞穴:法国::1", "苏美尔:伊拉克::1", "巨石阵:英国::1"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff3, //
        ["石器时代的什么动物现在已经灭绝了？::猎豹##长毛象##羚羊##食蚁兽::1", "石器时代之前是什么阶段？::泥浆时代##恐龙时代##冰河世纪##大爆炸::2", "什么是人科？::一个工具##人类的早期祖先##古代骨头的集合##一个鱼钩::1", "人类从哪个大陆迁徙到世界各地？::非洲##亚洲##澳大利亚##欧洲::0", "以下哪个定义了直立人？::有思想的人##现代人##聪明人##正直的人::3"]);
  }
}
