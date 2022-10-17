import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class GeoQuizAllQuestions extends AllQuestionsService {
  List<String>? _allCountriesCache;
  List<String>? _allCapitalsCache;
  List<CountryRanges>? _allCountryRanges;

  static final GeoQuizAllQuestions singleton = GeoQuizAllQuestions.internal();

  factory GeoQuizAllQuestions() {
    return singleton;
  }

  @override
  void clearCache() {
    _allCountriesCache = null;
    _allCapitalsCache = null;
    super.clearCache();
  }

  List<String> get allCapitals {
    _allCapitalsCache ??=
        _getAllCapitals.get<Language, List<String>>(getLanguage()) ??
            _getAllCapitals.get<Language, List<String>>(Language.en);
    return _allCapitalsCache!;
  }

  List<String> get allCountries {
    _allCountriesCache ??=
        _getAllCountries.get<Language, List<String>>(getLanguage()) ??
            _getAllCountries.get<Language, List<String>>(Language.en);
    return _allCountriesCache!;
  }

  GeoQuizAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    //
    ////
    ///////
    var questionConfig = GeoQuizGameQuestionConfig();
    ///////
    ////
    //
    addAR(result, questionConfig);
    addBG(result, questionConfig);
    addCS(result, questionConfig);
    addDA(result, questionConfig);
    addDE(result, questionConfig);
    addEL(result, questionConfig);
    addEN(result, questionConfig);
    addES(result, questionConfig);
    addFI(result, questionConfig);
    addFR(result, questionConfig);
    addHE(result, questionConfig);
    addHI(result, questionConfig);
    addHR(result, questionConfig);
    addHU(result, questionConfig);
    addID(result, questionConfig);
    addIT(result, questionConfig);
    addJA(result, questionConfig);
    addKO(result, questionConfig);
    addMS(result, questionConfig);
    addNL(result, questionConfig);
    addNB(result, questionConfig);
    addPL(result, questionConfig);
    addPT(result, questionConfig);
    addRO(result, questionConfig);
    addRU(result, questionConfig);
    addSK(result, questionConfig);
    addSL(result, questionConfig);
    addSR(result, questionConfig);
    addSV(result, questionConfig);
    addTH(result, questionConfig);
    addTR(result, questionConfig);
    addUK(result, questionConfig);
    addVI(result, questionConfig);
    addZH(result, questionConfig);
    return result;
  }

  List<CountryRanges> get allCountryRanges {
    _allCountryRanges ??= [
      CountryRanges(0, 16, 0, 28),
      CountryRanges(17, 21, 0, 28),
      CountryRanges(22, 28, 0, 28),
      CountryRanges(29, 31, 29, 44),
      CountryRanges(32, 44, 29, 44),
      CountryRanges(45, 55, 45, 68),
      CountryRanges(56, 62, 45, 68),
      CountryRanges(63, 68, 45, 68),
      CountryRanges(69, 75, 69, 90),
      CountryRanges(76, 85, 69, 90),
      CountryRanges(86, 90, 69, 90),
      CountryRanges(91, 105, 91, 105),
      CountryRanges(106, 110, 106, 159),
      CountryRanges(111, 147, 106, 159),
      CountryRanges(148, 154, 106, 159),
      CountryRanges(155, 159, 106, 159),
      CountryRanges(160, 162, 160, 174),
      CountryRanges(163, 174, 160, 174),
      CountryRanges(175, 182, 175, 194),
      CountryRanges(183, 194, 175, 194) ];
    return _allCountryRanges!;
  }
  Map<Language, List<String>> get _getAllCountries {
    Map<Language, List<String>> result = HashMap<Language, List<String>>();
    result.putIfAbsent(Language.ar, () => _allCountriesAR);
    result.putIfAbsent(Language.bg, () => _allCountriesBG);
    result.putIfAbsent(Language.cs, () => _allCountriesCS);
    result.putIfAbsent(Language.da, () => _allCountriesDA);
    result.putIfAbsent(Language.de, () => _allCountriesDE);
    result.putIfAbsent(Language.el, () => _allCountriesEL);
    result.putIfAbsent(Language.en, () => _allCountriesEN);
    result.putIfAbsent(Language.es, () => _allCountriesES);
    result.putIfAbsent(Language.fi, () => _allCountriesFI);
    result.putIfAbsent(Language.fr, () => _allCountriesFR);
    result.putIfAbsent(Language.he, () => _allCountriesHE);
    result.putIfAbsent(Language.hi, () => _allCountriesHI);
    result.putIfAbsent(Language.hr, () => _allCountriesHR);
    result.putIfAbsent(Language.hu, () => _allCountriesHU);
    result.putIfAbsent(Language.id, () => _allCountriesID);
    result.putIfAbsent(Language.it, () => _allCountriesIT);
    result.putIfAbsent(Language.ja, () => _allCountriesJA);
    result.putIfAbsent(Language.ko, () => _allCountriesKO);
    result.putIfAbsent(Language.ms, () => _allCountriesMS);
    result.putIfAbsent(Language.nl, () => _allCountriesNL);
    result.putIfAbsent(Language.nb, () => _allCountriesNB);
    result.putIfAbsent(Language.pl, () => _allCountriesPL);
    result.putIfAbsent(Language.pt, () => _allCountriesPT);
    result.putIfAbsent(Language.ro, () => _allCountriesRO);
    result.putIfAbsent(Language.ru, () => _allCountriesRU);
    result.putIfAbsent(Language.sk, () => _allCountriesSK);
    result.putIfAbsent(Language.sl, () => _allCountriesSL);
    result.putIfAbsent(Language.sr, () => _allCountriesSR);
    result.putIfAbsent(Language.sv, () => _allCountriesSV);
    result.putIfAbsent(Language.th, () => _allCountriesTH);
    result.putIfAbsent(Language.tr, () => _allCountriesTR);
    result.putIfAbsent(Language.uk, () => _allCountriesUK);
    result.putIfAbsent(Language.vi, () => _allCountriesVI);
    result.putIfAbsent(Language.zh, () => _allCountriesZH);
    return result;
  }
  List<String> get _allCountriesAR =>
      ["ألمانيا","فرنسا","المملكة المتحدة","إسبانيا","إيطاليا","بلجيكا","النمسا","البرتغال","سويسرا","هولندا","أيرلندا","موناكو","لوكسمبورغ","ليختنشتاين","أندورا","سان مارينو","الفاتيكان","السويد","الدنمارك","فنلندا","النرويج","أيسلندا","بولندا","اليونان","كرواتيا","هنغاريا","سلوفينيا","سلوفاكيا","جمهورية التشيك","إستونيا","لاتفيا","ليتوانيا","أوكرانيا","روسيا","رومانيا","بلغاريا","صربيا","البوسنة والهرسك","ألبانيا","الجبل الأسود","روسيا البيضاء","مولدوفا","مقدونيا الشمالية","قبرص","مالطا","إيران","تركيا","العراق","إسرائيل","جورجيا","أرمينيا","أذربيجان","سوريا","الأردن","لبنان","فلسطين","السعودية","الإمارات العربية المتحدة","دولة قطر","اليمن","عمان","الكويت","البحرين","كازاخستان","أفغانستان","أوزبكستان","طاجيكستان","قيرغيزستان","تركمانستان","الهند","باكستان","نيبال","سيريلانكا","بنغلاديش","بوتان","مالديفز","تايلاند","إندونيسيا","فيتنام","ماليزيا","فيلبيني","سنغافورة","ميانمار","لاوس","كمبوديا","بروناي","الصين","اليابان","كوريا الجنوبية","كوريا الشمالية","منغوليا","أستراليا","نيوزيلندا","بابوا غينيا الجديدة","تيمور الشرقية","فيجي","جزر سليمان","فانواتو","ساموا","كيريباتي","ميكرونيزيا","تونغا","جزر مارشال","بالاو","ناورو","توفالو","مصر","الجزائر","المغرب","تونس","ليبيا","نيجيريا","غانا","السنغال","مالي","الكاميرون","أوغندا","ساحل العاج","أنغولا","تنزانيا","النيجر","جمهورية افريقيا الوسطى","جمهورية الكونغو الديمقراطية","بوركينا فاسو","مدغشقر","تشاد","موزمبيق","زامبيا","بنين","غينيا","توگو","رواندا","ملاوي","بوروندي","ليبيريا","زيمبابوي","سيرا ليون","غامبيا","موريتانيا","الجابون","الكونغو","غينيا بيساو","غينيا الإستوائية","موريشيوس","سيشيل","جزر القمر","الرأس الأخضر","ساو تومي وبرينسيبي","الصومال","كينيا","أثيوبيا","السودان","جنوب السودان","إريتريا","جيبوتي","جنوب أفريقيا","ناميبيا","بوتسوانا","ليسوتو","إيسواتيني","الولايات المتحدة الأمريكية","كندا","المكسيك","كوبا","غواتيمالا","كوستا ريكا","بليز","جزر البهاما","جامايكا","هايتي","جمهورية الدومنيكان","بنما","السلفادور","نيكاراغوا","هندوراس","سانت لوسيا","غرينادا","دومينيكا","ترينداد وتوباغو","بربادوس","سانت فنسنت والجرينادينز","أنتيغوا وباربودا","سانت كيتس ونيفيس","البرازيل","الأرجنتين","كولومبيا","تشيلي","بيرو","فنزويلا","الاكوادور","أوروغواي","بوليفيا","باراغواي","غيانا","سورينام"];


  List<String> get _allCountriesBG =>
      ["Германия","Франция","Великобритания","Испания","Италия","Белгия","Австрия","Португалия","Швейцария","Нидерланды","Ирландия","Монако","Люксембург","Лихтенщайн","Андора","Сан Марино","Ватикана","Швеция","Дания","Финландия","Норвегия","Исландия","Полша","Гърция","Хърватия","Унгария","Словения","Словакия","Чехия","Естония","Латвия","Литва","Украйна","Русия","Румъния","България","Сърбия","Босна и Херцеговина","Албания","Черна гора","Беларус","Молдова","Северна Македония","Кипър","Малта","Иран","Турция","Ирак","Израел","Грузия","Армения","Азербайджан","Сирия","Йордания","Ливан","Палестина","Саудитска Арабия","Обединени арабски емирства","Катар","Йемен","Оман","Кувейт","Бахрейн","Казахстан","Афганистан","Узбекистан","Таджикистан","Киргизстан","Туркменистан","Индия","Пакистан","Непал","Шри Ланка","Бангладеш","Бутан","Малдивите","Тайланд","Индонезия","Виетнам","Малайзия","Филипините","Сингапур","Мианмар","Лаос","Камбоджа","Бруней","Китай","Япония","Южна Кореа","Северна Корея","Монголия","Австралия","Нова Зеландия","Папуа-Нова Гвинея","Източен Тимор","Фиджи","Соломонови острови","Вануату","Самоа","Кирибати","Микронезия","Тонга","Маршалови острови","Палау","Науру","Тувалу","Египет","Алжир","Мароко","Тунис","Либия","Нигерия","Гана","Сенегал","Мали","Камерун","Уганда","Бряг на слоновата кост","Ангола","Танзания","Нигер","Централноафриканска република","Демократична република Конго","Буркина Фасо","Мадагаскар","Чад","Мозамбик","Замбия","Бенин","Гвинея","Того","Руанда","Малави","Бурунди","Либерия","Зимбабве","Сиера Леоне","Гамбия","Мавритания","Габон","Конго","Гвинея-Бисау","Екваториална Гвинея","Мавриций","Сейшелски острови","Коморски острови","Кабо Верде","Сао Томе и Принсипи","Сомалия","Кения","Етиопия","Судан","Южен Судан","Еритрея","Джибути","Южна Африка","Намибия","Ботсвана","Лесото","Есватини","Съединени щати","Канада","Мексико","Куба","Гватемала","Коста Рика","Белиз","Бахами","Ямайка","Хаити","Доминиканска република","Панама","Ел Салвадор","Никарагуа","Хондурас","Сейнт Лусия","Гренада","Доминика","Тринидад и Тобаго","Барбадос","Сейнт Винсент и Гренадини","Антигуа и Барбуда","Сейнт Китс и Невис","Бразилия","Аржентина","Колумбия","Чили","Перу","Венецуела","Еквадор","Уругвай","Боливия","Парагвай","Гвиана","Суринам"];


  List<String> get _allCountriesCS =>
      ["Německo","Francie","Spojené království","Španělsko","Itálie","Belgie","Rakousko","Portugalsko","Švýcarsko","Holandsko","Irsko","Monako","Lucembursko","Lichtenštejnsko","Andorra","San Marino","Vatikán","Švédsko","Dánsko","Finsko","Norsko","Island","Polsko","Řecko","Chorvatsko","Maďarsko","Slovinsko","Slovensko","Česká republika","Estonsko","Lotyšsko","Litva","Ukrajina","Rusko","Rumunsko","Bulharsko","Srbsko","Bosna a Hercegovina","Albánie","Černá Hora","Bělorusko","Moldavsko","Severní Makedonie","Kypr","Malta","Írán","Turecko","Irák","Izrael","Gruzie","Arménie","Ázerbajdžán","Sýrie","Jordán","Libanon","Palestina","Saudská arábie","Spojené arabské emiráty","Katar","Jemen","Omán","Kuvajt","Bahrajn","Kazachstán","Afghánistán","Uzbekistán","Tádžikistán","Kyrgyzstán","Turkmenistán","Indie","Pákistán","Nepál","Srí Lanka","Bangladéš","Bhútán","Maledivy","Thajsko","Indonésie","Vietnam","Malajsie","Filipíny","Singapur","Myanmar","Laos","Kambodža","Brunej","Čína","Japonsko","Jižní Korea","Severní Korea","Mongolsko","Austrálie","Nový Zéland","Papua-Nová Guinea","Východní Timor","Fidži","Solomonovy ostrovy","Vanuatu","Samoa","Kiribati","Mikronésie","Tonga","Marshallovy ostrovy","Palau","Nauru","Tuvalu","Egypt","Alžírsko","Maroko","Tunisko","Libye","Nigérie","Ghana","Senegal","Mali","Kamerun","Ugandě","Pobřeží slonoviny","Angola","Tanzanie","Niger","Středoafrická republika","Demokratická republika Kongo","Burkina Faso","Madagaskar","Čadu","Mozambik","Zambie","Benin","Guinea","Togo","Rwandě","Malawi","Burundi","Libérie","Zimbabwe","Sierra Leone","Gambie","Mauritánie","Gabon","Kongo","Guinea-Bissau","Rovníková Guinea","Mauricius","Seychely","Komory","Kapverdy","Svatý Tomáš a Princův ostrov","Somálsko","Keňa","Etiopie","Súdán","Jižní Súdán","Eritrea","Džibutsko","Jižní Afrika","Namibie","Botswana","Lesotho","Eswatini","Spojené státy","Kanada","Mexiko","Kuba","Guatemala","Kostarika","Belize","Bahamy","Jamaica","Haiti","Dominikánská republika","Panama","El Salvador","Nikaragua","Honduras","Svatá Lucia","Grenada","Dominika","Trinidad a Tobago","Barbados","Svatý Vincenc a Grenadiny","Antigua a Barbuda","Svatý Kryštof a Nevis","Brazílie","Argentina","Kolumbie","Chile","Peru","Venezuela","Ekvádor","Uruguay","Bolívie","Paraguay","Guyana","Surinam"];


  List<String> get _allCountriesDA =>
      ["Tyskland","Frankrig","Det Forenede Kongerige","Spanien","Italien","Belgien","Østrig","Portugal","Schweiz","Holland","Irland","Monaco","Luxembourg","Liechtenstein","Andorra","San Marino","Vatikanet","Sverige","Danmark","Finland","Norge","Island","Polen","Grækenland","Kroatien","Ungarn","Slovenien","Slovakiet","Tjekkiet","Estland","Letland","Litauen","Ukraine","Rusland","Rumænien","Bulgarien","Serbien","Bosnien-Hercegovina","Albanien","Montenegro","Hviderusland","Moldova","Nordlige Makedonien","Cypern","Malta","Iran","Tyrkiet","Irak","Israel","Georgien","Armenien","Aserbajdsjan","Syrien","Jordan","Libanon","Palæstina","Saudi Arabien","Forenede Arabiske Emirater","Qatar","Yemen","Oman","Kuwait","Bahrain","Kasakhstan","Afghanistan","Usbekistan","Tadsjikistan","Kirgisistan","Turkmenistan","Indien","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldiverne","Thailand","Indonesien","Vietnam","Malaysia","Filippinerne","Singapore","Myanmar","Laos","Cambodja","Brunei","Kina","Japan","Sydkorea","Nordkorea","Mongoliet","Australien","New Zealand","Papua Ny Guinea","Øst Timor","Fiji","Salomonøerne","Vanuatu","Samoa","Kiribati","Mikronesien","Tonga","Marshalløerne","Palau","Nauru","Tuvalu","Egypten","Algeriet","Marokko","Tunesien","Libyen","Nigeria","Ghana","Senegal","Mali","Cameroun","Uganda","Elfenbenskysten","Angola","Tanzania","Niger","Den Centralafrikanske Republik","Den Demokratiske Republik Congo","Burkina Faso","Madagaskar","Tchad","Mozambique","Zambia","Benin","Guinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauretanien","Gabon","Congo","Guinea-Bissau","Ækvatorial Guinea","Mauritius","Seychellerne","Comorerne","Kap Verde","São Tomé og Príncipe","Somalia","Kenya","Etiopien","Sudan","Sydsudan","Eritrea","Djibouti","Sydafrika","Namibia","Botswana","Lesotho","Eswatini","Forenede Stater","Canada","Mexico","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaica","Haiti","Dominikanske republik","Panama","El Salvador","Nicaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad og Tobago","Barbados","Saint Vincent og Grenadinerne","Antigua og Barbuda","Saint Kitts og Nevis","Brasilien","Argentina","Colombia","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Surinam"];


  List<String> get _allCountriesDE =>
      ["Deutschland","Frankreich","Großbritannien","Spanien","Italien","Belgien","Österreich","Portugal","Schweiz","Niederlande","Irland","Monaco","Luxemburg","Liechtenstein","Andorra","San Marino","Vatikan","Schweden","Dänemark","Finnland","Norwegen","Island","Polen","Griechenland","Kroatien","Ungarn","Slowenien","Slowakei","Tschechien","Estland","Lettland","Litauen","Ukraine","Russland","Rumänien","Bulgarien","Serbien","Bosnien und Herzegowina","Albanien","Montenegro","Weißrussland","Moldawien","Nordmakedonien","Zypern","Malta","Iran","Türkei","Irak","Israel","Georgia","Armenien","Aserbaidschan","Syrien","Jordanien","Libanon","Palästina","Saudi Arabien","Vereinigte Arabische Emirate","Katar","Jemen","Oman","Kuwait","Bahrain","Kasachstan","Afghanistan","Usbekistan","Tadschikistan","Kirgisistan","Turkmenistan","Indien","Pakistan","Nepal","Sri Lanka","Bangladesch","Bhutan","Malediven","Thailand","Indonesien","Vietnam","Malaysia","Philippinen","Singapur","Myanmar","Laos","Kambodscha","Brunei","China","Japan","Südkorea","Nord Korea","Mongolei","Australien","Neuseeland","Papua Neu-Guinea","Osttimor","Fidschi","Salomon-Inseln","Vanuatu","Samoa","Kiribati","Mikronesien","Tonga","Marshallinseln","Palau","Nauru","Tuvalu","Ägypten","Algerien","Marokko","Tunesien","Libyen","Nigeria","Ghana","Senegal","Mali","Kamerun","Uganda","Elfenbeinküste","Angola","Tansania","Niger","Zentralafrikanische Republik","Demokratische Republik Kongo","Burkina Faso","Madagaskar","Tschad","Mosambik","Sambia","Benin","Guinea","Togo","Ruanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauretanien","Gabun","Kongo","Guinea-Bissau","Äquatorialguinea","Mauritius","Seychellen","Komoren","Kap Verde","São Tomé und Príncipe","Somalia","Kenia","Äthiopien","Sudan","Südsudan","Eritrea","Dschibuti","Südafrika","Namibia","Botswana","Lesotho","Eswatini","Vereinigte Staaten","Kanada","Mexiko","Kuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaika","Haiti","Dominikanische Republik","Panama","El Salvador","Nicaragua","Honduras","St. Lucia","Grenada","Dominica","Trinidad und Tobago","Barbados","St. Vincent und die Grenadinen","Antigua und Barbuda","St. Kitts und Nevis","Brasilien","Argentinien","Kolumbien","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolivien","Paraguay","Guyana","Suriname"];


  List<String> get _allCountriesEL =>
      ["Γερμανία","Γαλλία","Ηνωμένο Βασίλειο","Ισπανία","Ιταλία","Βέλγιο","Αυστρία","Πορτογαλία","Ελβετία","Ολλανδία","Ιρλανδία","Μονακό","Λουξεμβούργο","Λιχτενστάιν","Ανδόρα","Σαν Μαρίνο","Βατικανό","Σουηδία","Δανία","Φινλανδία","Νορβηγία","Ισλανδία","Πολωνία","Ελλάδα","Κροατία","Ουγγαρία","Σλοβενία","Σλοβακία","Τσεχική Δημοκρατία","Εσθονία","Λετονία","Λιθουανία","Ουκρανία","Ρωσία","Ρουμανία","Βουλγαρία","Σερβία","Βοσνία και Ερζεγοβίνη","Αλβανία","Μαυροβούνιο","Λευκορωσία","Μολδαβία","Βόρεια Μακεδονία","Κύπρος","Μάλτα","Ιράν","Τουρκία","Ιράκ","Ισραήλ","Γεωργία","Αρμενία","Αζερμπαϊτζάν","Συρία","Ιορδανία","Λίβανος","Παλαιστίνη","Σαουδική Αραβία","Ηνωμένα Αραβικά Εμιράτα","Κατάρ","Γέμενη","Ομάν","Κουβέιτ","Μπαχρέιν","Καζακστάν","Αφγανιστάν","Ουζμπεκιστάν","Τατζικιστάν","Κιργιζιστάν","Τουρκμενιστάν","Ινδία","Πακιστάν","Νεπάλ","Σρι Λάνκα","Μπαγκλαντές","Μπουτάν","Μαλδίβες","Ταϊλάνδη","Ινδονησία","Βιετνάμ","Μαλαισία","Φιλιππίνες","Σιγκαπούρη","Μιανμάρ","Λάος","Καμπότζη","Μπρουνέι","Κίνα","Ιαπωνία","Νότια Κορέα","Βόρεια Κορέα","Μογγολία","Αυστραλία","Νέα Ζηλανδία","Παπούα Νέα Γουινέα","Ανατολικό Τιμόρ","Φίτζι","Νησιά του Σολομώντα","Βανουάτου","Σαμόα","Κιριμπάτι","Μικρονησία","Τόνγκα","Νήσοι Μάρσαλ","Παλάου","Ναουρού","Τουβαλού","Αίγυπτος","Αλγερία","Μαρόκο","Τυνησία","Λιβύη","Νιγηρία","Γκάνα","Σενεγάλη","Μάλι","Καμερούν","Ουγκάντα","Ακτή Ελεφαντοστού","Αγκόλα","Τανζανία","Νίγηρας","Δημοκρατία Κεντρικής Αφρικής","Λαϊκή Δημοκρατία του Κονγκό","Μπουρκίνα Φάσο","Μαδαγασκάρη","Τσαντ","Μοζαμβίκη","Ζάμπια","Μπενίν","Γκινέα","Τόγκο","Ρουάντα","Μαλάουι","Μπουρούντι","Λιβερία","Ζιμπάμπουε","Σιέρρα Λεόνε","Γκάμπια","Μαυριτανία","Γκαμπόν","Κογκό","Γουινέα-Μπισάου","Ισημερινή Γουινέα","Μαυρίκιος","Σεϋχέλλες","Κομόρες","Πράσινο Ακρωτήριο","Σάο Τομέ και Πρίνσιπε","Σομαλία","Κενύα","Αιθιοπία","Σουδάν","Νότιο Σουδάν","Ερυθραία","Τζιμπουτί","Νότια Αφρική","Ναμίμπια","Μποτσουάνα","Λεσόθο","Εσουατίνι","Ηνωμένες Πολιτείες","Καναδάς","Μεξικό","Κούβα","Γουατεμάλα","Κόστα Ρίκα","Μπελίζ","Μπαχάμες","Ιαμαϊκή","Αΐτη","Δομινικανή Δημοκρατία","Παναμάς","Ελ Σαλβαδόρ","Νικαράγουα","Ονδούρα","Αγία Λουκία","Γρενάδα","Ντομίνικα","Τρινιντάντ και Τομπάγκο","Μπαρμπάντος","Άγιος Βικέντιος και Γρεναδίνες","Αντίγκουα και Μπαρμπούντα","Άγιος Χριστόφορος και Νέβις","Βραζιλία","Αργεντίνη","Κολομβία","χιλή","Περού","Βενεζουέλα","Εκουαδόρ","Ουρουγουάη","Βολιβία","Παραγουάη","Γουιάνα","Σουρινάμ"];


  List<String> get _allCountriesEN =>
      ["Germany","France","United Kingdom","Spain","Italy","Belgium","Austria","Portugal","Switzerland","Netherlands","Ireland","Monaco","Luxembourg","Liechtenstein","Andorra","San Marino","Vatican City","Sweden","Denmark","Finland","Norway","Iceland","Poland","Greece","Croatia","Hungary","Slovenia","Slovakia","Czech Republic","Estonia","Latvia","Lithuania","Ukraine","Russia","Romania","Bulgaria","Serbia","Bosnia and Herzegovina","Albania","Montenegro","Belarus","Moldova","North Macedonia","Cyprus","Malta","Iran","Turkey","Iraq","Israel","Georgia","Armenia","Azerbaijan","Syria","Jordan","Lebanon","Palestine","Saudi Arabia","United Arab Emirates","Qatar","Yemen","Oman","Kuwait","Bahrain","Kazakhstan","Afghanistan","Uzbekistan","Tajikistan","Kyrgyzstan","Turkmenistan","India","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldives","Thailand","Indonesia","Vietnam","Malaysia","Philippines","Singapore","Myanmar","Laos","Cambodia","Brunei","China","Japan","South Korea","North Korea","Mongolia","Australia","New Zealand","Papua New Guinea","East Timor","Fiji","Solomon Islands","Vanuatu","Samoa","Kiribati","Micronesia","Tonga","Marshall Islands","Palau","Nauru","Tuvalu","Egypt","Algeria","Morocco","Tunisia","Libya","Nigeria","Ghana","Senegal","Mali","Cameroon","Uganda","Ivory Coast","Angola","Tanzania","Niger","Central African Republic","Democratic Republic of the Congo","Burkina Faso","Madagascar","Chad","Mozambique","Zambia","Benin","Guinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Congo","Guinea-Bissau","Equatorial Guinea","Mauritius","Seychelles","Comoros","Cape Verde","São Tomé and Príncipe","Somalia","Kenya","Ethiopia","Sudan","South Sudan","Eritrea","Djibouti","South Africa","Namibia","Botswana","Lesotho","Eswatini","United States","Canada","Mexico","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaica","Haiti","Dominican Republic","Panama","El Salvador","Nicaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad and Tobago","Barbados","Saint Vincent and the Grenadines","Antigua and Barbuda","Saint Kitts and Nevis","Brazil","Argentina","Colombia","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Suriname"];


  List<String> get _allCountriesES =>
      ["Alemania","Francia","Reino Unido","España","Italia","Bélgica","Austria","Portugal","Suiza","Países Bajos","Irlanda","Mónaco","Luxemburgo","Liechtenstein","Andorra","San Marino","Ciudad del Vaticano","Suecia","Dinamarca","Finlandia","Noruega","Islandia","Polonia","Grecia","Croacia","Hungría","Eslovenia","Eslovaquia","Republica checa","Estonia","Letonia","Lituania","Ucrania","Rusia","Rumania","Bulgaria","Serbia","Bosnia y Herzegovina","Albania","Montenegro","Bielorrusia","Moldavia","Macedonia del norte","Chipre","Malta","Iran","Turquía","Irak","Israel","Georgia","Armenia","Azerbaiyán","Siria","Jordán","Líbano","Palestina","Arabia Saudita","Emiratos Árabes Unidos","Katar","Yemen","Omán","Kuwait","Bahrein","Kazajstán","Afganistán","Uzbekistán","Tayikistán","Kirguistán","Turkmenistán","India","Pakistán","Nepal","Sri Lanka","Bangladesh","Bután","Maldivas","Tailandia","Indonesia","Vietnam","Malasia","Filipinas","Singapur","Myanmar","Laos","Camboya","Brunei","China","Japón","Corea del Sur","Corea del Norte","Mongolia","Australia","Nueva Zelanda","Papúa Nueva Guinea","Timor Oriental","Fiyi","Islas Salomón","Vanuatu","Samoa","Kiribati","Micronesia","Tonga","Islas Marshall","Palau","Nauru","Tuvalu","Egipto","Argelia","Marruecos","Túnez","Libia","Nigeria","Ghana","Senegal","Mali","Camerún","Uganda","Costa de Marfil","Angola","Tanzania","Níger","República Centroafricana","República Democrática del Congo","Burkina Faso","Madagascar","Chad","Mozambique","Zambia","Benin","Guinea","Togo","Ruanda","Malawi","Burundi","Liberia","Zimbabue","Sierra Leona","Gambia","Mauritania","Gabón","Congo","Guinea-Bissau","Guinea Ecuatorial","Mauricio","Seychelles","Comoras","Cabo Verde","Santo Tomé y Príncipe","Somalia","Kenia","Etiopía","Sudán","Sudán del Sur","Eritrea","Djibouti","Sudáfrica","Namibia","Botsuana","Lesoto","Eswatini","Estados Unidos","Canadá","Mexico","Cuba","Guatemala","Costa Rica","Belice","Bahamas","Jamaica","Haití","República Dominicana","Panamá","El Salvador","Nicaragua","Honduras","Santa Lucía","Granada","Dominica","Trinidad y Tobago","Barbados","San Vicente y las Granadinas","Antigua y Barbuda","San Cristóbal y Nieves","Brasil","Argentina","Colombia","Chile","Perú","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guayana","Surinam"];


  List<String> get _allCountriesFI =>
      ["Saksa","Ranska","Yhdistynyt kuningaskunta","Espanja","Italia","Belgia","Itävalta","Portugali","Sveitsi","Alankomaat","Irlanti","Monaco","Luxemburg","Liechtenstein","Andorra","San Marino","Vatikaani","Ruotsi","Tanska","Suomi","Norja","Islanti","Puola","Kreikka","Kroatia","Unkari","Slovenia","slovakia","Tšekki","Togo","Latvia","Liettua","Ukraina","Venäjä","Romania","Bulgaria","Serbia","Bosnia ja Hertsegovina","Albania","montenegro","Valko-Venäjä","Moldova","Pohjois-Makedonia","Kypros","Malta","Iran","Turkki","Irak","Israel","Georgia","Armenia","azerbaijan","Syyria","Jordania","Libanon","Palestiina","Saudi-Arabia","Yhdistyneet Arabiemiirikunnat","Qatar","Jemen","Oman","Kuwait","Bahrain","Kazakstan","Afganistan","Uzbekistan","Tadžikistan","Kirgisia","Turkmenistan","Intia","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Malediivit","Thaimaa","Indonesia","Vietnam","Malesia","Filippiinit","Singapore","Myanmar","Laos","Kambodza","Brunei","Kiina","Japani","Etelä-Korea","Pohjois-Korea","Mongolia","Australia","Uusi Seelanti","Papua-Uusi-Guinea","Itä-Timor","Fidži","Solomonsaaret","Vanuatu","Samoa","Kiribati","Mikronesia","Tonga","Marshallsaaret","Palau","Nauru","Tuvalu","Egypti","Algeria","Marokko","Tunisia","Libya","Nigeria","Ghana","Senegal","mali","Kamerun","Uganda","Norsunluurannikko","Angola","Tansania","Niger","Keski-Afrikan tasavalta","Kongon demokraattinen tasavalta","Burkina Faso","Madagaskar","Chad","Mosambik","Sambia","Benin","Guinea","Mennä","Ruanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Kongo","Guinea-Bissau","Päiväntasaajan Guinea","Mauritius","Seychellit","Komorit","Kap Verde","Sao Tome ja Principe","somalia","Kenia","Etiopia","Sudan","eteläsudan","Eritrea","Djibouti","Etelä-Afrikka","namibia","Botswana","lesotho","Eswatini","Yhdysvallat","Kanada","Meksiko","Kuuba","Guatemala","Costa Rica","Belize","Bahama","Jamaika","Haiti","Dominikaaninen tasavalta","Panama","El Salvador","nicaragua","Honduras","Saint Lucia","Grenada","dominica","Trinidad ja Tobago","Barbados","Saint Vincent ja Grenadiinit","Antigua ja Barbuda","Saint Kitts ja Nevis","Brasilia","Argentiina","Kolumbia","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","suriname"];


  List<String> get _allCountriesFR =>
      ["Allemagne","France","Royaume-Uni","Espagne","Italie","Belgique","L'Autriche","le Portugal","Suisse","Pays-Bas","Irlande","Monaco","Luxembourg","Liechtenstein","Andorre","Saint Marin","Vatican","Suède","Danemark","Finlande","Norvège","Islande","Pologne","Grèce","Croatie","Hongrie","Slovénie","Slovaquie","République Tchèque","Estonie","Lettonie","Lituanie","Ukraine","Russie","Roumanie","Bulgarie","Serbie","Bosnie Herzégovine","Albanie","Monténégro","Biélorussie","Moldavie","Macédoine du Nord","Chypre","Malte","L'Iran","Turquie","Irak","Israël","Géorgie","Arménie","Azerbaïdjan","Syrie","Jordan","Liban","Palestine","Arabie Saoudite","Emirats Arabes Unis","Qatar","Yémen","Oman","Koweit","Bahreïn","Kazakhstan","Afghanistan","Ouzbékistan","Tadjikistan","Kirghizistan","Turkménistan","Inde","Pakistan","Népal","Sri Lanka","Bangladesh","Bhoutan","Maldives","Thaïlande","Indonésie","Vietnam","Malaisie","Philippines","Singapour","Myanmar","Laos","Cambodge","Brunei","Chine","Japon","Corée du Sud","Corée du Nord","Mongolie","Australie","Nouvelle-Zélande","Papouasie Nouvelle Guinée","Timor oriental","Fidji","îles Salomon","Vanuatu","Samoa","Kiribati","Micronésie","Tonga","Iles Marshall","Palau","Nauru","Tuvalu","Egypte","Algérie","Maroc","Tunisie","Libye","Nigeria","Ghana","Sénégal","Mali","Cameroun","Ouganda","Côte d'Ivoire","Angola","Tanzanie","Niger","République centrafricaine","République Démocratique du Congo","Burkina Faso","Madagascar","Tchad","Mozambique","Zambie","Bénin","Guinée","Togo","Rwanda","Malawi","Burundi","Libéria","Zimbabwe","Sierra Leone","Gambie","Mauritanie","Gabon","Congo","Guinée-Bissau","Guinée Équatoriale","Ile Maurice","les Seychelles","Comores","Cap-Vert","São Tomé et Príncipe","Somalie","Kenya","Ethiopie","Soudan","Soudan du sud","Érythrée","Djibouti","Afrique du Sud","Namibie","Botswana","Lesotho","Eswatini","États Unis","Canada","Mexique","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaïque","Haïti","République Dominicaine","Panama","Le Salvador","Nicaragua","Honduras","Sainte-Lucie","Grenade","Dominique","Trinité-et-Tobago","Barbade","Saint-Vincent-et-les-Grenadines","Antigua-et-Barbuda","Saint-Christophe-et-Niévès","Brésil","Argentine","Colombie","Chili","Pérou","Venezuela","Equateur","Uruguay","Bolivie","Paraguay","Guyane","Suriname"];


  List<String> get _allCountriesHE =>
      ["גֶרמָנִיָה","צָרְפַת","הממלכה המאוחדת","סְפָרַד","אִיטַלִיָה","בלגיה","אוֹסְטְרֵיָה","פּוֹרטוּגָל","שוויץ","הולנד","אירלנד","מונקו","לוקסמבורג","ליכטנשטיין","אנדורה","סן מרינו","וותיקן","שבדיה","דנמרק","פינלנד","נורווגיה","אִיסלַנד","פּוֹלִין","יוון","קרואטיה","הונגריה","סלובניה","סלובקיה","צ'כיה","אסטוניה","לטביה","ליטא","אוקראינה","רוּסִיָה","רומניה","בולגריה","סרביה","בוסניה והרצגובינה","אלבניה","מונטנגרו","בלארוס","מולדובה","צפון מקדוניה","קַפרִיסִין","מלטה","איראן","טורקיה","עִירַאק","ישראל","גאורגיה","אַרְמֶנִיָה","אזרבייג'ן","סוּריָה","יַרדֵן","לבנון","פלסטין","ערב הסעודית","איחוד האמירויות הערביות","קטאר","תֵימָן","עומאן","כווית","בחריין","קזחסטן","אפגניסטן","אוזבקיסטן","טג'יקיסטן","קירגיזסטן","טורקמניסטן","הוֹדוּ","פקיסטן","נפאל","סרי לנקה","בנגלדש","בהוטן","המלדיביים","תאילנד","אִינדוֹנֵזִיָה","וייטנאם","מלזיה","פיליפינים","סינגפור","מיאנמר","לאוס","קמבודיה","ברוניי","הרפובליקה העממית של סין","יפן","דרום קוריאה","צפון קוריאה","מונגוליה","אוֹסטְרַלִיָה","ניו זילנד","פפואה גינאה החדשה","מזרח טימור","פיג'י","איי שלמה","ונואטו","סמואה","קיריבטי","מיקרונזיה","טונגה","איי מרשל","פלאו","נאורו","טובאלו","מִצְרַיִם","אלג'יריה","מָרוֹקוֹ","תוניסיה","לוב","ניגריה","גאנה","סנגל","מלי","קמרון","אוגנדה","חוף השנהב","אנגולה","טנזניה","ניז'ר","הרפובליקה המרכז אפריקאית","הרפובליקה העממית של קונגו","בורקינה פאסו","מדגסקר","צ'אד","מוזמביק","זמביה","בנין","גינאה","טוגו","רואנדה","מלאווי","בורונדי","ליבריה","זימבבואה","סיירה לאון","גמביה","מאוריטניה","גאבון","קונגו","גינאה-ביסאו","גיניאה המשוונית","מאוריציוס","איי סיישל","קומורו","כף ורדה","סאו טומה ופרינסיפה","סומליה","קניה","אֶתִיוֹפִּיָה","סודן","דרום סודן","אריתריאה","ג'יבוטי","דרום אפריקה","נמיביה","בוצואנה","לסוטו","אסווטיני","ארצות הברית","קנדה","מקסיקו","קובה","גואטמלה","קוסטה ריקה","בליז","איי בהאמה","ג'מייקה","האיטי","הרפובליקה הדומיניקנית","פנמה","אל סלבדור","ניקרגואה","הונדורס","סנט לוסיה","גרנדה","דומיניקה","טרינידד וטובגו","ברבדוס","סנט וינסנט והגרנדינים","אנטיגואה וברבודה","סנט קיטס ונוויס","בְּרָזִיל","ארגנטינה","קולומביה","צ'ילה","פרו","ונצואלה","אקוודור","אורוגוואי","בוליביה","פרגוואי","גיאנה","סורינאם"];


  List<String> get _allCountriesHI =>
      ["जर्मनी","फ्रांस","यूनाइटेड किंगडम","स्पेन","इटली","बेल्जियम","ऑस्ट्रिया","पुर्तगाल","स्विट्जरलैंड","नीदरलैंड","आयरलैंड","मोनाको","लक्समबर्ग","लिकटेंस्टीन","अंडोरा","सैन मैरीनो","वेटिकन","स्वीडन","डेनमार्क","फिनलैंड","नॉर्वे","आइसलैंड","पोलैंड","यूनान","क्रोएशिया","हंगरी","स्लोवेनिया","स्लोवाकिया","चेक गणतंत्र","एस्तोनिया","लातविया","लिथुआनिया","यूक्रेन","रूस","रोमानिया","बुल्गारिया","सर्बिया","बोस्निया और हर्जेगोविना","अल्बानिया","मोंटेनेग्रो","बेलोरूस","मोलदोवा","उत्तर मैसेडोनिया","साइप्रस","माल्टा","ईरान","तुर्की","इराक","इजराइल","जॉर्जिया","आर्मीनिया","आज़रबाइजान","सीरिया","जॉर्डन","लेबनान","फिलिस्तीन","सऊदी अरब","संयुक्त अरब अमीरात","कतर","यमन","ओमान","कुवैट","बहरीन","कजाखस्तान","अफ़ग़ानिस्तान","उज़्बेकिस्तान","तजाकिस्तान","किर्गिज़स्तान","तुर्कमेनिस्तान","भारत","पाकिस्तान","नेपाल","श्री लंका","बांग्लादेश","भूटान","मालदीव","थाईलैंड","इंडोनेशिया","वियतनाम","मलेशिया","फिलीपींस","सिंगापुर","म्यांमार","लाओस","कंबोडिया","ब्रुनेई","चीन","जापान","दक्षिण कोरिया","उत्तर कोरिया","मंगोलिया","ऑस्ट्रेलिया","न्यूजीलैंड","पापुआ न्यू गिनी","पूर्वी तिमोर","फ़िजी","सोलोमन इस्लैंडस","वानुअतु","समोआ","किरिबाती","माइक्रोनेशिया","टोंगा","मार्शल द्वीप समूह","पलाऊ","नाउरू","तुवालु","मिस्र","एलजीरिया","मोरक्को","ट्यूनीशिया","लीबिया","नाइजीरिया","घाना","सेनेगल","माली","कैमरून","युगांडा","हाथीदांत का किनारा","अंगोला","तंजानिया","नाइजर","केंद्रीय अफ्रीकन गणराज्य","डेमोक्रेटिक रीपब्लिक ऑफ द कॉंगो","बुर्किना फासो","मेडागास्कर","चाड","मोजाम्बिक","जाम्बिया","बेनिन","गिन्नी","टोगो","रवांडा","मलावी","बुस्र्न्दी","लाइबेरिया","जिम्बाब्वे","सियरा लिओन","गाम्बिया","मॉरिटानिया","गैबॉन","कांगो","गिनी-बिसाऊ","भूमध्यवर्ती गिनी","मॉरीशस","सेशेल्स","कोमोरोस","केप वर्दे","साओ टोमे और प्रिंसिपे","सोमालिया","केन्या","इथियोपिया","सूडान","दक्षिण सूडान","इरिट्रिया","जिबूती","दक्षिण अफ्रीका","नामीबिया","बोत्सवाना","लेसोथो","एस्वातीनी","संयुक्त राज्य अमेरिका","कनाडा","मेक्सिको","क्यूबा","ग्वाटेमाला","कोस्टा रिका","बेलीज","बहामा","जमैका","हैती","डोमिनिकन गणराज्य","पनामा","अल साल्वाडोर","निकारागुआ","होंडुरस","सेंट लूसिया","ग्रेनेडा","डोमिनिका","त्रिनिदाद और टोबैगो","बारबाडोस","संत विंसेंट अँड थे ग्रेनडीनेस","अंतिगुया और बार्बूडा","संत किट्ट्स और नेविस","ब्राज़िल","अर्जेंटीना","कोलम्बिया","चिली","पेरू","वेनेजुएला","इक्वेडोर","उरुग्वे","बोलीविया","परागुआ","गुयाना","सूरीनाम"];


  List<String> get _allCountriesHR =>
      ["Njemačka","Francuska","Ujedinjeno Kraljevstvo","Španija","Italija","Belgija","Austrija","Portugal","Švicarska","Nizozemska","Irska","Monaco","Luksemburg","Lihtenštajn","Andora","San Marino","Vatikan","Švedska","Danska","Finska","Norveška","Island","Poljska","Grčka","Hrvatska","Mađarska","Slovenija","Slovačka","Češka Republika","Estonija","Letonija","Litva","Ukrajina","Rusija","Rumunjska","Bugarska","Srbija","Bosna i Hercegovina","Albanija","Crna Gora","Bjelorusija","Moldavija","Sjeverna Makedonija","Kipar","Malta","Iran","Turska","Irak","Izrael","Gruzija","Armenija","Azerbejdžan","Sirija","Jordan","Liban","Palestina","Saudijska Arabija","Ujedinjeni Arapski Emirati","Katar","Jemen","Oman","Kuvajt","Bahrein","Kazahstan","Avganistan","Uzbekistan","Tadžikistan","Kirgistan","Turkmenistan","Indija","Pakistan","Nepal","Šri Lanka","Bangladeš","Butan","Maldivi","Tajland","Indonezija","Vijetnam","Malezija","Filipini","Singapur","Mjanmar","Laos","Kambodža","Brunei","Kina","Japan","Južna Korea","Sjeverna Koreja","Mongolija","Australija","Novi Zeland","Papua Nova Gvineja","Istočni Timor","Fidži","Salomonovi otoci","Vanuatu","Samoa","Kiribati","Mikronezija","Laka dvokolica","Maršalovi otoci","Palau","Nauru","Tuvalu","Egipat","Alžir","Maroko","Tunis","Libija","Nigerija","Gana","Senegal","Mali","Kamerun","Uganda","Obala Slonovače","Angola","Tanzanija","Niger","Centralna Afrička Republika","Demokratska Republika Kongo","Burkina Faso","Madagaskar","Čad","Mozambik","Zambija","Benin","Gvineja","Togo","Ruanda","Malavi","Burundi","Liberija","Zimbabve","Sierra Leone","Gambija","Mauritanija","Gabon","Kongo","Gvineja Bisau","Ekvatorijalna Gvineja","Mauricijus","Sejšeli","Komori","Zelenortski otoci","São Tomé i Principe","Somalija","Kenija","Etiopija","Sudan","Južni Sudan","Eritreja","Džibuti","Južna Afrika","Namibija","Bocvana","Lesoto","Eswatini","Sjedinjene Američke Države","Kanada","Meksiko","Kuba","Gvatemala","Kostarika","Belize","Bahami","Jamajka","Haiti","Dominikanska Republika","Panama","El Salvador","Nikaragva","Honduras","Sveta Lucija","Grenada","Dominika","Trinidad i Tobago","Barbados","Sveti Vincent i Grenadini","Antigva i Barbuda","Saint Kitts i Nevis","Brazil","Argentina","Kolumbija","Čile","Peru","Venecuela","Ekvador","Urugvaj","Bolivija","Paragvaj","Gvajana","Surinam"];


  List<String> get _allCountriesHU =>
      ["Németország","Franciaország","Egyesült Királyság","Spanyolország","Olaszország","Belgium","Ausztria","Portugália","Svájc","Hollandia","Írország","Monaco","Luxemburg","Liechtenstein","Andorra","San Marino","Vatikán","Svédország","Dánia","Finnország","Norvégia","Izland","Lengyelország","Görögország","Horvátország","Magyarország","Szlovénia","Szlovákia","Cseh Köztársaság","Észtország","Lettország","Litvánia","Ukrajna","Oroszország","Románia","Bulgária","Szerbia","Bosznia és Hercegovina","Albánia","Montenegró","Fehéroroszország","Moldova","Észak-Macedónia","Ciprus","Málta","Irán","Törökország","Irak","Izrael","Grúzia","Örményország","Azerbajdzsán","Szíria","Jordánia","Libanon","Palesztina","Szaud-Arábia","Egyesült Arab Emírségek","Katar","Jemen","Omán","Kuvait","Bahrein","Kazahsztán","Afganisztán","Üzbegisztán","Tádzsikisztán","Kirgizisztán","Türkmenisztán","India","Pakisztán","Nepál","Srí Lanka","Banglades","Bhután","Maldív-szigetek","Thaiföld","Indonézia","Vietnam","Malaysia","Fülöp-szigetek","Singapore","Myanmar","Laosz","Kambodzsa","Brunei","Kína","Japán","Dél-Korea","Észak Kórea","Mongólia","Ausztrália","Új Zéland","Pápua Új-Guinea","Kelet-Timor","Fiji","Salamon-szigetek","Vanuatu","Szamoa","Kiribati","Mikronézia","Tonga","Marshall-szigetek","Palau","Nauru","Tuvalu","Egyiptom","Algéria","Marokkó","Tunézia","Líbia","Nigéria","Ghána","Szenegál","Mali","Kamerun","Uganda","Elefántcsontpart","Angola","Tanzánia","Niger","Közép-Afrikai Köztársaság","Kongói Demokratikus Köztársaság","Burkina Faso","Madagaszkár","Csád","Mozambik","Zambia","Benin","Guinea","Togo","Ruanda","Malawi","Burundi","Libéria","Zimbabwe","Sierra Leone","Gambia","Mauritánia","Gabon","Kongó","Bissau-Guinea","Egyenlítői-Guinea","Mauritius","Seychelles","Comore-szigetek","zöld-fok","São Tomé és Príncipe","Szomáliában","Kenya","Etiópia","Szudán","Dél Szudán","Eritrea","Dzsibuti","Dél-Afrika","Namíbia","Botswana","Lesotho","Eswatini","Egyesült Államok","Kanada","Mexikó","Kuba","Guatemala","Costa Rica","Belize","Bahamák","Jamaica","Haiti","Dominikai Köztársaság","Panama","El Salvador","Nicaragua","Honduras","Saint Lucia","Grenada","Dominika","Trinidad és Tobago","Barbados","Saint Vincent és a Grenadine-szigetek","Antigua és Barbuda","Saint Kitts és Nevis","Brazília","Argentína","Colombia","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolívia","Paraguay","Guyana","Suriname"];


  List<String> get _allCountriesID =>
      ["Jerman","Perancis","Britania Raya","Spanyol","Italia","Belgium","Austria","Portugal","Swiss","Belanda","Irlandia","Monako","Luksemburg","Liechtenstein","Andorra","San Marino","Vatikan","Swedia","Denmark","Finlandia","Norway","Islandia","Polandia","Yunani","Kroasia","Hungaria","Slovenia","Slovakia","Republik Ceko","Estonia","Latvia","Lithuania","Ukraina","Rusia","Rumania","Bulgaria","Serbia","Bosnia dan Herzegovina","Albania","Montenegro","Belarus","Moldova","Makedonia Utara","Siprus","Malta","Iran","Turki","Irak","Israel","Georgia","Armenia","Azerbaijan","Syria","Yordania","Libanon","Palestina","Arab Saudi","Uni Emirat Arab","Qatar","Yaman","Oman","Kuwait","Bahrain","Kazakhstan","Afganistan","Uzbekistan","Tajikistan","Kirgistan","Turkmenistan","India","Pakistan","Nepal","Srilanka","Bangladesh","Bhutan","Maladewa","Thailand","Indonesia","Vietnam","Malaysia","Filipina","Singapura","Myanmar","Laos","Kamboja","Brunei","Cina","Jepang","Korea Selatan","Korea Utara","Mongolia","Australia","Selandia Baru","Papua Nugini","Timor Timur","Fiji","Pulau Solomon","Vanuatu","Samoa","Kiribati","Mikronesia","Tonga","Pulau Marshall","Palau","Nauru","Tuvalu","Mesir","Aljazair","Maroko","Tunisia","Libya","Nigeria","Ghana","Senegal","Mali","Kamerun","Uganda","pantai Gading","Angola","Tanzania","Niger","Republik Afrika Tengah","Republik Demokrasi Kongo","Burkina Faso","Madagaskar","Chad","Mozambik","Zambia","Benin","Guinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Kongo","Guinea-Bissau","Guinea ekuator","Mauritius","Seychelles","Komoro","Tanjung Verde","São Tomé dan Príncipe","Somalia","Kenya","Etiopia","Sudan","Sudan Selatan","Eritrea","Djibouti","Afrika Selatan","Namibia","Botswana","Lesotho","Eswatini","Amerika Serikat","Kanada","Meksiko","Kuba","Guatemala","Kosta Rika","Belize","Bahama","Jamaika","Haiti","Republik Dominika","Panama","El Salvador","Nikaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad dan Tobago","Barbados","Saint Vincent dan Grenadines","Antigua dan Barbuda","Saint Kitts dan Nevis","Brazil","Argentina","Kolumbia","Chili","Peru","Venezuela","Ekuador","Uruguay","Bolivia","Paraguay","Guyana","Suriname"];


  List<String> get _allCountriesIT =>
      ["Germania","Francia","Regno Unito","Spagna","Italia","Belgio","Austria","Portogallo","Svizzera","Olanda","Irlanda","Monaco","Lussemburgo","Liechtenstein","Andorra","San Marino","Vaticano","Svezia","Danimarca","Finlandia","Norvegia","Islanda","Polonia","Grecia","Croazia","Ungheria","Slovenia","Slovacchia","Repubblica Ceca","Estonia","Lettonia","Lituania","Ucraina","Russia","Romania","Bulgaria","Serbia","Bosnia Erzegovina","Albania","Montenegro","Bielorussia","Moldova","Macedonia del Nord","Cipro","Malta","Iran","Turchia","Iraq","Israele","Georgia","Armenia","Azerbaijan","Siria","Giordania","Libano","Palestina","Arabia Saudita","Emirati Arabi Uniti","Qatar","yemen","Oman","Kuwait","Bahrain","Kazakistan","afghanistan","Uzbekistan","Tajikistan","Kyrgyzstan","Turkmenistan","India","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldive","Tailandia","Indonesia","Vietnam","Malaysia","Filippine","Singapore","Myanmar","Laos","Cambogia","Brunei","Cina","Giappone","Corea del Sud","Corea del nord","Mongolia","Australia","Nuova Zelanda","Papua Nuova Guinea","Timor Est","Fiji","Isole Salomone","Vanuatu","Samoa","Kiribati","Micronesia","tonga","Isole Marshall","Palau","Nauru","Tuvalu","Egitto","algeria","Marocco","Tunisia","Libia","Nigeria","Ghana","Senegal","Mali","Camerun","Uganda","Costa d'Avorio","angola","Tanzania","Niger","Repubblica Centrafricana","Repubblica Democratica del Congo","Burkina Faso","Madagascar","Chad","Mozambico","Zambia","Benin","Guinea","Togo","Ruanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Congo","Guinea-Bissau","Guinea Equatoriale","Mauritius","Seychelles","Comoros","capo Verde","São Tomé e Príncipe","Somalia","Kenia","Etiopia","Sudan","Sudan del Sud","l'Eritrea","Gibuti","Sud Africa","Namibia","Botswana","Lesoto","Eswatini","Stati Uniti","Canada","Messico","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Giamaica","Haiti","Repubblica Dominicana","Panama","El Salvador","Nicaragua","Honduras","Santa Lucia","Grenada","Dominica","Trinidad e Tobago","Barbados","Saint Vincent e Grenadine","Antigua e Barbuda","Saint Kitts e Nevis","Brasile","Argentina","Colombia","Chile","Perù","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Suriname"];


  List<String> get _allCountriesJA =>
      ["ドイツ","フランス","イギリス","スペイン","イタリア","ベルギー","オーストリア","ポルトガル","スイス","オランダ","アイルランド","モナコ","ルクセンブルク","リヒテンシュタイン","アンドラ","サンマリノ","バチカン","スウェーデン","デンマーク","フィンランド","ノルウェー","アイスランド","ポーランド","ギリシャ","クロアチア","ハンガリー","スロベニア","スロバキア","チェコ共和国","エストニア","ラトビア","リトアニア","ウクライナ","ロシア","ルーマニア","ブルガリア","セルビア","ボスニア・ヘルツェゴビナ","アルバニア","モンテネグロ","ベラルーシ","モルドバ","北マケドニア","キプロス","マルタ","イラン","トルコ","イラク","イスラエル","ジョージア","アルメニア","アゼルバイジャン","シリア","ヨルダン","レバノン","パレスチナ","サウジアラビア","アラブ首長国連邦","カタール","イエメン","オマーン","クウェート","バーレーン","カザフスタン","アフガニスタン","ウズベキスタン","タジキスタン","キルギス","トルクメニスタン","インド","パキスタン","ネパール","スリランカ","バングラデシュ","ブータン","モルディブ","タイ","インドネシア","ベトナム","マレーシア","フィリピン","シンガポール","ミャンマー","ラオス","カンボジア","ブルネイ","中国","日本","韓国","北朝鮮","モンゴル","オーストラリア","ニュージーランド","パプアニューギニア","東ティモール","フィジー","ソロモン諸島","バヌアツ","サモア","キリバス","ミクロネシア","トンガ","マーシャル諸島","パラオ","ナウル","ツバル","エジプト","アルジェリア","モロッコ","チュニジア","リビア","ナイジェリア","ガーナ","セネガル","マリ","カメルーン","ウガンダ","コートジボワール","アンゴラ","タンザニア","ニジェール","中央アフリカ共和国","コンゴ民主共和国","ブルキナファソ","マダガスカル","チャド","モザンビーク","ザンビア","ベナン","ギニア","トーゴ","ルワンダ","マラウイ","ブルンジ","リベリア","ジンバブエ","シエラレオネ","ガンビア","モーリタニア","ガボン","コンゴ","ギニアビサウ","赤道ギニア","モーリシャス","セイシェル","コモロ","カーボベルデ","サントメとプリンシペ","ソマリア","ケニア","エチオピア","スーダン","南スーダン","エリトリア","ジブチ","南アフリカ","ナミビア","ボツワナ","レソト","エスワティーニ","アメリカ","カナダ","メキシコ","キューバ","グアテマラ","コスタリカ","ベリーズ","バハマ","ジャマイカ","ハイチ","ドミニカ共和国","パナマ","エルサルバドル","ニカラグア","ホンジュラス","セントルシア","グレナダ","ドミニカ","トリニダード・トバゴ","バルバドス","セントビンセントおよびグレナディーン諸島","アンティグアバーブーダ","セントクリストファーネイビス","ブラジル","アルゼンチン","コロンビア","チリ","ペルー","ベネズエラ","エクアドル","ウルグアイ","ボリビア","パラグアイ","ガイアナ","スリナム"];


  List<String> get _allCountriesKO =>
      ["독일","프랑스","영국","스페인","이탈리아","벨기에","오스트리아","포르투갈","스위스","네덜란드","아일랜드","모나코","룩셈부르크","리히텐슈타인","안도라","산 마리노","바티칸 궁전","스웨덴","덴마크","핀란드","노르웨이","아이슬란드","폴란드","그리스","크로아티아","헝가리","슬로베니아","슬로바키아","체코 공화국","에스토니아","라트비아","리투아니아","우크라이나","러시아","루마니아","불가리아","세르비아","보스니아 헤르체고비나","알바니아","몬테네그로","벨라루스","몰도바","북 마케도니아","키프로스","몰타","이란","터키","이라크","이스라엘","그루지야","아르메니아","아제르바이잔","시리아","요르단","레바논","팔레스타인","사우디 아라비아","아랍 에미리트","카타르","예멘","오만","쿠웨이트","바레인","카자흐스탄","아프가니스탄","우즈베키스탄","타지키스탄","키르기스스탄","투르크 메니스탄","인도","파키스탄","네팔","스리랑카","방글라데시","부탄","몰디브","태국","인도네시아","베트남","말레이시아","필리핀","싱가포르","미얀마","라오스","캄보디아","브루나이","중국","일본","대한민국","북한","몽골리아","호주","뉴질랜드","파푸아 뉴기니","동 티모르","피지","솔로몬 제도","바누아투","사모아","키리바시","미크로네시아","통가","마샬 군도","팔라우","나우루","투발루","이집트","알제리","모로코","튀니지","리비아","나이지리아","가나","세네갈","말리","카메룬","우간다","아이보리 해안","앙골라","탄자니아","니제르","중앙 아프리카 공화국","콩고 민주 공화국","부키 나 파소","마다가스카르","차드","모잠비크","잠비아","베냉","기니","토고","르완다","말라위","부룬디","라이베리아","짐바브웨","시에라 리온","감비아","모리타니","가봉","콩고","기니 비사우","적도 기니","모리셔스","세이셸","코모로","카보 베르데","상토 메 프린시 페","소말리아","케냐","에티오피아","수단","남 수단","에리트레아","지부티","남아프리카","나미비아","보츠와나","레소토","에스와 티니","미국","캐나다","멕시코","쿠바","과테말라","코스타리카","벨리즈","바하마","자메이카","아이티","도미니카 공화국","파나마","엘살바도르","니카라과","온두라스","세인트 루시아","그레나다","도미니카","트리니다드 토바고","바베이도스","세인트 빈센트 그레나딘","앤티가 바부 다","세인트 키츠 네비스","브라질","아르헨티나","콜롬비아","칠레","페루","베네수엘라","에콰도르","우루과이","볼리비아","파라과이","가이아나","수리남"];


  List<String> get _allCountriesMS =>
      ["Jerman","Perancis","Inggeris","Sepanyol","Itali","Belgium","Austria","Portugal","Switzerland","Belanda","Ireland","Monaco","Luxembourg","Liechtenstein","Andorra","San Marino","Vatican","Sweden","Denmark","Finland","Norway","Iceland","Poland","Yunani","Croatia","Hungary","Slovenia","Slovakia","Republik Czech","Estonia","Latvia","Lithuania","Ukraine","Rusia","Romania","Bulgaria","Serbia","Bosnia dan Herzegovina","Albania","Montenegro","Belarus","Moldova","Macedonia Utara","Cyprus","Malta","Iran","Turki","Iraq","Israel","Georgia","Armenia","Azerbaijan","Syria","Jordan","Lubnan","Palestin","Arab Saudi","Emiriah Arab Bersatu","Qatar","Yaman","Oman","Kuwait","Bahrain","Kazakhstan","Afghanistan","Uzbekistan","Tajikistan","Kyrgyzstan","Turkmenistan","India","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldives","Thailand","Indonesia","Vietnam","Malaysia","Filipina","Singapura","Myanmar","Laos","Kemboja","Negara Brunei","China","Jepun","Korea Selatan","Korea Utara","Mongolia","Australia","New Zealand","Papua New Guinea","Timor Timur","Fiji","Kepulauan Solomon","Vanuatu","Samoa","Kiribati","Mikronesia","Tonga","Pulau Marshall","Palau","Nauru","Tuvalu","Mesir","Algeria","Maghribi","Tunisia","Libya","Nigeria","Ghana","Senegal","Mali","Kamerun","Uganda","Pantai Gading","Angola","Tanzania","Niger","Republik Afrika Tengah","Republik Demokratik Kongo","Burkina Faso","Madagascar","Chad","Mozambik","Zambia","Benin","Guinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Kongo","Guinea-Bissau","Guinea Khatulistiwa","Mauritius","Seychelles","Komoro","Cape Verde","São Tomé dan Príncipe","Somalia","Kenya","Ethiopia","Sudan","selatan Sudan","Eritrea","Djibouti","Afrika Selatan","Namibia","Botswana","Lesotho","Eswatini","Amerika Syarikat","Kanada","Mexico","Cuba","Guatemala","Costa rica","Belize","Bahama","Jamaica","Haiti","Republik Dominika","Panama","El Salvador","Nicaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad dan Tobago","Barbados","Saint Vincent dan Grenadines","Antigua dan Barbuda","Saint Kitts dan Nevis","Brazil","Argentina","Colombia","Cili","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Nama Surin"];


  List<String> get _allCountriesNL =>
      ["Duitsland","Frankrijk","Verenigd Koningkrijk","Spanje","Italië","België","Oostenrijk","Portugal","Zwitserland","Nederland","Ierland","Monaco","Luxemburg","Liechtenstein","Andorra","San Marino","Vaticaan","Zweden","Denemarken","Finland","Noorwegen","IJsland","Polen","Griekenland","Kroatië","Hongarije","Slovenië","Slowakije","Tsjechische Republiek","Estland","Letland","Litouwen","Oekraïne","Rusland","Roemenië","Bulgarije","Servië","Bosnië-Herzegovina","Albanië","Montenegro","Wit-Rusland","Moldavië","Noord-Macedonië","Cyprus","Malta","Iran","Turkije","Irak","Israël","Georgië","Armenië","Azerbeidzjan","Syrië","Jordanië","Libanon","Palestina","Saoedi-Arabië","Verenigde Arabische Emiraten","Qatar","Jemen","Oman","Koeweit","Bahrein","Kazachstan","Afghanistan","Oezbekistan","Tadzjikistan","Kirgizië","Turkmenistan","India","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldiven","Thailand","Indonesië","Vietnam","Maleisië","Filippijnen","Singapore","Myanmar","Laos","Cambodja","Brunei","China","Japan","Zuid-Korea","Noord Korea","Mongolië","Australië","Nieuw-Zeeland","Papoea-Nieuw-Guinea","Oost Timor","Fiji","Solomon eilanden","Vanuatu","Samoa","Kiribati","Micronesië","Tonga","Marshall eilanden","Palau","Nauru","Tuvalu","Egypte","Algerije","Marokko","Tunesië","Libië","Nigeria","Ghana","Senegal","Mali","Kameroen","Oeganda","Ivoorkust","Angola","Tanzania","Niger","Centraal Afrikaanse Republiek","Democratische Republiek Congo","Burkina Faso","Madagascar","Tsjaad","Mozambique","Zambia","Benin","Guinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritanië","Gabon","Congo","Guinee-Bissau","Equatoriaal-Guinea","Mauritius","Seychellen","Comoren","Kaapverdië","São Tomé en Principe","Somalië","Kenia","Ethiopië","Soedan","Zuid Soedan","Eritrea","Djibouti","Zuid-Afrika","Namibië","Botswana","Lesotho","Eswatini","Verenigde Staten","Canada","Mexico","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaica","Haïti","Dominicaanse Republiek","Panama","El Salvador","Nicaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad en Tobago","Barbados","Saint Vincent en de Grenadines","Antigua en Barbuda","Saint Kitts en Nevis","Brazilië","Argentinië","Colombia","Chili","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Suriname"];


  List<String> get _allCountriesNB =>
      ["Tyskland","Frankrike","Storbritannia","Spania","Italia","Belgia","Østerrike","Portugal","Sveits","Nederland","Irland","Monaco","Luxembourg","Liechtenstein","Andorra","San Marino","Vatikanet","Sverige","Danmark","Finland","Norge","Island","Polen","Hellas","Kroatia","Ungarn","Slovenia","Slovakia","Tsjekkisk Republikk","Estland","Latvia","Litauen","Ukraina","Russland","Romania","Bulgaria","Serbia","Bosnia og Herzegovina","albania","Montenegro","Hviterussland","Moldova","Nord-Makedonia","Kypros","Malta","Iran","Tyrkia","Irak","Israel","Georgia","Armenia","Aserbajdsjan","Syria","Jordan","Libanon","Palestina","Saudi-Arabia","De forente arabiske emirater","Qatar","Jemen","Oman","Kuwait","Bahrain","Kasakhstan","Afghanistan","Usbekistan","Tadsjikistan","Kirgisistan","Turkmenistan","India","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldivene","Thailand","Indonesia","Vietnam","Malaysia","Filippinene","Singapore","Myanmar","Laos","Kambodsja","Brunei","Kina","Japan","Sør-Korea","Nord-Korea","Mongolia","Australia","New Zealand","Papua Ny-Guinea","Øst-Timor","Fiji","Solomon øyene","Vanuatu","Samoa","Kiribati","Mikronesia","Tonga","Marshalløyene","Palau","Nauru","Tuvalu","Egypt","Algerie","Marokko","Tunisia","Libya","Nigeria","Ghana","Senegal","Mali","Kamerun","Uganda","Elfenbenskysten","Angola","Tanzania","Niger","Den sentralafrikanske republikk","Den demokratiske republikken Kongo","Burkina Faso","Madagaskar","Tsjad","Mosambik","Zambia","Benin","Guinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Kongo","Guinea-Bissau","Ekvatorial-Guinea","Mauritius","Seychellene","Komorene","Kapp Verde","São Tomé og Príncipe","Somalia","Kenya","Etiopia","Sudan","Sør-Sudan","Eritrea","Djibouti","Sør-Afrika","Namibia","Botswana","Lesotho","Eswatini","Forente Stater","Canada","Mexico","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaica","Haiti","den dominikanske republikk","Panama","El Salvador","Nicaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad og Tobago","Barbados","Saint Vincent og Grenadinene","Antigua og Barbuda","Saint Kitts og Nevis","Brasil","Argentina","Colombia","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Surinam"];


  List<String> get _allCountriesPL =>
      ["Niemcy","Francja","Zjednoczone Królestwo","Hiszpania","Włochy","Belgia","Austria","Portugalia","Szwajcaria","Holandia","Irlandia","Monako","Luksemburg","Liechtenstein","Andora","San Marino","Watykan","Szwecja","Dania","Finlandia","Norwegia","Islandia","Polska","Grecja","Chorwacja","Węgry","Słowenia","Słowacja","Republika Czeska","Estonia","Łotwa","Litwa","Ukraina","Rosja","Rumunia","Bułgaria","Serbia","Bośnia i Hercegowina","Albania","Czarnogóra","Białoruś","Moldova","Macedonia Północna","Cypr","Malta","Iran","Turcja","Irak","Izrael","Gruzja","Armenia","Azerbejdżan","Syria","Jordania","Liban","Palestyna","Arabia Saudyjska","Zjednoczone Emiraty Arabskie","Katar","Jemen","Oman","Kuwejt","Bahrajn","Kazachstan","Afganistan","Uzbekistan","Tadżykistan","Kirgistan","Turkmenia","Indie","Pakistan","Nepal","Sri Lanka","Bangladesz","Bhutan","Malediwy","Tajlandia","Indonezja","Wietnam","Malezja","Filipiny","Singapur","Myanmar","Laos","Kambodża","Brunei","Chiny","Japonia","Korea Południowa","Korea Północna","Mongolia","Australia","Nowa Zelandia","Papua Nowa Gwinea","Wschodni Timor","Fidżi","Wyspy Salomona","Vanuatu","Samoa","Kiribati","Mikronezja","Tonga","Wyspy Marshalla","Palau","Nauru","Tuvalu","Egipt","Algieria","Maroko","Tunezja","Libia","Nigeria","Ghana","Senegal","Mali","Kamerun","Uganda","Wybrzeże Kości Słoniowej","Angola","Tanzania","Niger","Republika Środkowoafrykańska","Demokratyczna Republika Konga","Burkina Faso","Madagaskar","Czad","Mozambik","Zambia","Benin","Gwinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauretania","Gabon","Kongo","Gwinea Bissau","Gwinea Równikowa","Mauritius","Seszele","Komory","Wyspy Zielonego Przylądka","Wyspy Świętego Tomasza i Książęca","Somali","Kenia","Etiopia","Sudan","Sudan Południowy","Erytrea","Dżibuti","Afryka Południowa","Namibia","Botswana","Lesotho","Eswatini","Stany Zjednoczone","Kanada","Meksyk","Kuba","Gwatemala","Kostaryka","Belize","Bahamy","Jamajka","Haiti","Republika Dominikany","Panama","Salwador","Nikaragua","Honduras","święta Lucia","Grenada","Dominika","Trynidad i Tobago","Barbados","Saint Vincent i Grenadyny","Antigua i Barbuda","Saint Kitts i Nevis","Brazylia","Argentyna","Kolumbia","Chile","Peru","Wenezuela","Ekwador","Urugwaj","Boliwia","Paragwaj","Gujana","Surinam"];


  List<String> get _allCountriesPT =>
      ["Alemanha","França","Reino Unido","Espanha","Itália","Bélgica","Áustria","Portugal","Suíça","Países Baixos","Irlanda","Mônaco","Luxemburgo","Liechtenstein","Andorra","San Marino","Vaticano","Suécia","Dinamarca","Finlândia","Noruega","Islândia","Polônia","Grécia","Croácia","Hungria","Eslovênia","Eslováquia","República Checa","Estônia","Letônia","Lituânia","Ucrânia","Rússia","Romênia","Bulgária","Sérvia","Bósnia e Herzegovina","Albânia","Montenegro","Bielorrússia","Moldova","Macedônia do Norte","Chipre","Malta","Irã","Turquia","Iraque","Israel","Geórgia","Armênia","Azerbaijão","Síria","Jordânia","Líbano","Palestina","Arábia Saudita","Emirados Árabes Unidos","Catar","Iémen","Omã","Kuwait","Barém","Cazaquistão","Afeganistão","Usbequistão","Tajiquistão","Quirguistão","Turquemenistão","Índia","Paquistão","Nepal","Sri Lanka","Bangladesh","Butão","Maldivas","Tailândia","Indonésia","Vietnã","Malásia","Filipinas","Cingapura","Myanmar","Laos","Camboja","Brunei","China","Japão","Coreia do Sul","Coreia do Norte","Mongólia","Austrália","Nova Zelândia","Papua Nova Guiné","Timor Leste","Fiji","Ilhas Salomão","Vanuatu","Samoa","Kiribati","Micronésia","Tonga","Ilhas Marshall","Palau","Nauru","Tuvalu","Egito","Argélia","Marrocos","Tunísia","Líbia","Nigéria","Gana","Senegal","Mali","Camarões","Uganda","Costa do Marfim","Angola","Tanzânia","Níger","República Centro-Africana","República Democrática do Congo","Burkina Faso","Madagáscar","Chade","Moçambique","Zâmbia","Benin","Guiné","Togo","Ruanda","Malawi","Burundi","Libéria","Zimbábue","Serra Leoa","Gâmbia","Mauritânia","Gabão","Congo","Guiné-Bissau","Guiné Equatorial","Maurícia","Seychelles","Comores","cabo Verde","São Tomé e Príncipe","Somália","Quênia","Etiópia","Sudão","Sudão do Sul","Eritreia","Djibuti","África do Sul","Namíbia","Botsuana","Lesoto","Eswatini","Estados Unidos","Canadá","México","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaica","Haiti","República Dominicana","Panamá","El Salvador","Nicarágua","Honduras","Santa Lúcia","Granada","Dominica","Trindade e Tobago","Barbados","São Vicente e Granadinas","Antígua e Barbuda","São Cristóvão e Nevis","Brasil","Argentina","Colômbia","Chile","Peru","Venezuela","Equador","Uruguai","Bolívia","Paraguai","Guiana","Suriname"];


  List<String> get _allCountriesRO =>
      ["Germania","Franţa","Regatul Unit","Spania","Italia","Belgia","Austria","Portugalia","Elveţia","Olanda","Irlanda","Monaco","Luxemburg","Liechtenstein","Andorra","San Marino","Vatican","Suedia","Danemarca","Finlanda","Norvegia","Islanda","Polonia","Grecia","Croaţia","Ungaria","Slovenia","Slovacia","Republica Cehă","Estonia","Letonia","Lituania","Ucraina","Rusia","România","Bulgaria","Serbia","Bosnia si Hertegovina","Albania","Muntenegru","Belarus","Moldova","Macedonia de Nord","Cipru","Malta","Iran","Turcia","Irak","Israel","Georgia","Armenia","Azerbaidjan","Siria","Iordania","Liban","Palestina","Arabia Saudită","Emiratele Arabe Unite","Qatar","Yemen","Oman","Kuweit","Bahrain","Kazahstan","Afganistan","Uzbekistan","Tadjikistan","Kârgâzstan","Turkmenistan","India","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldive","Tailanda","Indonezia","Vietnam","Malaezia","Filipine","Singapore","Myanmar","Laos","Cambogia","Brunei","China","Japonia","Coreea de Sud","Coreea de Nord","Mongolia","Australia","Noua Zeelanda","Papua Noua Guinee","Timorul de Est","Fiji","Insulele Solomon","Vanuatu","Samoa","Kiribati","Micronezia","Tonga","Insulele Marshall","Palau","Nauru","Tuvalu","Egipt","Algeria","Maroc","Tunisia","Libia","Nigeria","Ghana","Senegal","Mali","Camerun","Uganda","Coasta de Fildes","Angola","Tanzania","Niger","Republica Centrafricană","Republica Democrata din Congo","Burkina Faso","Madagascar","Ciad","Mozambic","Zambia","Benin","Guineea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Congo","Guineea-Bissau","Guineea Ecuatorială","Mauritius","Seychelles","Comore","Republica Capului Verde","Sao Tome și Principe","Somalia","Kenia","Etiopia","Sudan","Sudanul de Sud","Eritreea","Djibouti","Africa de Sud","Namibia","Botswana","Lesotho","Eswatini","Statele Unite","Canada","Mexic","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaica","Haiti","Republica Dominicană","Panama","El Salvador","Nicaragua","Honduras","Sfânta Lucia","Grenada","Dominica","Trinidad și Tobago","Barbados","Sfântul Vincent și Grenadine","Antigua si Barbuda","Saint Kitts și Nevis","Brazilia","Argentina","Columbia","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Surinam"];


  List<String> get _allCountriesRU =>
      ["Германия","Франция","объединенное Королевство","Испания","Италия","Бельгия","Австрия","Португалия","Швейцария","Нидерланды","Ирландия","Монако","Люксембург","Лихтенштейн","андорра","Сан-Марино","Ватикан","Швеция","Дания","Финляндия","Норвегия","Исландия","Польша","Греция","Хорватия","Венгрия","Словения","Словакия","Республика Чехия","Эстония","Латвия","Литва","Украина","Россия","Румыния","Болгария","Сербия","Босния и Герцеговина","Албания","Черногория","Беларусь","Молдова","Северная Македония","Кипр","Мальта","Иран","Турция","Ирак","Израиль","Грузия","Армения","Азербайджан","Сирия","Иордания","Ливан","Палестина","Саудовская Аравия","Объединенные Арабские Эмираты","Катар","Йемен","Оман","Кувейт","Бахрейн","Казахстан","Афганистан","Узбекистан","Таджикистан","Киргизия","Туркменистан","Индия","Пакистан","Непал","Шри-Ланка","Бангладеш","Бутан","Мальдивы","Таиланд","Индонезия","Вьетнам","Малайзия","Филиппины","Сингапур","Мьянма","Лаос","Камбоджа","Бруней","Китай","Япония","Южная Корея","Северная Корея","Монголия","Австралия","Новая Зеландия","Папуа - Новая Гвинея","Восточный Тимор","Фиджи","Соломоновы острова","Вануату","Самоа","Кирибати","Микронезия","Тонга","Маршалловы острова","Палау","Науру","Тувалу","Египет","Алжир","Марокко","Тунис","Ливия","Нигерия","Гана","Сенегал","Мали","Камерун","Уганда","Кот-д'Ивуар","Ангола","Танзания","Нигер","Центрально-Африканская Республика","Демократическая Республика Конго","Буркина-Фасо","Мадагаскар","Чад","Мозамбик","Замбия","Бенин","Гвинея","Того","Руанда","Малави","Бурунди","Либерия","Зимбабве","Сьерра-Леоне","Гамбия","Мавритания","Габон","Конго","Гвинея-Бисау","Экваториальная Гвинея","Маврикий","Сейшельские острова","Коморские острова","Кабо-Верде","Сан-Томе и Принсипи","Сомали","Кения","Эфиопия","Судан","южный Судан","Эритрея","Джибути","Южная Африка","Намибия","Ботсвана","Лесото","Эсватини","Соединенные Штаты","Канада","Мексика","Куба","Гватемала","Коста Рика","Белиз","Багамские о-ва","Ямайка","Гаити","Доминиканская Респблика","Панама","Сальвадор","Никарагуа","Гондурас","Сент-Люсия","Гренада","Доминика","Тринидад и Тобаго","Барбадос","Святой Винсент и Гренадины","Антигуа и Барбуда","Сент-Китс и Невис","Бразилия","Аргентина","Колумбия","Чили","Перу","Венесуэла","Эквадор","Уругвай","Боливия","Парагвай","Гайана","Суринам"];


  List<String> get _allCountriesSK =>
      ["Nemecko","Francúzsko","Spojene kralovstvo","španielsko","Taliansko","Belgicko","Rakúsko","Portugalsko","švajčiarsko","Holandsko","Írsko","Monaco","Luxembursko","Lichtenštajnsko","Andorra","San Maríno","Vatikán","Švédsko","Dánsko","Fínsko","Nórsko","Island","Poľsko","Grécko","Chorvátsko","maďarsko","Slovinsko","Slovensko","Česká republika","Estónsko","Lotyšsko","Litva","Ukrajina","Rusko","Rumunsko","Bulharsko","Srbsko","Bosna a Hercegovina","Albánsko","čierna Hora","bielorusko","Moldavsko","Severná Macedónsko","Cyprus","Malta","Irán","Turecko","Irak","Izrael","Georgia","Arménsko","Azerbajdžan","Sýria","Jordán","Libanon","Palestína","Saudská Arábia","Spojené Arabské Emiráty","katar","jemen","Omán","Kuvajt","Bahrain","Kazachstan","Afganistan","Uzbekistan","Tadžikistan","Kirgizsko","Turkménsko","India","Pakistan","Nepál","Srí Lanka","Bangladéš","Bhután","Maledivy","Thailand","Indonézia","Vietnam","Malajzia","Filipíny","Singapore","Mjanmarsko","Laos","Kambodža","Brunej","Čína","Japonsko","Južná Kórea","Severná Kórea","Mongolsko","Austrália","Nový Zéland","Papua-Nová Guinea","Východný Timor","Fiji","Šalamúnove ostrovy","Vanuatu","Samoa","Kiribati","Mikronézia","Tonga","Maršalove ostrovy","Palau","Nauru","Tuvalu","egypt","Alžírsko","Maroko","Tunisko","Líbya","Nigéria","Ghana","Senegal","Mali","Kamerun","uganda","Pobrežie Slonoviny","Angola","Tanzánia","Niger","Stredoafrická republika","Konžská demokratická republika","Burkina Faso","madagaskar","Chad","Mozambik","Zambia","Benin","Guinea","Togo","Rwanda","Malawi","Burundi","Libéria","Zimbabwe","Sierra Leone","Gambia","Mauritánia","Gabon","Congo","Guinea-Bissau","rovníková Guinea","Mauritius","Seychely","komory","Cape Verde","Svätý Tomáš a Princov ostrov","Somálsko","Keňa","Etiópia","Sudan","Južný Sudán","Eritrea","Džibutsko","južná Afrika","Namíbia","Botswana","Lesotho","Eswatini","Spojené štáty","Kanada","Mexiko","Kuba","Guatemala","Kostarika","belize","Bahamské ostrovy","jamaica","haiti","Dominikánska republika","Panama","El Salvador","Nikaragua","honduras","Svätá Lucia","Grenada","Dominica","Trinidad a Tobago","Barbados","Svätý Vincent a Grenadíny","Antigua a Barbuda","Svätý Krištof a Nevis","Brazília","Argentína","Kolumbia","Čile","peru","Venezuela","Ekvádor","Uruguaj","Bolívia","Paraguaj","Guyana","Surinam"];


  List<String> get _allCountriesSL =>
      ["Nemčija","Francija","Združeno kraljestvo","Španija","Italija","Belgija","Avstrija","Portugalska","Švica","Nizozemska","Irska","Monako","Luksemburg","Liechtenstein","Andora","San Marino","Vatikan","Švedska","Danska","Finska","Norveška","Islandija","Poljska","Grčija","Hrvaška","Madžarska","Slovenija","Slovaška","Češka","Estonija","Latvija","Litva","Ukrajina","Rusija","Romunija","Bolgarija","Srbija","Bosna in Hercegovina","Albanija","Črna gora","Belorusija","Moldavija","Severna Makedonija","Ciper","Malta","Iran","Turčija","Irak","Izrael","Gruzija","Armenija","Azerbajdžan","Sirija","Jordan","Libanon","Palestina","Savdska Arabija","Združeni Arabski Emirati","Katar","Jemen","Oman","Kuvajt","Bahrajn","Kazahstan","Afganistan","Uzbekistan","Tadžikistan","Kirgizistan","Turkmenistan","Indija","Pakistan","Nepal","Šrilanka","Bangladeš","Butan","Maldivi","Tajska","Indonezija","Vietnam","Malezija","Filipini","Singapur","Mjanmar","Laos","Kambodža","Brunej","Kitajska","Japonska","Južna Koreja","Severna Koreja","Mongolija","Avstralija","Nova Zelandija","Papua Nova Gvineja","Vzhodni Timor","Fidži","Salomonovi otoki","Vanuatu","Samoa","Kiribati","Mikronezija","Tonga","Marshallovi otoki","Palau","Nauru","Tuvalu","Egipt","Alžirija","Maroko","Tunizija","Libija","Nigerija","Gana","Senegal","Mali","Kamerun","Uganda","Slonokoščena obala","Angola","Tanzanija","Niger","Srednjeafriška republika","Vzhodni Kongo","Burkina Faso","Madagaskar","Čad","Mozambik","Zambija","Benin","Gvineja","Togo","Ruanda","Malavi","Burundi","Liberija","Zimbabve","Sierra Leone","Gambija","Mavretanija","Gabon","Kongo","Gvineja Bissau","Ekvatorialna Gvineja","Mavricij","Sejšeli","Komori","Zelenortski otoki","São Tome in Principe","Somalija","Kenija","Etiopija","Sudan","Južni Sudan","Eritreja","Džibuti","Južna Afrika","Namibija","Bocvana","Lesoto","Eswatini","Združene države","Kanada","Mehika","Kuba","Gvatemala","Kostarika","Belize","Bahami","Jamajka","Haiti","Dominikanska republika","Panama","El Salvador","Nikaragva","Honduras","Sveta Lucija","Grenada","Dominika","Trinidad in Tobago","Barbados","Sveti Vincent in Grenadine","Antigva in Barbuda","Saint Kitts in Nevis","Brazilija","Argentina","Kolumbija","Čile","Peru","Venezuela","Ekvador","Urugvaj","Bolivija","Paragvaj","Gvajana","Surinam"];


  List<String> get _allCountriesSR =>
      ["Немачка","Француска","Велика Британија","Спаин","Италија","Белгија","Аустрија","Португал","Швајцарска","Нидерланды","Ирска","Монако","Луксембург","Лихтенштајн","Андорра","Сан-Марино","Ватикан","Шведска","Данска","Финланд","Норвешка","Исланд","Пољска","Грчка","Хрватска","Мађарска","Словенија","Словачка","Чешка","Естонија","Летонија","Литванија","Украјина","Русија","Румунија","Бугарска","Србија","Босна и Херцеговина","Албанија","Црна Гора","Белорусија","Молдавија","Северна Македонија","Кипар","Малта","Иран","Турска","Ирак","Израел","Георгиа","Јерменија","Азербејџан","Сирија","Јордан","Либан","Палестине","Саудијска Арабија","Уједињени арапски Емирати","Катар","Јемен","Оман","Кувајт","Бахреин","Казахстан","Авганистан","Узбекистан","Таџикистан","Киргистан","Туркменистан","Индија","Пакистан","Непал","Шри Ланка","Бангладеш","Бутан","Малдиви","Тајланд","Индонезија","Вијетнам","Малезија","Филипини","Сингапур","Мјанмар","Лаос","Камбоџа","Брунеј","Кина","Јапан","Јужна Кореја","Северна Кореја","Монголија","Аустралија","Нови Зеланд","Папуа Нова Гвинеја","Источни Тимор","Фији","Соломонска острва","Вануату","Самоа","Кирибати","Мицронесиа","Тонга","Маршалска острва","Палау","Науру","Тувалу","Египат","Алжир","Мароко","Тунис","Либија","Нигериа","Гана","Сенегал","Мали","Камерун","Уганда","Обала Слоноваче","Ангола","Танзанија","Нигер","Централна Афричка Република","Демократска Република Конго","Буркина Фасо","Мадагасцар","Чад","Мозамбик","Замбија","Бенин","Гвинеја","Того","Руанда","Малави","Бурунди","Либерија","Зимбабве","Сијера Леоне","Гамбија","Мауританија","Габон","Конго","Гвинеја Бисао","Екваторијална Гвинеја","Маурицијус","Сејшели","Цоморос","Цапе Верде","Сао Томе и Принцип","Сомалија","Кенија","Етиопија","Судан","Јужни Судан","Еритреја","Џибути","Јужна Африка","Намибија","Боцвана","Лесото","Есватини","Америка","Канада","Мексико","Куба","Гватемала","Костарика","Белизе","Бахами","Јамајка","Хаити","Доминиканска република","Панама","Ел Салвадор","Никарагва","Хондурас","Света Луција","Гренада","Доминика","Тринидад и Тобаго","Барбадос","Свети Винцент и Гренадини","Антигва и Барбуда","Сент Китс и Невис","Бразил","Аргентина","Колумбија","Чиле","Перу","Венецуела","Еквадор","Уругвај","Боливија","Парагвај","Гвајана","Суринам"];


  List<String> get _allCountriesSV =>
      ["Tyskland","Frankrike","Storbritannien","Spanien","Italien","belgien","österrike","portugal","schweiz","nederländerna","irland","Monaco","luxemburg","liechtenstein","andorra","San Marino","Vatikanen","Sverige","Danmark","finland","Norge","Island","polen","Grekland","kroatien","Ungern","slovenien","Slovakien","Tjeckien","estland","lettland","litauen","Ukraina","ryssland","rumänien","bulgarien","Serbien","Bosnien och Hercegovina","Albanien","Montenegro","Vitryssland","Moldavien","Norra Makedonien","cypern","Malta","Iran","Turkiet","irak","Israel","georgien","Armenien","Azerbajdzjan","syrien","Jordanien","libanon","palestina","Saudiarabien","Förenade arabemiraten","Qatar","jemen","oman","kuwait","Bahrain","Kazakstan","Afghanistan","Uzbekistan","Tadzjikistan","Kirgizistan","Turkmenistan","Indien","pakistan","nepal","Sri Lanka","Bangladesh","bhutan","Maldiverna","Thailand","indonesien","vietnam","malaysia","filippinerna","Singapore","Myanmar","laos","Kambodja","Brunei","Kina","Japan","Sydkorea","Nordkorea","mongoliet","Australien","Nya Zeeland","Papua Nya Guinea","Östtimor","Fiji","Salomonöarna","Vanuatu","Samoa","Kiribati","Mikronesien","tonga","Marshallöarna","Palau","Nauru","Tuvalu","egypten","algeriet","Marocko","tunisien","libyen","nigeria","ghana","Senegal","Mali","Kamerun","Uganda","Elfenbenskusten","Angola","Tanzania","Niger","Centralafrikanska republiken","Demokratiska republiken Kongo","Burkina Faso","madagaskar","Chad","Moçambique","zambia","Benin","Guinea","Togo","Rwanda","Malawi","burundi","liberia","Zimbabwe","Sierra Leone","Gambia","Mauretanien","gabon","kongo","GUINEA-BISSAU","Ekvatorialguinea","Mauritius","Seychellerna","Komorerna","Cap Verde","São Tomé och Príncipe","Somalia","kenya","etiopien","Sudan","södra Sudan","Eritrea","Djibouti","Sydafrika","Namibia","botswana","lesotho","Eswatini","Förenta staterna","kanada","mexico","kuba","guatemala","Costa Rica","Belize","Bahamas","Jamaica","haiti","Dominikanska republiken","Panama","El Salvador","nicaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad och Tobago","Barbados","Saint Vincent och Grenadinerna","Antigua och Barbuda","Saint Kitts och Nevis","Brasilien","argentina","colombia","Chile","peru","Venezuela","ecuador","Uruguay","Bolivia","paraguay","Guyana","Surinam"];


  List<String> get _allCountriesTH =>
      ["ประเทศเยอรมัน","ฝรั่งเศส","สหราชอาณาจักร","สเปน","อิตาลี","เบลเยียม","ออสเตรีย","โปรตุเกส","ประเทศสวิสเซอร์แลนด์","เนเธอร์แลนด์","ไอร์แลนด์","โมนาโก","ลักเซมเบิร์ก","ประเทศลีชเทินชไตน์","อันดอร์รา","ซานมาริโน","วาติกัน","สวีเดน","เดนมาร์ก","ฟินแลนด์","นอร์เวย์","ประเทศไอซ์แลนด์","โปแลนด์","กรีซ","โครเอเชีย","ฮังการี","สโลวีเนีย","สโลวะเกีย","ประเทศเช็กเกีย","เอสโตเนีย","ลัตเวีย","ประเทศลิธัวเนีย","ยูเครน","รัสเซีย","โรมาเนีย","บัลแกเรีย","เซอร์เบีย","บอสเนียและเฮอร์เซโก","แอลเบเนีย","มอนเตเนโก","เบลารุส","มอลโดวา","ประเทศมาซิโดเนียเหนือ","ประเทศไซปรัส","ประเทศมอลตา","อิหร่าน","ประเทศตุรกี","อิรัก","อิสราเอล","จอร์เจีย","อาร์เมเนีย","อาเซอร์ไบจาน","ซีเรีย","จอร์แดน","เลบานอน","ปาเลสไตน์","ซาอุดิอาราเบีย","สหรัฐอาหรับเอมิเรตส์","กาตาร์","เยเมน","โอมาน","คูเวต","บาห์เรน","คาซัคสถาน","อัฟกานิสถาน","อุซเบกิ","ทาจิกิสถาน","คีร์กีสถาน","เติร์กเมนิสถาน","อินเดีย","ปากีสถาน","ประเทศเนปาล","ศรีลังกา","ประเทศบังกลาเทศ","ภูฏาน","มัลดีฟส์","ประเทศไทย","อินโดนีเซีย","เวียดนาม","ประเทศมาเลเซีย","ฟิลิปปินส์","สิงคโปร์","พม่า","ลาว","กัมพูชา","บรูไน","ประเทศจีน","ประเทศญี่ปุ่น","เกาหลีใต้","เกาหลีเหนือ","ประเทศมองโกเลีย","ออสเตรเลีย","ประเทศนิวซีแลนด์","ปาปัวนิวกินี","ประเทศติมอร์-เลสเต","ฟิจิ","หมู่เกาะโซโลมอน","วานูอาตู","ซามัว","ประเทศคิริบาส","ไมโครนีเซีย","ตองกา","หมู่เกาะมาร์แชลล์","ปาเลา","ประเทศนาอูรู","ตูวาลู","อียิปต์","ประเทศแอลจีเรีย","โมร็อกโก","ตูนิเซีย","ประเทศลิบยา","ประเทศไนจีเรีย","ประเทศกานา","ประเทศเซเนกัล","มาลี","แคเมอรูน","ยูกันดา","ประเทศโกตดิวัวร์","แองโกลา","ประเทศแทนซาเนีย","ประเทศไนเธอร์","สาธารณรัฐแอฟริกากลาง","สาธารณรัฐประชาธิปไตยคองโก","บูร์กินาฟาโซ","มาดากัสการ์","ชาด","ประเทศโมซัมบิก","แซมเบีย","ประเทศเบนิน","ประเทศกินี","โตโก","รวันดา","มาลาวี","บุรุนดี","ประเทศไลบีเรีย","ประเทศซิมบับเว","เซียร์ราลีโอน","แกมเบีย","ประเทศมอริเตเนีย","ประเทศกาบอง","ประเทศคองโก","กินีบิสเซา","อิเควทอเรียลกินี","มอริเชียส","เซเชลส์","คอโมโรส","เคปเวิร์ด","เซาตูเมและปรินซิปี","โซมาเลีย","ประเทศเคนย่า","สาธารณรัฐเอธิโอเปีย","ซูดาน","ซูดานใต้","เอริเทรี","จิบูตี","แอฟริกาใต้","นามิเบีย","บอตสวานา","เลโซโท","ประเทศเอสวาตีนี","สหรัฐ","แคนาดา","เม็กซิโก","คิวบา","กัวเตมาลา","คอสตาริกา","เบลีซ","บาฮามาส","เกาะจาเมกา","ไฮติ","สาธารณรัฐโดมินิกัน","ปานามา","เอลซัลวาดอร์","นิการากัว","ฮอนดูรัส","เซนต์ลูเซีย","เกรเนดา","โดมินิกา","ตรินิแดดและโตเบโก","บาร์เบโดส","เซนต์วินเซนต์และเกรนาดีนส์","แอนติกาและบาร์บูดา","เซนต์คิตส์และเนวิส","บราซิล","อาร์เจนตินา","โคลอมเบีย","ชิลี","เปรู","เวเนซุเอลา","เอกวาดอร์","อุรุกวัย","โบลิเวีย","ประเทศปารากวัย","กายอานา","ซูรินาเม"];


  List<String> get _allCountriesTR =>
      ["Almanya","Fransa","Birleşik Krallık","ispanya","İtalya","Belçika","Avusturya","Portekiz","İsviçre","Hollanda","İrlanda","Monako","Lüksemburg","Lihtenştayn","Andorra","San Marino","Vatikan","İsveç","Danimarka","Finlandiya","Norveç","İzlanda","Polonya","Yunanistan","Hırvatistan","Macaristan","Slovenya","Slovakya","Çek Cumhuriyeti","Estonya","Letonya","Litvanya","Ukrayna","Rusya","Romanya","Bulgaristan","Sırbistan","Bosna Hersek","Arnavutluk","Karadağ","Belarus","Moldova","Kuzey Makedonya","Kıbrıs","Malta","İran","Türkiye","Irak","İsrail","Gürcistan","Ermenistan","Azerbeycan","Suriye","Ürdün","Lübnan","Filistin","Suudi Arabistan","Birleşik Arap Emirlikleri","Katar","Yemen","Umman","Kuveyt","Bahreyn","Kazakistan","Afganistan","Özbekistan","Tacikistan","Kırgızistan","Türkmenistan","Hindistan","Pakistan","Nepal","Sri Lanka","Bangladeş","Butan","Maldivler","Tayland","Endonezya","Vietnam","Malezya","Filipinler","Singapur","Myanmar","Laos","Kamboçya","Brunei","Çin","Japonya","Güney Kore","Kuzey Kore","Moğolistan","Avustralya","Yeni Zelanda","Papua Yeni Gine","Doğu Timor","Fiji","Solomon Adaları","Vanuatu","Samoa","Kiribati","Mikronezya","Tonga","Marşal Adaları","Palau","Nauru","Tuvalu","Mısır","Cezayir","Fas","Tunus","Libya","Nijerya","Gana","Senegal","Mali","Kamerun","Uganda","Fildişi Sahili","Angora","Tanzanya","Nijer","Orta Afrika Cumhuriyeti","Kongo Demokratik Cumhuriyeti","Burkina Faso","Madagaskar","Çad","Mozambik","Zambiya","Benin","Gine","Togo","Ruanda","Malawi","Burundi","Liberya","Zimbabve","Sierra Leone","Gambiya","Moritanya","Gabon","Kongo","Gine-Bissau","Ekvator Ginesi","Mauritius","Seyşeller","Komorlar","Yeşil Burun Adaları","São Tomé ve Príncipe","Somali","Kenya","Etiyopya","Sudan","Güney Sudan","Eritre","Cibuti","Güney Afrika","Namibya","Botsvana","Lesotho","Eswatini","Amerika Birleşik Devletleri","Kanada","Meksika","Küba","Guatemala","Kosta Rika","Belize","Bahamalar","Jamaika","Haiti","Dominik Cumhuriyeti","Panama","El Salvador","Nikaragua","Honduras","Saint Lucia","Grenada","Dominika","Trinidad ve Tobago","Barbados","Saint Vincent ve Grenadinler","Antigua ve Barbuda","Saint Kitts ve Nevis","Brezilya","Arjantin","Kolombiya","Şili","Peru","Venezuela","Ekvador","Uruguay","Bolivya","Paraguay","Guyana","Surinam"];


  List<String> get _allCountriesUK =>
      ["Німеччина","Франція","Велика Британія","Іспанія","Італія","Бельгія","Австрія","Португалія","Швейцарія","Нідерланди","Ірландія","Монако","Люксембург","Ліхтенштейн","Андорра","Сан-Марино","Ватикан","Швеція","Данія","Фінляндія","Норвегія","Ісландія","Польща","Греція","Хорватія","Угорщина","Словенія","Словаччина","Чеська Республіка","Естонія","Латвія","Литва","Україна","Росія","Румунія","Болгарія","Сербія","Боснія і Герцеговина","Албанія","Чорногорія","Білорусь","Молдова","Північна Македонія","Кіпр","Мальта","Іран","Туреччина","Ірак","Ізраїль","Грузія","Вірменія","Азербайджан","Сирія","Йорданія","Ліван","Палестина","Саудівська Аравія","Об'єднані Арабські Емірати","Катар","Ємен","Оман","Кувейт","Бахрейн","Казахстан","Афганістан","Узбекистан","Таджикистан","Киргизстан","Туркменістан","Індія","Пакистан","Непал","Шрі Ланка","Бангладеш","Бутан","Мальдіви","Таїланд","Індонезія","В'єтнам","Малайзія","Філіппіни","Сінгапур","М'янма","Лаос","Камбоджа","Бруней","Китай","Японія","Південна Корея","Північна Корея","Монголія","Австралія","Нова Зеландія","Папуа-Нова Гвінея","Східний Тимор","Фіджі","Соломонові острови","Вануату","Самоа","Кірібаті","Мікронезія","Тонга","Маршаллові острови","Палау","Науру","Тувалу","Єгипет","Алжир","Марокко","Туніс","Лівія","Нігерія","Гана","Сенегал","Малі","Камерун","Уганда","Берег Слонової Кістки","Ангола","Танзанія","Нігер","Центральноафриканська республіка","Демократична Республіка Конго","Буркіна-Фасо","Мадагаскар","Чад","Мозамбік","Замбія","Бенін","Гвінея","Того","Руанда","Малаві","Бурунді","Ліберія","Зімбабве","Сьєрра-Леоне","Гамбія","Мавританія","Габон","Конго","Гвінея-Бісау","Екваторіальна Гвінея","Маврикій","Сейшельські острови","Коморські острови","Кабо-Верде","Сан-Томе та Принсіпі","Сомалі","Кенія","Ефіопія","Судан","Південний Судан","Еритрея","Джибуті","Південна Африка","Намібія","Ботсвана","Лесото","Есватині","Сполучені Штати","Канада","Мексика","Куба","Гватемала","Коста-Ріка","Беліз","Багами","Ямайка","Гаїті","Домініканська республіка","Панама","Сальвадор","Нікарагуа","Гондурас","Сент-Люсія","Гренада","Домініка","Тринідад і Тобаго","Барбадос","Сент-Вінсент і Гренадини","Антигуа та Барбуда","Сент-Кітс і Невіс","Бразилія","Аргентина","Колумбія","Чилі","Перу","Венесуела","Еквадор","Уругвай","Болівія","Парагвай","Гайана","Сурінам"];


  List<String> get _allCountriesVI =>
      ["Đức","Pháp","Vương quốc Anh","Tây Ban Nha","Ý","Bỉ","Áo","Bồ Đào Nha","Thụy Sĩ","Hà Lan","Ireland","Monaco","Luxembourg","Liechtenstein","Andorra","San Marino","Vatican","Thụy Điển","Đan Mạch","Phần Lan","Na Uy","Nước Iceland","Ba Lan","Hy Lạp","Croatia","Hungary","Slovenia","Slovakia","Cộng hòa Séc","Estonia","Latvia","Litva","Ukraine","Nga","Rumani","Bulgaria","Serbia","Bosnia và Herzegovina","Albania","Montenegro","Belarus","Moldova","Bắc Macedonia","Síp","Malta","Iran","Thổ Nhĩ Kỳ","Iraq","Israel","Georgia","Armenia","Azerbaijan","Syria","Jordan","Lebanon","Palestine","Ả Rập Xê Út","Các Tiểu vương quốc Ả Rập Thống nhất","Qatar","Yemen","Oman","Kuwait","Bahrain","Kazakhstan","Afghanistan","Uzbekistan","Tajikistan","Kyrgyzstan","Turkmenistan","Ấn Độ","Pakistan","Nepal","Sri Lanka","Bangladesh","Bhutan","Maldives","Thái Lan","Indonesia","Việt Nam","Malaysia","Philippines","Singapore","Myanmar","Lào","Campuchia","Brunei","Trung Quốc","Nhật Bản","Nam Triều Tiên","Bắc Triều Tiên","Mông Cổ","Úc","New Zealand","Papua New Guinea","Đông Timor","Fiji","Quần đảo Solomon","Vanuatu","Samoa","Kiribati","Micronesia","Tonga","Quần đảo Marshall","Palau","Nauru","Tuvalu","Ai Cập","Algeria","Maroc","Tunisia","Libya","Nigeria","Ghana","Sénégal","Mali","Cameroon","Uganda","bờ biển Ngà","Angola","Tanzania","Nigeria","Cộng hòa Trung Phi","Cộng hòa dân chủ Congo","Burkina Faso","Madagascar","Chad","Mozambique","Zambia","Bénin","Guinea","Togo","Rwanda","Malawi","Burundi","Liberia","Zimbabwe","Sierra Leone","Gambia","Mauritania","Gabon","Cộng hòa Congo","Guinea-Bissau","Equatorial Guinea","Mauritius","Seychelles","Comoros","Mũi Verde","Sao Tome và Principe","Somalia","Kenya","Ethiopia","Sudan","Nam Sudan","Eritrea","Djibouti","Nam Phi","Namibia","Botswana","Lesotho","Eswatini","Hoa Kỳ","Canada","Mexico","Cuba","Guatemala","Costa Rica","Belize","Bahamas","Jamaica","Haiti","Cộng hòa Dominica","Panama","El Salvador","Nicaragua","Honduras","Saint Lucia","Grenada","Dominica","Trinidad và Tobago","Barbados","Saint Vincent và Grenadines","Antigua và Barbuda","Saint Kitts và Nevis","Brazil","Argentina","Colombia","Chile","Peru","Venezuela","Ecuador","Uruguay","Bolivia","Paraguay","Guyana","Suriname"];


  List<String> get _allCountriesZH =>
      ["德国","法国","英国","西班牙","意大利","比利时","奥地利","葡萄牙","瑞士","荷兰","爱尔兰","摩纳哥","卢森堡","列支敦士登","安道尔","圣马力诺","梵蒂冈","瑞典","丹麦","芬兰","挪威","冰岛","波兰","希腊","克罗地亚","匈牙利","斯洛文尼亚","斯洛伐克","捷克共和国","爱沙尼亚","拉脱维亚","立陶宛","乌克兰","俄国","罗马尼亚","保加利亚","塞尔维亚","波斯尼亚和黑塞哥维那","阿尔巴尼亚","黑山共和国","白俄罗斯","摩尔多瓦","北马其顿","塞浦路斯","马耳他","伊朗","土耳其","伊拉克","以色列","佐治亚州","亚美尼亚","阿塞拜疆","叙利亚","约旦","黎巴嫩","巴勒斯坦","沙特阿拉伯","阿拉伯联合酋长国","卡塔尔","也门","阿曼","科威特","巴林","哈萨克斯坦","阿富汗","乌兹别克斯坦","塔吉克斯坦","吉尔吉斯斯坦","土库曼斯坦","印度","巴基斯坦","尼泊尔","斯里兰卡","孟加拉国","不丹","马尔代夫","泰国","印度尼西亚","越南","马来西亚","菲律宾","新加坡","缅甸","老挝","柬埔寨","文莱","中国","日本","南韩","北朝鲜","蒙古","澳大利亚","新西兰","巴布亚新几内亚","东帝汶","斐济","所罗门群岛","瓦努阿图","萨摩亚","基里巴斯","密克罗尼西亚","汤加","马绍尔群岛","帛琉","瑙鲁","图瓦卢","埃及","阿尔及利亚","摩洛哥","突尼斯","利比亚","奈及利亚","加纳","塞内加尔","马里","喀麦隆","乌干达","象牙海岸","安哥拉","坦桑尼亚","尼日尔","中非共和国","刚果民主共和国","布基纳法索","马达加斯加","乍得","莫桑比克","赞比亚","贝宁","几内亚","多哥","卢旺达","马拉维","布隆迪","利比里亚","津巴布韦","塞拉利昂","冈比亚","毛里塔尼亚","加蓬","刚果","几内亚比绍","赤道几内亚","毛里求斯","塞舌尔","科摩罗","佛得角","圣多美和普林西比","索马里","肯尼亚","埃塞俄比亚","苏丹","南苏丹","厄立特里亚","吉布地","南非","纳米比亚","博茨瓦纳","莱索托","埃斯瓦蒂尼","美国","加拿大","墨西哥","古巴","危地马拉","哥斯达黎加","伯利兹","巴哈马","牙买加","海地","多明尼加共和国","巴拿马","萨尔瓦多","尼加拉瓜","洪都拉斯","圣卢西亚","格林纳达","多米尼加","特立尼达和多巴哥","巴巴多斯","圣文森特和格林纳丁斯","安提瓜和巴布达","圣基茨和尼维斯","巴西","阿根廷","哥伦比亚","智利","秘鲁","委内瑞拉","厄瓜多尔","乌拉圭","玻利维亚","巴拉圭","圭亚那","苏里南"];


  List<String> get allCountriesRanked =>
      ["0:8","1:10","2:11","3:17","4:13","5:19","6:23","7:28","8:24","9:25","10:44","11:106","12:140","13:131","14:188","15:142","16:176","17:35","18:42","19:43","20:45","21:56","22:21","23:27","24:32","25:38","26:59","27:62","28:64","29:109","30:152","31:77","32:20","33:4","34:39","35:41","36:46","37:57","38:61","39:79","40:80","41:143","42:150","43:89","44:170","45:7","46:9","47:53","48:55","49:49","50:58","51:69","52:100","53:101","54:122","55:128","56:40","57:103","58:93","59:96","60:130","61:137","62:154","63:52","64:54","65:82","66:105","67:123","68:124","69:1","70:72","71:67","72:74","73:118","74:166","75:174","76:12","77:26","78:34","79:47","80:73","81:110","82:83","83:117","84:76","85:171","86:0","87:6","88:16","89:94","90:71","91:29","92:60","93:113","94:156","95:162","96:167","97:175","98:179","99:181","100:184","101:185","102:190","103:192","104:193","105:194","106:14","107:31","108:33","109:70","110:121","111:36","112:51","113:66","114:78","115:81","116:87","117:88","118:92","119:95","120:97","121:127","122:129","123:120","124:90","125:107","126:108","127:111","128:112","129:114","130:115","131:119","132:125","133:134","134:135","135:136","136:139","137:145","138:146","139:148","140:149","141:153","142:155","143:158","144:186","145:161","146:169","147:178","148:68","149:75","150:98","151:126","152:133","153:141","154:159","155:15","156:144","157:147","158:151","159:160","160:2","161:22","162:5","163:50","164:132","165:99","166:172","167:173","168:85","169:91","170:102","171:138","172:164","173:165","174:104","175:180","176:182","177:189","178:157","179:177","180:183","181:187","182:191","183:3","184:18","185:30","186:37","187:48","188:63","189:65","190:84","191:86","192:116","193:163","194:168"];


  List<String> get allFlags =>
      ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","95","97","103","104","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","126","127","128","129","130","131","132","134","135","136","138","140","144","148","149","150","151","152","155","156","157","160","161","162","163","164","165","166","167","168","169","170","171","173","174","175","176","178","179","181","183","184","185","186","187","188","189","190","191","192","193","194"];


  List<String> get allMaps =>
      ["0","1","2","3","4","5","6","7","8","9","17","18","19","20","21","22","23","24","25","26","27","28","29","30","32","33","34","35","36","38","40","41","43","45","47","49","50","51","53","54","56","57","58","59","60","61","63","64","65","66","68","69","70","71","72","73","74","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","97","98","103","106","107","108","109","110","111","112","113","120","122","124","148","150","155","156","160","161","162","163","164","165","166","168","169","171","173","174","183","184","185","186","187","188","189","190","191","192","193","194"];


  List<String> get allCapitalIndexes =>
      ["86","69","160","183","33","162","87","45","0","46","1","2","76","4","106","155","88","3","184","5","32","22","161","6","8","9","77","23","7","91","185","107","24","108","78","17","111","186","25","34","56","35","18","19","10","20","36","79","187","49","163","112","63","47","64","48","21","37","50","26","92","38","27","188","28","189","113","71","148","51","109","90","70","80","72","149","84","31","114","39","40","115","65","82","190","168","191","116","117","43","124","169","118","58","89","119","59","120","150","165","52","53","170","57","174","66","11","125","126","29","81","127","128","93","129","130","192","83","73","131","123","110","54","67","68","132","151","121","122","60","13","164","152","133","134","135","61","171","136","12","153","15","41","156","138","157","139","140","42","158","30","141","62","94","143","154","193","172","44","166","179","144","14"];


  Map<Language, List<String>> get _getAllCapitals {
    Map<Language, List<String>> result = HashMap<Language, List<String>>();
    result.putIfAbsent(Language.ar, () => _allCapitalsAR);
    result.putIfAbsent(Language.bg, () => _allCapitalsBG);
    result.putIfAbsent(Language.cs, () => _allCapitalsCS);
    result.putIfAbsent(Language.da, () => _allCapitalsDA);
    result.putIfAbsent(Language.de, () => _allCapitalsDE);
    result.putIfAbsent(Language.el, () => _allCapitalsEL);
    result.putIfAbsent(Language.en, () => _allCapitalsEN);
    result.putIfAbsent(Language.es, () => _allCapitalsES);
    result.putIfAbsent(Language.fi, () => _allCapitalsFI);
    result.putIfAbsent(Language.fr, () => _allCapitalsFR);
    result.putIfAbsent(Language.he, () => _allCapitalsHE);
    result.putIfAbsent(Language.hi, () => _allCapitalsHI);
    result.putIfAbsent(Language.hr, () => _allCapitalsHR);
    result.putIfAbsent(Language.hu, () => _allCapitalsHU);
    result.putIfAbsent(Language.id, () => _allCapitalsID);
    result.putIfAbsent(Language.it, () => _allCapitalsIT);
    result.putIfAbsent(Language.ja, () => _allCapitalsJA);
    result.putIfAbsent(Language.ko, () => _allCapitalsKO);
    result.putIfAbsent(Language.ms, () => _allCapitalsMS);
    result.putIfAbsent(Language.nl, () => _allCapitalsNL);
    result.putIfAbsent(Language.nb, () => _allCapitalsNB);
    result.putIfAbsent(Language.pl, () => _allCapitalsPL);
    result.putIfAbsent(Language.pt, () => _allCapitalsPT);
    result.putIfAbsent(Language.ro, () => _allCapitalsRO);
    result.putIfAbsent(Language.ru, () => _allCapitalsRU);
    result.putIfAbsent(Language.sk, () => _allCapitalsSK);
    result.putIfAbsent(Language.sl, () => _allCapitalsSL);
    result.putIfAbsent(Language.sr, () => _allCapitalsSR);
    result.putIfAbsent(Language.sv, () => _allCapitalsSV);
    result.putIfAbsent(Language.th, () => _allCapitalsTH);
    result.putIfAbsent(Language.tr, () => _allCapitalsTR);
    result.putIfAbsent(Language.uk, () => _allCapitalsUK);
    result.putIfAbsent(Language.vi, () => _allCapitalsVI);
    result.putIfAbsent(Language.zh, () => _allCapitalsZH);
    return result;
  }
  List<String> get _allCapitalsAR =>
      ["بكين","نيو دلهي","واشنطن","برازيليا","موسكو","مكسيكو سيتي","طوكيو","طهران","برلين","أنقرة","باريس","لندن","بانكوك","روما","القاهرة","بريتوريا","سيول","مدريد","بوينس ايرس","بروكسل","كييف","وارسو","أوتاوا","فيينا","برن","أمستردام","جاكرتا","أثينا","لشبونة","كانبرا","بوغوتا","الجزائر العاصمة","زغرب","الرباط","هانوي","ستوكهولم","أبوجا","سانتياغو","بودابست","بوخارست","الرياض","صوفيا","كوبنهاغن","هلسنكي","دبلن","أوسلو","بلغراد","كوالا لمبور","ليما","تبليسي","هافانا","أكرا","أستانا","بغداد","كابول","بيت المقدس","ريكيافيك","سراييفو","يريفان","ليوبليانا","ويلينجتون","تيرانا","براتيسلافا","كاراكاس","براغ","كيتو","داكار","كاتماندو","مقديشو","باكو","تونس","أولان باتور","اسلام آباد","مانيلا","كولومبو","نيروبي","بنوم بنه","فيلنيوس","باماكو","بودغوريتشا","مينسك","ياوندي","طشقند","نايبيداو","مونتيفيديو","كينغستون","سوكري","كمبالا","ياموسوكرو","نيقوسيا","أنتاناناريفو","بورت أو برنس","لواندا","الدوحة","بيونغ يانغ","دودوما","صنعاء","نيامي","اديس ابابا","سان خوسيه","دمشق","عمان","سانتو دومينغو","أبو ظبي","تيغوسيغالبا","دوشانبي","موناكو","نجامينا","مابوتو","تالين","سنغافورة","لوساكا","بورتو نوفو","مرفئ مويسبي","كوناكري","لومي","أسونسيون","فينتيان","دكا","كيغالي","واغادوغو","طرابلس","بيروت","بيشكيك","عشق أباد","ليلونغوي","الخرطوم","بانغي","كينشاسا","مسقط","فادوز","مدينة غواتيمالا","جوبا","بوجومبورا","مونروفيا","هراري","مدينة الكويت","مدينة باناما","فريتاون","لوكسمبورغ","أسمرة","سان مارينو","كيشيناو","ويندهوك","نواكشوط","غابورون","ليبرفيل","برازافيل","إسكوبية","ماسيرو","ريغا","بيساو","المنامة","ديلي","بورت لويس","جيبوتي","جورج تاون","سان سلفادور","فاليتا","بلموبان","بريدجتاون","فيكتوريا","أندورا لا فيلا"];


  List<String> get _allCapitalsBG =>
      ["Пекин","Ню Делхи","Вашингтон","Бразилия","Москва","Мексико сити","Токио","Техеран","Берлин","Анкара","Париж","Лондон","Банкок","Рим","Кайро","Претория","Сеул","Мадрид","Буенос Айрес","Брюксел","Киев","Варшава","Отава","Виена","Берн","Амстердам","Джакарта","Атина","Лисабон","Канбера","Богота","Алжир","Загреб","Рабат","Ханой","Стокхолм","Абуджа","Сантяго","Будапеща","Букурещ","Рияд","София","Копенхаген","Хелзинки","Дъблин","Осло","Белград","Куала Лумпур","Лима","Тбилиси","Хавана","Акра","Астана","Багдад","Кабул","Йерусалим","Рейкявик","Сараево","Ереван","Любляна","Уелингтън","Тирана","Братислава","Каракас","Прага","Кито","Дакар","Катманду","Могадишу","Баку","Тунис","Улан Батор","Исламабад","Манила","Коломбо","Найроби","Пном Пен","Вилнюс","Бамако","Подгорица","Минск","Яунде","Ташкент","Найпиидо","Монтевидео","Кингстън","Сукре","Кампала","Ямусукро","Никозия","Антананариву","Порт-о-Пренс","Луанда","Доха","Пхенян","Додома","Сана","Ниамей","Адис Абеба","Сан Хосе","Дамаск","Аман","Санто Доминго","Абу Даби","Тегусигалпа","Душанбе","Монако","Нджамена","Мапуто","Талин","Сингапур","Лусака","Порто Ново","Порт Морсби","Конакри","Ломе","Асунсион","Виентян","Дака","Кигали","Уагадугу","Триполи","Бейрут","Бишкек","Ашхабад","Лилонгве","Хартум","Банги","Киншаса","Мускат","Вадуц","Гватемала Сити","Джуба","Бужумбура","Монровия","Хараре","Кувейт Сити","Панама Сити","Фрийтаун","Люксембург","Асмара","Сан Марино","Кишинев","Виндхук","Нуакшот","Габороне","Либревил","Бразавил","Скопие","Масеру","Рига","Бисау","Манама","Дили","Порт Луис","Джибути","Джорджтаун","Сан Салвадор","Валета","Белмопан","Бриджтаун","Виктория","Андора ла Веля"];


  List<String> get _allCapitalsCS =>
      ["Peking","Nové Dillí","Washington","Brasilia","Moskva","Mexico City","Tokio","Teherán","Berlín","Ankara","Paříž","Londýn","Bangkok","Řím","Káhira","Pretoria","Soul","Madrid","Buenos Aires","Brusel","Kyjev","Varšava","Ottawa","Vídeň","Bern","Amsterdam","Jakarta","Athény","Lisabon","Canberra","Bogota","Alžír","Záhřeb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapešť","Bukurešť","Rijád","Sofie","Kodaň","Helsinki","Dublin","Oslo","Bělehrad","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdád","Kábul","Jeruzalém","Reykjavík","Sarajevo","Jerevan","Lublaň","Wellington","Tirana","Bratislava","Caracas","Praha","Quito","Dakar","Káthmándú","Mogadišo","Baku","Tunis","Ulánbátar","Islámábád","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Taškent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikósie","Antananarivo","Port-au-Prince","Luanda","Dauhá","Pchjongčchang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damašek","Ammán","Santo Domingo","Abu Dhabi","Tegucigalpa","Dušanbe","Monako","N'Djamena","Maputo","Tallinn","Singapur","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dháka","Kigali","Ouagadougou","Tripolis","Beirut","Biškek","Ašchabad","Lilongwe","Chartúm","Bangui","Kinshasa","Maskat","Vaduz","Ciudad de Guatemala","Juba","Bujumbura","Monrovia","Harare","Město Kuwait","Město Panama","Freetown","Lucembursko","Asmara","San Marino","Kišiněv","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Džibutsko","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Viktorie","Andorra la Vella"];


  List<String> get _allCapitalsDA =>
      ["Beijing","New Delhi","Washington","Brasilia","Moskva","Mexico City","Tokyo","Teheran","Berlin","Ankara","Paris","London","Bangkok","Rom","Cairo","Pretoria","Seoul","Madrid","Buenos Aires","Bruxelles","Kiev","Warszawa","Ottawa","Wien","Bern","Amsterdam","Jakarta","Athen","Lissabon","Canberra","Bogota","Algier","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapest","Bukarest","Riyadh","Sofia","København","Helsinki","Dublin","Oslo","Beograd","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdad","Kabul","Jerusalem","Reykjavik","Sarajevo","Jerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Prag","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Tasjkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damaskus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Bisjkek","Asjkhabad","Lilongwe","Khartoum","Bangui","Kinshasa","Muscat","Vaduz","Guatemala City","Juba","Bujumbura","Monrovia","Harare","Kuwait City","Panama City","Freetown","Luxembourg","Asmara","San Marino","Chișinău","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsDE =>
      ["Peking","Neu-Delhi","Washington","Brasília","Moskau","Mexiko-Stadt","Tokio","Teheran","Berlin","Ankara","Paris","London","Bangkok","Rom","Kairo","Pretoria","Seoul","Madrid","Buenos Aires","Brüssel","Kiew","Warschau","Ottawa","Wien","Bern","Amsterdam","Jakarta","Athen","Lissabon","Canberra","Bogotá","Algier","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapest","Bukarest","Riad","Sofia","Kopenhagen","Helsinki","Dublin","Oslo","Belgrad","Kuala Lumpur","Lima","Tiflis","Havanna","Accra","Astana","Bagdad","Kabul","Jerusalem","Reykjavík","Sarajewo","Jerewan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Prag","Quito","Dakar","Kathmandu","Mogadischu","Baku","Tunis","Ulan-Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaoundé","Taschkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pjöngjang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damaskus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Duschanbe","Monaco","N’Djamena","Maputo","Tallinn","Singapur","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asunción","Vientiane","Dhaka","Kigali","Ouagadougou","Tripolis","Beirut","Bischkek","Aschgabat","Lilongwe","Khartum","Bangui","Kinshasa","Maskat","Vaduz","Guatemala-Stadt","Juba","Bujumbura","Monrovia","Harare","Kuwait-Stadt","Panama-Stadt","Freetown","Luxemburg","Asmara","San Marino","Chisinau","Windhuk","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bisau","Manama","Dili","Port Louis","Dschibuti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsEL =>
      ["Πεκίνο","Νέο Δελχί","Ουάσινγκτον","Μπραζίλια","Μόσχα","Πόλη του Μεξικού","Τόκιο","Τεχεράνη","Βερολίνο","Άγκυρα","Παρίσι","Λονδίνο","Μπανγκόκ","Ρώμη","Κάιρο","Πρετόρια","Σεούλ","Μαδρίτη","Μπουένος Άιρες","Βρυξέλλες","Κίεβο","Βαρσοβία","Οττάβα","Βιέννη","Βέρνη","Άμστερνταμ","Τζακάρτα","Αθήνα","Λισαβόνα","Καμπέρα","Μπογκοτά","Αλγερίο","Ζάγκρεμπ","Ραμπάτ","Ανόι","Στοκχόλμη","Abuja","Σαντιάγο","Βουδαπέστη","Βουκουρέστι","Ριάντ","Σοφία","Κοπεγχάγη","Χέλσινκι","Δουβλίνο","Άσλο","Βελιγράδιο","Κουάλα Λουμπούρ","Λίμα","Τιφλίδα","Αβάνα","Άκρα","Αστάνα","Βαγδάτη","Καμπούλ","Ιερουσαλήμ","Ρέικιαβικ","Σεράγεβο","Ερεβάν","Λιουμπλιάνα","Ουέλινγκτον","Τιράνα","Μπρατισλάβα","Καράκας","Πράγα","Κίτο","Ντακάρ","Κατμαντού","Μογκαντίσου","Μπακού","Τυνίδος","Ουλάν Μπάτορ","Ισλαμαμπάντ","Μανίλα","Κολόμπο","Ναϊρόμπι","Πνομ Πενχ","Βίλνιους","Μπαμάκο","Ποντγκόριτσα","Μινσκ","Γιαουντέ","Τασκένδη","Νέπιντο","Μοντεβιδέο","Κίνγκστον","Σούκρε","Καμπάλα","Γιαμουσούκρο","Λευκωσία","Ανταναναρίβο","Πορτ-ο-Πρενς","Λουάντα","Ντόχα","Πιονγκγιάνγκ","Ντοντόμα","Σαναά","Νιαμέι","Αντίς Αμπέμπα","Σαν Χοσέ","Δαμάσκο","Αμμάν","Σάντο Ντομίνγκο","Αμπού Ντάμπι","Τεγουσιγάλπα","Ντουσάνμπε","Μονακό","Ντζαμένα","Μαπούτο","Ταλίν","Σιγκαπούρη","Λουσάκα","Πόρτο-Νόβο","Πορτ Μόρεσμπι","Κονακρί","Λομέ","Ασουνσιόν","Βιεντιάν","Ντάκα","Κιγκάλι","Ουαγκαντούγκου","Τρίπολις","Βηρύτος","Μπισκέκ","Ασγκαμπάτ","Λιλόνγκουε","Χαρτούμ","Μπανγκούι","Κινσάσα","Μουσκάτ","Βαντούζ","Πόλη της Γουατεμάλας","Τζούμπα","Μπουζουμπούρα","Μονρόβια","Χαράρε","Πόλη του Κουβέιτ","Πόλη του Παναμά","Φρίταουν","Λουξεμβούργο","Ασμάρα","Σαν Μαρίνο","Κισινάου","Γουίντχουκ","Νουακσότ","Γκαμπορόνε","Λιμπρεβίλ","Μπραζαβίλ","Σκόπια","Μαζέρου","Ρίγα","Μπισάου","Μανάμα","Ντίλι","Πορτ Λούις","Τζιμπουτί","Τζορτζτάουν","Σαν Σαλβαδόρ","Βαλέτα","Μπελμοπάν","Μπρίτζταουν","Βικτώρια","Ανδόρα λα Βέγια"];


  List<String> get _allCapitalsEN =>
      ["Beijing","New Delhi","Washington","Brasilia","Moscow","Mexico City","Tokyo","Tehran","Berlin","Ankara","Paris","London","Bangkok","Rome","Cairo","Pretoria","Seoul","Madrid","Buenos Aires","Brussels","Kiev","Warsaw","Ottawa","Vienna","Bern","Amsterdam","Jakarta","Athens","Lisbon","Canberra","Bogota","Algiers","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapest","Bucharest","Riyadh","Sofia","Copenhagen","Helsinki","Dublin","Oslo","Belgrade","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Baghdad","Kabul","Jerusalem","Reykjavik","Sarajevo","Yerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Prague","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Tashkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Ababa","San Jose","Damascus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Bishkek","Ashgabat","Lilongwe","Khartoum","Bangui","Kinshasa","Muscat","Vaduz","Guatemala City","Juba","Bujumbura","Monrovia","Harare","Kuwait City","Panama City","Freetown","Luxembourg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsES =>
      ["Beijing","Nueva Delhi","Washington","Brasília","Moscú","Ciudad de México","tokio","Teherán","Berlín","Ankara","París","Londres","bangkok","Roma","El Cairo","Pretoria","Seúl","Madrid","Buenos Aires","Bruselas","kiev","Varsovia","Ottawa","Viena","Berna","Ámsterdam","Jacarta","Atenas","Lisboa","Canberra","Bogotá","Argel","Zagreb","Rabat","Hanoi","Estocolmo","Abuya","santiago","budapest","Bucarest","Riad","Sofía","Copenhague","helsinki","Dublín","Oslo","Belgrado","Kuala Lumpur","lima","Tiflis","la Habana","Acra","Astaná","Bagdad","Kabul","Jerusalén","Reikiavik","sarajevo","Ereván","liubliana","Wellington","Tirana","Bratislava","Caracas","Praga","Quito","Dakar","Katmandú","Mogadisio","Bakú","Túnez","Ulán Bator","islamabad","Manila","colombo","Nairobi","Phnom Penh","Vilna","bamako","Podgorica","Minsk","Yaundé","Tashkent","Naipyidó","Montevideo","Kingston","Sucre","Kampala","Yamusukro","nicosia","Antananarivo","Puerto Príncipe","Luanda","Doha","Pionyang","Dodoma","Saná","Niamey","Addis Abeba","San Jose","Damasco","Amán","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Mónaco","Yamena","Maputo","Tallin","Singapur","Lusaka","Porto Novo","puerto moresby","Conakri","Lomé","Asunción","Vientián","Daca","Kigali","Uagadugú","Trípoli","Beirut","Biskek","Asjabad","Lilongüe","Jartum","bangui","Kinsasa","Mascate","Vaduz","Ciudad de Guatemala","Juba","Buyumbura","Monrovia","Harare","Ciudad de Kuwait","ciudad de Panama","Freetown","luxemburgo","Asmara","San Marino","Chisináu","Windhoek","Nuakchot","Gaborone","Libreville","Brazzaville","Skopje","Maseru","riga","Bisáu","manama","Dili","Port Louis","Yibuti","georgetown","San Salvador","La Valeta","Belmopán","Bridgetown","Victoria","Andorra la Vieja"];


  List<String> get _allCapitalsFI =>
      ["Peking","New Delhi","Washington","Brasilia","Moskova","Mexico City","Tokio","Teheran","Berliini","Ankara","Pariisi","Lontoo","Bangkok","Rooma","Kairo","Pretoria","Soul","Madrid","Buenos Aires","Bryssel","Kiova","Varsova","Ottawa","Wien","Bern","Amsterdam","Jakarta","Ateena","Lissabon","Canberra","Bogota","Alger","Zagreb","Rabat","Hanoi","Tukholma","Abuja","Santiago","Budapest","Bukarest","Riad","Sofia","Kööpenhamina","Helsinki","Dublin","Oslo","Belgrad","Kuala Lumpur","Lima","Tbilisi","Havanna","Accra","Astana","Bagdad","Kabul","Jerusalem","Reykjavik","Sarajevo","Jerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Praha","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilna","Bamako","Podgorica","Minsk","Yaounde","Taškent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pjongjang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damaskos","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dušanbe","Monaco","N'Djamena","Maputo","Tallinna","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Biškek","Ašgabat","Lilongwe","Khartum","Bangui","Kinshasa","Masqat","Vaduz","Guatemala City","Juba","Bujumbura","Monrovia","Harare","Kuwait City","Panaman City","Freetown","Luxemburg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riika","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsFR =>
      ["Pékin","New Delhi","Washington","Brasilia","Moscou","Mexico","Tokyo","Téhéran","Berlin","Ankara","Paris","Londres","Bangkok","Rome","Caire","Prétoria","Séoul","Madrid","Buenos Aires","Bruxelles","Kiev","Varsovie","Ottawa","Vienne","Berne","Amsterdam","Jakarta","Athènes","Lisbonne","Canberra","Bogota","Alger","Zagreb","Rabat","Hanoï","Stockholm","Abuja","Santiago","Budapest","Bucarest","Riyad","Sofia","Copenhague","Helsinki","Dublin","Oslo","Belgrade","Kuala Lumpur","Lima","Tbilissi","La Havane","Accra","Astana","Bagdad","Kaboul","Jérusalem","Reykjavik","Sarajevo","Erevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Prague","Quito","Dakar","Katmandou","Mogadiscio","Bakou","tunis","Ulan Bator","Islamabad","Manille","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaoundé","Tachkent","Naypyidaw","Montevidéo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosie","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Ababa","San José","Damas","Amman","Saint Domingue","Abou Dabi","Tegucigalpa","Douchanbé","Monaco","N'Djaména","Maputo","Tallin","Singapour","Lusaka","Porto Novo","Port Moresby","Conakry","Lomé","Asunción","Vientiane","Dacca","Kigali","Ouagadougou","Tripoli","Beyrouth","Bichkek","Achgabat","Lilongwe","Khartoum","Bangui","Kinshasa","Mascate","Vaduz","Ville de Guatemala","Djouba","Bujumbura","Monrovia","Harare","Ville de Koweït","Ville de Panama","Freetown","Luxembourg","Asmara","Saint Marin","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","La Valette","Belmopan","Bridgetown","Victoria","Andorre-la-Vieille"];


  List<String> get _allCapitalsHE =>
      ["בייג'ין","ניו דלהי","וושינגטון","ברזיליה","מוסקבה","מקסיקו סיטי","טוקיו","טהראן","ברלין","אנקרה","פריז","לונדון","בנגקוק","רומא","קהיר","פרטוריה","סיאול","מדריד","בואנוס איירס","בריסל","קייב","ורשה","אוטווה","וינה","ברן","אמסטרדם","ג'קרטה","אַתוּנָה","ליסבון","קנברה","בוגוטה","אלג'יר","זאגרב","רבאט","האנוי","שטוקהולם","אבוג'ה","סנטיאגו","בודפשט","בוקרשט","ריאד","סופיה","קופנהגן","הלסינקי","דבלין","אוסלו","בלגרד","קואלה לומפור","לימה","טביליסי","הוואנה","אקרה","אסטנה","בגדד","קאבול","ירושלים","רייקיאוויק","סרייבו","ירוואן","לובליאנה","וולינגטון","טירנה","ברטיסלבה","קראקס","פראג","קיטו","דקאר","קטמנדו","מוגדישו","באקו","תוניס","אולן בטור","איסלמבאד","מנילה","קולומבו","ניירובי","פנום פן","וילנה","במקו","פודגוריצה","מינסק","יאונדה","טשקנט","נייפידאו","מונטווידאו","קינגסטון","סוקרה","קמפלה","יאמוסוקרו","ניקוסיה","אנטננריבו","פורט-או-פרינס","לואנדה","דוחה","פיונגיאנג","דודומה","צנעא","ניאמי","אדיס אבבה","סאן חוזה","דמשק","עמאן","סנטו דומינגו","אבו דאבי","טגוסיגלפה","דושנבה","מונקו","נג'מנה","מאפוטו","טאלין","סינגפור","לוסקה","פורטו-נובו","פורט מורסבי","קונקרי","לומה","אסונסיון","ויינטיאן","דאקה","קיגאלי","אואגדו","טריפולי","ביירות","בישקק","אשגבאט","לילונגווה","חרטום","בנגוי","קינשאסה","מוּסקָט","ואדוז","עיר גואטמלה","ג'ובה","בוג'ומבורה","מונרוביה","הררה","העיר כוויית","העיר פנמה","פריטאון","לוקסמבורג","אסמרה","סן מרינו","קישינב","וינדהוק","נואקשוט","גאבורון","ליברוויל","ברזוויל","סקופיה","מאסרו","ריגה","ביסאו","מנאמה","דילי","פורט לואיס","ג'יבוטי","ג'ורג'טאון","סן סלבדור","ולטה","בלמופן","ברידג'טאון","ויקטוריה","אנדורה לה ולה"];


  List<String> get _allCapitalsHI =>
      ["बीजिंग","नई दिल्ली","वाशिंगटन","ब्रासीलिया","मास्को","मेक्सिको सिटी","टोक्यो","तेहरान","बर्लिन","अंकारा","पेरिस","लंडन","बैंकाक","रोम","काहिरा","प्रिटोरिया","सियोल","मैड्रिड","ब्यूनस आयर्स","ब्रसेल्स","कीव","वारसा","ओटावा","वियना","बर्न","एम्स्टर्डम","जकार्ता","एथेंस","लिस्बन","कैनबरा","बोगोटा","अल्जीयर्स","ज़ाग्रेब","रबात","हनोई","स्टॉकहोम","अबुजा","सेंटियागो","बुडापेस्टो","बुखारेस्ट","रियाद","सोफिया","कोपेनहेगन","हेलसिंकि","डबलिन","ओस्लो","बेलग्रेड","क्वालालंपुर","लीमा","त्बिलिसी","हवाना","अक्करा","अस्ताना","बगदाद","काबुल","यरूशलेम","रिक्जेविक","साराजेवो","येरेवान","Ljubljana","वेलिंग्टन","तिराना","ब्रैटिस्लावा","कराकास","प्राहा","क्विटो","डकारो","काठमांडू","मोगादिशू","बाकू","ट्यूनिस","उलान बतोर","इस्लामाबाद","मनीला","कोलंबो","नैरोबी","नोम पेन्ह","विनियस","बमाको","Podgorica","मिन्स्क","Yaounde","ताशकंद","नेपीडाॅ","मोंटेवीडियो","किन्टाल","सुक्रे","कंपाला","यामौस्सोक्रो","निकोसिया","अंटानानारिवो","पोर्ट-ओ-प्रिंस","लुआंडा","दोहा","फियोंगयांग","डोडोमा","साना","नियामे","अदीस अबाबा","सैन जोस","दमिश्क","अम्मान","सैंटो डोमिंगो","आबू धाबी","तेगुसिगाल्पा","दुशान्बे","मोनाको","न'दजामेना","मापुटो","तेलिन","सिंगापुर","लुसाका","पोर्टो नोवो","पोर्ट मोरेस्बी","कोनाक्री","लोम","असंसियन","वियनतियाने","ढाका","किगली","ऊगादोगो","त्रिपोली","बेरूत","बिश्केक","अश्गाबात","लिलोंग्वे","खार्तूम","बंगुई","कीण्षासा","मस्कट","वादुज़","ग्वाटेमाला शहर","जुबा","बुजुम्बुरा","मोन्रोविया","हरारे","कुवैत शहर","पनामा शहर","फ्रीटाउन","लक्समबर्ग","अस्मार","सैन मारिनो","चिसिनाऊ","विंडहोक","नोआखाली","गोबोर्नी","लिब्रेविल","ब्राज़ाविल","स्कोप्जे","मासेरु","रीगा","बिसाऊ","मनामा","दिली","पोर्ट लुइस","जिबूती","जॉर्ज टाउन","सैन सैल्वाडोर","वालेटा","बेल्मोपान","ब्रिजटाउन","विक्टोरिया","अंडोरा ला वेल्ला"];


  List<String> get _allCapitalsHR =>
      ["Peking","New Delhi","Washington","Brazilija","Moskva","Ciudad de México","Tokio","Teheran","Berlin","Ankara","Pariz","London","Bangkok","Rim","Kairo","Pretorija","Seul","Madrid","Buenos Aires","Bruxellesu","Kijev","Varšava","Ottawa","Beč","Bern","Amsterdam","Jakarta","Atena","Lisabon","Canberra","Bogota","Alžir","Zagreb","Rabat","Hanoj","Stockholm","Abuja","Santiago","Budimpešta","Bukurešt","Rijad","Sofija","Kopenhagen","Helsinki","Dublin","Oslo","Beograd","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdad","Kabul","Jeruzalem","Reykjavik","Sarajevo","Yerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Prag","Quito","Dakar","Katmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Taškent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikozija","Antananarivo","Port-au-Prince","Luanda","Doha","Pjongjang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damask","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dušanbe","Monako","N'Djamena","Maputo","Tallinn","Singapur","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Bejrut","Biškek","Ašgabat","Lilongwe","Kartum","Bangui","Kinshasa","Muskat","Vaduz","Ciudad de Guatemala","Juba","Bujumbura","Monrovia","Harare","Kuwait","Panamá","Freetown","Luksemburg","Asmara","San Marino","Kišinjev","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Džibuti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Viktorija","Andora la Vella"];


  List<String> get _allCapitalsHU =>
      ["Peking","Delhi","Washington","Brasilia","Moszkva","Mexikóváros","Tokió","Teherán","Berlin","Ankara","Párizs","London","Bangkok","Róma","Kairó","Pretoria","Szöul","Madrid","Buenos Aires","Brüsszel","Kijev","Varsó","Ottawa","Bécs","Bern","Amszterdam","Jakarta","Athén","Lisszabon","Canberra","Bogota","Algír","Zágráb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapest","Bukarest","Rijád","Sofia","Koppenhága","Helsinki","Dublin","Oslo","Belgrád","Kuala Lumpur","Lima","Tbiliszi","Havanna","Accra","Asztana","Bagdad","Kabul","Jeruzsálem","Reykjavík","Szarajevó","Jereván","Ljubljana","Wellington","Tirana","Pozsony","Caracas","Prága","Quito","Dakar","Katmandu","Mogadishu","Baku","Tunisz","Ulan Bator","Iszlámábád","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minszk","Yaounde","Taskent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Phenjan","Dodoma","Sanaa","Niamey","Addisz-Abeba","San Jose","Damaszkusz","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dusanbe","Monaco","N'Djamena","Maputo","Tallinn","Szingapúr","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dakka","Kigali","Ouagadougou","Tripoli","Bejrút","Biskek","Ashgabat","Lilongwe","Kartúm","Bangui","Kinshasa","Maszkat","Vaduz","Guatemalaváros","Juba","Bujumbura","Monrovia","Harare","Kuwaitváros","Panamaváros","Freetown","Luxemburg","Asmara","San Marino","Kisinyov","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Szkopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Dzsibuti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsID =>
      ["Beijing","New Delhi","Washington","Brasilia","Moskow","kota Meksiko","Tokyo","Teheran","Berlin","Ankara","Paris","London","Bangkok","Roma","Kairo","Pretoria","seoul","Madrid","Buenos Aires","Brussel","Kiev","Warsawa","Ottawa","Wina","Bern","Amsterdam","Jakarta","Athena","Lisboa","Canberra","Bogotá","Aljir","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapest","Bukares","Riyadh","Sofia","Kopenhagen","Helsinki","Dublin","Oslo","Beograd","Kuala Lumpur","lima","Tbilisi","Havana","Accra","astana","Bagdad","Kabul","Yerusalem","Reykjavik","Sarajevo","Yerevan","Ljubljana","Wellington","Tirana","bratislava","Caracas","Praha","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunisia","Ulan Bator","Islamabad","Manila","Kolombo","Nairobi","Phnom Penh","Vilnius","bamako","Podgorica","Minsk","Yaounde","Tashkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikosia","Antananarivo","Port-au-Prince","luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Ababa","San Jose","Damaskus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monako","N'Djamena","Maputo","Tallinn","Singapura","Lusaka","Porto-Novo","Port Moresby","Conakry","Lomé","Asunción","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Biskek","Ashgabat","Lilongwe","Khartoum","Bangui","Kinshasa","Muskat","Vaduz","kota Guatemala","Juba","Bujumbura","monrovia","Harare","kota Kuwait","kota Panama","Freetown","Luksemburg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","gaboron","Libreville","Brazzaville","Skopje","maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsIT =>
      ["Pechino","Nuova Delhi","Washington","Brasília","Mosca","città del Messico","Tokio","Teheran","Berlino","Ankara","Parigi","Londra","Bangkok","Roma","Cairo","Pretoria","Seul","Madrid","Buenos Aires","Bruxelles","Kiev","Varsavia","Ottawa","Vienna","Berna","Amsterdam","Giacarta","Atene","Lisbona","Canberra","Bogotà","Algeri","Zagabria","Rabat","Hanoi","Stoccolma","Abuja","Santiago","Budapest","Bucarest","Riad","Sofia","Copenaghen","Helsinki","Dublino","Oslo","Belgrado","Kuala Lumpur","Lima","Tbilisi","L'Avana","Accra","Astana","Bagdad","Kabul","Gerusalemme","Reykjavik","Sarajevo","Yerevan","Lubiana","Wellington","Tirana","Bratislava","Caracas","Praga","Quito","Dakar","Katmandu","Mogadiscio","Baku","Tunisi","Ulan Bator","Islamabad","manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaoundé","Tashkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","Dodom","Sanaa","Niamey","Addis Abeba","San Jose","Damasco","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Porto Moresby","Conakry","Lomé","Asunzione","Vientiane","Dacca","Kigali","Ouagadougou","Tripoli","Beirut","Biškek","Aşgabat","Lilongwe","Khartum","Bangui","Kinshasa","Mascate","Vaduz","Città del Guatemala","Giuba","Bujumbura","Monrovia","Harare","Città di Kuwait","Panamá","Freetown","Lussemburgo","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maserù","Riga","Bissau","Manama","Dili","Port Louis","Gibuti","Georgetown","San Salvador","La Valletta","Belmopan","Bridgetown","Vittoria","Andorra la Vella"];


  List<String> get _allCapitalsJA =>
      ["北京","ニューデリー","ワシントン","ブラジリア","モスクワ","メキシコシティ","東京","テヘラン","ベルリン","アンカラ","パリ","ロンドン","バンコク","ローマ","カイロ","プレトリア","ソウル","マドリッド","ブエノスアイレス","ブリュッセル","キエフ","ワルシャワ","オタワ","ウィーン","ベルン","アムステルダム","ジャカルタ","アテネ","リスボン","キャンベラ","ボゴタ","アルジェ","ザグレブ","ラバト","ハノイ","ストックホルム","アブジャ","サンティアゴ","ブダペスト","ブカレスト","リヤド","ソフィア","コペンハーゲン","ヘルシンキ","ダブリン","オスロ","ベオグラード","クアラルンプール","リマ","トビリシ","ハバナ","アクラ","アスタナ","バグダッド","カブール","エルサレム","レイキャビク","サラエボ","エレバン","リュブリャナ","ウェリントン","ティラナ","ブラチスラバ","カラカス","プラハ","キト","ダカール","カトマンズ","モガディシュ","バクー","チュニス","ウランバートル","イスラマバード","マニラ","コロンボ","ナイロビ","プノンペン","ビリニュス","バマコ","ポドゴリツァ","ミンスク","ヤウンデ","タシケント","ネピドー","モンテビデオ","キングストン","スクレ","カンパラ","ヤムスクロ","ニコシア","アンタナナリボ","ポルトープランス","ルアンダ","ドーハ","平壌","ドドマ","サナア","ニアメ","アディスアベバ","サンホセ","ダマスカス","アンマン","サントドミンゴ","アブダビ","テグシガルパ","ドゥシャンベ","モナコ","ンジャメナ","マプト","タリン","シンガポール","ルサカ","ポルトノボ","ポートモレスビー","コナクリ","ロメ","アスンシオン","ビエンチャン","ダッカ","キガリ","ワガドゥグー","トリポリ","ベイルート","ビシュケク","アシガバート","リロングウェ","ハルツーム","バンギ","キンシャサ","マスカット","ファドゥーツ","グアテマラシティ","ジュバ","ブジュンブラ","モンロビア","ハラレ","クウェートシティ","パナマ市","フリータウン","ルクセンブルク","アスマラ","サンマリノ","キシナウ","ウィントフック","ヌアクショット","ハボローネ","リーブルビル","ブラザビル","スコピエ","マセル","リガ","ビサウ","マナーマ","ディリ","ポートルイス","ジブチ","ジョージタウン","サンサルバドル","バレッタ","ベルモパン","ブリッジタウン","ビクトリア","アンドラ・ラ・ベリャ"];


  List<String> get _allCapitalsKO =>
      ["베이징","뉴델리","워싱턴","브라질리아","모스크바","멕시코 시티","도쿄","테헤란","베를린","앙카라","파리","런던","방콕","로마","카이로","프리토리아","서울","마드리드","부에노스 아이레스","브뤼셀","키에프","바르샤바","오타와","비엔나","베른","암스테르담","자카르타","아테네","리스본","캔버라","보고타","알제","자그레브","라바트","하노이","스톡홀름","아부자","산티아고","부다페스트","부카레스트","리야드","소피아","코펜하겐","헬싱키","더블린","오슬로","베오그라드","쿠알라 룸푸르","리마","트빌리시","아바나","아크라","아스타나","바그다드","카불","예루살렘","레이캬비크","사라예보","예레반","류블랴나","웰링턴","티라나","브라티슬라바","카라카스","프라하","키토","다카르","카트만두","모가디슈","바쿠","튀니스","울란바토르","이슬라마바드","마닐라","콜롬보","나이로비","프놈펜","빌뉴스","바마코","포드고리차","민스크","야운데","타슈켄트","네피도","몬테비데오","킹스턴","수크레","캄팔라","야무수크로","니코시아","안타나나리보","포르토프랭스","루안다","도하","평양","도도마","사나","니아메","아디스 아바바","산호세","다마스쿠스","암만","산토 도밍고","아부 다비","테구시갈파","두샨베","모나코","은자메나","마푸토","탈린","싱가포르","루사카","포르투노보","포트모르즈비","코나크리","로메","아순시온","비엔티안","다카","키갈리","와가두구","트리폴리","베이루트","비슈케크","아쉬하바트","릴롱궤","하르툼","방기","킨샤사","무스카트","파두츠","과테말라 시티","쥬바","부줌부라","몬로비아","하라레","쿠웨이트 시티","파나마 시티","프리타운","룩셈부르크","아스마라","산 마리노","키시나우","빈트후크","누악쇼트","가보로네","리브르빌","브라자빌","스코페","마세루","리가","비사우","마나마","딜리","포트 루이스","지부티","조지타운","산살바도르","발레타","벨모판","브리지타운","빅토리아","안도라 라 베야"];


  List<String> get _allCapitalsMS =>
      ["Beijing","New Delhi","Washington","Brasilia","Moscow","Bandar Raya Mexico","Tokyo","Tehran","Berlin","Ankara","Paris","London","Bangkok","Rom","Kaherah","Pretoria","Seoul","Madrid","Buenos Aires","Brussels","Kiev","Warsaw","Ottawa","Vienna","Bern","Amsterdam","Jakarta","Athens","Lisbon","Canberra","Bogota","Algiers","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapest","Bucharest","Riyadh","Sofia","Copenhagen","Helsinki","Dublin","Oslo","Belgrade","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Baghdad","Kabul","Baitulmaqdis","Reykjavik","Sarajevo","Yerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Prague","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Tashkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Putera","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Ababa","San Jose","Damsyik","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapura","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Bishkek","Ashgabat","Lilongwe","Khartoum","Bangui","Kinshasa","Masqat","Vaduz","Bandar Raya Guatemala","Juba","Bujumbura","Monrovia","Harare","Bandar Kuwait","Kota Panama","Freetown","Luxembourg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsNL =>
      ["Peking","New Delhi","Washington","Brazilië","Moskou","Mexico-Stad","Tokio","Teheran","Berlijn","Ankara","Parijs","Londen","Bangkok","Rome","Cairo","Pretoria","Seoel","Madrid","Buenos Aires","Brussel","Kiev","Warschau","Ottawa","Wenen","Bern","Amsterdam","Jakarta","Athene","Lissabon","Canberra","Bogota","Algiers","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Boedapest","Boekarest","Riyad","Sofia","Kopenhagen","Helsinki","Dublin","Oslo","Belgrado","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdad","Kaboel","Jeruzalem","Reykjavik","Sarajevo","Jerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Praag","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunis","Ulaanbaatar","Islamabad","manilla","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaoundé","Tasjkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Ababa","San Jose","Damascus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lomé","Asunción","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beiroet","Bisjkek","Asjchabad","Lilongwe","Khartoem","Bangui","Kinshasa","Muscat","Vaduz","Guatemala-Stad","Juba","Bujumbura","Monrovia","Harare","Koeweit Stad","Panama Stad","Freetown","Luxemburg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manamah","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsNB =>
      ["Beijing","New Delhi","Washington","Brasilia","Moskva","Mexico by","Tokyo","Teheran","Berlin","Ankara","Paris","London","Bangkok","Roma","Kairo","Pretoria","Seoul","Madrid","Buenos Aires","Brussel","Kiev","Warszawa","Ottawa","Wien","Bern","Amsterdam","Jakarta","Athen","Lisboa","Canberra","Bogota","Alger","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapest","Bucuresti","Riyadh","Sofia","København","Helsinki","Dublin","Oslo","Beograd","Kuala Lumpur","Lima","Tbilisi","Havanna","Accra","Astana","Bagdad","Kabul","Jerusalem","Reykjavik","Sarajevo","Jerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Praha","Quito","Dakar","Katmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Tasjkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damaskus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Bisjkek","Asjkhabad","Lilongwe","Khartoum","Bangui","Kinshasa","Muskat","Vaduz","Guatemala by","Juba","Bujumbura","Monrovia","Harare","Kuwait by","Panama by","Freetown","Luxembourg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsPL =>
      ["Pekin","Nowe Delhi","Waszyngton","Brazylia","Moskwa","Meksyk","Tokio","Teheran","Berlin","Ankara","Paryż","Londyn","Bangkok","Rzym","Kair","Pretoria","Seul","Madryt","Buenos Aires","Bruksela","Kijów","Warszawa","Ottawa","Wiedeń","Berno","Amsterdam","Djakarta","Ateny","Lizbona","Canberra","Bogota","Algier","Zagrzeb","Rabat","Hanoi","Sztokholm","Abudża","Santiago","Budapeszt","Bukareszt","Rijad","Sofia","Kopenhaga","Helsinki","Dublin","Osło","Belgrad","Kuala Lumpur","Lima","Tbilisi","Hawana","Akra","Astana","Bagdad","Kabul","Jerozolima","Reykjavik","Sarajewo","Erewan","Lublana","Wellington","Tirana","Bratysława","Carakas","Praga","Quito","Dakar","Katmandu","Mogadiszu","Baku","Tunis","Ułan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Wilno","Bamako","Podgorica","Mińsk","Jaunde","Taszkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Jamusukro","Nikozja","Antananarywa","Port-au-Prince","Luanda","Doha","Pjongjang","Dodoma","Sana","Niamey","Addis Abeba","San Jose","Damaszek","Amman","Santo Domingo","Abu Dabi","Tegucigalpa","Duszanbe","Monako","Ndżamena","Maputo","Tallinn","Singapur","Lusaka","Porto Novo","Port Moresby","Konakri","Lome","Asuncion","Wientian","Dhaka","Kigali","Wagadugu","Trypolis","Bejrut","Biszkek","Aszchabad","Lilongwe","Chartum","Bangi","Kinszasa","Muskat","Vaduz","Miasto Gwatemala","Dżuba","Bużumbura","Monrowia","Harare","Kuwejt","miasto Panama","Freetown","Luksemburg","Asmara","San Marino","Kiszyniów","Windhuk","Nawakszut","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Ryga","Bissau","Manama","Dili","Port Louis","Dżibuti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andora la Vella"];


  List<String> get _allCapitalsPT =>
      ["Pequim","Nova Delhi","Washington","Brasília","Moscou","Cidade do México","Tóquio","Teerã","Berlim","Ancara","Paris","Londres","Bangkok","Roma","Cairo","Pretória","Seul","Madri","Buenos Aires","Bruxelas","Kiev","Varsóvia","Ottawa","Viena","Berna","Amsterdã","Jacarta","Atenas","Lisboa","Canberra","Bogotá","Argel","Zagreb","Rabat","Hanói","Estocolmo","Abuja","Santiago","Budapeste","Bucareste","Riad","Sofia","Copenhague","Helsinque","Dublin","Oslo","Belgrado","Kuala Lumpur","Lima","Tbilisi","Havana","Acra","Astana","Bagdá","Cabul","Jerusalém","Reiquiavique","Sarajevo","Yerevan","Liubliana","Wellington","Tirana","Bratislava","Caracas","Praga","Quito","Dacar","Katmandu","Mogadíscio","Baku","Túnis","Ulaanbaatar","Islamabade","Manila","Colombo","Nairóbi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaoundé","Tasquente","Naypyidaw","Montevidéu","Kingston","Sucre","Campala","Yamoussoukro","Nicósia","Antananarivo","Porto Príncipe","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Adis Abeba","San José","Damasco","Amã","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Mônaco","N'Djamena","Maputo","Tallinn","Cingapura","Lusaka","Porto-Novo","Porto Moresby","Conacri","Lomé","Assunção","Vientiane","Daca","Kigali","Ouagadougou","Trípoli","Beirute","Bisqueque","Asgabade","Lilongwe","Cartum","Bangui","Kinshasa","Mascate","Vaduz","cidade da Guatemala","Juba","Bujumbura","Monróvia","Harare","Kuwait","Cidade do Panamá","Freetown","Luxemburgo","Asmara","São Marinho","Chisinau","Windhoek","Nouakchott","Gaborona","Libreville","Brazzaville","Escópia","Maseru","Riga","Bissau","Manama","Díli","Porto Louis","Djibuti","Georgetown","são Salvador","Valeta","Belmopan","Bridgetown","Vitória","Andorra-a-Velha"];


  List<String> get _allCapitalsRO =>
      ["Beijing","New Delhi","Washington","Brasilia","Moscova","Mexico City","Tokyo","Teheran","Berlin","Ankara","Paris","Londra","Bangkok","Roma","Cairo","Pretoria","Seul","Madrid","Buenos Aires","Bruxelles","Kiev","Varşovia","Ottawa","Viena","Berna","Amsterdam","Jakarta","Atena","Lisabona","Canberra","Bogota","Alger","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapesta","Bucureşti","Riad","Sofia","Copenhaga","Helsinki","Dublin","Oslo","Belgrad","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdad","Kabul","Ierusalim","Reykjavik","Saraievo","Erevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Praga","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Taşkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Phenian","Dodoma","Sanaa","Niamey","Addis Ababa","San Jose","Damasc","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dușanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Bișkek","Așgabat","Lilongwe","Khartum","Bangui","Kinshasa","Muscat","Vaduz","Ciudad de Guatemala","Juba","Bujumbura","Monrovia","Harare","Kuweit","Ciudad de Panamá","Freetown","Luxemburg","Asmara","San Marino","Chişinău","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopie","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsRU =>
      ["Пекин","Нью-Дели","Вашингтон","Бразилиа","Москва","Сьюдад-де-Мехико","Токио","Тегеран","Берлин","Анкара","Париж","Лондон","Бангкок","Рим","Каир","Претория","Сеул","Мадрид","Буэнос айрес","Брюссель","Киев","Варшава","Оттава","Вена","Берн","Амстердам","Джакарта","Афины","Лиссабон","Канберра","Богота","Алжир","Загреб","Рабат","Ханой","Стокгольм","Абуджа","Сантьяго","Будапешт","Бухарест","Эр-Рияд","София","Копенгаген","Хельсинки","Дублин","Осло","Белград","Куала-Лумпур","Лима","Тбилиси","Гавана","Аккра","Астана","Багдад","Кабул","Иерусалим","Рейкьявик","Сараево","Ереван","Любляна","Веллингтон","Тирана","Братислава","Каракас","Прага","Кито","Дакар","Катманду","Могадишо","Баку","Тунис","Улан-Батор","Исламабад","Манила","Коломбо","Найроби","Пномпень","Вильнюс","Бамако","Подгорица","Минск","Яунде","Ташкент","Нейпьидо","Монтевидео","Кингстон","Сукре","Кампала","Ямусукро","Никосия","Антананариву","Порт-о-Пренс","Луанда","Доха","Пхеньян","Додома","Сана","Ниамей","Аддис-Абеба","Сан - Хосе","Дамаск","Амман","Санто-Доминго","Абу Даби","Тегусигальпа","Душанбе","Монако","Нджамена","Мапуту","Таллинн","Сингапур","Лусака","Порто-Ново","Порт-Морсби","Конакри","Ломе","Асунсьон","Вьентьян","Дакка","Кигали","Уагадугу","Триполи","Бейрут","Бишкек","Ашхабад","Лилонгве","Хартум","Банги","Киншаса","Маскат","Вадуц","Гватема́ла","Джуба","Бужумбура","Монровия","Хараре","Кувейт","Панама","Фритаун","Люксембург","Асмэра","Сан-Марино","Кишинев","Виндхук","Нуакшот","Габороне","Либревиль","Браззавиль","Скопье","Масеру","Рига","Бисау","Манама","Дили","Порт-Луи","Джибути","Джорджтаун","Сан-Сальвадор","Валлетта","Бельмопан","Бриджтаун","Виктория","Андорра-ла-Велья"];


  List<String> get _allCapitalsSK =>
      ["Peking","Nové Dillí","Washington","Brasilia","Moskva","Ciudad de México","Tokio","Teherán","Berlín","Ankara","Paríž","Londýn","Bangkok","Rím","Káhira","Pretória","Soul","Madrid","Buenos Aires","Brusel","Kyjev","Varšava","Ottawa","Viedeň","Bern","Amsterdam","Jakarta","Atény","Lisabon","Canberra","Bogota","Alžír","Záhreb","Rabat","Hanoj","Štokholm","Abuja","Santiago","Budapešť","Bukurešť","Rijád","Sofia","Kodaň","Helsinki","Dublin","Oslo","Belehrad","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdad","Kábul","Jeruzalem","Reykjavík","Sarajevo","Jerevan","Ľubľana","Wellington","Tirana","Bratislava","Caracas","Praha","Quito","Dakar","Káthmandu","Mogadišo","Baku","Tunis","Ulánbátar","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Taškent","Nay Pyi Taw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikózia","Antananarivo","Port-au-Prince","Luanda","Dauha","Pjongčang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damask","Ammán","Santo Domingo","Abu Dhabi","Tegucigalpa","Dušanbe","Monako","N'Djamena","Maputo","Tallinn","Singapur","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dháka","Kigali","Ouagadougou","Tripolis","Bejrút","Biškek","Ašchabad","Lilongwe","Chartúm","Bangui","Kinshasa","Maskat","Vaduz","Guatemala City","Juba","Bujumbura","Monrovia","Harare","Kuvajt City","Panama City","Freetown","Luxembursko","Asmara","San Maríno","Kišiňov","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Džibutsko","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsSL =>
      ["Peking","New Delhi","Washington","Brazilija","Moskva","Ciudad de México","Tokio","Teheran","Berlin","Ankara","Pariz","London","Bangkok","Rim","Kairo","Pretoria","Seul","Madrid","Buenos Aires","Bruselj","Kijevu","Varšava","Ottawa","Dunaj","Bern","Amsterdam","Jakarta","Atene","Lizbona","Canberra","Bogota","Alžir","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budimpešta","Bukarešta","Riyadh","Sofija","Kopenhagen","Helsinki","Dublin","Oslo","Beograd","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdad","Kabul","Jeruzalem","Reykjavik","Sarajevo","Erevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Praga","Quito","Dakar","Katmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Taškent","Nepjido","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nikozija","Antananarivo","Port-au-Prince","Luanda","Doha","Pjongjang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damask","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dušanbe","Monako","N'Djamena","Maputo","Tallinn","Singapur","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Bejrut","Biškek","Ašhabad","Lilongwe","Kartum","Bangui","Kinšasa","Muškat","Vaduz","Gvatemala","Juba","Bujumbura","Monrovia","Harare","Kuvajt","Panama","Freetown","Luksemburg","Asmara","San Marino","Kišinjev","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Džibuti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Viktorija","Andorra la Vella"];


  List<String> get _allCapitalsSR =>
      ["Пекинг","Нев Делхи","Васхингтон","Бразилија","Москва","Мексико Сити","Токио","Техеран","Берлин","Анкара","Париз","Лондон","Бангкок","Рим","Каиро","Преторија","Сеоул","Мадрид","Буенос Ајрес","Брисел","Киев","Варшава","Оттава","Беч","Берн","Амстердам","Џакарта","Атхенс","Лисабон","Цанберра","Богота","Алжир","Загреб","Рабат","Ханој","Стоцкхолм","Абуја","Сантиаго","Будимпешта","Букурешт","Ријад","Софиа","Копенхаген","Хелсинки","Даблин","Осло","Београд","Куала Лумпур","Лима","Тбилиси","Хавана","Аццра","Астана","Багдад","Кабул","Јерусалим","Реикјавик","Сарајево","Иереван","Љубљана","Веллингтон","Тирана","Братислава","Царацас","Праг","Кито","Дакар","Катманду","Могадисху","Баку","Тунис","Улан Батор","Исламабад","Манила","Цоломбо","Најроби","Пном Пен","Вилниус","Бамако","Подгорица","Минск","Јаунде","Тасхкент","Нејпјидо","Монтевидео","Кингстон","Сукре","Кампала","Јамусукро","Никозија","Антананариво","Порт-о-Пренс","Луанда","Доха","Пјонгјанг","Додома","Санаа","Ниамеи","Адис Абеба","Сан Хосе","Дамаск","Амман","Санто Доминго","Абу Даби","Тегусигалпа","Душанбе","Монако","Нџамена","Мапуто","Таллинн","Сингапур","Лусака","Порто-Ново","Порт Моресби","Цонакри","Ломе","Асунцион","Вијентијан","Дхака","Кигали","Уагадугу","Триполи","Бејрут","Бисхкек","Асхгабат","Лилонгве","Кхартоум","Бангуи","Киншаса","Маскат","Вадуз","Гватемала","Јуба","Бујумбура","Монровија","Хараре","Кувајт","Панама","Фреетовн","Луксембург","Асмара","Сан-Марино","Кишињев","Виндхоек","Ноуакцхотт","Габороне","Либревилле","Бразавил","Скопје","Масеру","Рига","Бисау","Манама","Дили","Порт Лоуис","Џибути","Георгетовн","Сан Салвадор","Валета","Белмопан","Бридгетовн","Викторија","Андора ла Веља"];


  List<String> get _allCapitalsSV =>
      ["Peking","New Delhi","Washington","Brasilia","Moskva","Mexico City","Tokyo","Teheran","Berlin","Ankara","Paris","London","Bangkok","Rom","Kairo","Pretoria","Seoul","Madrid","Buenos Aires","Bryssel","Kiev","Warszawa","Ottawa","Wien","Bern","amsterdam","Jakarta","Aten","Lissabon","canberra","Bogota","alger","Zagreb","Rabat","hanoi","Stockholm","Abuja","Santiago","budapest","Bukarest","Riyadh","Sofia","köpenhamn","helsingfors","Dublin","Oslo","Belgrad","Kuala Lumpur","Lima","Tbilisi","Havanna","Accra","Astana","Bagdad","Kabul","Jerusalem","Reykjavik","Sarajevo","Jerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Prag","Quito","Dakar","Katmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnom Penh","Vilnius","Bamako","Podgorica","Minsk","Yaounde","Tasjkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","Dodoma","Sanaa","Niamey","Addis Abeba","San Jose","Damaskus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lomé","Asuncion","Vientiane","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Bisjkek","Asjchabad","Lilongwe","Khartoum","Bangui","Kinshasa","Muskat","Vaduz","Guatemala City","Juba","Bujumbura","Monrovia","Harare","Kuwait City","Panama City","Freetown","Luxemburg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsTH =>
      ["ปักกิ่ง","นิวเดลี","วอชิงตัน","บราซิเลีย","มอสโก","เม็กซิโกซิตี","โตเกียว","เตหะราน","เบอร์ลิน","อังการา","ปารีส","ลอนดอน","กรุงเทพฯ","โรม","ไคโร","พริทอเรีย","โซล","มาดริด","บัวโนสไอเรส","บรัสเซลส์","เคียฟ","วอร์ซอ","ออตตาวา","เวียนนา","แบร์น","อัมสเตอร์ดัม","จาการ์ตา","เอเธนส์","ลิสบอน","แคนเบอร์รา","โบโกตา","แอลเจียร์","ซาเกร็บ","ราบัต","ฮานอย","สตอกโฮล์ม","อาบูจา","ซานติอาโก","บูดาเปสต์","บูคาเรสต์","ริยาด","โซเฟีย","โคเปนเฮเกน","เฮลซิงกิ","ดับลิน","ออสโล","เบลเกรด","กัวลาลัมเปอร์","ลิมา","ทบิลิซิ","ฮาวานา","อักกรา","อัสตานา","แบกแดด","คาบูล","เยรูซาเลม","เรคยาวิก","ซาราเยโว","เยเรวาน","ลูบลิยานา","เวลลิงตัน","ติรานา","บราติสลาวา","การากัส","ปราก","กีโต","ดาการ์","กาฐมาณฑุ","โมกาดิชู","บากู","ตูนิส","อูลานบาตอร์","อิสลามาบัด","มะนิลา","โคลัมโบ","ไนโรบี","พนมเปญ","วิลนีอุส","บามาโก","พอดกอรีตซา","มินสค์","ยาอุนเด","ทาชเคนต์","เนปยีดอ","มอนเตวิเดโอ","คิงส์ตัน","ซูเกร","กัมปาลา","ยามูซูโกร","นิโคเซีย","อันตานานาริโว","ปอร์โตแปรงซ์","ลูอันดา","โดฮา","เปียงยาง","โดโดมะ","ซานา","นีอาเม","แอดดิสอาบาบา","ซานโฮเซ","ดามัสกัส","อัมมาน","ซานโตโดมิงโก","อาบูดาบี","เตกูซิกัลปา","ดูชานเบ","โมนาโก","เอ็นจาเมนา","มาปูโต","ทาลลินน์","สิงคโปร์","ลูซากา","ปอร์โต-โนโว","พอร์ตมอร์สบี","โกนากรี","โลเม","อาซุนซิออง","เวียงจันทน์","ธากา","คิกาลี","วากาดูกู","ตริโปลี","เบรุต","บิชเคก","อาชกาบัต","ลิลองเว","คาร์ทูม","บังกี","กินชาซา","มัสกัต","วาดุซ","กัวเตมาลาซิตี้","จูบา","บูจุมบูรา","มอนโรเวีย","ฮาราเร","คูเวตซิตี","ปานามาซิตี้","ฟรีทาวน์","ลักเซมเบิร์ก","แอสมารา","ซานมารีโน","คีชีเนา","วินด์ฮุก","นูแอกชอต","กาโบโรเน","ลีเบรอวิล","บราซซาวิล","สโกเปีย","มาเซรู","ริกา","บิสเซา","มานามา","ดิลี","พอร์ตลูอิส","จิบูตี","จอร์จทาวน์","ซานซัลวาดอร์","วัลเลตตา","เบลโมแพน","บริดจ์ทาวน์","วิคตอเรีย","อันดอร์ราลาเวยา"];


  List<String> get _allCapitalsTR =>
      ["Pekin","Yeni Delhi","Washington","Brezilya","Moskova","Meksiko","Tokyo","Tahran","Berlin","Ankara","Paris","Londra","Bangkok","Roma","Kahire","Pretoria","Seul","Madrid","Buenos Aires","Brüksel","Kiev","Varşova","Ottawa","Viyana","Bern","Amsterdam","Cakarta","Atina","Lizbon","kanberra","Bogota","Cezayir","Zagreb","Rabat","Hanoi","Stockholm","Abuja","Santiago","Budapeşte","Bükreş","Riyad","Sofya","Kopenhag","Helsinki","Dublin","oslo","Belgrad","kuala Lumpur","Lima","Tiflis","Havana","Akra","Astana","Bağdat","Kabil","Kudüs","Reykjavik","Saraybosna","Erivan","Ljubljana","Wellington","Tiran","Bratislava","Karakas","Prag","Quito","Dakar","Katmandu","Mogadişu","Bakü","Tunus","Ulan Batur","İslamabad","Manila","Kolombo","Nairobi","Phnom Penh","Vilnüs","Bamako","Podgoritsa","Minsk","yaounde","Taşkent","Nepido","Montevideo","Kingston","sucre","Kampala","Yamoussoukro","Lefkoşa","Antananarivo","Port-au-Prince","Luanda","Doha","Pyongyang","dodoma","sanaa","Niamey","Addis Ababa","San Jose","Şam","Amman","Santo Domingo","Abu Dabi","Tegucigalpa","Duşanbe","Monako","N'Djamena","Maputo","Tallinn","Singapur","Lusaka","Porto-Novo","Port Moresby","Konakri","lome","Asuncion","Vientian","Dakka","kigali","Ouagadougou","Trablus","Beyrut","Bişkek","Aşkabat","Lilongwe","Hartum","bangui","Kinşasa","maskat","Vaduz","Guatemala şehri","Juba","Bujumbura","Monrovia","harare","Kuveyt Şehri","Panama Şehri","Freetown","Lüksemburg","Asmara","San Marino","Kişinev","Windhoek","Nuakşot","Gaboron","Libreville","Brazzaville","Üsküp","Maseru","Riga","Bissau","Manama","dili","Port Louis","Cibuti","Georgetown","San Salvador","Valetta","Belmopan","Bridgetown","Victoria","Andora la Vella"];


  List<String> get _allCapitalsUK =>
      ["Пекін","Нью-Делі","Вашингтон","Бразиліа","Москва","Мехіко","Токіо","Тегеран","Берлін","Анкара","Париж","Лондон","Бангкок","Рим","Каїр","Преторія","Сеул","Мадрид","Буенос-Айрес","Брюссель","Київ","Варшава","Оттава","Відень","Берн","Амстердам","Джакарта","Афіни","Лісабон","Канберра","Богота","Алжир","Загреб","Рабат","Ханой","Стокгольм","Абуджа","Сантьяго","Будапешт","Бухарест","Ер-Ріяд","Софія","Копенгаген","Гельсінкі","Дублін","Осло","Белград","Куала-Лумпур","Ліма","Тбілісі","Гавана","Аккра","Астана","Багдад","Кабул","Єрусалим","Рейк'явік","Сараєво","Єреван","Любляна","Веллінгтон","Тирана","Братислава","Каракас","Прага","Кіто","Дакар","Катманду","Могадішо","Баку","Туніс","Улан-Батор","Ісламабад","Маніла","Коломбо","Найробі","Пномпень","Вільнюс","Бамако","Подгориця","Мінськ","Яунде","Ташкент","Найп'їдо","Монтевідео","Кінгстон","Сукре","Кампала","Ямусукро","Нікосія","Антананаріву","Порт-о-Пренс","Луанда","Доха","Пхеньян","Додома","Сана","Ніамей","Аддіс-Абеба","Сан-Хосе","Дамаск","Амман","Санто-Домінго","Абу-Дабі","Тегусігальпа","Душанбе","Монако","Нджамена","Мапуту","Таллінн","Сінгапур","Лусака","Порто-Ново","Порт-Морсбі","Конакрі","Ломе","Асунсьйон","В'єнтьян","Дакка","Кігалі","Уагадугу","Тріполі","Бейрут","Бішкек","Ашхабад","Лілонгве","Хартум","Бангі","Кіншаса","Маскат","Вадуц","Гватемала Сіті","Джуба","Бужумбура","Монровія","Хараре","Ель-Кувейт","Панама-Сіті","Фрітаун","Люксембург","Асмара","Сан-Марино","Кишинів","Віндхук","Нуакшот","Габороне","Лібревіль","Браззавіль","Скоп'є","Масеру","Рига","Біссау","Манама","Ділі","Порт-Луї","Джібуті","Джорджтаун","Сан-Сальвадор","Валлетта","Бельмопан","Бріджтаун","Вікторія","Андорра-ла-Велья"];


  List<String> get _allCapitalsVI =>
      ["Bắc Kinh","New Delhi","Washington","Brasilia","Moskva","Thành phố México","Tokyo","Tehran","Berlin","Ankara","Paris","Luân Đôn","Băng Cốc","Roma","Cairo","Pretoria","Seoul","Madrid","Buenos Aires","Bruxelles","Kiev","Warsaw","Ottawa","Vienna","Bern","Amsterdam","Jakarta","Athens","Lisboa","Canberra","Bogota","Algiers","Zagreb","Rabat","Hà Nội","Stockholm","Abuja","Santiago","Budapest","Bucharest","Riyadh","Sofia","Copenhagen","Helsinki","Dublin","Oslo","Beograd","Kuala Lumpur","Lima","Tbilisi","Havana","Accra","Astana","Bagdad","Kabul","Jerusalem","Reykjavik","Sarajevo","Yerevan","Ljubljana","Wellington","Tirana","Bratislava","Caracas","Praha","Quito","Dakar","Kathmandu","Mogadishu","Baku","Tunis","Ulan Bator","Islamabad","Manila","Colombo","Nairobi","Phnôm Pênh","Vilnius","Bamako","Podgorica","Minsk","Yaoundé","Tashkent","Naypyidaw","Montevideo","Kingston","Sucre","Kampala","Yamoussoukro","Nicosia","Antananarivo","Port-au-Prince","Luanda","Doha","Bình Nhưỡng","Dodoma","Sanaa","Niamey","Addis Ababa","San Jose","Damascus","Amman","Santo Domingo","Abu Dhabi","Tegucigalpa","Dushanbe","Monaco","N'Djamena","Maputo","Tallinn","Singapore","Lusaka","Porto-Novo","Port Moresby","Conakry","Lome","Asuncion","Viêng Chăn","Dhaka","Kigali","Ouagadougou","Tripoli","Beirut","Bishkek","Ashgabat","Lilongwe","Khartoum","Bangui","Kinshasa","Muscat","Vaduz","Thành phố Guatemala","Juba","Bujumbura","Monrovia","Harare","thành phố Kuwait","thành phố Panama","Freetown","Luxembourg","Asmara","San Marino","Chisinau","Windhoek","Nouakchott","Gaborone","Libreville","Brazzaville","Skopje","Maseru","Riga","Bissau","Manama","Dili","Port Louis","Djibouti","Georgetown","San Salvador","Valletta","Belmopan","Bridgetown","Victoria","Andorra la Vella"];


  List<String> get _allCapitalsZH =>
      ["北京","新德里","华盛顿","巴西利亚","莫斯科","墨西哥城","东京","德黑兰","柏林","安卡拉","巴黎","伦敦","曼谷","罗马","开罗","比勒陀利亚","汉城","马德里","布宜诺斯艾利斯","布鲁塞尔","基辅","华沙","渥太华","维也纳","伯尔尼","阿姆斯特丹","雅加达","雅典","里斯本","堪培拉","波哥大","阿尔及尔","萨格勒布","拉巴特","河内","斯德哥尔摩","阿布贾","圣地亚哥","布达佩斯","布加勒斯特","利雅得","苏菲亚","哥本哈根","赫尔辛基","都柏林","奥斯陆","贝尔格莱德","吉隆坡","利马","第比利斯","哈瓦那","阿克拉","阿斯塔纳","巴格达","喀布尔","耶路撒冷","雷克雅未克","塞拉耶佛","埃里温","卢布尔雅那","惠灵顿","地拉那","布拉迪斯拉发","卡拉卡斯","布拉格","基多","达喀尔","加德满都","摩加迪沙","巴库","突尼斯","乌兰巴托","伊斯兰堡","马尼拉","科伦坡","内罗毕","金边","维尔纽斯","巴马科","波德戈里察","明斯克","雅温得","塔什干","奈比多","蒙得维的亚","金士顿","苏克雷","坎帕拉","亚穆苏克罗","尼科西亚","塔那那利佛","太子港","罗安达","多哈","平壤","多多马","萨那","尼亚美","亚的斯亚贝巴","圣荷西","大马士革","安曼","圣多明哥","阿布扎比","特古西加尔巴","杜尚别","摩纳哥","恩贾梅纳","马普托","塔林","新加坡","路沙卡","波多诺伏","莫尔斯比港","科纳克里","洛美","亚松森","万象","达卡","基加利","瓦加杜古","的黎波里","贝鲁特","比什凯克","阿什哈巴德","利隆圭","喀土穆","班吉","金沙萨","马斯喀特","瓦杜兹","瓜地馬拉市","朱巴","布琼布拉","蒙羅維亞","哈拉雷","科威特城","巴拿馬城","弗里敦","卢森堡","阿斯马拉","圣马力诺","基希讷乌","温得和克","努瓦克肖特","哈博罗内","利伯维尔","布拉柴维尔","斯科普里","马塞卢","里加","比绍","麦纳麦","帝力","路易港","吉布提","乔治敦","圣萨尔瓦多","瓦莱塔","贝尔莫潘","布里奇顿","维多利亚","安道尔城"];


  void addAR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.ar;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["‎‎‎‎الدول الاسكندنافية‎‎:‎‎17,18,20‎", "‎‎‎‎شبه جزيرة البلقان‎‎:‎‎42,38,37,35,39,23,36,24,26,34‎", "‎‎‎‎منطقة دول البلطيق‎‎:‎‎29,30,31‎", "‎‎‎‎أمريكا الوسطى‎‎:‎‎164,165,166,171,172,173,174‎", "‎‎‎‎المغرب العربي‎‎:‎‎108,107,109,110,138‎", "‎‎‎‎شبه الجزيرة العربية‎‎:‎‎47,53,61,60,59,58,57,56‎", "‎‎‎‎شرق اسيا‎‎:‎‎86,87,88,89,90‎", "‎‎‎‎القوقاز‎‎:‎‎49,50,51‎", "‎‎‎‎جنوب شرق آسيا‎‎:‎‎76,77,78,79,80,81,82,83,84,85,94‎", "‎‎‎‎آسيا الوسطى‎‎:‎‎63,67,66,68,65‎", "‎‎‎‎جنوب افريقيا‎‎:‎‎155,156,157,158,159‎", "‎‎‎‎جنوب امريكا‎‎:‎‎183,184,185,186,187,188,189,190,191,192,193,194‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["‎‎‎‎الإتحاد السوفييتي‎‎:‎‎50,51,40,29,49,63,67,30,31,41,33,66,68,32,65‎", "‎‎‎‎سلطنة مغول الهند‎‎:‎‎64,73,69,70‎", "‎‎‎‎الإمبراطورية البريطانية‎‎:‎‎181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135‎", "‎‎‎‎إمبراطورية المغول‎‎:‎‎64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78‎", "‎‎‎‎الإمبراطورية الرومانية‎‎:‎‎38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16‎", "‎‎‎‎الإمبراطورية العثمانية‎‎:‎‎38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32‎", "‎‎‎‎الإمبراطورية البرتغالية‎‎:‎‎118,183,146,86,94,129,69,132,126,7,147,190‎", "‎‎‎‎إنكا الإمبراطورية‎‎:‎‎186,184,191,187,189,185‎", "‎‎‎‎امبراطورية المايا‎‎:‎‎162,164,166,174,172‎", "‎‎‎‎الإمبراطورية النمساوية المجرية‎‎:‎‎6,25,28,27,34,22,32,36,26,24,37,39,4‎", "‎‎‎‎الامبراطورية الفارسية‎‎:‎‎64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎برج إيفل ، باريس‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎الكولوسيوم ، روما‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎لافتة هوليوود ، لوس أنجلوس‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎الهرم الأكبر في الجيزة ، مصر‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎تمثال الحرية ، نيويورك‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎سور الصين العظيم‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎أنغكور وات ، كمبوديا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎الفاتيكان‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎برج بيزا المائل ، إيطاليا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎تمثال المسيح الفادي ، ريو دي جانيرو‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎دار أوبرا سيدني ، سيدني‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎أكروبوليس ، أثينا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎تاج محل ، الهند‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎الجامع الأزرق باسطنبول‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎برج خليفة ، دبي‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎متحف اللوفر ، باريس‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ماتشو بيتشو، بيرو‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎جدار برلين‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ديزني لاند ، كاليفورنيا‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎الميدان الأحمر ، موسكو‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎البتراء ، الأردن‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ذا ستريب ، لاس فيغاس‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎القصر الكبير ، بانكوك‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ساغرادا فاميليا ، برشلونة‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ضريح الإمبراطور الأول تشين ، الصين‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ميدان التايمز ، نيويورك‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎المدينة المحرمة ، بكين‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎كنيسة بورجوند ستاف ، النرويج‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎جامع الشيخ زايد ، أبو ظبي‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎قصر نويشفانشتاين ، ألمانيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎برج لؤلؤة الشرق ، شنغهاي‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎برجا بتروناس التوأم ، ماليزيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ميناء فيكتوريا ، هونغ كونغ‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎مكتبة سيلسوس ، أفسس‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎قناة بنما ، بنما‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎خليج ها لونج ، فيتنام‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎سالار دو أويوني ، بوليفيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎الثقب الأزرق العظيم ، بليز‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎بالي، اندونيسيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎شفق قطبي ، النرويج‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎جبل فوجي ، اليابان‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ميناء ريو دي جانيرو ، البرازيل‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎باريا كانيون ، الولايات المتحدة‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎جبل ايفرست ونيبال والتبت‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎شلالات نياجارا ، كندا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎البحيرة الوردية ، السنغال‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎الغابة السوداء ، ألمانيا‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎شلالات آنجل ، فنزويلا‎‎:‎‎1,2,4‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎جبل كليمنجارو ، تنزانيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎دلتا الدانوب ، رومانيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎شلالات فيكتوريا وزيمبابوي وزامبيا‎‎:‎‎5,6,9‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎عين الصحراء ، موريتانيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎البحر الميت ، إسرائيل‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎منحدرات موهير ، أيرلندا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎براكين الطين ، أذربيجان‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎بحيرة مورين ، كندا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎رخام الشيطان ، أستراليا‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎باموكالي ، تركيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎كانيو كريستيلز ، كولومبيا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎بركان باريكوتين ، المكسيك‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎موراكي بولدرز ، نيوزيلندا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎الكهف الأزرق ، إيطاليا‎‎:‎‎0,1,2‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎كهوف الرخام ، تشيلي‎‎:‎‎3,0,2‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎كهف الكريستال ، برمودا‎‎:‎‎0,1,2‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎جزيرة جيجو ، كوريا الجنوبية‎‎:‎‎1,2,5‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎شلالات اجوازو ، الأرجنتين والبرازيل‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ماترهورن ، سويسرا‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎جبل تيبل ، جنوب أفريقيا‎‎:‎‎1,6,5‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎بوطينة ، الإمارات العربية المتحدة‎‎:‎‎1,6,5‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎سونداربانس ، بنغلاديش‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎فيردون جورج ، فرنسا‎‎:‎‎‎‎:‎‎‎"]);
  }

  void addBG(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.bg;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Скандинавия:17,18,20", "Балкански полуостров:42,38,37,35,39,23,36,24,26,34", "регион на балтийските държави:29,30,31", "Централна Америка:164,165,166,171,172,173,174", "Магреб:108,107,109,110,138", "арабския полуостров:47,53,61,60,59,58,57,56", "източна Азия:86,87,88,89,90", "Кавказ:49,50,51", "Югоизточна Азия:76,77,78,79,80,81,82,83,84,85,94", "Централна Азия:63,67,66,68,65", "Южна Африка:155,156,157,158,159", "Южна Америка:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["съветски съюз:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Моголската империя:64,73,69,70", "Британска империя:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Монголска империя:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "римска империя:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Османската империя:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Португалска империя:118,183,146,86,94,129,69,132,126,7,147,190", "Империя на инките:186,184,191,187,189,185", "Цивилизация на маите:162,164,166,174,172", "Австро-Унгарска империя:6,25,28,27,34,22,32,36,26,24,37,39,4", "Персийска империя:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Айфелова кула, Париж::", ":Колизей, Рим::", ":Знак Голливуда, Лос Анджелис::", ":Хеопсова пирамида, Египет::", ":Статуя на Свободата, Ню Йорк::", ":Велика китайска стена::", ":Ангкор Ват, Камбоджа::", ":Ватикана::", ":Наклонена кула в Пиза, Италия::", ":Статуя на Христос Спасител, Рио де Жанейро::", ":Опера на Сидни, Сидни::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Акропол, Атина::", ":Тадж Махал, Индия::", ":Султан Ахмед джамия, Истанбул::", ":Бурдж Халифа, Дубай::", ":Лувър, Париж::", ":Мачу Пикчу, Перу::", ":Берлинска стена::", ":Дисниленд Ризорт, Калифорния::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Червен площад, Москва::", ":Петра, Йордания::", ":Лас-Вегас-Стрип::", ":Големият кралски дворец, Банкок::", ":Саграда Фамилия, Барселона::", ":Теракотена армия, Китай::", ":Таймс Скуеър, Ню Йорк::", ":Забраненият град, Пекин::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Дървената църква Боргунд, Норвегия::", ":Мечеть шейха Зайда, Абу Даби::", ":Нойшванщайн, Германия::", ":Ориенталска перлена кула, Шанхай::", ":Петронас, Малайзия::", ":Пристанище Виктория, Хонг Конг::", ":Библиотеката на Целз, Ефес::", ":Панамски канал, Панама::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Ха Лонг Бей, Виетнам::", ":Салар де Уюни, Боливия::", ":Синя дупка, Белиз::", ":Бали, Индонезия::", ":Северно сияние, Норвегия::", ":Фуджи, Япония::", ":Пристанище на Рио де Жанейро, Бразилия::", ":каньон пария, САЩ::", ":Връх Еверест, Непал и Тибет::", ":Ниагарския водопад, Канада::", ":Лак Роуз, Сенегал::", ":Шварцвалд, Германия::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Водопадът Анхел, Венецуела:1,2,4:", ":Килиманджаро, Танзания::", ":Делта на Дунав, Румъния::", ":Водопадът Виктория, Зимбабве и Замбия:5,6,9:", ":Окото на Сахара, Мавритания::", ":Мъртво море, Израел::", ":Скалы Мохер, Ирландия::", ":Кален вулкан, Азербайджан::", ":Езерото Морейн, Канада::", ":Дяволските мрамори, Австралия::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Памуккале, Турция::", ":Каньо Кристалес, Колумбия::", ":Вулкан Парикутин, Мексико::", ":Моераки боулдърс, Нова Зеландия::", ":Синя пещера, Италия:0,1,2:", ":Мраморните пещери, Чили:3,0,2:", ":Кристалната пещера, Бермуди:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Чеджу-до, Южна Корея:1,2,5:", ":Игуасу (водопад), Аржентина и Бразилия::", ":Матерхорн, Швейцария::", ":Тейбъл Маунтин, Южна Африка:1,6,5:", ":Бу Тина, Обединени арабски емирства:1,6,5:", ":Сундарбанс, Бангладеш::", ":Дефиле на Вердон, Франция::"]);
  }

  void addCS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.cs;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinávie:17,18,20", "Balkánský poloostrov:42,38,37,35,39,23,36,24,26,34", "Region pobaltských států:29,30,31", "Střední Amerika:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "arabský poloostrov:47,53,61,60,59,58,57,56", "východní Asie:86,87,88,89,90", "Kavkaz:49,50,51", "Jihovýchodní Asie:76,77,78,79,80,81,82,83,84,85,94", "Střední Asie:63,67,66,68,65", "Jižní Afrika:155,156,157,158,159", "Jižní Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovětský svaz:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mughalská říše:64,73,69,70", "Britské impérium:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolská říše:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Římská říše:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Osmanská říše:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugalská říše:118,183,146,86,94,129,69,132,126,7,147,190", "Incká říše:186,184,191,187,189,185", "Mayská říše:162,164,166,174,172", "Rakousko-Uhersko:6,25,28,27,34,22,32,36,26,24,37,39,4", "Perská říše:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffelova věž, Paříž::", ":Koloseum, Řím::", ":Nápis Hollywood, Los Angeles::", ":Velká pyramida v Gíze, Egypt::", ":Socha svobody, New York::", ":Velká čínská zeď::", ":Angkor Vat, Kambodža::", ":Vatikán::", ":Šikmá věž v Pise, Itálie::", ":Kristus Vykupitel, Rio de Janeiro::", ":Opera v Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Athény::", ":Tádž Mahal, Indie::", ":Modrá mešita, Istanbul::", ":Burdž Chalífa, Dubaj::", ":Muzeum Louvre, Paříž::", ":Machu Picchu, Peru::", ":Berlínská zeď::", ":Disneyland Resort, Kalifornie::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Rudé náměstí, Moskva::", ":Petra, Jordánsko::", ":The Strip, Las Vegas::", ":Velký palác, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Terakotová armáda, Čína::", ":Times Square, New York::", ":Zakázané město, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Sloupový kostel v Borgundu, Norsko::", ":Mešita Šejka Zayeda, Abú Dhabí::", ":Zámek Neuschwanstein, Německo::", ":Oriental Pearl Tower, Šanghaj::", ":Petronas Twin Towers, Malajsie::", ":Přístav Victoria, Hong Kong::", ":Knihovna Celsus, Efesus::", ":Panamský průplav, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Záliv Halong, Vietnam::", ":Salar de Uyuni, Bolívie::", ":Velká modrá díra, Belize::", ":Bali, Indonésie::", ":Polární záře, Norsko::", ":Fudži, Japonsko::", ":Přístav Rio de Janeiro, Brazílie::", ":Paria Kaňon, Spojené státy::", ":Mount Everest, Nepál a Tibet::", ":Niagarské vodopády, Kanada::", ":Lac Rose, Senegal::", ":Černý les, Německo::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Salto Ángel, Venezuela:1,2,4:", ":Kilimandžáro, Tanzanie::", ":Dunajská delta, Rumunsko::", ":Viktoriiny vodopády, Zimbabwe a Zambie:5,6,9:", ":Oko Sahary, Mauritánie::", ":Mrtvé moře, Izrael::", ":Útesy Moher, Irsko::", ":Bahenní sopky, Ázerbájdžán::", ":Jezero Moraine, Kanada::", ":Ďábelské kuličky, Austrálie::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turecko::", ":Řeka pěti barev, Columbia::", ":Sopka Paricutín, Mexiko::", ":Moeraki balvany, Nový Zéland::", ":Modrá jeskyně, Itálie:0,1,2:", ":Mramorové jeskyně, Chile:3,0,2:", ":Jeskyně Krystal, Bermudy:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Ostrov Jeju, Jižní Korea:1,2,5:", ":Vodopády Iguaçu, Argentina a Brazílie::", ":Matterhorn, Švýcarsko::", ":Stolová hora, Jižní Afrika:1,6,5:", ":Bu Tinah, Spojené arabské emiráty:1,6,5:", ":Sundarbans, Bangladéš::", ":Grand canyon du Verdon, Francie::"]);
  }

  void addDA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.da;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavien:17,18,20", "Balkanhalvøen:42,38,37,35,39,23,36,24,26,34", "Baltiske stater region:29,30,31", "Mellemamerika:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Arabiske Halvø:47,53,61,60,59,58,57,56", "øst Asien:86,87,88,89,90", "Kaukasus:49,50,51", "Sydøstasien:76,77,78,79,80,81,82,83,84,85,94", "Centralasien:63,67,66,68,65", "Sydlige Afrika:155,156,157,158,159", "Sydamerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovjetunionen:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mogulriget:64,73,69,70", "Britiske Imperium:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolske kejserdømme:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Romerriget:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Det Osmanniske Rige:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugisisk Imperium:118,183,146,86,94,129,69,132,126,7,147,190", "Inkariget:186,184,191,187,189,185", "Maya Imperium:162,164,166,174,172", "Østrig-Ungarsk Imperium:6,25,28,27,34,22,32,36,26,24,37,39,4", "Persisk Imperium:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffeltårnet, Paris::", ":Colosseum, Rom::", ":Hollywood Sign, Los Angeles::", ":Den store pyramide i Giza, Egypten::", ":Frihedsgudinden, New York::", ":Kinesiske mur::", ":Angkor Wat, Cambodja::", ":Vatikanstaten::", ":Skæve Tårn i Pisa, Italien::", ":Kristus forløser, Rio de Janeiro::", ":Operahuset i Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Athen::", ":Taj Mahal, Indien::", ":Blå Moské, Istanbul::", ":Burj Khalifa, Dubai::", ":Louvre, Paris::", ":Machu Picchu, Peru::", ":Berlinmuren::", ":Disneyland Resort, Californien::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Røde Plads, Moskva::", ":Petra, Jordan::", ":The Strip, Las Vegas::", ":Grand Palads, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Terrakottahæren, Kina::", ":Times Square, New York::", ":Forbudt By, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgund Stavkirke, Norge::", ":Sheik Zayed-moskeen, Abu Dhabi::", ":Neuschwanstein Slot, Tyskland::", ":Oriental Pearl Tower, Shanghai::", ":Petronas Twin Towers, Malaysia::", ":Victoria Havn, Hong Kong::", ":Celsus bibliotek, Efesus::", ":Panamakanalen, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Ha Long-bugten, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Store blå hul, Belize::", ":Bali, Indonesien::", ":Aurora Borealis, Norge::", ":Fuji, Japan::", ":Rio de Janeiro Havn, Brasilien::", ":Paria Canyon, USA::", ":Mount Everest, Nepal og Tibet::", ":Niagaravandfaldene, Canada::", ":Lac Rose, Senegal::", ":Schwarzwald, Tyskland::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Salto del Angel, Venezuela:1,2,4:", ":Kilimanjaro, Tanzania::", ":Donau-deltaet, Rumænien::", ":Victoria-vandfaldene, Zimbabwe og Zambia:5,6,9:", ":Sahara-øen, Mauretanien::", ":Det Døde Hav, Israel::", ":Klipper af Moher, Irland::", ":Mud vulkaner, Aserbajdsjan::", ":Moraine Sø, Canada::", ":Djævelens marmor, Australien::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Tyrkiet::", ":Floden af fem farver, Colombia::", ":Paricutín vulkan, Mexico::", ":Moeraki stenblokke, New Zealand::", ":Den blå grotte, Italien:0,1,2:", ":Marmorhule, Chile:3,0,2:", ":Krystal Hule, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jeju Ø, Sydkorea:1,2,5:", ":Iguazú-vandfaldene, Argentina og Brasilien::", ":Matterhorn, Schweiz::", ":Bord bjerg, Sydafrika:1,6,5:", ":Bu Tinah, De Forenede Arabiske Emirater:1,6,5:", ":Sundarbans, Bangladesh::", ":Verdon kløft, Frankrig::"]);
  }

  void addDE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.de;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavien:17,18,20", "Balkanhalbinsel:42,38,37,35,39,23,36,24,26,34", "Region Baltikum:29,30,31", "Zentralamerika:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Arabische Halbinsel:47,53,61,60,59,58,57,56", "Ostasien:86,87,88,89,90", "Kaukasus:49,50,51", "Südostasien:76,77,78,79,80,81,82,83,84,85,94", "Zentralasien:63,67,66,68,65", "Südliches Afrika:155,156,157,158,159", "Südamerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sowjetunion:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mogulreich:64,73,69,70", "Britische Weltreich:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolisches Reich:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Römisches Reich:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Osmanisches Reich:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugiesisches Reich:118,183,146,86,94,129,69,132,126,7,147,190", "Inka-Reich:186,184,191,187,189,185", "Maya-Reich:162,164,166,174,172", "Österreichisch-Ungarisches Reich:6,25,28,27,34,22,32,36,26,24,37,39,4", "Persisches Reich:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffelturm, Paris::", ":Kolosseum, Rom::", ":Hollywood Sign, Los Angeles::", ":Große Pyramide von Gizeh, Ägypten::", ":Freiheitsstatue, New York::", ":Chinesische Mauer::", ":Angkor Wat, Kambodscha::", ":Vatikanstadt::", ":Schiefer Turm von Pisa, Italien::", ":Christus der Erlöser, Rio de Janeiro::", ":Sydney Opernhaus, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Athen::", ":Taj Mahal, Indien::", ":Blaue Moschee, Istanbul::", ":Burj Khalifa, Dubai::", ":Louvre-Museum, Paris::", ":Machu Picchu, Peru::", ":Berliner Mauer::", ":Disneyland Resort, Kalifornien::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Roter Platz, Moskau::", ":Petra, Jordanien::", ":Der Strip, Las Vegas::", ":Großer Palast, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Terrakotta-Krieger, China::", ":Times Square, New York::", ":Verbotene Stadt, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgund Stabkirche, Norwegen::", ":Scheich-Zayid-Moschee, Abu Dhabi::", ":Schloss Neuschwanstein, Deutschland::", ":Orientalischer Perlenturm, Shanghai::", ":Petronas Twin Towers, Malaysia::", ":Victoria Harbour, Hongkong::", ":Bibliothek von Celsus, Ephesus::", ":Panamakanal, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Halong-Bucht, Vietnam::", ":Salar de Uyuni, Bolivien::", ":Das große blaue Loch, Belize::", ":Bali, Indonesien::", ":Die Aurora Borealis, Norwegen::", ":Berg Fuji, Japan::", ":Hafen von Rio De Janeiro, Brasilien::", ":Paria Schlucht, Vereinigte Staaten::", ":Mount Everest, Nepal und Tibet::", ":Niagarafälle, Kanada::", ":Retba-See, Senegal::", ":Der Schwarzwald, Deutschland::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angel Fälle, Venezuela:1,2,4:", ":Kilimanjaro, Tansania::", ":Donaudelta, Rumänien::", ":Viktoriafälle, Simbabwe und Sambia:5,6,9:", ":Auge der Sahara, Mauretanien::", ":Das Tote Meer, Israel::", ":Cliffs of Moher, Irland::", ":Schlammvulkane, Aserbaidschan::", ":Moraine Lake, Kanada::", ":Teufelsmurmeln, Australien::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Türkei::", ":Der Fluss der fünf Farben, Kolumbien::", ":Vulkan Paricutín, Mexiko::", ":Moeraki Boulders, Neuseeland::", ":Die Blaue Grotte, Italien:0,1,2:", ":Marmorhöhlen, Chile:3,0,2:", ":Kristallhöhle, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jejudo, Südkorea:1,2,5:", ":Iguazu Wasserfälle, Argentinien und Brasilien::", ":Matterhorn, Schweiz::", ":Tafelberg, Südafrika:1,6,5:", ":Bu Tinah, Vereinigte Arabische Emirate:1,6,5:", ":Sundarbans, Bangladesch::", ":Verdon Schlucht, Frankreich::"]);
  }

  void addEL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.el;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Σκανδιναβία:17,18,20", "Βαλκανική χερσόνησος:42,38,37,35,39,23,36,24,26,34", "περιοχή των χωρών της Βαλτικής:29,30,31", "Κεντρική Αμερική:164,165,166,171,172,173,174", "Μαγκρέμπ:108,107,109,110,138", "Αραβική Χερσόνησος:47,53,61,60,59,58,57,56", "ανατολική Ασία:86,87,88,89,90", "Καύκασος:49,50,51", "Νοτιοανατολική Ασία:76,77,78,79,80,81,82,83,84,85,94", "Κεντρική Ασία:63,67,66,68,65", "Μεσημβρινή Αφρική:155,156,157,158,159", "νότια Αμερική:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Σοβιετική Ένωση:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Αυτοκρατορία των Μουγκάλ:64,73,69,70", "Βρετανική Αυτοκρατορία:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Μογγολική Αυτοκρατορία:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Ρωμαϊκή Αυτοκρατορία:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Οθωμανική Αυτοκρατορία:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Πορτογαλική Αυτοκρατορία:118,183,146,86,94,129,69,132,126,7,147,190", "Αυτοκρατορία Inca:186,184,191,187,189,185", "Αυτοκρατορία των Μάγια:162,164,166,174,172", "Αυστροουγγρική Αυτοκρατορία:6,25,28,27,34,22,32,36,26,24,37,39,4", "Περσική Αυτοκρατορία:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Πύργος του Άιφελ, Παρίσι::", ":Κολοσσαίο, Ρώμη::", ":Σημάδι του Χόλιγουντ, Λος Άντζελες::", ":Μεγάλη Πυραμίδα της Γκίζας, Αίγυπτος::", ":Άγαλμα της Ελευθερίας, Νέα Υόρκη::", ":Σινικό τείχος της Κίνας::", ":Άνγκορ Βατ, Καμπότζη::", ":Πόλη του Βατικανού::", ":Πύργος της Πίζας, Ιταλία::", ":Χριστός Λυτρωτής, Ρίο ντε Τζανέιρο::", ":Όπερα του Σίδνεϊ, Σίδνεϊ::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Ακρόπολη, Αθήνα::", ":Ταζ Μαχάλ, Ινδία::", ":Μπλε Τζαμί, Κωνσταντινούπολη::", ":Μπουρτζ Χαλίφα, Ντουμπάι::", ":Μουσείο του Λούβρου, Παρίσι::", ":Μάτσου Πίτσου, Περού::", ":Τοίχος του Βερολίνου::", ":Disneyland Θέρετρο, Καλιφόρνια::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Κόκκινη Πλατεία, Μόσχα::", ":Πέτρα, Ιορδανία::", ":Η Γάζα, Λας Βέγκας::", ":Μεγάλο παλάτι, Μπανγκόκ::", ":Σαγράδα Φαμίλια, Βαρκελώνη::", ":Πολεμιστές Terra Cotta, Κίνα::", ":Times Square, Νέα Υόρκη::", ":Απαγορευμένη Πόλη, Πεκίνο::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Εκκλησία Borgund Stave, Νορβηγία::", ":Τζαμί Σέιχ Ζάιεντ, Αμπού Ντάμπι::", ":Κάστρο Νοϊσβάνσταϊν, Γερμανία::", ":Πύργος Oriental Pearl, Σαγκάη::", ":Πετρονάς Δίδυμοι Πύργοι, Μαλαισία::", ":Λιμάνι Βικτόρια, Χονγκ Κονγκ::", ":Βιβλιοθήκη του Κέλσου, Έφεσος::", ":Κανάλι του Παναμά, Παναμάς::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Κόλπος Χαλόνγκ, Βιετνάμ::", ":Σαλάρ ντε Ουγιούι, Βολιβία::", ":Η Μεγάλη Μπλε Τρύπα, Μπελίζε::", ":Μπαλί, Ινδονησία::", ":Βόρειο σέλας, Νορβηγία::", ":βουνό Φούτζι, Ιαπωνία::", ":Λιμάνι του Ρίο Ντε Τζανέιρο, Βραζιλία::", ":Φαράγγι, Ηνωμένες Πολιτείες::", ":Έβερεστ, Νεπάλ και Θιβέτ::", ":Καταρράκτες του Νιαγάρα, Καναδάς::", ":Λίμνη Τριαντάφυλλο, Σενεγάλη::", ":Το Μέλανα Δρυμό, Γερμανία::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":καταρράκτες Έιντζελ, Βενεζουέλα:1,2,4:", ":Όρος Κιλιμάντζαρο, Τανζανία::", ":Δέλτα του Δούναβη, Ρουμανία::", ":Βικτώριας, Ζιμπάμπουε και Ζάμπια:5,6,9:", ":Μάτι της Σαχάρας, Μαυριτανία::", ":Η Νεκρά Θάλασσα, Ισραήλ::", ":Βράχοι του Μοχέρ, Ιρλανδία::", ":Ηφαιστειακά λάσπη, Αζερμπαϊτζάν::", ":Η λίμνη Moraine, Καναδάς::", ":Μάρμαρα του διαβόλου, Αυστραλία::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Παμούκκαλε, Τουρκία::", ":Ο ποταμός πέντε χρωμάτων, Κολούμπια::", ":Ηφαίστειο Paricutín, Μεξικό::", ":Μολάκη Μολδάκι, Νέα Ζηλανδία::", ":Η Γαλάζια Σπηλιά, Ιταλία:0,1,2:", ":Μάρμαρα Σπήλαια, Χιλή:3,0,2:", ":Κρυσταλλική Σπηλιά, Βερμούδες:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Νήσος Jeju, Νότια Κορέα:1,2,5:", ":Καταρράκτες Iguazu, Αργεντινή και Βραζιλία::", ":Μάττερχορν, Ελβετία::", ":Τραπέζι Βουνό, Νότια Αφρική:1,6,5:", ":Bu Tinah, Ηνωμένα Αραβικά Εμιράτα:1,6,5:", ":Σούντορμπον, Μπανγκλαντές::", ":Φαράγγι του Verdon, Γαλλία::"]);
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["86:1427647786","69:1352642280","160:327096265","77:267670543","70:212228286","183:209469323","111:195874683","73:161376708","33:145734038","87:127202192","162:126190788","150:109224414","80:106651394","106:98423598","78:95545962","122:84068091","0:83124418","46:82340088","45:81800188","76:68863514","2:67141684","1:64990511","4:60627291","155:57792518","119:56313438","82:53708320","149:51392565","88:51171706","185:49661048","3:46692858","184:44361150","32:44246156","116:42729036","107:42228408","151:41801533","47:38433600","22:37921592","64:37171921","161:37074562","108:36029093","56:33702756","65:32476244","187:31989260","79:31528033","118:30809787","126:29496004","188:28887118","59:28498683","112:28206728","71:28095714","124:26262313","89:25549604","115:25216267","117:25069230","91:24898152","120:22442822","72:21228763","123:19751466","34:19506114","114:19077749","186:18729160","63:18319618","132:18143217","127:17351708","164:17247849","189:17084358","9:17059560","52:16945057","84:16249792","113:15854323","125:15477729","148:15008226","135:14438802","129:12414293","131:12301970","109:11565201","128:11485044","5:11482178","191:11353142","163:11338134","169:11123178","152:10975927","28:10665677","170:10627141","133:10524117","23:10522246","7:10256193","17:9971638","53:9965318","51:9949537","25:9707499","57:9630959","174:9587522","40:9452617","66:9100835","6:8891388","36:8802754","93:8606323","8:8525611","48:8381516","130:7889093","136:7650150","83:7061507","35:7051608","192:6956066","54:6859408","110:6678559","173:6465501","172:6420746","67:6304030","68:5850901","81:5757499","18:5752126","19:5522576","27:5453014","20:5337962","140:5244359","165:4999441","55:4862979","60:4829473","134:4818973","10:4818690","92:4743131","121:4666368","138:4403313","171:4176869","24:4156405","61:4137312","41:4051944","49:4002942","153:3452786","190:3449285","37:3323925","90:3170216","50:2951745","168:2934847","38:2882740","31:2801264","58:2781682","156:2448301","137:2280094","157:2254068","139:2119275","158:2108328","42:2082957","26:2077837","30:1928459","141:1874303","62:1569446","178:1389843","29:1322920","142:1308975","94:1267974","143:1189265","43:1170125","159:1136281","154:958923","95:883483","145:832322","193:779006","74:754388","96:652857","39:627809","12:604245","194:575990","146:543767","75:515696","44:439248","85:428963","167:385637","166:383071","21:336713","97:292680","179:286641","147:211028","98:196129","175:181889","99:115847","100:112640","176:111454","101:110589","180:110211","144:97096","181:96286","14:77006","177:71625","102:58413","182:52441","11:38682","13:37910","15:33785","103:17907","105:11508","104:10670","16:801"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["33:17098246","161:9984670","86:9596961","160:9525067","183:8515767","91:7692024","69:3287263","184:2780400","63:2724900","107:2381741","122:2344858","56:2149690","162:1964375","77:1910931","151:1861484","110:1759540","45:1648195","90:1564110","187:1285216","125:1284000","120:1267000","118:1246700","114:1240192","155:1221037","185:1141748","150:1104300","191:1098581","138:1030700","106:1002450","119:945087","111:923768","188:916445","70:907132","156:825615","126:801590","46:783562","186:756102","127:752612","82:676578","64:652230","152:644329","148:637657","121:622984","32:603500","124:587041","157:581730","149:580367","1:543940","59:527968","76:513120","3:505992","68:488100","115:475442","93:462840","17:450295","65:447400","108:446550","47:438317","192:406752","135:390757","87:377975","0:357114","140:342000","19:338424","78:331212","79:330803","20:323802","117:322463","22:312696","60:309500","4:301339","80:300000","189:276841","123:274222","92:270467","139:267668","129:245857","2:242495","116:241550","112:238533","34:238397","83:236800","193:214969","40:207600","67:199951","113:196722","52:185180","84:181035","190:176215","194:163820","109:163610","73:147570","71:147516","66:143100","23:131957","173:130373","89:120540","132:118484","153:117600","128:114763","174:112492","134:111369","35:111002","163:109884","164:108889","21:103000","88:100210","25:93028","7:92090","53:89342","36:88361","51:86600","6:83871","57:83600","28:78865","171:75417","136:71740","10:70273","49:69700","72:65610","31:65300","30:64559","130:56785","24:56594","37:51209","165:51100","27:49037","170:48671","29:45227","18:43094","9:41850","8:41284","74:38394","141:36125","41:33846","5:30528","158:30355","50:29743","96:28896","38:28748","142:28051","133:27834","169:27750","131:26338","42:25713","154:23200","166:22966","172:21041","48:20770","26:20273","95:18272","61:17818","159:17364","94:14919","167:13943","39:13812","97:12189","58:11586","137:11295","168:10991","54:10452","43:9251","55:6020","85:5765","178:5130","146:4033","98:2842","12:2586","143:2040","145:1862","147:964","99:811","62:778","177:751","101:747","81:726","100:702","175:616","14:468","103:459","144:452","181:442","179:430","180:389","176:344","44:316","75:300","182:261","102:181","13:160","15:61","105:26","104:21","11:2.02","16:0.49"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["0:6,5,28,18,1,12,9,22,8","160:161,162","49:50,51,33,46","184:191,183,186,192,190","86:64,74,69,63,89,67,83,90,82,71,33,66,78,70","122:118,133,121,140,131,152,119,116,127","6:28,0,25,4,13,27,26,8","1:14,5,0,4,12,11,3,8","33:51,40,86,29,19,49,63,89,30,31,90,20,22,32","36:37,35,24,25,39,42,34","119:133,122,149,132,126,131,116,127","46:50,51,35,49,23,45,47,52","127:118,157,122,132,126,156,119,135","107:110,114,138,108,120,109","25:6,24,34,36,27,26,32","69:73,74,86,82,71,70,72","45:64,50,51,47,70,46,68","114:107,123,117,129,138,120,113","183:184,191,185,193,192,187,194,190,188","120:107,128,123,125,110,114,111","22:40,28,0,31,33,27,32","56:47,53,61,60,58,57,59","151:121,125,106,153,150,110,152","32:40,25,41,22,34,33,27","64:86,45,70,66,68,65","123:128,117,112,114,120,130","115:121,125,140,142,139,111","121:115,125,122,140,152,151","125:115,121,110,120,111,151","150:154,153,149,148,152,151","129:117,141,134,114,113,136","47:45,53,61,56,52,46","4:6,1,15,26,8,16","110:107,125,106,120,151,109","126:159,132,155,119,127,135","155:157,159,158,126,156,135","152:121,122,150,149,151,116","51:50,49,45,33,46","40:30,31,22,33,32","191:184,183,186,192,187","35:23,42,34,36,46","185:183,189,171,187,188","140:118,115,121,122,139","117:123,112,129,134,114","24:37,25,39,36,26","48:106,55,53,54,52","53:47,48,56,52,55","63:86,67,33,68,65","149:150,148,152,119,116","83:84,86,82,76,78","39:38,37,24,36","82:73,86,69,83,76","42:38,35,23,36","187:191,183,186,185,189","34:35,25,41,36,32","113:137,129,141,114,138","27:6,28,25,22,32","3:14,1,7,108","8:6,1,4,13,0","52:47,48,53,54,46","116:122,149,131,152,119","65:64,63,67,66,68","38:23,42,39","118:122,140,156,127","50:51,49,45,46","5:1,0,12,9","128:123,120,111,130","157:156,155,127,135","28:6,0,22,27","106:55,48,110,151","23:38,35,46,42","164:166,172,174,162","67:86,63,66,65","30:40,29,31,33","31:40,30,22,33","138:107,114,113","156:118,157,155,127","111:128,115,125,120","70:64,69,45,86","131:133,122,119,116","26:6,24,4,25","66:64,86,67,65","76:84,83,79,82","68:64,45,63,65","135:157,126,155,127","37:24,39,36","133:122,131,119","84:83,76,78","186:184,191,187","154:153,150","153:154,150,151","19:20,17,33","139:115,140,142","112:123,117,130","193:183,194,188","174:164,172,173","77:94,79,93","89:86,88,33","134:129,117,136","12:5,1,0","132:126,119,127","79:85,77,76","162:166,164,160","108:107,3","9:5,0","20:19,17,33","60:56,57,59","55:106,48,53","192:184,191,183","148:154,150,149","194:183,193","130:128,123,112","188:183,185,193","78:84,86,83","14:1,3","73:69,82","166:164,162","74:86,69","165:173,171","189:185,187","172:164,174","142:115,139","29:30,33","159:126,155","141:129,113","61:47,56","54:48,52","13:6,8","41:34,32","90:86,33","71:86,69","173:165,174","171:185,165","136:129,134","17:19,20","109:107,110","57:60,56","190:184,183","59:60,56","85:79","161:160","18:0","170:169","94:77","137:113","169:170","10:2","88:89","158:155","11:1","93:77","7:3","58:56","15:4","2:10","16:4"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Scandinavia:17,18,20", "Balkan Peninsula:42,38,37,35,39,23,36,24,26,34", "Baltic states region:29,30,31", "Central America:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Arabian Peninsula:47,53,61,60,59,58,57,56", "East Asia:86,87,88,89,90", "Caucasus:49,50,51", "Southeast Asia:76,77,78,79,80,81,82,83,84,85,94", "Central Asia:63,67,66,68,65", "Southern Africa:155,156,157,158,159", "South America:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Soviet Union:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mughal Empire:64,73,69,70", "British Empire:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongol Empire:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Roman Empire:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Ottoman Empire:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portuguese Empire:118,183,146,86,94,129,69,132,126,7,147,190", "Inca Empire:186,184,191,187,189,185", "Mayan Empire:162,164,166,174,172", "Austro-Hungarian Empire:6,25,28,27,34,22,32,36,26,24,37,39,4", "Persian Empire:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffel Tower, Paris::", ":Colosseum, Rome::", ":Hollywood Sign, Los Angeles::", ":Great Pyramid of Giza, Egypt::", ":Statue of Liberty, New York::", ":Great Wall of China::", ":Angkor Wat, Cambodia::", ":Vatican City::", ":Leaning Tower of Pisa, Italy::", ":Christ the Redeemer, Rio de Janeiro::", ":Sydney Opera House, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Acropolis, Athens::", ":Taj Mahal, India::", ":Blue Mosque, Istanbul::", ":Burj Khalifa, Dubai::", ":Louvre Museum, Paris::", ":Machu Picchu, Peru::", ":Berlin Wall::", ":Disneyland Resort, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Red Square, Moscow::", ":Petra, Jordan::", ":The Strip, Las Vegas::", ":Grand Palace, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Terra Cotta Warriors, China::", ":Times Square, New York::", ":Forbidden City, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgund Stave Church, Norway::", ":Sheikh Zayed Mosque, Abu Dhabi::", ":Neuschwanstein Castle, Germany::", ":Oriental Pearl Tower, Shanghai::", ":Petronas Twin Towers, Malaysia::", ":Victoria Harbour, Hong Kong::", ":Library of Celsus, Ephesus::", ":Panama Canal, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Ha Long Bay, Vietnam::", ":Salar de Uyuni, Bolivia::", ":The Great Blue Hole, Belize::", ":Bali, Indonesia::", ":The Aurora Borealis, Norway::", ":Mount Fuji, Japan::", ":Harbor of Rio De Janeiro, Brazil::", ":Paria Canyon, United States::", ":Mount Everest, Nepal and Tibet::", ":Niagara Falls, Canada::", ":Lac Rose, Senegal::", ":The Black Forest, Germany::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angel Falls, Venezuela:1,2,4:", ":Mount Kilimanjaro, Tanzania::", ":Danube Delta, Romania::", ":Victoria Falls, Zimbabwe and Zambia:5,6,9:", ":Eye of the Sahara, Mauritania::", ":The Dead Sea, Israel::", ":Cliffs of Moher, Ireland::", ":Mud volcanoes, Azerbaijan::", ":Moraine Lake, Canada::", ":Devil's Marbles, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turkey::", ":The River of Five Colors, Colombia::", ":Paricutín Volcano, Mexico::", ":Moeraki Boulders, New Zealand::", ":The Blue Grotto, Italy:0,1,2:", ":Marble Caves, Chile:3,0,2:", ":Crystal Cave, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jeju Island, South Korea:1,2,5:", ":Iguazu Falls, Argentina and Brazil::", ":Matterhorn, Switzerland::", ":Table Mountain, South Africa:1,6,5:", ":Bu Tinah, United Arab Emirates:1,6,5:", ":Sundarbans, Bangladesh::", ":Verdon Gorge, France::"]);
  }

  void addES(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.es;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Escandinavia:17,18,20", "Península de los Balcanes:42,38,37,35,39,23,36,24,26,34", "región de los estados bálticos:29,30,31", "Centroamérica:164,165,166,171,172,173,174", "Magreb:108,107,109,110,138", "Península Arabica:47,53,61,60,59,58,57,56", "este de Asia:86,87,88,89,90", "Cáucaso:49,50,51", "Sudeste Asiático:76,77,78,79,80,81,82,83,84,85,94", "Asia Central:63,67,66,68,65", "África austral:155,156,157,158,159", "Sudamerica:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Unión Soviética:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Imperio Mogol:64,73,69,70", "Imperio Británico:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Imperio Mongol:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Imperio Romano:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Imperio Otomano:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Imperio Portugués:118,183,146,86,94,129,69,132,126,7,147,190", "Imperio Inca:186,184,191,187,189,185", "Imperio Maya:162,164,166,174,172", "Imperio Austro-Húngaro:6,25,28,27,34,22,32,36,26,24,37,39,4", "Imperio Persa:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Torre Eiffel, París::", ":Coliseo, Roma::", ":Hollywood Sign, Los Angeles::", ":Gran pirámide de Giza, Egipto::", ":Estatua de la Libertad, Nueva York::", ":Gran Muralla de China::", ":Angkor Wat, Camboya::", ":Ciudad del Vaticano::", ":Torre inclinada de Pisa, Italia::", ":Cristo Redentor, Río de Janeiro::", ":Ópera de Sídney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Acrópolis, Atenas::", ":Taj Mahal, India::", ":Mezquita Azul, Estambul::", ":Burj Khalifa, Dubai::", ":Museo del Louvre, París::", ":Machu Picchu, Perú::", ":Muro de Berlín::", ":Disneyland Resort, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Plaza Roja, Moscú::", ":Petra, Jordania::", ":The Strip, Las Vegas::", ":Gran palacio, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Guerreros de Terracota, China::", ":Times Square, Nueva York::", ":Ciudad Prohibida, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Iglesia de madera de Borgund, Noruega::", ":Mezquita Sheikh Zayed, Abu Dhabi::", ":Castillo de Neuschwanstein, Alemania::", ":Oriental Pearl Tower, Shanghai::", ":Torres Petronas, Malasia::", ":Puerto Victoria, Hong Kong::", ":Biblioteca de Celso, Éfeso::", ":Canal de Panamá, Panamá::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Bahía de Ha Long, Vietnam::", ":Salar de Uyuni, Bolivia::", ":El gran agujero azul, Belice::", ":Bali, Indonesia::", ":La Aurora Boreal, Noruega::", ":Monte Fuji, Japón::", ":Puerto de Río de Janeiro, Brasil::", ":Cañón Paria, Estados Unidos::", ":Monte Everest, Nepal y Tíbet::", ":Cataratas del Niágara, Canadá::", ":Lago Rosa, Senegal::", ":El Bosque Negro, Alemania::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Salto Ángel, Venezuela:1,2,4:", ":Monte Kilimanjaro, Tanzania::", ":Delta del Danubio, Rumania::", ":Cataratas Victoria, Zimbabwe y Zambia:5,6,9:", ":Ojo del Sahara, Mauritania::", ":El Mar Muerto, Israel::", ":Acantilados de Moher, Irlanda::", ":Volcanes de barro, Azerbaiyán::", ":Lago Moraine, Canadá::", ":Canicas del diablo, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turquía::", ":El río de los cinco colores, Colombia::", ":Volcán Paricutín, México::", ":Cantos rodados de Moeraki, Nueva Zelanda::", ":La gruta azul, Italia:0,1,2:", ":Cuevas de Mármol, Chile:3,0,2:", ":Cueva de cristal, Bermudas:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Isla de Jeju, Corea del Sur:1,2,5:", ":Cataratas del Iguazú, Argentina y Brasil::", ":Matterhorn, Suiza::", ":Montaña de la Mesa, Sudáfrica:1,6,5:", ":Bu Tinah, Emiratos Árabes Unidos:1,6,5:", ":Sundarbans, Bangladesh::", ":Gargantas del Verdon, Francia::"]);
  }

  void addFI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.fi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavia:17,18,20", "Balkanin niemimaa:42,38,37,35,39,23,36,24,26,34", "Baltian maiden alue:29,30,31", "Keski-Amerikka:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Arabian niemimaa:47,53,61,60,59,58,57,56", "Itä-Aasia:86,87,88,89,90", "Kaukasus:49,50,51", "Kaakkois-Aasia:76,77,78,79,80,81,82,83,84,85,94", "Keski-Aasia:63,67,66,68,65", "Eteläinen Afrikka:155,156,157,158,159", "Etelä-Amerikka:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Neuvostoliitto:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Suurmogulien valtakunta:64,73,69,70", "Britannian imperiumi:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolien valtakunta:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Rooman valtakunta:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Ottomaanien valtakunta:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugalin valtakunta:118,183,146,86,94,129,69,132,126,7,147,190", "Inkojen valtakunta:186,184,191,187,189,185", "Mayan valtakunta:162,164,166,174,172", "Itä-Unkarin valtakunta:6,25,28,27,34,22,32,36,26,24,37,39,4", "Persian valtakunta:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffel-torni, Pariisi::", ":Colosseum, Rooma::", ":Hollywood-kyltti, Los Angeles::", ":Gizan suuri pyramidi, Egypti::", ":Vapaudenpatsas, New York::", ":Kiinan suuri muuri::", ":Angkor Wat, Kambodža::", ":Vatikaani::", ":Pisan kalteva torni, Italia::", ":Kristuksen Lunastaja, Rio de Janeiro::", ":Sydneyn oopperatalo, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Ateena::", ":Taj Mahal, Intia::", ":Sininen moskeija, Istanbul::", ":Burj Khalifa, Dubai::", ":Louvre-museo, Pariisi::", ":Machu Picchu, Peru::", ":Berliinin muuri::", ":Disneyland Resort, Kalifornia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Punainen tori, Moskova::", ":Petra, Jordania::", ":The Strip, Las Vegas::", ":Suuri palatsi, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Terrakotta-armeija, Kiina::", ":Times Square, New York::", ":Kielletty kaupunki, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgundin sauvakirkko, Norja::", ":Šeikki Zayedin moskeija, Abu Dhabi::", ":Neuschwansteinin linna, Saksa::", ":Oriental Pearl Tower, Shanghai::", ":Petronas Twin Towers, Malesia::", ":Victoria Harbour, Hong Kong::", ":Celsuksen kirjasto, Efesos::", ":Panaman kanava, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Halonginlahti, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Suuri sininen reikä, Belize::", ":Bali, Indonesia::", ":Revontulet, Norja::", ":Fuji, Japani::", ":Rio de Janeiron satama, Brasilia::", ":Parian kanjoni, Yhdysvallat::", ":Everest, Nepal ja Tiibet::", ":Niagaran putoukset, Kanada::", ":Lac Rose, Senegal::", ":Musta metsä, Saksa::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angelin putoukset, Venezuela:1,2,4:", ":Kilimanjaro, Tansania::", ":Tonava Delta, Romania::", ":Victorian putoukset, Zimbabwe ja Sambia:5,6,9:", ":Saharan silmä, Mauritania::", ":Kuollut meri, Israel::", ":Moherin kallio, Irlanti::", ":Muta tulivuoria, Azerbaijan::", ":Moreenijärvi, Kanada::", ":Paholaisen marmorit, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turkki::", ":Viiden värin joki, Columbia::", ":Paricutín-tulivuori, Meksiko::", ":Moeraki Lohkareita, Uusi-Seelanti::", ":Sininen luola, Italia:0,1,2:", ":Marmori luolat, Chile:3,0,2:", ":Kristalli luola, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jeju Saari, Etelä-Korea:1,2,5:", ":Iguazun putoukset, Argentiina ja Brasilia::", ":Matterhorn, Sveitsi::", ":Pöytävuori, Etelä-Afrikka:1,6,5:", ":Bu Tinah, Arabiemiirikunnat:1,6,5:", ":Sundarbans, Bangladesh::", ":Verdon rotko, Ranska::"]);
  }

  void addFR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.fr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Scandinavie:17,18,20", "Péninsule balkanique:42,38,37,35,39,23,36,24,26,34", "Région des États baltes:29,30,31", "Amérique centrale:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "péninsule arabique:47,53,61,60,59,58,57,56", "Asie de l'Est:86,87,88,89,90", "Caucase:49,50,51", "Asie du Sud-Est:76,77,78,79,80,81,82,83,84,85,94", "Asie centrale:63,67,66,68,65", "Afrique australe:155,156,157,158,159", "Amérique du Sud:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Union soviétique:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Empire moghol:64,73,69,70", "Empire britannique:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Empire mongol:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Empire romain:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Empire ottoman:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Empire portugais:118,183,146,86,94,129,69,132,126,7,147,190", "Empire inca:186,184,191,187,189,185", "Empire maya:162,164,166,174,172", "Empire austro-hongrois:6,25,28,27,34,22,32,36,26,24,37,39,4", "Empire perse:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Tour Eiffel, Paris::", ":Colisée, Rome::", ":Panneau Hollywood, Los Angeles::", ":Grande Pyramide de Gizeh, Egypte::", ":Statue de la Liberté, New York::", ":Grande Muraille de Chine::", ":Angkor Wat, Cambodge::", ":Cité du Vatican::", ":Tour penchée de Pise, Italie::", ":Christ Rédempteur, Rio de Janeiro::", ":Opéra de Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Acropole, Athènes::", ":Taj Mahal, Inde::", ":Mosquée Bleue, Istanbul::", ":Burj Khalifa, Dubai::", ":Musée du Louvre, Paris::", ":Machu Picchu, Pérou::", ":Mur de Berlin::", ":Disneyland Resort, Californie::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Place Rouge, Moscou::", ":Petra, Jordanie::", ":The Strip, Las Vegas::", ":Grand Palais, Bangkok::", ":La Sagrada Familia, Barcelone::", ":Guerriers en terre cuite, Chine::", ":Times Square, New York::", ":Cité Interdite, Pékin::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Eglise Borgund Stave, Norvège::", ":Mosquée Cheikh Zayed, Abu Dhabi::", ":Château de Neuschwanstein, Allemagne::", ":Tour de la Perle de l'Orient, Shanghai::", ":Tours jumelles Petronas, Malaisie::", ":Victoria Harbour, Hong Kong::", ":Bibliothèque de Celsus, Ephèse::", ":Canal de Panama, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Baie d'Along, Vietnam::", ":Salar de Uyuni, Bolivie::", ":Le Grand Trou Bleu, Belize::", ":Bali, Indonésie::", ":L'Aurora Borealis, Norvège::", ":Mont Fuji, Japon::", ":Port de Rio De Janeiro, Brésil::", ":Canyon de Paria, États-Unis::", ":Mont Everest, Népal et Tibet::", ":Chutes du Niagara, Canada::", ":Lac Rose, Sénégal::", ":La Forêt Noire, Allemagne::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Salto Ángel, Venezuela:1,2,4:", ":Mont Kilimandjaro, Tanzanie::", ":Delta du Danube, Roumanie::", ":Chutes Victoria, Zimbabwe et Zambie:5,6,9:", ":Œil du Sahara, Mauritanie::", ":La mer Morte, Israël::", ":Falaises de Moher, Irlande::", ":Volcans de boue, Azerbaïdjan::", ":Lac Moraine, Canada::", ":Marbres du diable, Australie::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turquie::", ":La rivière des cinq couleurs, Colombie::", ":Volcan Paricutín, Mexique::", ":Moeraki rochers, Nouvelle-Zélande::", ":La Grotte Bleue, Italie:0,1,2:", ":Grottes de marbre, Chili:3,0,2:", ":Grotte de cristal, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Île de Jeju, Corée du Sud:1,2,5:", ":Chutes d'Iguazu, Argentine et Brésil::", ":Cervin, Suisse::", ":Montagne de la Table, Afrique du Sud:1,6,5:", ":Bu Tinah, Émirats arabes unis:1,6,5:", ":Sundarbans, Bangladesh::", ":Gorges du Verdon, France::"]);
  }

  void addHE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.he;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["‎‎‎‎סקנדינביה‎‎:‎‎17,18,20‎", "‎‎‎‎חצי האי הבלקני‎‎:‎‎42,38,37,35,39,23,36,24,26,34‎", "‎‎‎‎אזור המדינות הבלטיות‎‎:‎‎29,30,31‎", "‎‎‎‎מרכז אמריקה‎‎:‎‎164,165,166,171,172,173,174‎", "‎‎‎‎מגרב‎‎:‎‎108,107,109,110,138‎", "‎‎‎‎חצי האי ערב‎‎:‎‎47,53,61,60,59,58,57,56‎", "‎‎‎‎מזרח אסיה‎‎:‎‎86,87,88,89,90‎", "‎‎‎‎קווקז‎‎:‎‎49,50,51‎", "‎‎‎‎דרום-מזרח אסיה‎‎:‎‎76,77,78,79,80,81,82,83,84,85,94‎", "‎‎‎‎מרכז אסיה‎‎:‎‎63,67,66,68,65‎", "‎‎‎‎דרום אפריקה‎‎:‎‎155,156,157,158,159‎", "‎‎‎‎דרום אמריקה‎‎:‎‎183,184,185,186,187,188,189,190,191,192,193,194‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["‎‎‎‎ברית המועצות‎‎:‎‎50,51,40,29,49,63,67,30,31,41,33,66,68,32,65‎", "‎‎‎‎האימפריה המוגולית‎‎:‎‎64,73,69,70‎", "‎‎‎‎האימפריה הבריטית‎‎:‎‎181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135‎", "‎‎‎‎האימפריה המונגולית‎‎:‎‎64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78‎", "‎‎‎‎האימפריה הרומית‎‎:‎‎38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16‎", "‎‎‎‎אימפריה עות'מאנית‎‎:‎‎38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32‎", "‎‎‎‎האימפריה הפורטוגזית‎‎:‎‎118,183,146,86,94,129,69,132,126,7,147,190‎", "‎‎‎‎אימפריית האינקה‎‎:‎‎186,184,191,187,189,185‎", "‎‎‎‎אימפריית המאיה‎‎:‎‎162,164,166,174,172‎", "‎‎‎‎האימפריה האוסטרו-הונגרית‎‎:‎‎6,25,28,27,34,22,32,36,26,24,37,39,4‎", "‎‎‎‎האימפריה הפרסית‎‎:‎‎64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎מגדל אייפל, פריז‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎קולוסיאום, רומא‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎שלט הוליווד, לוס אנג'לס‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הפירמידה הגדולה של גיזה, מצרים‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎פסל החירות, ניו יורק‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎החומה הסינית‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎אנגקור וואט, קמבודיה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎וותיקן‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎המגדל הנטוי של פיזה, איטליה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ישו הגואל, ריו דה ז'ניירו‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎בית האופרה של סידני, סידני‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎אקרופוליס, אתונה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎טאג' מאהל, הודו‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎המסגד הכחול, איסטנבול‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎בורג' ח'ליפה, דובאי‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מוזיאון הלובר, פריז‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מאצ'ו פיצ'ו, פרו‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎חומת ברלין‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎אתר הנופש דיסנילנד, קליפורניה‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎הכיכר האדומה, מוסקבה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎פטרה, ירדן‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הסטריפ, לאס וגאס‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הארמון הגדול, בנגקוק‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎סגרדה פמיליה, ברצלונה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎צבא הטרקוטה, סין‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎כיכר טיימס, ניו יורק‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎העיר האסורה, בייג'ין‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎כנסיית עמוד בורגונד, נורבגיה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מסגד שייח' זאיד, אבו דאבי‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎טירת נוישוונשטיין, גרמניה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מגדל הפנינה המזרחית, שנגחאי‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מגדלי פטרונס, מלזיה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎נמל ויקטוריה, הונג קונג‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ספריית קלסוס, אפסוס‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎תעלת פנמה‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎הא לונג ביי, וייטנאם‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎סלאר דה אויוני, בוליביה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎החור הכחול הגדול, בליז‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎באלי, אינדונזיה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎אורורה בוריאליס, נורבגיה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הר פוג'י, יפן‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎נמל ריו דה ז'נרו, ברזיל‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎קניון חריץ, ארצות הברית‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הר האוורסט, נפאל וטיבט‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מפלי הניאגרה, קנדה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎אגם ורוד, סנגל‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎היער השחור, גרמניה‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎מפל אנחל, ונצואלה‎‎:‎‎1,2,4‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הר קילימנג'רו, טנזניה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎דלתת הדנובה, רומניה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מפלי ויקטוריה, זימבבואה וזמביה‎‎:‎‎5,6,9‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎עין הסהרה, מאוריטניה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ים המלח, ישראל‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎צוקי מוהר, אירלנד‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הרי געש בוץ, אזרבייג'ן‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎אגם מוריין, קנדה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎גולות השטן, אוסטרליה‎‎:‎‎‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎פמוקלה, טורקיה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎נהר חמשת הצבעים, קולומביה‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎פריקוטין, מקסיקו‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מוארקי בולדרס, ניו זילנד‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎המערה הכחולה, איטליה‎‎:‎‎0,1,2‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מערות השיש, צ'ילה‎‎:‎‎3,0,2‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מערת קריסטל, ברמודה‎‎:‎‎0,1,2‎‎:‎‎‎"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        ["‎‎‎‎‎‎‎‎‎‎:‎‎האי ג'ג'ו, דרום קוריאה‎‎:‎‎1,2,5‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מפלי איגואסו, ארגנטינה וברזיל‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎מטרהורן, שוויץ‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎הר השולחן, דרום אפריקה‎‎:‎‎1,6,5‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎בו טינה, איחוד האמירויות הערביות‎‎:‎‎1,6,5‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎סונדרבאנס, בנגלדש‎‎:‎‎‎‎:‎‎‎", "‎‎‎‎‎‎‎‎‎‎:‎‎ערוץ ורדון, צרפת‎‎:‎‎‎‎:‎‎‎"]);
  }

  void addHI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.hi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["स्कैंडेनेविया:17,18,20", "बाल्कन प्रायद्वीप:42,38,37,35,39,23,36,24,26,34", "बाल्टिक राज्य क्षेत्र:29,30,31", "मध्य अमरीका:164,165,166,171,172,173,174", "मघरेब:108,107,109,110,138", "अरबी प्रायद्वीप:47,53,61,60,59,58,57,56", "पूर्वी एशिया:86,87,88,89,90", "काकेशस:49,50,51", "दक्षिण - पूर्व एशिया:76,77,78,79,80,81,82,83,84,85,94", "मध्य एशिया:63,67,66,68,65", "दक्षिणी अफ्रीका:155,156,157,158,159", "दक्षिण अमेरिका:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["सोवियत संघ:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "मुगल साम्राज्य:64,73,69,70", "ब्रिटिश साम्राज्य:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "मंगोल साम्राज्य:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "रोमन साम्राज्य:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "तुर्क साम्राज्य:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "पुर्तगाली साम्राज्य:118,183,146,86,94,129,69,132,126,7,147,190", "इंका साम्राज्य:186,184,191,187,189,185", "माया साम्राज्य:162,164,166,174,172", "ऑस्ट्रो-हंगेरियन साम्राज्य:6,25,28,27,34,22,32,36,26,24,37,39,4", "फारसी साम्राज्य:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":एफिल टॉवर, पेरिस::", ":कोलोसियम, रोम::", ":हॉलीवुड साइन, लॉस एंजिल्स::", ":गीज़ा का महान पिरामिड, मिस्र::", ":स्टैच्यू ऑफ लिबर्टी, न्यूयॉर्क::", ":चीन की महान दीवार::", ":अंगकोर वाट, कंबोडिया::", ":वेटिकन सिटी::", ":पीसा, इटली का लीनिंग टॉवर::", ":क्राइस्ट द रिडीमर, रियो डी जनेरियो::", ":सिडनी ओपेरा हाउस, सिडनी::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":एक्रोपोलिस, एथेंस::", ":ताज महल, भारत::", ":ब्लू मस्जिद, इस्तांबुल::", ":बुर्ज खलीफा, दुबई::", ":लौवर संग्रहालय, पेरिस::", ":माचू पिचू, पेरू::", ":बर्लिन की दीवार::", ":डिज़नीलैंड रिज़ॉर्ट, कैलिफोर्निया::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":रक्रेमलिन, मॉस्को::", ":पेट्रा, जॉर्डन::", ":द स्ट्रिप, लास वेगास::", ":ग्रांड पैलेस, बैंकॉक::", ":सग्रादा फैमिलिया, बार्सिलोना::", ":टेराकोटा सेना, चीन::", ":टाइम्स स्क्वायर, न्यूयॉर्क::", ":निषिद्ध शहर, बीजिंग::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":बोरगंड स्टोव चर्च, नॉर्वे::", ":शेख जायद मस्जिद, अबू धाबी::", ":नेउशवांस्टीन कैसल, जर्मनी::", ":ओरिएंटल पर्ल टॉवर, शंघाई::", ":पेट्रोनास ट्विन टावर्स, मलेशिया::", ":विक्टोरिया हार्बर, हांगकांग::", ":सेलस की लाइब्रेरी, इफिसुस::", ":पनामा नहर, पनामा::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":हा लॉन्ग बे, वियतनाम::", ":सालार दे उयूनी, बोलीविया::", ":द ग्रेट ब्लू होल, बेलीज::", ":बाली, इंडोनेशिया::", ":औरोरा बोरेलिस, नॉर्वे::", ":माउंट फूजी, जापान::", ":रियो डी जनेरियो, ब्राजील के हार्बर::", ":पारिया कैनियन, संयुक्त राज्य अमेरिका::", ":माउंट एवरेस्ट, नेपाल और तिब्बत::", ":नियाग्रा फॉल्स, कनाडा::", ":लाख गुलाब, सेनेगल::", ":द ब्लैक फॉरेस्ट, जर्मनी::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":एंजल फॉल्स, वेनेजुएला:1,2,4:", ":माउंट किलिमंजारो, तंजानिया::", ":डेन्यूब डेल्टा, रोमानिया::", ":विक्टोरिया फॉल्स, जिम्बाब्वे और ज़ाम्बिया:5,6,9:", ":सहारा की आंख, मॉरिटानिया::", ":मृत सागर, इज़राइल::", ":मोहेर, आयरलैंड की चट्टानें::", ":मिट्टी के ज्वालामुखी, अज़रबैजान::", ":मोराइन झील, कनाडा::", ":डेविल्स मार्बल्स, ऑस्ट्रेलिया::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":पामुकेल, तुर्की::", ":द रिवर ऑफ फाइव कलर्स, कोलंबिया::", ":परिकतीन ज्वालामुखी, मैक्सिको::", ":मूरकी बोल्डर, न्यूजीलैंड::", ":द ब्लू ग्रोटो, इटली:0,1,2:", ":संगमरमर की गुफाएँ, चिली:3,0,2:", ":क्रिस्टल गुफा, बरमूडा:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":जाजू द्वीप, दक्षिण कोरिया:1,2,5:", ":इगाज़ु फॉल्स, अर्जेंटीना और ब्राजील::", ":मैटरहॉर्न, स्विट्जरलैंड::", ":टेबल माउंटेन, दक्षिण अफ्रीका:1,6,5:", ":बू टीना, संयुक्त अरब अमीरात:1,6,5:", ":सुंदरवन, बांग्लादेश::", ":वर्डन गॉर्ज, फ्रांस::"]);
  }

  void addHR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.hr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavija:17,18,20", "Balkanski poluotok:42,38,37,35,39,23,36,24,26,34", "regija baltičkih država:29,30,31", "Centralna Amerika:164,165,166,171,172,173,174", "Magreb:108,107,109,110,138", "Arapski poluotok:47,53,61,60,59,58,57,56", "Istočna Azija:86,87,88,89,90", "Kavkaz:49,50,51", "Jugoistočna Azija:76,77,78,79,80,81,82,83,84,85,94", "Srednja Azija:63,67,66,68,65", "Južna Afrika (regija):155,156,157,158,159", "Južna Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovjetski Savez:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mogulsko carstvo:64,73,69,70", "Britansko carstvo:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolsko carstvo:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Rimsko carstvo:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Osmansko carstvo:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugalsko carstvo:118,183,146,86,94,129,69,132,126,7,147,190", "Carstvo Inka:186,184,191,187,189,185", "Carstvo Maja:162,164,166,174,172", "Austro-Ugarsko carstvo:6,25,28,27,34,22,32,36,26,24,37,39,4", "Perzijsko carstvo:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffelov toranj, Pariz::", ":Kolosej, Rim::", ":Holivudski znak, Los Angeles::", ":Velika piramida u Gizi, Egipat::", ":Kip slobode, New York::", ":Kineski zid::", ":Angkor Wat, Kambodža::", ":Vatikan::", ":Kosi toranj u Pisi, Italija::", ":Krist Otkupitelj, Rio de Janeiro::", ":Opera u Sydneyu, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropola, Atena::", ":Taj Mahal, Indija::", ":Plava džamija, Istanbul::", ":Burj Khalifa, Dubai::", ":Muzej Louvre, Pariz::", ":Machu Picchu, Peru::", ":Berlinski zid::", ":Disneyland Resort, Kalifornija::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Crveni trg, Moskva::", ":Petra, Jordan::", ":Strip, Las Vegas::", ":Velika palača, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Vojska terakota, Kina::", ":Times Square, New York::", ":Zabranjeni grad, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Crkva Borgund, Norveška::", ":Džamija šeika Zajeda, Abu Dhabi::", ":Dvorac Neuschwanstein, Njemačka::", ":Orijentalni biserni toranj, Šangaj::", ":Petronas blizanci, Malezija::", ":Victoria Harbour, Hong Kong::", ":Biblioteka u Celsusu, Efez::", ":Panamski kanal, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Zaljev Hạ Long, Vijetnam::", ":Salar de Uyuni, Bolivija::", ":Velika plava rupa, Belize::", ":Bali, Indonezija::", ":Polarna svjetlost, Norveška::", ":Brdo Fuji, Japan::", ":Luka Rio de Janeiro, Brazil::", ":Kanjon Paria, Sjedinjene Američke Države::", ":Mount Everest, Nepal i Tibet::", ":Niagarski slapovi, Kanada::", ":Lac Rose, Senegal::", ":Crna šuma, Njemačka::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angelovi slapovi, Venezuela:1,2,4:", ":Kilimandžaro, Tanzanija::", ":Delta Dunava, Rumunjska::", ":Viktorijini slapovi, Zimbabwe i Zambija:5,6,9:", ":Sahara, Mauritanija::", ":Mrtvo more, Izrael::", ":Moherske litice, Irska::", ":Vulkani blata, Azerbajdžan::", ":Morsko jezero, Kanada::", ":Vražji mramori, Australija::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turska::", ":Rijeka pet boja, Kolumbija::", ":Vulkan Paricutín, Meksiko::", ":Moeraki balvani, Novi Zeland::", ":Plava špilja, Italija:0,1,2:", ":Mramorne špilje, Čile:3,0,2:", ":Kristalna pećina, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Otok Jeju, Južna Koreja:1,2,5:", ":Slapovi Iguazu, Argentina i Brazil::", ":Matterhorn, Švicarska::", ":Stolna planina, Južna Afrika:1,6,5:", ":Bu Tinah, Ujedinjeni Arapski Emirati:1,6,5:", ":Sundarbans, Bangladeš::", ":Ždrijelo Verdon, Francuska::"]);
  }

  void addHU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.hu;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinávia:17,18,20", "Balkán-félsziget:42,38,37,35,39,23,36,24,26,34", "balti államok régiója:29,30,31", "Közép-Amerika:164,165,166,171,172,173,174", "Magreb:108,107,109,110,138", "Arab félsziget:47,53,61,60,59,58,57,56", "Kelet-Ázsia:86,87,88,89,90", "Kaukázus:49,50,51", "Délkelet-Ázsia:76,77,78,79,80,81,82,83,84,85,94", "Közép-Ázsia:63,67,66,68,65", "Dél-Afrika (régió):155,156,157,158,159", "Dél-Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Szovjetunió:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mogul Birodalom:64,73,69,70", "Brit Birodalom:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongol Birodalom:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Római Birodalom:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Oszmán Birodalom:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugál Birodalom:118,183,146,86,94,129,69,132,126,7,147,190", "Inka Birodalom:186,184,191,187,189,185", "Maja Birodalom:162,164,166,174,172", "Osztrák-Magyar Birodalom:6,25,28,27,34,22,32,36,26,24,37,39,4", "Perzsa Birodalom:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffel-torony, Párizs::", ":Colosseum, Róma::", ":Hollywood Sign, Los Angeles::", ":Nagy Giza-i piramis, Egyiptom::", ":Szabadság-szobor, New York::", ":Kínai Nagy Fal::", ":Angkorvat, Kambodzsa::", ":Vatikánváros::", ":Pisa ferde tornya, Olaszország::", ":A megváltó Krisztus, Rio de Janeiro::", ":Sydney Operaház, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolisz, Athén::", ":Tádzs Mahal, India::", ":Kék mecset, Isztambul::", ":Burdzs Kalifa, Dubai::", ":Louvre Múzeum, Párizs::", ":Machu Picchu, Peru::", ":Berlini fal::", ":Disneyland Resort, Kalifornia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Vörös tér, Moszkva::", ":Petra, Jordánia::", ":The Strip, Las Vegas::", ":Nagy Palota, Bangkok::", ":Szent Család-templom, Barcelona::", ":Agyaghadsereg, Kína::", ":Times Square, New York::", ":Tiltott város, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgund Stave templom, Norvégia::", ":Zájed sejk mecset, Abu Dhabi::", ":Neuschwanstein kastély, Németország::", ":Keleti Pearl Tower, Shanghai::", ":Petronas-ikertorony, Malajzia::", ":Victoria kikötő, Hong Kong::", ":Celsus könyvtár, Efézus::", ":Panama-csatorna, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Hạ Long-öböl, Vietnam::", ":Salar de Uyuni, Bolívia::", ":Nagy kék lyuk, Belize::", ":Bali, Indonézia::", ":Az Aurora Borealis, Norvégia::", ":Fudzsi, Japán::", ":Rio de Janeiro kikötője, Brazília::", ":Paria kanyon, Egyesült Államok::", ":Csomolungma, Nepál és Tibet::", ":Niagara-vízesés, Kanada::", ":Lac Rose, Senegal::", ":A Fekete-erdő, Németország::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angel-vízesés, Venezuela:1,2,4:", ":Kilimandzsáró-hegy, Tanzánia::", ":Duna-delta, Románia::", ":Victoria-vízesés, Zimbabwe és Zambia:5,6,9:", ":A Szahara szeme, Mauritánia::", ":A Holt-tenger, Izrael::", ":Moher-sziklák, Írország::", ":Sár vulkánok, Azerbajdzsán::", ":Moraine tó, Kanada::", ":Ördög marmorai, Ausztrália::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Törökország::", ":Az öt színes folyó, Kolumbia::", ":Paricutín vulkán, Mexikó::", ":Moeraki sziklák, Új-Zéland::", ":A kék barlang, Olaszország:0,1,2:", ":Márványbarlangok, Chile:3,0,2:", ":Kristálybarlang, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jeju-sziget, Dél-Korea:1,2,5:", ":Iguazu-vízesés, Argentína és Brazília::", ":Matterhorn, Svájc::", ":Asztali hegy, Dél-Afrika:1,6,5:", ":Bu Tinah, Egyesült Arab Emirátusok:1,6,5:", ":Szundarbansz, Banglades::", ":Verdon-kanyon, Franciaország::"]);
  }

  void addID(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.id;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavia:17,18,20", "Semenanjung Balkan:42,38,37,35,39,23,36,24,26,34", "Wilayah negara-negara Baltik:29,30,31", "Amerika Tengah:164,165,166,171,172,173,174", "Arab Maghrib:108,107,109,110,138", "Semenanjung Arab:47,53,61,60,59,58,57,56", "Asia Timur:86,87,88,89,90", "Kaukasus:49,50,51", "Asia Tenggara:76,77,78,79,80,81,82,83,84,85,94", "Asia Tengah:63,67,66,68,65", "Afrika bagian selatan:155,156,157,158,159", "Amerika Selatan:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Uni Soviet:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Kesultanan Mughal:64,73,69,70", "Kerajaan Inggris:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Kekaisaran Mongol:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Kekaisaran Romawi:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Kekaisaran Ottoman:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Kekaisaran Portugis:118,183,146,86,94,129,69,132,126,7,147,190", "Kerajaan Inca:186,184,191,187,189,185", "Kekaisaran Maya:162,164,166,174,172", "Kekaisaran Austria-Hongaria:6,25,28,27,34,22,32,36,26,24,37,39,4", "Kekaisaran Persia:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Menara Eiffel, Paris::", ":Colosseum, Roma::", ":Hollywood Sign, Los Angeles::", ":Piramida Agung Giza, Mesir::", ":Patung Liberty, New York::", ":Tembok Besar Tiongkok::", ":Angkor Wat, Kamboja::", ":Kota Vatikan::", ":Menara Miring Pisa, Italia::", ":Christ the Redeemer, Rio de Janeiro::", ":Gedung Opera Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Athena::", ":Taj Mahal, India::", ":Masjid Biru, Istanbul::", ":Burj Khalifa, Dubai::", ":Museum Louvre, Paris::", ":Machu Picchu, Peru::", ":Tembok Berlin::", ":Disneyland Resort, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Kotak Merah, Moskow::", ":Petra, Yordania::", ":The Strip, Las Vegas::", ":Istana Raja, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Pasukan terakota, Cina::", ":Times Square, New York::", ":Kota Terlarang, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Gereja Borgund Stave, Norwegia::", ":Masjid Agung Sheikh Zayed, Abu Dhabi::", ":Kastil Neuschwanstein, Jerman::", ":Menara Oriental Pearl, Shanghai::", ":Menara Kembar Petronas, Malaysia::", ":Pelabuhan Victoria, Hong Kong::", ":Perpustakaan Celsus, Ephesus::", ":Terusan Panama, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Teluk Ha Long, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Lubang biru, Belize::", ":Bali, Indonesia::", ":Aurora, Norwegia::", ":Gunung Fuji, Jepang::", ":Pelabuhan Rio De Janeiro, Brasil::", ":Paria Ngarai, Amerika Serikat::", ":Gunung Everest, Nepal dan Tibet::", ":Air Terjun Niagara, Kanada::", ":Lac Rose, Senegal::", ":Hutan Hitam, Jerman::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Air terjun Angel, Venezuela:1,2,4:", ":Kilimanjaro, Tanzania::", ":Delta Donau, Romania::", ":Air Terjun Victoria, Zimbabwe dan Zambia:5,6,9:", ":Struktur Richat, Mauritania::", ":Laut Mati, Israel::", ":Tebing Moher, Irlandia::", ":Gunung berapi lumpur, Azerbaijan::", ":Danau Moraine, Kanada::", ":Iblis kelereng, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turki::", ":Sungai Lima Warna, Kolumbia::", ":Gunung berapi Paricutín, Meksiko::", ":Bongkahan batu Moeraki, Selandia Baru::", ":Gua Biru, Italia:0,1,2:", ":Gua Marmer, Chili:3,0,2:", ":Gua kristal, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Pulau Jeju, Korea Selatan:1,2,5:", ":Air terjun Iguazu, Argentina dan Brasil::", ":Matterhorn, Swiss::", ":Gunung Meja, Afrika Selatan:1,6,5:", ":Bu Tinah, Uni Emirat Arab:1,6,5:", ":Sundarban, Bangladesh::", ":Verdon Jurang, Prancis::"]);
  }

  void addIT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.it;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Scandinavia:17,18,20", "Penisola balcanica:42,38,37,35,39,23,36,24,26,34", "Regione degli Stati baltici:29,30,31", "America centrale:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Penisola Arabica:47,53,61,60,59,58,57,56", "Asia orientale:86,87,88,89,90", "Caucaso:49,50,51", "Sud-est asiatico:76,77,78,79,80,81,82,83,84,85,94", "Asia centrale:63,67,66,68,65", "L'Africa australe:155,156,157,158,159", "L'America del Sud:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Unione Sovietica:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Dinastia Moghul:64,73,69,70", "Impero britannico:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Impero mongolo:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Impero Romano:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Impero ottomano:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Impero portoghese:118,183,146,86,94,129,69,132,126,7,147,190", "Impero Inca:186,184,191,187,189,185", "Impero Maya:162,164,166,174,172", "Impero austro-ungarico:6,25,28,27,34,22,32,36,26,24,37,39,4", "Impero persiano:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Torre Eiffel, Parigi::", ":Colosseo, Roma::", ":Scritta Hollywood, Los Angeles::", ":Piramide di Cheope, Egitto::", ":Statua della Libertà, New York::", ":Grande muraglia cinese::", ":Angkor Wat, Cambogia::", ":Città del Vaticano::", ":Torre pendente di Pisa, Italia::", ":Cristo Redentore, Rio de Janeiro::", ":Teatro dell'opera di Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Acropoli, Atene::", ":Taj Mahal, India::", ":Moschea Blu, Istanbul::", ":Burj Khalifa, Dubai::", ":Museo del Louvre, Parigi::", ":Machu Picchu, Perù::", ":Muro di Berlino::", ":Disneyland Resort, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Piazza Rossa, Mosca::", ":Petra, Giordania::", ":The Strip, Las Vegas::", ":Grande Palazzo Reale, Bangkok::", ":La Sagrada Familia, Barcellona::", ":Esercito di terracotta, Cina::", ":Times Square, New York::", ":Città Proibita, Pechino::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Stavkirke di Borgund, Norvegia::", ":Gran Moschea dello Sceicco Zayed, Abu Dhabi::", ":Castello di Neuschwanstein, Germania::", ":Oriental Pearl Tower, Shanghai::", ":Petronas Twin Towers, Malesia::", ":Victoria Harbour, Hong Kong::", ":Biblioteca di Celso, Efeso::", ":Canale di Panama, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Baia di Halong, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Dolina marina, Belize::", ":Bali, Indonesia::", ":L'Aurora Boreale, Norvegia::", ":Monte Fuji, Giappone::", ":Porto di Rio De Janeiro, Brasile::", ":Paria Canyon, Stati Uniti::", ":Monte Everest, Nepal e Tibet::", ":Cascate del Niagara, Canada::", ":Lac Rose, Senegal::", ":Foresta Nera, Germania::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Salto Angel, Venezuela:1,2,4:", ":Kilimangiaro, Tanzania::", ":Delta del Danubio, Romania::", ":Cascate Vittoria, Zimbabwe e Zambia:5,6,9:", ":Occhio del Sahara, Mauritania::", ":Il Mar Morto, Israele::", ":Scogliere di Moher, Irlanda::", ":Vulcani di fango, Azerbaijan::", ":Lago Moraine, Canada::", ":Marmi del diavolo, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turchia::", ":Il fiume dei cinque colori, Colombia::", ":Vulcano Paricutín, Messico::", ":Massi di Moeraki, Nuova Zelanda::", ":Grotta Azzurra, Italia:0,1,2:", ":Marmeren grotten, Cile:3,0,2:", ":Cave di cristallo, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Isola di Jeju, Corea del Sud:1,2,5:", ":Cascate dell'Iguazú, Argentina e Brasile::", ":Cervino, Svizzera::", ":Montagna della Tavola, Sudafrica:1,6,5:", ":Bu Tinah, Emirati Arabi Uniti:1,6,5:", ":Sundarbans, Bangladesh::", ":Gola del Verdon, Francia::"]);
  }

  void addJA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.ja;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["スカンジナビア:17,18,20", "バルカン半島:42,38,37,35,39,23,36,24,26,34", "バルト三国地域:29,30,31", "中米:164,165,166,171,172,173,174", "マグリブ:108,107,109,110,138", "アラビア半島:47,53,61,60,59,58,57,56", "東アジア:86,87,88,89,90", "コーカサス:49,50,51", "東南アジア:76,77,78,79,80,81,82,83,84,85,94", "中央アジア:63,67,66,68,65", "南部アフリカ:155,156,157,158,159", "南アメリカ:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["ソビエト連邦:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "ムガル帝国:64,73,69,70", "大英帝国:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "モンゴル帝国:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "ローマ帝国:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "オスマン帝国:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "ポルトガル海上帝国:118,183,146,86,94,129,69,132,126,7,147,190", "インカ帝国:186,184,191,187,189,185", "マヤ帝国:162,164,166,174,172", "オーストリア:6,25,28,27,34,22,32,36,26,24,37,39,4", "ペルシャ帝国:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":エッフェル塔,パリ::", ":コロシアム,ローマ::", ":ハリウッドサイン,ロサンゼルス::", ":ギザの大ピラミッド,エジプト::", ":自由の女神,ニューヨーク::", ":万里の長城::", ":アンコールワット,カンボジア::", ":バチカン市国::", ":ピサの斜塔,イタリア::", ":救い主キリスト,リオデジャネイロ::", ":シドニーオペラハウス,シドニー::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":アクロポリス,アテネ::", ":タージ・マハル,インド::", ":ブルーモスク,イスタンブール::", ":ブルジュ・ハリファ,ドバイ::", ":パリ,ルーブル美術館::", ":マチュピチュ,ペルー::", ":ベルリンの壁::", ":ディズニーランド・リゾート,カリフォルニア州::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":赤の広場,モスクワ::", ":ヨルダン・ペトラ::", ":ストリップ,ラスベガス::", ":グランドパレス,バンコク::", ":ラ・サグラダ・ファミリア,バルセロナ::", ":テラコッタ戦士,中国::", ":タイムズスクエア,ニューヨーク::", ":紫禁城,北京::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":ノルウェーのボルグンドスターブ教会::", ":シェイクザイードモスク,アブダビ::", ":ノイシュヴァンシュタイン城,ドイツ::", ":オリエンタルパールタワー,上海::", ":ペトロナスツインタワー,マレーシア::", ":ビクトリアハーバー,香港::", ":ケルスス図書館,エフェソス::", ":パナマ運河,パナマ::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":ベトナム,ハロン湾::", ":ウユニ塩湖,ボリビア::", ":グレートブルーホール,ベリーズ::", ":バリ,インドネシア::", ":オーロラ,ノルウェー::", ":富士山,日本::", ":リオデジャネイロの港,ブラジル::", ":パリアキャニオン,アメリカ合衆国::", ":ネパールとチベットのエベレスト山::", ":ナイアガラの滝,カナダ::", ":ラック・ローズ,セネガル::", ":シュヴァルツヴァルト,ドイツ::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":エンジェルフォールズ,ベネズエラ:1,2,4:", ":キリマンジャロ山,タンザニア::", ":ドナウデルタ,ルーマニア::", ":ビクトリア滝,ジンバブエとザンビア:5,6,9:", ":サハラ砂漠の眼,モーリタニア::", ":イスラエルの死海::", ":アイルランドのモハーの断崖::", ":泥火山,アゼルバイジャン::", ":モレーン湖,カナダ::", ":デビルズマーブルズ,オーストラリア::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":トルコ,パムッカレ::", ":5色の川,コロンビア::", ":パリクティン火山,メキシコ::", ":モエラキ・ボールダーズ,ニュージーランド::", ":ブルー・グロット,イタリア:0,1,2:", ":大理石の洞窟,チリ:3,0,2:", ":クリスタルケーブ,バミューダ:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":済州島,韓国:1,2,5:", ":イグアスの滝,アルゼンチン,ブラジル::", ":スイス,マッターホルン::", ":テーブルマウンテン,南アフリカ:1,6,5:", ":Bu Tinah,アラブ首長国連邦:1,6,5:", ":スンダルバンス,バングラデシュ::", ":ヴェルドン渓谷,フランス::"]);
  }

  void addKO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.ko;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["스칸디나비아:17,18,20", "발칸 반도:42,38,37,35,39,23,36,24,26,34", "발트해 연안국:29,30,31", "중앙 아메리카:164,165,166,171,172,173,174", "마그레브:108,107,109,110,138", "아라비아 반도:47,53,61,60,59,58,57,56", "동아시아:86,87,88,89,90", "코카서스 산맥:49,50,51", "동남아시아:76,77,78,79,80,81,82,83,84,85,94", "중앙 아시아:63,67,66,68,65", "남아프리카:155,156,157,158,159", "남아메리카:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["소련:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "무굴 제국:64,73,69,70", "대영 제국:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "몽골제국:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "로마 왕국:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "오스만 제국:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "포르투갈 제국:118,183,146,86,94,129,69,132,126,7,147,190", "잉카 제국:186,184,191,187,189,185", "마야 제국:162,164,166,174,172", "오스트리아-헝가리 제국:6,25,28,27,34,22,32,36,26,24,37,39,4", "페르시아 제국:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":에펠 탑, 파리::", ":콜로세움, 로마::", ":할리우드 사인, 로스 앤젤레스::", ":기자의 위대한 피라미드, 이집트::", ":뉴욕 자유의 여신상::", ":중국 만리장성::", ":앙코르 와트, 캄보디아::", ":바티칸 시국::", ":피사의 사탑, 이탈리아::", ":그리스도 구속자, 리오 데 자네이로::", ":시드니 오페라 하우스, 시드니::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":아크로 폴리스, 아테네::", ":타지 마할, 인도::", ":블루 모스크, 이스탄불::", ":두바이, 버즈 칼리파::", ":루브르 박물관, 파리::", ":마추피추, 페루::", ":베를린 장벽::", ":디즈니 랜드 리조트, 캘리포니아::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":붉은 광장, 모스크바::", ":페트라, 요르단::", ":스트립, 라스 베이거스::", ":그랜드 팰리스, 방콕::", ":라 사그라 다 파밀리아, 바르셀로나::", ":테라 코타 워리어스, 중국::", ":타임 스퀘어, 뉴욕::", ":자금성, 베이징::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":보그 룬트 스 베브 교회, 노르웨이::", ":셰이크 자이드 모스크, 아부 다비::", ":독일 노이 슈반 슈타인 성::", ":상해 동방 명주 타워::", ":페트로나스 쌍둥이 빌딩, 말레이시아::", ":빅토리아 하버, 홍콩::", ":셀 수스 도서관, 에페소스::", ":파나마 운하, 파나마::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":하롱 베이, 베트남::", ":살라르 데 우유니, 볼리비아::", ":그레이트 블루 홀, 벨리즈::", ":발리, 인도네시아::", ":오로라, 노르웨이::", ":후지산, 일본::", ":브라질 리오 데 자네이로 하버::", ":파리아 협곡, 미국::", ":에베레스트, 네팔, 티베트::", ":나이아가라 폭포, 캐나다::", ":라크 로즈, 세네갈::", ":검은 숲, 독일::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":엔젤 폴스, 베네수엘라:1,2,4:", ":킬리만자로 산, 탄자니아::", ":다뉴브 델타, 루마니아::", ":빅토리아 폭포, 짐바브웨 및 잠비아:5,6,9:", ":모리 타니의 사하라 사막의 눈::", ":이스라엘의 사해::", ":Moher의 절벽, 아일랜드::", ":진흙 화산, 아제르바이잔::", ":Moraine 호수, 캐나다::", ":악마의 대리석, 호주::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":파묵칼레, 터키::", ":컬럼의 강, 콜롬비아::", ":파리 쿠틴 화산, 멕시코::", ":모에 라키 바위, 뉴질랜드::", ":푸른 동굴, 이탈리아:0,1,2:", ":마블 동굴, 칠레:3,0,2:", ":크리스탈 동굴, 버뮤다:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":제주도, 한국:1,2,5:", ":아르헨티나, 브라질 이과수 폭포::", ":마터호른, 스위스::", ":테이블 마운틴, 남아프리카:1,6,5:", ":Bu Tinah, 아랍 에미리트 연합:1,6,5:", ":순데 반스, 방글라데시::", ":베르 동 협곡, 프랑스::"]);
  }

  void addMS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.ms;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Scandinavia:17,18,20", "Semenanjung Balkan:42,38,37,35,39,23,36,24,26,34", "Wilayah negara-negara Baltik:29,30,31", "Amerika Tengah:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Semenanjung Arab:47,53,61,60,59,58,57,56", "Asia Timur:86,87,88,89,90", "Kaukasus:49,50,51", "Asia Tenggara:76,77,78,79,80,81,82,83,84,85,94", "Asia Tengah:63,67,66,68,65", "Selatan Afrika:155,156,157,158,159", "Amerika Selatan:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Kesatuan Soviet:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Empayar Mughal:64,73,69,70", "Empayar Britain:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Empayar Mongol:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Empayar Rom:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Kerajaan Uthmaniyyah:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Empayar Portugis:118,183,146,86,94,129,69,132,126,7,147,190", "Kerajaan Inca:186,184,191,187,189,185", "Empayar Maya:162,164,166,174,172", "Empayar Austro-Hungarian:6,25,28,27,34,22,32,36,26,24,37,39,4", "Empayar Parsi:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Menara Eiffel, Paris::", ":Colosseum, Rom::", ":Hollywood Sign, Los Angeles::", ":Piramid Besar Giza, Mesir::", ":Patung Liberty, New York::", ":Tembok Besar China::", ":Angkor Wat, Kemboja::", ":Kota Vatikan::", ":Menara Condong Pisa, Itali::", ":Kristus Penebus, Rio de Janeiro::", ":Panggung Opera Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Athens::", ":Taj Mahal, India::", ":Masjid Biru, Istanbul::", ":Burj Khalifa, Dubai::", ":Muzium Louvre, Paris::", ":Machu Picchu, Peru::", ":Tembok Berlin::", ":Disneyland Resort, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Segi Empat Merah, Moscow::", ":Petra, Jordan::", ":The Strip, Las Vegas::", ":Istana Raja, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Tentera Terracotta, China::", ":Times Square, New York::", ":Kota Terlarang, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Gereja Borgund Stave, Norway::", ":Masjid Sheikh Zayed, Abu Dhabi::", ":Istana kota Neuschwanstein, Jerman::", ":Oriental Pearl Tower, Shanghai::", ":Menara Berkembar Petronas, Malaysia::", ":Pelabuhan Victoria, Hong Kong::", ":Perpustakaan Celsus, Ephesus::", ":Terusan Panama, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Teluk Ha Long, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Lubang biru, Belize::", ":Bali, Indonesia::", ":Aurora, Norway::", ":Gunung Fuji, Jepun::", ":Pelabuhan Rio De Janeiro, Brazil::", ":Paria Canyon, Amerika Syarikat::", ":Gunung Everest, Nepal dan Tibet::", ":Air Terjun Niagara, Kanada::", ":Lac Rose, Senegal::", ":Hutan Hitam, Jerman::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Air Terjun Angel, Venezuela:1,2,4:", ":Gunung Kilimanjaro, Tanzania::", ":Delta Danube, Romania::", ":Air Terjun Victoria, Zimbabwe dan Zambia:5,6,9:", ":Mata Sahara, Mauritania::", ":Laut Mati, Israel::", ":Cliffs of Moher, Ireland::", ":Gunung berapi Lumpur, Azerbaijan::", ":Tasik Moraine, Kanada::", ":Marbles Devil, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turki::", ":Sungai Lima Warna, Columbia::", ":Gunung berapi Paricutín, Mexico::", ":Batu Moeraki sepotong, New Zealand::", ":Grotto Biru, Itali:0,1,2:", ":Gua Marble, Chile:3,0,2:", ":Gua kristal, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Pulau Jeju, Korea Selatan:1,2,5:", ":Air Terjun Iguazu, Argentina dan Brazil::", ":Matterhorn, Switzerland::", ":Jadual Gunung, Afrika Selatan:1,6,5:", ":Bu Tinah, Emiriah Arab Bersatu:1,6,5:", ":Sundarban, Bangladesh::", ":Jurang Verdon, Perancis::"]);
  }

  void addNL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.nl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Scandinavië:17,18,20", "Balkan-schiereiland:42,38,37,35,39,23,36,24,26,34", "Baltische staten regio:29,30,31", "Centraal Amerika:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Arabisch Schiereiland:47,53,61,60,59,58,57,56", "Oost-Azië:86,87,88,89,90", "Kaukasus:49,50,51", "Zuid-Oost Azië:76,77,78,79,80,81,82,83,84,85,94", "Centraal Azië:63,67,66,68,65", "Zuidelijk Afrika:155,156,157,158,159", "Zuid-Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovjet-Unie:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mogolrijk:64,73,69,70", "Britse rijk:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongoolse rijk:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Romeinse rijk:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Ottomaanse Rijk:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugees rijk:118,183,146,86,94,129,69,132,126,7,147,190", "Inca-rijk:186,184,191,187,189,185", "Maya-rijk:162,164,166,174,172", "Oostenrijks-Hongaarse rijk:6,25,28,27,34,22,32,36,26,24,37,39,4", "Perzische rijk:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffeltoren, Parijs::", ":Colosseum, Rome::", ":Hollywood Sign, Los Angeles::", ":Grote piramide van Gizeh, Egypt::", ":Vrijheidsbeeld, New York::", ":Grote muur van China::", ":Angkor Wat, Cambodja::", ":Vaticaanstad::", ":Scheve toren van Pisa, Italië::", ":Christus de Verlosser, Rio de Janeiro::", ":Sydney Opera House, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Athene::", ":Taj Mahal, India::", ":Blauwe Moskee, Istanbul::", ":Burj Khalifa, Dubai::", ":Het Louvre, Parijs::", ":Machu Picchu, Peru::", ":Berlijnse muur::", ":Disneyland Resort, Californië::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Rode Plein, Moskou::", ":Petra, Jordanië::", ":The Strip, Las Vegas::", ":Groots paleis, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Terracotta krijgers, China::", ":Times Square, New York::", ":Verboden Stad, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Staafkerk van Borgund, Noorwegen::", ":Sjeik Zayed-moskee, Abu Dhabi::", ":Kasteel Neuschwanstein, Duitsland::", ":Oriental Pearl Tower, Shanghai::", ":Petronas Twin Towers, Maleisië::", ":Victoria Harbour, Hong Kong::", ":Bibliotheek van Celsus, Ephesus::", ":Panamakanaal, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Hạ Longbaai, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Het grote blauwe gat, Belize::", ":Bali, Indonesië::", ":Poollicht, Noorwegen::", ":Fuji, Japan::", ":Haven van Rio De Janeiro, Brazilië::", ":Paria Canyon, Verenigde Staten::", ":Mount Everest, Nepal en Tibet::", ":Niagarawatervallen, Canada::", ":Roze Meer, Senegal::", ":Het Zwarte Woud, Duitsland::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Ángelwaterval, Venezuela:1,2,4:", ":Kilimanjaro, Tanzania::", ":Donau Delta, Roemenië::", ":Victoriawatervallen, Zimbabwe en Zambia:5,6,9:", ":Oog van de Sahara, Mauritanië::", ":Dode Zee, Israel::", ":Kliffen van Moher, Ierland::", ":Moddervulkanen, Azerbeidzjan::", ":Moraine Lake, Canada::", ":Devil's Marbles, Australië::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turkije::", ":Caño Cristales, Colombia::", ":Paricutín-vulkaan, Mexico::", ":Moeraki Boulders, Nieuw-Zeeland::", ":Blauwe Grot, Italië:0,1,2:", ":Marmeren grotten, Chile:3,0,2:", ":Kristallen grot, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jeju-eiland, Zuid-Korea:1,2,5:", ":Iguazu-watervallen, Argentinië en Brazilië::", ":Matterhorn, Zwitserland::", ":Tafelberg, Zuid-Afrika:1,6,5:", ":Bu Tinah, Verenigde Arabische Emiraten:1,6,5:", ":Sundarbans, Bangladesh::", ":Gorges du Verdon, Frankrijk::"]);
  }

  void addNB(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.nb;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavia:17,18,20", "Balkan-halvøya:42,38,37,35,39,23,36,24,26,34", "Baltiske stater region:29,30,31", "Sentral-Amerika:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "den arabiske halvøy:47,53,61,60,59,58,57,56", "øst Asia:86,87,88,89,90", "Kaukasus:49,50,51", "Sørøst-Asia:76,77,78,79,80,81,82,83,84,85,94", "Sentral-Asia:63,67,66,68,65", "Sørlige Afrika:155,156,157,158,159", "Sør Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovjetunionen:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mogulriket:64,73,69,70", "Det britiske imperiet:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolske imperiet:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Romerriket:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Det osmanske riket:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugisisk imperium:118,183,146,86,94,129,69,132,126,7,147,190", "Inkariket:186,184,191,187,189,185", "Mayariket:162,164,166,174,172", "Østerriksk-Ungarsk imperium:6,25,28,27,34,22,32,36,26,24,37,39,4", "Persisk imperium:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffeltårnet, Paris::", ":Colosseum, Roma::", ":Hollywoodskiltet, Los Angeles::", ":Kheopspyramiden, Egypt::", ":Frihetsgudinnen, New York::", ":Den kinesiske mur::", ":Angkor Vat, Kambodsja::", ":Vatikanstaten::", ":Det skjeve tårnet i Pisa, Italia::", ":Kristus forløser, Rio de Janeiro::", ":Sydney operahus, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Athen::", ":Taj Mahal, India::", ":Sultan Ahmed-moskeen, Istanbul::", ":Burj Khalifa, Dubai::", ":Louvre-museet, Paris::", ":Machu Picchu, Peru::", ":Berlin-muren::", ":Disneyland Resort, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Den røde plass, Moskva::", ":Petra, Jordan::", ":The Strip, Las Vegas::", ":Det Kongelige Palass, Bangkok::", ":Sagrada Família, Barcelona::", ":Terrakottahæren, Kina::", ":Times Square, New York::", ":Den forbudte by, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgund stavkirke, Norge::", ":Sheikh Zayed-moskeen, Abu Dhabi::", ":Neuschwanstein, Tyskland::", ":Oriental Pearl Tower, Shanghai::", ":Petronas Twin Towers, Malaysia::", ":Victoria Harbour, Hong Kong::", ":Celsus-biblioteket, Efesos::", ":Panamakanalen, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Hạ Long-bukten, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Det store blå hullet, Belize::", ":Bali, Indonesia::", ":Aurora polaris, Norge::", ":Fuji-san, Japan::", ":havnen i Rio De Janeiro, Brasil::", ":Paria Dal, USA::", ":Mount Everest, Nepal og Tibet::", ":Niagarafallene, Canada::", ":Lac Rose, Senegal::", ":Black Forest, Tyskland::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angelfossen, Venezuela:1,2,4:", ":Kilimanjaro-fjellet, Tanzania::", ":Donaudeltaet, Romania::", ":Victoriafallene, Zimbabwe og Zambia:5,6,9:", ":Sahara-øye, Mauritania::", ":Dødehavet, Israel::", ":Cliffs of Moher, Irland::", ":Mud-vulkaner, Aserbajdsjan::", ":Moraine Lake, Canada::", ":Djevelens klinkekuler, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Tyrkia::", ":Caño Cristales, Columbia::", ":Paricutín vulkan, Mexico::", ":Moeraki Boulders, New Zealand::", ":Den blå grotten, Italia:0,1,2:", ":Marmorhuler, Chile:3,0,2:", ":Krystallgrotte, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jeju-øya, Sør-Korea:1,2,5:", ":Iguazúfallene, Argentina og Brasil::", ":Matterhorn, Sveits::", ":Taffelberg, Sør-Afrika:1,6,5:", ":Bu Tinah, De forente arabiske emirater:1,6,5:", ":Sundarbans, Bangladesh::", ":Verdon Kløft, Frankrike::"]);
  }

  void addPL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.pl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandynawia:17,18,20", "Półwysep Bałkański:42,38,37,35,39,23,36,24,26,34", "Region krajów bałtyckich:29,30,31", "Ameryka środkowa:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Półwysep Arabski:47,53,61,60,59,58,57,56", "wschodnia Azja:86,87,88,89,90", "Kaukaz:49,50,51", "Azja Południowo-Wschodnia:76,77,78,79,80,81,82,83,84,85,94", "Azja Środkowa:63,67,66,68,65", "Afryka Południowa:155,156,157,158,159", "Ameryka Południowa:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Związek Radziecki:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Wielcy Mogołowie:64,73,69,70", "Imperium Brytyjskie:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Imperium Mongolskie:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Cesarstwo Rzymskie:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Imperium Osmańskie:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Imperium Portugalskie:118,183,146,86,94,129,69,132,126,7,147,190", "Imperium Inków:186,184,191,187,189,185", "Imperium Majów:162,164,166,174,172", "Cesarstwo Austro-Węgierskie:6,25,28,27,34,22,32,36,26,24,37,39,4", "Imperium Perskie:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Wieża Eiffla, Paryż::", ":Koloseum, Rzym::", ":Hollywood Sign, Los Angeles::", ":Wielka Piramida w Gizie, Egipt::", ":Statua Wolności, Nowy Jork::", ":Wielki Mur Chiński::", ":Angkor Wat, Kambodża::", ":Watykan::", ":Krzywa wieża w Pizie, Włochy::", ":Chrystus Odkupiciel, Rio de Janeiro::", ":Sydney Opera House, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropol, Ateny::", ":Tadź Mahal, Indie::", ":Błękitny Meczet, Stambuł::", ":Burdż Chalifa, Dubaj::", ":Luwr, Paryż::", ":Machu Picchu, Peru::", ":Mur berliński::", ":Disneyland Resort, Kalifornia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Plac Czerwony, Moskwa::", ":Petra, Jordania::", ":The Strip, Las Vegas::", ":Wielki Pałac, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Terakotowa Armia, Chiny::", ":Times Square, Nowy Jork::", ":Zakazane Miasto, Pekin::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgund stavkirke, Norwegia::", ":Meczet Szejka Zayeda w Abu Zabi::", ":Zamek Neuschwanstein, Niemcy::", ":Oriental Pearl Tower, Szanghaj::", ":Petronas Twin Towers, Malezja::", ":Victoria Harbour, Hong Kong::", ":Biblioteka Celsusa, Efez::", ":Kanał Panamski, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Zatoka Ha Long, Wietnam::", ":Salar de Uyuni, Boliwia::", ":Wielka Niebieska Dziura, Belize::", ":Bali, Indonezja::", ":Zorza polarna, Norwegia::", ":Fudżi, Japonia::", ":Port w Rio De Janeiro, Brazylia::", ":Kanion Paria, Stany Zjednoczone::", ":Mount Everest, Nepal i Tybet::", ":Wodospad Niagara, Kanada::", ":Lac Rose, Senegal::", ":Czarny Las, Niemcy::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Salto Angel, Wenezuela:1,2,4:", ":Kilimandżaro, Tanzania::", ":Delta Dunaju, Rumunia::", ":Wodospady Wiktorii, Zimbabwe i Zambia:5,6,9:", ":Kalb ar-Riszat, Mauretania::", ":Morze Martwe, Izrael::", ":Klify Moheru, Ireland::", ":Wulkany błotne, Azerbejdżan::", ":Moraine, Kanada::", ":Karlu Karlu, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turcja::", ":Rzeka pięciu kolorów, Kolumbia::", ":Wulkan Paricutín, Meksyk::", ":Głazy Moeraki, Nowa Zelandia::", ":Lazurowa Grota, Włochy:0,1,2:", ":Marmurowe jaskinie, Chile:3,0,2:", ":Jaskinia Kryształowa, Bermudy:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Wyspa Jeju, Korea Południowa:1,2,5:", ":Wodospady Iguazu, Argentyna i Brazylia::", ":Matterhorn, Szwajcaria::", ":Góra Stołowa, Republika Południowej Afryki:1,6,5:", ":Bu Tinah, Zjednoczone Emiraty Arabskie:31,26,26:", ":Sundarbany, Bangladesz::", ":Przełom Verdon, Francja::"]);
  }

  void addPT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.pt;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Escandinávia:17,18,20", "Península Balcânica:42,38,37,35,39,23,36,24,26,34", "região dos estados bálticos:29,30,31", "América Central:164,165,166,171,172,173,174", "Magrebe:108,107,109,110,138", "Península Arábica:47,53,61,60,59,58,57,56", "Ásia leste:86,87,88,89,90", "Cáucaso:49,50,51", "Sudeste da Ásia:76,77,78,79,80,81,82,83,84,85,94", "Ásia Central:63,67,66,68,65", "África Austral:155,156,157,158,159", "América do Sul:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["União Soviética:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Império Mogol:64,73,69,70", "Império Britânico:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Império Mongol:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Império Romano:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Império Otomano:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Império Português:118,183,146,86,94,129,69,132,126,7,147,190", "Império Inca:186,184,191,187,189,185", "Império Maia:162,164,166,174,172", "Império Austro-Húngaro:6,25,28,27,34,22,32,36,26,24,37,39,4", "Império Persa:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Torre Eiffel, Paris::", ":Coliseu, Roma::", ":Letreiro de Hollywood, Los Angeles::", ":Grande Pirâmide de Gizé, Egito::", ":Estátua da Liberdade, Nova York::", ":Grande Muralha da China::", ":Angkor Wat, Camboja::", ":Cidade do Vaticano::", ":Torre inclinada de Pisa, Itália::", ":Cristo Redentor, Rio de Janeiro::", ":Ópera de Sydney, Sidney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Acrópole, Atenas::", ":Taj Mahal, Índia::", ":Mesquita Azul, Istambul::", ":Burj Khalifa, Dubai::", ":Museu do Louvre, Paris::", ":Machu Picchu, Peru::", ":Muro de Berlim::", ":Disneyland Resort, Califórnia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Praça Vermelha, Moscou::", ":Petra, Jordânia::", ":The Strip, Las Vegas::", ":Grande Palácio, Banguecoque::", ":La Sagrada Familia, Barcelona::", ":Guerreiros de terracota, China::", ":Times Square, Nova York::", ":Cidade Proibida, Pequim::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Igreja Borgund Stave, Noruega::", ":Mesquita do Sheikh Zayed, Abu Dhabi::", ":Castelo de Neuschwanstein, Alemanha::", ":Torre da Pérola Oriental, Xangai::", ":Petronas Twin Towers, Malásia::", ":Victoria Harbour, Hong Kong::", ":Biblioteca de Celso, Éfeso::", ":Canal do Panamá, Panamá::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Baía de Ha Long, Vietnã::", ":Salar de Uyuni, Bolívia::", ":O Grande Buraco Azul, Belize::", ":Bali, Indonésia::", ":A Aurora Boreal, Noruega::", ":Monte Fuji, Japão::", ":Porto do Rio de Janeiro, Brasil::", ":Cânion Paria, Estados Unidos::", ":Monte Everest, Nepal e Tibet::", ":Cataratas do Niágara, Canadá::", ":Lac Rose, Senegal::", ":A Floresta Negra, Alemanha::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Salto Ángel, Venezuela:1,2,4:", ":Monte Kilimanjaro, Tanzânia::", ":Delta do Danúbio, Romênia::", ":Cataratas Vitória, Zimbábue e Zâmbia:5,6,9:", ":Olho do Saara, Mauritânia::", ":O Mar Morto, Israel::", ":Falésias de Moher, Irlanda::", ":Vulcões de lama, Azerbaijão::", ":Lago Moraine, Canadá::", ":Mármores do Diabo, Austrália::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turquia::", ":O Rio das Cinco Cores, Colômbia::", ":Vulcão Paricutín, México::", ":Seixos gigantes de Moerek, Nova Zelândia::", ":Gruta Azul, Itália:0,1,2:", ":Grutas de Mármore, Chile:3,0,2:", ":Gruta de Cristal, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Ilha de Jeju, Coreia do Sul:1,2,5:", ":Cataratas do Iguaçu, Argentina e Brasil::", ":Matterhorn, Suíça::", ":Montanha da Mesa, África do Sul:1,6,5:", ":Bu Tinah, Emirados Árabes Unidos:1,6,5:", ":Sundarbans, Bangladesh::", ":Garganta de Verdon, França::"]);
  }

  void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.ro;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Scandinavia:17,18,20", "Peninsula Balcanică:42,38,37,35,39,23,36,24,26,34", "Regiunea statelor baltice:29,30,31", "America Centrală:164,165,166,171,172,173,174", "Magreb:108,107,109,110,138", "Peninsula Arabică:47,53,61,60,59,58,57,56", "Asia de Est:86,87,88,89,90", "Caucaz:49,50,51", "Asia de Sud-Est:76,77,78,79,80,81,82,83,84,85,94", "Asia Centrală:63,67,66,68,65", "Africa Sudică:155,156,157,158,159", "America de Sud:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Uniunea Sovietică:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Imperiul Mogul:64,73,69,70", "Imperiul Britanic:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Imperiul Mongol:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Imperiul Roman:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Imperiul Otoman:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Imperiul Portughez:118,183,146,86,94,129,69,132,126,7,147,190", "Imperiul Inca:186,184,191,187,189,185", "Imperiul Maya:162,164,166,174,172", "Imperiul Austro-Ungar:6,25,28,27,34,22,32,36,26,24,37,39,4", "Imperiul Persan:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Turnul Eiffel, Paris::", ":Colosseum, Roma::", ":Semnul Hollywood, Los Angeles::", ":Marea Piramidă din Giza, Egipt::", ":Statuia Libertăţii, New York::", ":Marele Zid Chinezesc::", ":Angkor Wat, Cambodgia::", ":Vatican::", ":Turnul înclinat din Pisa, Italia::", ":Hristos Răscumpărătorul, Rio de Janeiro::", ":Sydney Opera House, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Acropola din Atena, Atena::", ":Taj Mahal, India::", ":Moscheea Albastră, Istanbul::", ":Burj Khalifa, Dubai::", ":Muzeul Luvru, Paris::", ":Machu Picchu, Peru::", ":Zidul Berlinului::", ":Disneyland Resort, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Piaţa Roşie, Moscova::", ":Petra, Iordania::", ":Fâşia, Las Vegas::", ":Palatul Grand, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Armata de Teracotă, China::", ":Times Square, New York::", ":Oraşul interzis, Beijing::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Biserica Borgund Stave, Norvegia::", ":Moscheea Șeicului Zayed , Abu Dhabi::", ":Castelul Neuschwanstein, Germania::", ":Turnul Pearl Oriental, Shanghai::", ":Turnurile Petronas, Malaezia::", ":Portul Victoria, Hong Kong::", ":Biblioteca lui Celsus, Efes::", ":Canalul Panama, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Ha Long Bay, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Marea Gaură Albastră, Belize::", ":Bali, Indonezia::", ":Auroră polară, Norvegia::", ":Muntele Fuji, Japonia::", ":Portul din Rio De Janeiro, Brazilia::", ":Canionul Paria, Statele Unite::", ":Muntele Everest, Nepal şi Tibet::", ":Cascada Niagara, Canada::", ":Lac Rose, Senegal::", ":Pădurea Neagră, Germania::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Cascada Angel, Venezuela:1,2,4:", ":Muntele Kilimanjaro, Tanzania::", ":Delta Dunării, România::", ":Cascadele din Victoria, Zimbabwe şi Zambia:5,6,9:", ":Ochiul Saharei, Mauritania::", ":Marea Moartă, Israel::", ":Stâncile din Moher, Irlanda::", ":Vulcanii noroioși, Azerbaijan::", ":Lacul Moraine, Canada::", ":Pietrele Diavolului, Australia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turcia::", ":Râul cu Cinci Culori, Columbia::", ":Vulcan Paricutín, Mexic::", ":Bolovanii Moeraki, Noua Zeelandă::", ":Grota Albastră, Italia:0,1,2:", ":Peştera de marmură, Chile:3,0,2:", ":Peştera de cristal, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Insula Jeju, Coreea de Sud:1,2,5:", ":Cascadele de pe Iguazú, Argentina şi Brazilia::", ":Matterhorn, Elveţia::", ":Muntele Masa, Africa de Sud:1,6,5:", ":Bu Tinah, Emiratele Arabe Unite:1,6,5:", ":Sundarbans, Bangladesh::", ":Cheile Verdon, Franţa::"]);
  }

  void addRU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.ru;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Скандинавия:17,18,20", "Балканский полуостров:42,38,37,35,39,23,36,24,26,34", "Балтийский регион:29,30,31", "Центральная Америка:164,165,166,171,172,173,174", "Магриб:108,107,109,110,138", "Аравийский полуостров:47,53,61,60,59,58,57,56", "Восточная Азия:86,87,88,89,90", "Кавказ:49,50,51", "Юго-Восточная Азия:76,77,78,79,80,81,82,83,84,85,94", "Центральная Азия:63,67,66,68,65", "Южная Африка:155,156,157,158,159", "Южная Америка:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Советский Союз:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Империя Великих Моголов:64,73,69,70", "Британская империя:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Монгольская империя:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Римская империя:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Османская империя:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Португальская империя:118,183,146,86,94,129,69,132,126,7,147,190", "Империя инков:186,184,191,187,189,185", "Империя майя:162,164,166,174,172", "Австро-Венгерская империя:6,25,28,27,34,22,32,36,26,24,37,39,4", "Персидская империя:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Эйфелева башня, Париж::", ":Колизей, Рим::", ":Знак Голливуда, Лос-Анджелес::", ":Великая пирамида в Гизе, Египет::", ":Статуя Свободы, Нью-Йорк::", ":Великая китайская стена::", ":Ангкор-Ват, Камбоджа::", ":Ватикан::", ":Пизанская башня, Италия::", ":Христос-Искупитель, Рио-де-Жанейро::", ":Сиднейский оперный театр, Сидней::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Акрополь, Афины::", ":Тадж-Махал, Индия::", ":Голубая мечеть, Стамбул::", ":Бурдж Халифа, Дубай::", ":Лувр, Париж::", ":Мачу-Пикчу, Перу::", ":Берлинская стена::", ":Диснейленд Резорт, Калифорния::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Красная площадь, Москва::", ":Петра, Иордания::", ":Стрип, Лас-Вегас::", ":Большой дворец, Бангкок::", ":Саграда-Фамилия, Барселона::", ":Терракотовая армия, Китай::", ":Таймс-сквер, Нью-Йорк::", ":Запретный город, Пекин::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Деревянная церковь Боргунд, Норвегия::", ":Мечеть шейха Зайда, Абу-Даби::", ":Замок Нойшванштайн, Германия::", ":Восточная жемчужина, Шанхай::", ":Башни Петронас, Малайзия::", ":Виктория Харбор, Гонконг::", ":Библиотека Цельса, Эфес::", ":Панамский канал, Панама::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Бухта Халонг, Вьетнам::", ":Салар де Уюни, Боливия::", ":Большая голубая дыра, Белиз::", ":Бали, Индонезия::", ":Северное сияние, Норвегия::", ":Гора Фудзи, Япония::", ":Порт Рио-де-Жанейро, Бразилия::", ":Пария Каньон, Соединенные Штаты::", ":Гора Эверест, Непал и Тибет::", ":Ниагарский водопад, Канада::", ":Ретба, Сенегал::", ":Шварцвальд, Германия::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Водопад Анхель, Венесуэла:1,2,4:", ":Гора Килиманджаро, Танзания::", ":Дельта Дуная, Румыния::", ":Водопад Виктория, Зимбабве и Замбия:5,6,9:", ":Глаз Сахары, Мавритания::", ":Мертвое море, Израиль::", ":Скалы Мохер, Ирландия::", ":Грязевые вулканы, Азербайджан::", ":Озеро Морейн, Канада::", ":Шары дьявола, Австралия::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Памуккале, Турция::", ":Река пяти цветов, Колумбия::", ":Вулкан Парикутин, Мексика::", ":Валуны Моераки, Новая Зеландия::", ":Голубой грот, Италия:0,1,2:", ":Мраморные пещеры, Чили:3,0,2:", ":Хрустальная пещера, Бермудские острова:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Остров Чеджу, Южная Корея:1,2,5:", ":Водопады Игуасу, Аргентина и Бразилия::", ":Маттерхорн, Швейцария::", ":Столовая гора, ЮАР:1,6,5:", ":Бу Тина, Объединенные Арабские Эмираты:1,6,5:", ":Сундарбанс, Бангладеш::", ":Ущелье Вердон, Франция::"]);
  }

  void addSK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.sk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Škandinávie:17,18,20", "Balkánsky polostrov:42,38,37,35,39,23,36,24,26,34", "Región pobaltských štátov:29,30,31", "Stredná Amerika:164,165,166,171,172,173,174", "Magreb:108,107,109,110,138", "Arabský polostrov:47,53,61,60,59,58,57,56", "Východná Ázia:86,87,88,89,90", "Kaukaz:49,50,51", "Juhovýchodná Ázia:76,77,78,79,80,81,82,83,84,85,94", "Stredná Ázia:63,67,66,68,65", "Južná Afrika (región):155,156,157,158,159", "Južná Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovietsky zväz:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mughali:64,73,69,70", "Britské impérium:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolská ríša:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Rímska ríša:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Osmanská ríša:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugalské impérium:118,183,146,86,94,129,69,132,126,7,147,190", "Incká ríša:186,184,191,187,189,185", "Mayská ríša:162,164,166,174,172", "Rakúsko-Uhorská ríša:6,25,28,27,34,22,32,36,26,24,37,39,4", "Perzská ríša:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffelova veža, Paríž::", ":Koloseum, Rím::", ":Hollywoodske znamenie, Los Angeles::", ":Veľká pyramída v Gíze, Egypt::", ":Socha slobody, New York::", ":Veľká čínsky múr::", ":Angkór Vat, Kambodža::", ":Vatikán::", ":Šikmá veža v Pise, Taliansko::", ":Kristus Spasiteľ, Rio de Janeiro::", ":Sydney Opera House, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropola, Atény::", ":Tádž Mahal, India::", ":Modrá mešita, Istanbul::", ":Burdž chalífa, Dubaj::", ":Múzeum Louvre, Paríž::", ":Machu Picchu, Peru::", ":Berlínsky múr::", ":Disneyland Resort, Kalifornia::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Červené námestie, Moskva::", ":Petra, Jordánsko::", ":The Strip, Las Vegas::", ":Veľký palác, Bangkok::", ":Sagrada Familia, Barcelona::", ":Terakotová armáda, Čína::", ":Times Square, New York::", ":Zakázané mesto, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Kostol Borgund Stave, Nórsko::", ":MeŠita šejka Zayeda, Abú Zabí::", ":Zámok Neuschwanstein, Nemecko::", ":Orientálna perlová veža, Šanghaj::", ":Menara Berkembar Petronas, Malajzia::", ":Victoria Harbor, Hong Kong::", ":Knižnica Celzia, Efez::", ":Panamský prieplav, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Vịnh Hạ Long, Vietnam::", ":Salar de Uyuni, Bolívia::", ":Veľká modrá diera, Belize::", ":Bali, Indonézia::", ":Polárna žiara, Nórsko::", ":Fudžisan, Japonsko::", ":Prístav Rio De Janeiro, Brazília::", ":Paria kaňon, Spojené štáty::", ":Mount Everest, Nepál a Tibet::", ":Niagarské vodopády, Kanada::", ":Lac Rose, Senegal::", ":Čierny les, Nemecko::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angelov vodopád, Venezuela:1,2,4:", ":Kilimandžáro, Tanzánia::", ":Delta Dunaja, Rumunsko::", ":Viktóriine vodopády, Zimbabwe a Zambia:5,6,9:", ":Eye of Sahara, Mauritania::", ":Mŕtve more, Izrael::", ":Moherské útesy, Írsko::", ":Bahenné sopky, Azerbajdžan::", ":Moraine jazero, Kanada::", ":Diablove guličky, Austrália::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turecko::", ":Rieka piatich farieb, Kolumbia::", ":Sopka Paricutín, Mexiko::", ":Kamenná časť Moeraki, Nový Zéland::", ":Modré jaskyne, Taliansko:0,1,2:", ":Mramorové jaskyne, Čile:3,0,2:", ":Kristallgrotta, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Ostrov Jeju, Južná Kórea:1,2,5:", ":Vodopády Iguazu, Argentína a Brazília::", ":Matterhorn, Švajčiarsko::", ":Stolová hora, Južná Afrika:1,6,5:", ":Bu Tinah, Spojené arabské emiráty:1,6,5:", ":Sundarban, Bangladéš::", ":Grand canyon du Verdon, Francúzsko::"]);
  }

  void addSL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.sl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavija:17,18,20", "Balkanski polotok:42,38,37,35,39,23,36,24,26,34", "regija baltskih držav:29,30,31", "Srednja Amerika:164,165,166,171,172,173,174", "Magreb:108,107,109,110,138", "Arabski polotok:47,53,61,60,59,58,57,56", "Vzhodna Azija:86,87,88,89,90", "Kavkaz:49,50,51", "Jugovzhodna Azija:76,77,78,79,80,81,82,83,84,85,94", "Srednja Azija:63,67,66,68,65", "Južna Afrika (regija):155,156,157,158,159", "Južna Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovjetska zveza:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mughal Empire:64,73,69,70", "Britansko cesarstvo:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolsko cesarstvo:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "rimsko cesarstvo:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "otomanski imperij:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugalsko cesarstvo:118,183,146,86,94,129,69,132,126,7,147,190", "Inkovsko cesarstvo:186,184,191,187,189,185", "majevsko cesarstvo:162,164,166,174,172", "Avstro-Ogrsko cesarstvo:6,25,28,27,34,22,32,36,26,24,37,39,4", "Perzijsko cesarstvo:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eifflov stolp, Pariz::", ":Kolosej, Rim::", ":Hollywood Sign, Los Angeles::", ":Velika piramida v Gizi, Egipt::", ":Kip svobode, New York::", ":Veliki kitajski zid::", ":Angkor Wat, Kambodža::", ":Vatikan::", ":Poševni stolp v Pisi, Italija::", ":Kristus Odrešenik, Rio de Janeiro::", ":Sydney Opera House, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropola, Atene::", ":Taj Mahal, Indija::", ":Modra mošeja, Istanbul::", ":Burj Khalifa, Dubaj::", ":Muzej Louvre, Pariz::", ":Machu Picchu, Peru::", ":Berlinski zid::", ":Disneyland Resort, Kalifornija::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Rdeči trg, Moskva::", ":Petra, Jordan::", ":Strip, Las Vegas::", ":Velika palača, Bangkok::", ":La Sagrada Familia, Barcelona::", ":Glinena vojska, Kitajska::", ":Times Square, New York::", ":Prepovedano mesto, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgundska cerkev, Norveška::", ":Mošeja Sheikh Zayed, Abu Dhabi::", ":Grad Neuschwanstein, Nemčija::", ":Oriental Pearl Tower, Šanghaj::", ":Petronasova stolpa, Malezija::", ":Pristanišče Victoria, Hong Kong::", ":Celsusova knjižnica, Efez::", ":Panamski prekop, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Zaliv Halong, Vietnam::", ":Salar de Uyuni, Bolivija::", ":Modra luknja, Belize::", ":Bali, Indonezija::", ":Polarni sij, Norveška::", ":Gora Fuji, Japonska::", ":Pristanišče Rio De Janeiro, Brazilija::", ":Kanjon Paria, Združene države Amerike::", ":Mount Everest, Nepal in Tibet::", ":Niagarski slapovi, Kanada::", ":Lac Rose, Senegal::", ":Črni gozd, Nemčija::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angelski slapovi, Venezuela:1,2,4:", ":Gora Kilimandžaro, Tanzanija::", ":Delta Donave, Romunija::", ":Viktorijini slapovi, Zimbabve in Zambija:5,6,9:", ":Oko Sahare, Mavretanija::", ":Mrtvo morje, Izrael::", ":Moherski klifi, Irska::", ":Blatni vulkani, Azerbajdžan::", ":Jezero Moraine, Kanada::", ":Devils Marbles, Avstralija::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turčija::", ":Reka petih barv, Kolumbija::", ":Vulkan Paricutín, Mehika::", ":Moeraki balvani, Nova Zelandija::", ":Modra jama, Italija:0,1,2:", ":Marmorne jame, Čile:3,0,2:", ":Kristalna jama, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Otok Jeju, Južna Koreja:1,2,5:", ":Slapovi Iguazu, Argentina in Brazilija::", ":Matterhorn, Švica::", ":Namizna gora, Južna Afrika:1,6,5:", ":Bu Tinah, Združeni arabski emirati:1,6,5:", ":Sundarbans, Bangladeš::", ":Soteska Verdon, Francija::"]);
  }

  void addSR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.sr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Скандинавија:17,18,20", "Балканско полуострво:42,38,37,35,39,23,36,24,26,34", "регион балтичких држава:29,30,31", "Централна Америка:164,165,166,171,172,173,174", "Магреб:108,107,109,110,138", "Арабијско полуострво:47,53,61,60,59,58,57,56", "источна Азија:86,87,88,89,90", "Кавказ:49,50,51", "Југоисточна Азија:76,77,78,79,80,81,82,83,84,85,94", "Централна Азија:63,67,66,68,65", "Јужна Африка:155,156,157,158,159", "Јужна Америка:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Совјетски Савез:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Могулско царство:64,73,69,70", "Британска империја:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Монголско царство:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Римско царство:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Османско царство:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Португалско царство:118,183,146,86,94,129,69,132,126,7,147,190", "Инка Емпире:186,184,191,187,189,185", "Маиан Емпире:162,164,166,174,172", "Аустро-Угарска:6,25,28,27,34,22,32,36,26,24,37,39,4", "Персијско царство:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Ајфелова кула, Париз::", ":Колосеум, Рим::", ":Холивудски знак, Лос Анђелес::", ":Велика пирамида у Гизи, Египат::", ":Кип слободе, Њујорк::", ":Великая Китайская стена::", ":Ангкор Ват, Камбоџа::", ":Ватикан::", ":Криви торањ у Пизи, Италија::", ":Христа Искупитеља, Рио де Жанеиро::", ":Сиднејска опера, Сиднеј::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Акропољ, Атина::", ":Таџ Махал, Индија::", ":Плава џамија, Истанбул::", ":Бурџ Калифа, Дубаи::", ":Музеј Лувр, Париз::", ":Мачу Пикчу, Перу::", ":Берлински зид::", ":Одмаралиште Дизниленд, Калифорнија::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Црвени трг, Москва::", ":Петра, Јордан::", ":Стрип, Лас Вегас::", ":Велика палата, Бангкок::", ":Саграда Фамилија, Барселона::", ":Ратници од теракоте, Кина::", ":Тајмс сквер, Њујорк::", ":Забрањени град, Пекинг::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Црква Боргунд Ставе, Норвешка::", ":Џамија шеика Заједа, Абу Даби::", ":Дворац Нојшванштајн, Немачка::", ":Ориентал Пеарл Товер, Шангај::", ":Куле Петронас, Малезија::", ":Лука Викторија, Хонг Конг::", ":Целсусова библиотека, Ефес::", ":Панамски канал, Панама::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Бухта Халонг, Вијетнам::", ":Салар де Ујуни, Боливија::", ":Велика плава рупа, Белизе::", ":Бали, Индонезија::", ":Поларна светлост, Норвешка::", ":Фуџи, Јапан::", ":Лука Рио Де Жанеиро, Бразил::", ":Кањон Париа, Сједињене Америчке Државе::", ":Монт Еверест, Непал и Тибет::", ":Нијагарини водопади, Канада::", ":Лац Росе, Сенегал::", ":Шварцвалд, Немачка::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Ангел Фаллс, Венецуела:1,2,4:", ":Планина Килиманџаро, Танзанија::", ":Делта Дунава, Румунија::", ":Викторијини водопади, Зимбабве и Замбија:5,6,9:", ":Око Сахаре, Мауританија::", ":Мртво море, Израел::", ":Скалы Мохер, Ирска::", ":Вулкани блата, Азербејџан::", ":Лаке Мораине, Канада::", ":Девил'с Марблес, Аустралија::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Памуккале, Турска::", ":Река пет боја, Колумбија::", ":Вулкан Парикутин, Мексико::", ":Моераки Боулдерс, Нови Зеланд::", ":Плава пећина, Италија:0,1,2:", ":Мермерне пећине, Чиле:3,0,2:", ":Кристална пећина, Бермуда:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Острво Јеју, Јужна Кореја:1,2,5:", ":Водопади Игвасу, Аргентина и Бразил::", ":Маттерхорн, Швајцарска::", ":Стона планина, Јужна Африка:1,6,5:", ":Бу Тина, Уједињени Арапски Емирати:1,6,5:", ":Сундарбан, Бангладеш::", ":Вердонска клисура, Француска::"]);
  }

  void addSV(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.sv;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Skandinavien:17,18,20", "Balkanhalvön:42,38,37,35,39,23,36,24,26,34", "Baltiska staterna:29,30,31", "Centralamerika:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "Arabiska halvön:47,53,61,60,59,58,57,56", "Östasien:86,87,88,89,90", "Kaukasus:49,50,51", "Sydöstra Asien:76,77,78,79,80,81,82,83,84,85,94", "Centralasien:63,67,66,68,65", "Södra Afrika:155,156,157,158,159", "Sydamerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovjetunionen:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Mogulriket:64,73,69,70", "Brittiska imperiet:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Mongolska riket:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Romerska riket:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Ottomanska riket:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portugisiska imperiet:118,183,146,86,94,129,69,132,126,7,147,190", "Inkariket:186,184,191,187,189,185", "Mayariket:162,164,166,174,172", "Österrikisk-ungerska imperiet:6,25,28,27,34,22,32,36,26,24,37,39,4", "Persiska imperiet:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eiffeltornet, Paris::", ":Colosseum, Rom::", ":Hollywoodskylten, Los Angeles::", ":Cheopspyramiden, Egypten::", ":Frihetsgudinnan, New York::", ":Kinas stora mur::", ":Angkor Vat, Kambodja::", ":Vatikanstaten::", ":Det lutande tornet i Pisa, Italien::", ":Kristus förlossare, Rio de Janeiro::", ":Operahuset i Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Aten::", ":Taj Mahal, Indien::", ":Blå moskén, Istanbul::", ":Burj Khalifa, Dubai::", ":Louvre-museet, Paris::", ":Machu Picchu, Peru::", ":Berlinmuren::", ":Disneyland Resort, Kalifornien::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Röda torget, Moskva::", ":Petra, Jordanien::", ":The Strip, Las Vegas::", ":Stort Palats, Bangkok::", ":Sagrada Família, Barcelona::", ":Terrakottaarmén, Kina::", ":Times Square, New York::", ":Förbjudna staden, Peking::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgunds stavkyrka, Norge::", ":Sheikh Zayed-moskén, Abu Dhabi::", ":Neuschwanstein, Tyskland::", ":Oriental Pearl Tower, Shanghai::", ":Petronas Twin Towers, Malaysia::", ":Victoria Harbour, Hong Kong::", ":Celsus bibliotek, Efesos::", ":Panamakanalen, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Ha Long-bukten, Vietnam::", ":Salar de Uyuni, Bolivia::", ":Blått hål, Belize::", ":Bali, Indonesien::", ":Polarsken, Norge::", ":Fuji, Japan::", ":Hamnen i Rio De Janeiro, Brasilien::", ":Paria Kanjon, USA::", ":Mount Everest, Nepal och Tibet::", ":Niagarafallen, Kanada::", ":Lac Rose, Senegal::", ":Black Forest, Tyskland::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angelfallen, Venezuela:1,2,4:", ":Kilimanjaro-berget, Tanzania::", ":Donau Delta, Rumänien::", ":Victoriafallen, Zimbabwe och Zambia:5,6,9:", ":Richatformationen, Mauretanien::", ":Döda havet, Israel::", ":Cliffs of Moher, Irland::", ":Mud vulkaner, Azerbajdzjan::", ":Moraine Lake, Kanada::", ":Devil's Marbles, Australien::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Turkiet::", ":Caño Cristales, Columbia::", ":Paricutín vulkan, Mexiko::", ":Moeraki Boulders, Nya Zeeland::", ":Den blå grotten, Italien:0,1,2:", ":Marmorgrottor, Chile:3,0,2:", ":Kristallgrotta, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Cheju-do, Sydkorea:1,2,5:", ":Iguazúfallen, Argentina och Brasilien::", ":Matterhorn, Schweiz::", ":Taffelberget, Sydafrika:1,6,5:", ":Bu Tinah, Förenade Arabemiraten:1,6,5:", ":Sundarban, Bangladesh::", ":Verdon Klyfta, Frankrike::"]);
  }

  void addTH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.th;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["สแกนดิเนเวีย:17,18,20", "คาบสมุทรบอลข่าน:42,38,37,35,39,23,36,24,26,34", "ภูมิภาครัฐบอลติก:29,30,31", "อเมริกากลาง:164,165,166,171,172,173,174", "มาเกร็บ:108,107,109,110,138", "คาบสมุทรอาหรับ:47,53,61,60,59,58,57,56", "เอเชียตะวันออก:86,87,88,89,90", "คอเคซัส:49,50,51", "เอเชียตะวันออกเฉียงใต้:76,77,78,79,80,81,82,83,84,85,94", "เอเชียกลาง:63,67,66,68,65", "แอฟริกาใต้ (ภูมิภาค):155,156,157,158,159", "อเมริกาใต้:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["สหภาพโซเวียต:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "จักรวรรดิโมกุล:64,73,69,70", "จักรวรรดิอังกฤษ:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "จักรวรรดิมองโกล:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "จักรวรรดิโรมัน:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "จักรวรรดิออตโตมัน:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "จักรวรรดิโปรตุเกส:118,183,146,86,94,129,69,132,126,7,147,190", "อาณาจักรอินคา:186,184,191,187,189,185", "อาณาจักรมายา:162,164,166,174,172", "จักรวรรดิออสเตรีย-ฮังการี:6,25,28,27,34,22,32,36,26,24,37,39,4", "จักรวรรดิเปอร์เซีย:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":หอไอเฟล, ปารีส::", ":โคลอสเซียมโรม::", ":ป้ายฮอลลีวูด, ลอสแองเจลิส::", ":มหาปิรามิดแห่งกิซาประเทศอียิปต์::", ":เทพีเสรีภาพ, นิวยอร์ก::", ":กำแพงเมืองจีน::", ":นครวัดกัมพูชา::", ":นครวาติกัน::", ":หอเอนเมืองปิซา, อิตาลี::", ":Christ the Redeemer, ริโอเดอจาเนโร::", ":โรงอุปรากรซิดนีย์, ซิดนีย์::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":อะโครโพลิส, เอเธนส์::", ":ทัชมาฮาลอินเดีย::", ":มัสยิดสุลต่านอาเหม็ด, อิสตันบูล::", ":บุรจญ์เคาะลีฟะฮ์, ดูไบ::", ":พิพิธภัณฑ์ลูฟร์, ปารีส::", ":มาชูปิกชู, เปรู::", ":กำแพงเบอร์ลิน::", ":ดิสนีย์แลนด์รีสอร์ทแคลิฟอร์เนีย::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":จัตุรัสแดง, มอสโก::", ":เปตรา, จอร์แดน::", ":เดอะสตริป, ลาสเวกัส::", ":พระบรมมหาราชวัง, กรุงเทพ::", ":ซากราดาฟามิลิอา, บาร์เซโลนา::", ":สุสานฉินสื่อหวง, จีน::", ":ไทม์สแควร์นิวยอร์ก::", ":พระราชวังต้องห้าม, ปักกิ่ง::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":โบสถ์ Borgund Stave, นอร์เวย์::", ":เที่ยวมัสยิด Sheikh Zayed, อาบูดาบี::", ":ปราสาทน็อยชวานชไตน์, เยอรมนี::", ":หอไข่มุกตะวันออก, เซี่ยงไฮ้::", ":เปโตรนาสทาวเวอร์, มาเลเซีย::", ":ท่าเรือวิคตอเรีย, ฮ่องกง::", ":ห้องสมุดของ Celsus, เอเฟซัส::", ":คลองปานามา, ปานามา::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":ฮาลองเบย์, เวียดนาม::", ":Salar de Uyuni, โบลิเวีย::", ":สีน้ำเงินรู, เบลีซ::", ":บาหลี, อินโดนีเซีย::", ":ออโรรา, นอร์เวย์::", ":ภูเขาไฟฟูจิ, ญี่ปุ่น::", ":ท่าเรือริโอเดอจาเนโรประเทศบราซิล::", ":ปาเรียแคนยอน, สหรัฐอเมริกา::", ":ยอดเขาเอเวอเรสต์, เนปาลและทิเบต::", ":น้ำตกไนแอการา, แคนาดา::", ":ลัคโรส, เซเนกัล::", ":ป่าสนเขาเยอรมนี::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":น้ำตกเอนเจล, เวเนซุเอลา:1,2,4:", ":ยอดเขาคิลิมันจาโร, แทนซาเนีย::", ":สามเหลี่ยมปากแม่น้ำดานูบโรมาเนีย::", ":น้ำตกวิกตอเรียซิมบับเวและแซมเบีย:5,6,9:", ":นัยน์ตาของซาฮาร่า, มอริเตเนีย::", ":ทะเลเดดซี, อิสราเอล::", ":หน้าผาแห่งโมเฮอร์, ไอร์แลนด์::", ":โคลนภูเขาไฟ, อาเซอร์ไบจาน::", ":ทะเลสาบจาร, แคนาดา::", ":หินอ่อนปีศาจ, ออสเตรเลีย::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":ปามุกกาเล, ตุรกี::", ":แม่น้ำหลากสีโคลัมเบีย::", ":ภูเขาไฟคอนติเนน, เม็กซิโก::", ":ก้อนหินโมเอรากิ, นิวซีแลนด์::", ":ถ้ำสีฟ้า, อิตาลี:0,1,2:", ":ถ้ำหินอ่อน, ชิลี:3,0,2:", ":ถ้ำคริสตัลเบอร์มิวดา:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":เกาะเชจู, เกาหลีใต้:1,2,5:", ":น้ำตกอีกวาซู, อาร์เจนตินาและบราซิล::", ":มัทเทอร์ฮอร์น, สวิตเซอร์แลนด์::", ":ภูเขาโต๊ะ, แอฟริกาใต้:1,6,5:", ":Bu Tinah, สหรัฐอาหรับเอมิเรตส์:1,6,5:", ":สุนทรพน, บังคลาเทศ::", ":Verdon หุบ, ฝรั่งเศส::"]);
  }

  void addTR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.tr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["İskandinavya:17,18,20", "Balkan Yarımadası:42,38,37,35,39,23,36,24,26,34", "Baltık ülkeleri bölgesi:29,30,31", "Orta Amerika:164,165,166,171,172,173,174", "Mağrip:108,107,109,110,138", "Arap Yarımadası:47,53,61,60,59,58,57,56", "Doğu Asya:86,87,88,89,90", "Kafkasya:49,50,51", "Güneydoğu Asya:76,77,78,79,80,81,82,83,84,85,94", "Orta Asya:63,67,66,68,65", "Güney Afrika:155,156,157,158,159", "Güney Amerika:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Sovyetler Birliği:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Babürlüler:64,73,69,70", "İngiliz İmparatorluğu:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Moğol İmparatorluğu:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Roma İmparatorluğu:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Osmanlı İmparatorluğu:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Portekiz İmparatorluğu:118,183,146,86,94,129,69,132,126,7,147,190", "İnka İmparatorluğu:186,184,191,187,189,185", "Maya İmparatorluğu:162,164,166,174,172", "Avusturya-Macaristan İmparatorluğu:6,25,28,27,34,22,32,36,26,24,37,39,4", "Pers İmparatorluğu:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Eyfel Kulesi, Paris::", ":Kolezyum, Roma::", ":Hollywood Sign, Los Angeles::", ":Büyük Giza Piramidi, Mısır::", ":Özgürlük Anıtı, New York::", ":Çin Seddi::", ":Angkor Vat, Kamboçya::", ":Vatikan Şehri::", ":Pisa Kulesi, İtalya::", ":İsa'nın Kurtarıcısı, Rio de Janeiro::", ":Sydney Opera Binası, Sidney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Akropolis, Atina::", ":Tac Mahal, Hindistan::", ":Sultanahmet Camii, İstanbul::", ":Burç Halife, Dubai::", ":Louvre Müzesi, Paris::", ":Machu Picchu, Peru::", ":Berlin Duvarı::", ":Disneyland Resort, Kaliforniya::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Kızıl Meydan, Moskova::", ":Petra, Ürdün::", ":Strip, Las Vegas::", ":Büyük Saray, Bangkok::", ":La Sagrada Familia, Barselona::", ":Terra Cotta Savaşçıları, Çin::", ":Times Meydanı, New York::", ":Yasak Şehir, Pekin::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Borgund Stave Kilisesi, Norveç::", ":Şeyh Zayed Camii, Abu Dabi::", ":Neuschwanstein Şatosu, Almanya::", ":Oryantal İnci Kulesi, Şangay::", ":Petronas İkiz Kuleleri, Malezya::", ":Victoria Limanı, Hong Kong::", ":Celsus Kütüphanesi, Efes::", ":Panama Kanalı, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Ha Long Koyu, Vietnam::", ":Salar de Uyuni Gölü, Bolivya::", ":Büyük Mavi Delik, Belize::", ":Bali, Endonezya::", ":Kutup ışıkları, Norveç::", ":Fuji Dağı, Japonya::", ":Rio De Janeiro Limanı, Brezilya::", ":Paria Kanyonu, Amerika Birleşik Devletleri::", ":Everest Dağı, Nepal ve Tibet::", ":Niagara Şelalesi, Kanada::", ":Retba Gölü, Senegal::", ":Kara Orman, Almanya::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Angel Şelaleleri, Venezuela:1,2,4:", ":Kilimanjaro Dağı, Tanzanya::", ":Tuna Deltası, Romanya::", ":Victoria Şelalesi, Zimbabve ve Zambiya:5,6,9:", ":Sahra'nın Gözü, Moritanya::", ":Ölü Deniz, İsrail::", ":Moher Kayalıkları, İrlanda::", ":Çamur volkanları, Azerbaycan::", ":Moraine Gölü, Kanada::", ":Şeytanın Mermerleri, Avustralya::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Türkiye::", ":Beş Renkli Nehir, Kolombiya::", ":Paricutín Volkanı, Meksika::", ":Głazy Moeraki, Yeni Zelanda::", ":Mavi Grotto, İtalya:0,1,2:", ":Mermer Mağaralar, Şili:3,0,2:", ":Kristal Mağarası, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Jeju Adası, Güney Kore:1,2,5:", ":Iguazu Şelalesi, Arjantin ve Brezilya::", ":Matterhorn, İsviçre::", ":Masa Dağı, Güney Afrika:1,6,5:", ":Bu Tinah, Birleşik Arap Emirlikleri:1,6,5:", ":Sundarbans, Bangladeş::", ":Verdon vadi, Fransa::"]);
  }

  void addUK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.uk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Скандинавії:17,18,20", "Балканський півострів:42,38,37,35,39,23,36,24,26,34", "Регіон країн Балтії:29,30,31", "Центральна Америка:164,165,166,171,172,173,174", "Магриб:108,107,109,110,138", "Аравійський півострів:47,53,61,60,59,58,57,56", "Східна Азія:86,87,88,89,90", "Кавказ:49,50,51", "Південно-Східна Азія:76,77,78,79,80,81,82,83,84,85,94", "Центральна Азія:63,67,66,68,65", "Південна Африка:155,156,157,158,159", "Південна Америка:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Радянський Союз:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Імперія Великих Моголів:64,73,69,70", "Британська імперія:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Монгольська імперія:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "Римська імперія:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "Османська імперія:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Португальська імперія:118,183,146,86,94,129,69,132,126,7,147,190", "Імперія інків:186,184,191,187,189,185", "Імперія майя:162,164,166,174,172", "Австро-Угорська імперія:6,25,28,27,34,22,32,36,26,24,37,39,4", "Перська імперія:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Ейфелева вежа, Париж::", ":Колізей, Рим::", ":Знак Голлівуду, Лос-Анджелес::", ":Велика піраміда Гізи, Єгипет::", ":Статуя Свободи, Нью-Йорк::", ":Велика Китайська стіна::", ":Ангкор-Ват, Камбоджа::", ":Місто Ватикан::", ":Пізанська вежа, Італія::", ":Христос-Викупитель, Ріо-де-Жанейро::", ":Оперний театр Сіднея, Сідней::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Акрополь, Афіни::", ":Тадж-Махал, Індія::", ":Блакитна мечеть, Стамбул::", ":Бурдж Халіфа, Дубай::", ":Музей Лувра, Париж::", ":Мачу-Пікчу, Перу::", ":Берлінська стіна::", ":Курорт Діснейленд, Каліфорнія::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Червона площа, Москва::", ":Петра, Йорданія::", ":Стрип, Лас-Вегас::", ":Великий палац, Бангкок::", ":Храм Святого Сімейства, Барселона::", ":Терра Котта Воїни, Китай::", ":Таймс-сквер, Нью-Йорк::", ":Заборонене місто, Пекін::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Церква Боргунд Став, Норвегія::", ":Мечеть Шейха Заїда, Абу-Дабі::", ":Замок Нойшванштайн, Німеччина::", ":Східна перлина башта, Шанхай::", ":Петронас-вежі-близнюки, Малайзія::", ":Гавань Вікторія, Гонконг::", ":Бібліотека Цельса, Ефес::", ":Панамський канал, Панама::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Бей Ха Ханг, В'єтнам::", ":Салар де Уюні, Болівія::", ":Велика синя діра, Беліз::", ":Балі, Індонезія::", ":Аврора Бореаліс, Норвегія::", ":гора Фудзі, Японія::", ":Гавань Ріо-де-Жанейро, Бразилія::", ":Парія Каньйон, США::", ":Еверест, Непал і Тибет::", ":Ніагарський водоспад, Канада::", ":Озеро Ретба, Сенегал::", ":Чорний ліс, Німеччина::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Ангел-Фоллз, Венесуела:1,2,4:", ":гора Кіліманджаро, Танзанія::", ":Дельта Дунаю, Румунія::", ":Водоспад Вікторія, Зімбабве та Замбія:5,6,9:", ":Око Сахари, Мавританія::", ":Мертве море, Ізраїль::", ":Скелі Мохер, Ірландія::", ":Грязьові вулкани, Азербайджан::", ":Моренне озеро, Канада::", ":Чортовий мармур, Австралія::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Памуккале, Туреччина::", ":Річка п'яти кольорів, Колумбія::", ":Вулкан Парикутін, Мексика::", ":Валуни Моеракі, Нова Зеландія::", ":Синій грот, Італія:0,1,2:", ":Мармурові печери, Чилі:3,0,2:", ":Кришталева печера, Бермуди:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Острів Чеджу, Південна Корея:1,2,5:", ":Водоспад Ігуасу, Аргентина та Бразилія::", ":Маттерхорн, Швейцарія::", ":Столова гора, Південна Африка:1,6,5:", ":Бу-Тіна, Об’єднані Арабські Емірати:1,6,5:", ":Сундарбани, Бангладеш::", ":Вердонська ущелина, Франція::"]);
  }

  void addVI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.vi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["Bán Đảo Scandinavia:17,18,20", "Bán đảo Balkan:42,38,37,35,39,23,36,24,26,34", "Khu vực các quốc gia vùng Baltic:29,30,31", "Trung Mỹ:164,165,166,171,172,173,174", "Maghreb:108,107,109,110,138", "bán đảo Ả-rập:47,53,61,60,59,58,57,56", "Đông Á:86,87,88,89,90", "Caucasus:49,50,51", "Đông Nam Á:76,77,78,79,80,81,82,83,84,85,94", "Trung Á:63,67,66,68,65", "Nam Phi (khu vực):155,156,157,158,159", "Nam Mỹ:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["Liên Xô:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "Đế chế Mughal:64,73,69,70", "đế quốc Anh:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "Đế chế Mông Cổ:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "đế chế La Mã:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "đế chế Ottoman:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "Đế chế Bồ Đào Nha:118,183,146,86,94,129,69,132,126,7,147,190", "Đế chế Inca:186,184,191,187,189,185", "Đế chế Maya:162,164,166,174,172", "Đế chế Áo-Hung:6,25,28,27,34,22,32,36,26,24,37,39,4", "đế chế Ba Tư:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":Tháp Eiffel, Paris::", ":Đấu trường La Mã, Rome::", ":Bảng hiệu Hollywood, Los Angeles::", ":Kim tự tháp Giza vĩ đại, Ai Cập::", ":Tượng Nữ thần Tự do, New York::", ":Vạn Lý Trường Thành của Trung Quốc::", ":Angkor Wat, Campuchia::", ":Thành phố Vatican::", ":Tháp nghiêng Pisa, Ý::", ":Chúa Cứu thế, Rio de Janeiro::", ":Nhà hát Opera Sydney, Sydney::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":Thành cổ, Athens::", ":Taj Mahal, Ấn Độ::", ":Nhà thờ Hồi giáo Xanh, Istanbul::", ":Burj Khalifa, Dubai::", ":Bảo tàng Louvre, Paris::", ":Machu Picchu, Peru::", ":Bức tường Berlin::", ":Khu nghỉ dưỡng Disneyland, California::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":Quảng trường Đỏ, Matxcơva::", ":Petra, Jordan::", ":Dải, Las Vegas::", ":Cung điện lớn, Bangkok::", ":Vương cung thánh đường Sagrada Família, Barcelona::", ":Các chiến binh Terra Cotta, Trung Quốc::", ":Quảng trường Thời đại, New York::", ":Tử Cấm Thành, Bắc Kinh::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":Nhà thờ Borgund Stave, Na Uy::", ":Nhà thờ Hồi giáo Sheikh Zayed, Abu Dhabi::", ":Lâu đài Neuschwanstein, Đức::", ":Tháp ngọc phương Đông, Thượng Hải::", ":Tháp đôi Petronas, Malaysia::", ":Cảng Victoria, Hồng Kông::", ":Thư viện Celsus, Êphêsô::", ":Kênh Panama, Panama::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":Vịnh Hạ Long, Việt Nam::", ":Salar de Uyuni, Bôlivia::", ":Hố xanh lớn, Belize::", ":Bali, Indonesia::", ":Cực quang, Na Uy::", ":Núi Phú Sĩ, Nhật Bản::", ":Cảng Rio De Janeiro, Brazil::", ":Hẻm núi Paria, Hoa Kỳ::", ":Đỉnh Everest, Nepal và Tây Tạng::", ":Thác Niagara, Canada::", ":Lạc hoa hồng, Sénégal::", ":Rừng Đen, Đức::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":Thác Angel, Venezuela:1,2,4:", ":Núi Kilimanjaro, Tanzania::", ":Đồng bằng sông Danube, Rumani::", ":Thác Victoria, Zimbabwe và Zambia:5,6,9:", ":Mắt Sahara, Mauritania::", ":Biển Chết, Israel::", ":Vách đá Moher, Ireland::", ":Núi lửa bùn, Azerbaijan::", ":Hồ Moraine, Canada::", ":Viên bi của quỷ, Úc::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":Pamukkale, Thổ Nhĩ Kỳ::", ":Dòng sông năm màu, Columbia::", ":Núi lửa Paricutín, Mexico::", ":Những tảng đá Moeraki, New Zealand::", ":Hang xanh, Ý:0,1,2:", ":Hang đá cẩm thạch, Chile:3,0,2:", ":Hang động pha lê, Bermuda:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":Đảo Jeju, Hàn Quốc:1,2,5:", ":Thác Iguazu, Argentina và Brazil::", ":Matterhorn, Thụy Sĩ::", ":Núi Bàn, Nam Phi:1,6,5:", ":Bu Tinah, Các tiểu vương quốc Ả Rập thống nhất:1,6,5:", ":Sundarban, Bangladesh::", ":Verdon Gorge, Pháp::"]);
  }

  void addZH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.zh;
    addQuestions(
        result, //
        language, //
        questionConfig.cat3, //
        questionConfig.diff0, //
        ["斯堪的纳维亚:17,18,20", "巴尔干半岛:42,38,37,35,39,23,36,24,26,34", "波罗的海国家地区:29,30,31", "中美洲:164,165,166,171,172,173,174", "马格里布:108,107,109,110,138", "阿拉伯半岛:47,53,61,60,59,58,57,56", "东亚:86,87,88,89,90", "高加索:49,50,51", "东南亚:76,77,78,79,80,81,82,83,84,85,94", "中亚:63,67,66,68,65", "南部非洲:155,156,157,158,159", "南美洲:183,184,185,186,187,188,189,190,191,192,193,194"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat4, //
        questionConfig.diff0, //
        ["前苏联:50,51,40,29,49,63,67,30,31,41,33,66,68,32,65", "莫卧儿帝国:64,73,69,70", "大英帝国:181,91,167,86,62,73,179,166,74,157,85,115,161,43,177,106,159,95,137,112,176,193,69,47,10,48,53,168,149,99,61,158,110,132,79,75,44,143,82,156,104,92,111,60,70,93,58,182,175,180,98,144,136,81,96,148,155,152,72,151,119,101,178,105,116,57,2,97,59,127,135", "蒙古帝国:64,50,51,40,86,49,69,45,47,63,67,83,41,90,82,89,70,22,34,33,88,52,66,46,68,32,65,78", "罗马帝国:38,107,14,50,6,51,5,37,35,24,43,106,1,49,0,23,25,45,47,48,4,53,61,54,110,13,12,44,11,39,108,9,42,7,34,33,15,56,36,27,26,3,8,52,109,46,32,2,16", "奥斯曼帝国:38,107,37,35,24,43,106,153,49,23,25,47,48,53,61,54,110,41,39,42,34,33,56,36,27,151,52,109,46,32", "葡萄牙帝国:118,183,146,86,94,129,69,132,126,7,147,190", "印加帝国:186,184,191,187,189,185", "玛雅帝国:162,164,166,174,172", "奥匈帝国:6,25,28,27,34,22,32,36,26,24,37,39,4", "波斯帝国:64,50,51,35,43,106,49,23,69,45,47,48,53,63,61,67,54,110,42,60,70,34,33,56,52,66,46,68,57,32,65"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [":巴黎埃菲尔铁塔::", ":罗马斗兽场，罗马::", ":好萊塢標誌，洛杉矶::", ":埃及吉萨大金字塔::", ":纽约自由女神像::", ":中国长城::", ":柬埔寨吴哥窟::", ":梵蒂冈城::", ":意大利比萨斜塔::", ":基督救世主，里约热内卢::", ":悉尼悉尼歌剧院::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff1, //
        [":雅典卫城，雅典::", ":印度泰姬陵::", ":伊斯坦布尔蓝色清真寺::", ":迪拜哈利法塔::", ":巴黎卢浮宫博物馆::", ":秘鲁马丘比丘::", ":柏林墙::", ":加州迪士尼乐园度假区::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff2, //
        [":莫斯科红场::", ":约旦佩特拉::", ":拉斯维加斯大道::", ":曼谷大皇宫::", ":圣家堂::", ":秦始皇兵马俑，中国::", ":纽约时代广场::", ":北京紫禁城::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff3, //
        [":博尔贡木板教堂，挪威::", ":谢赫扎耶德清真寺，阿布扎比::", ":新天鹅堡，德国::", ":上海东方明珠塔::", ":马来西亚双子塔::", ":維多利亞港::", ":以弗所的塞尔苏斯图书馆::", ":巴拿马运河，巴拿马::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff0, //
        [":越南下龙湾::", ":烏尤尼鹽沼，玻利维亚::", ":伯利兹大蓝洞::", ":印度尼西亚巴厘岛::", ":极光，挪威::", ":日本富士山::", ":巴西里约热内卢港::", ":帕里亚峡谷，美国::", ":珠穆朗玛峰，尼泊尔和西藏::", ":加拿大尼亚加拉大瀑布::", ":玫瑰湖，塞内加尔::", ":德国黑森林::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff1, //
        [":委内瑞拉安赫尔瀑布:1,2,4:", ":坦桑尼亚乞力马扎罗山::", ":罗马尼亚多瑙河三角洲::", ":维多利亚瀑布，津巴布韦和赞比亚:5,6,9:", ":毛里塔尼亚撒哈拉之眼::", ":死海，以色列::", ":爱尔兰莫赫悬崖::", ":泥火山，阿塞拜疆::", ":加拿大梦莲湖::", ":魔鬼大理石，澳大利亚::"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff2, //
        [":土耳其棉花堡::", ":五色河，哥伦比亚::", ":墨西哥Paricutín火山::", ":摩拉基巨石，新西兰::", ":意大利蓝洞:0,1,2:", ":智利大理石洞穴:3,0,2:", ":百慕大水晶洞:0,1,2:"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat8, //
        questionConfig.diff3, //
        [":韩国济州岛:1,2,5:", ":伊瓜苏瀑布，阿根廷和巴西::", ":瑞士马特宏峰::", ":南非桌山:1,6,5:", ":Bu Tinah，阿拉伯联合酋长国:1,6,5:", ":孟加拉国孙德尔本斯::", ":维登峡谷，France::"]);
  }



}

class CountryRanges {
  int start;
  int end;
  int maxStart;
  int maxEnd;

  CountryRanges(this.start, this.end, this.maxStart, this.maxEnd);
}
