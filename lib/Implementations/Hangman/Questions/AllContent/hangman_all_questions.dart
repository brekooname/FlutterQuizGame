import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class HangmanAllQuestions extends AllQuestionsService {
  static final HangmanAllQuestions singleton = HangmanAllQuestions.internal();

  factory HangmanAllQuestions() {
    return singleton;
  }

  HangmanAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = HangmanGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    addBG(result, questionConfig);
    addCS(result, questionConfig);
    addDA(result, questionConfig);
    addDE(result, questionConfig);
    addEL(result, questionConfig);
    addEN(result, questionConfig);
    addES(result, questionConfig);
    addFI(result, questionConfig);
    addFR(result, questionConfig);
    addHR(result, questionConfig);
    addHU(result, questionConfig);
    addID(result, questionConfig);
    addIT(result, questionConfig);
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
    addTR(result, questionConfig);
    addUK(result, questionConfig);
    return result;
  }

  void addBG(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.bg;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Австрия", "Белгия", "Бразилия", "Канада", "Китай", "Франция", "Германия", "Италия", "Мексико", "Русия", "Испания", "Съединени щати", "Япония", "Нидерланды", "Австралия", "Португалия", "Турция", "България", "Индия", "Гърция"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Мишка", "Маймуна", "Леопард", "Делфин", "Гепард", "Шимпанзе", "Крокодил", "Врана", "Елен", "Заек", "Акула", "Тигър", "Гълъб", "Патица", "Орел", "Слон", "Жираф", "Лъв", "Мечка", "Кон"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Картофи", "Орхидея", "Фасул", "Ябълка", "Роза", "Царевица", "Слънчоглед", "Чесън", "Малини", "Лимон", "Праскови", "Портокали", "Круша", "Слива", "Банан", "Краставица", "Грозде", "Домат", "Морков"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Престилка", "Бутилка", "Отварачка за бутилки", "Купа", "Готварска книга", "Прибори за хранене", "Вилица"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Поничка", "Паста", "Кебап", "Кроасан", "Лазаня", "Сирене", "Пица", "Спагети", "Омлет", "Сладолед", "Хляб", "Торта", "Печено", "Кисело мляко", "Бърза храна", "Кисели краставички", "Кленов сироп", "Тост", "Шоколад", "Картофено пюре"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Кипър", "Колумбия", "Чехия", "Хърватия", "Дания", "Египет", "Швейцария", "Финландия", "Гана", "Мароко", "Иран", "Нигерия", "Сърбия", "Норвегия", "Беларус", "Швеция", "Южна Кореа", "Украйна", "Унгария", "Алжир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Алигатор", "Антилопа", "Магаре", "Носорог", "Зебра", "Полярна мечка", "Коза", "Кит", "Горила", "Коала", "Камила", "Хиена", "Жаба", "Златна рибка", "Ягуар", "Панда", "Овца", "Вълк", "Костенурка", "Пингвин"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Лале", "Лук", "Череши", "Тиква", "Ягода", "Кафе", "Глухарче", "Ананас", "Фъстъци", "Коприва", "Кайсия", "Кокос", "Грейпфрут", "Диня", "Пъпеш", "Кисели череши", "Мента", "Чушки", "Зеле", "Грах"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Готвач", "Съдомиялна машина", "Храна", "Контейнер за боклук", "Сокоизстисквачка", "Фурна", "Рецепта"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Фъстъчено масло", "Чипс", "Такос", "Пудинг", "Кюфтета от месо", "Печено пиле", "Мед", "Морски дарове", "Пържени картофи", "Колбаси", "Хамбургер", "Майонеза", "Пуканки", "Чийзбургер", "Хот дог", "Кекс", "Бекон", "Кетчуп", "Масло", "Палачинка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Боливия", "Камерун", "Южна Африка", "Исландия", "Румъния", "Израел", "Еквадор", "Естония", "Перу", "Латвия", "Словакия", "Словения", "Полша", "Тунис", "Аржентина", "Виетнам", "Грузия", "Албания", "Монако", "Непал"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Гъска", "Язовец", "Дива свиня", "Щъркел", "Кенгуру", "Анаконда", "Катерица", "Папагал", "Хамстер", "Таралеж", "Хипопотам", "Бръмбар", "Пантера", "Октопод", "Питон", "Бабуин", "Фрет", "Кафява мечка", "Пеликан", "Гарван"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Червена боровинка", "Дюля", "Кактус", "Репички", "Цвекло", "Какао", "Киви", "Манго", "Хрян", "Смокини", "Риган", "Елха", "Касис", "Патладжан", "Бързия", "Маслини", "Броколи", "Копър", "Спанак", "Карфиол"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Фризер", "Тиган за пържене", "Чайник", "Маса", "Тостер", "Центрофуга", "Шпатула"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Компот", "Мусака", "Пастърма", "Зехтин", "Равиоли", "Млечен шейк", "Свински котлет", "Пилешка супа", "Чийзкейк", "Френски тост", "Марципан", "Гулаш", "Кюфте", "Бурито", "Черен шоколад", "Макарони", "Джинджифил", "Вафла", "Барбекю"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Андора", "Ангола", "Армения", "Северна Корея", "Индонезия", "Чили", "Литва", "Малайзия", "Мали", "Черна гора", "Сенегал", "Парагвай", "Люксембург", "Хаити", "Азербайджан", "Уругвай", "Венецуела", "Ирак", "Куба", "Ямайка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Лос", "Кондор", "Вайпър", "Сокол", "Морско свинче", "Пъстърва", "Черна мамба", "Медуза", "Северен елен", "Лама", "Лебед", "Фазан", "Пъдпъдък", "Голяма бяла акула", "Сьомга", "Скорпион", "Муле", "Скункс", "Газела", "Койот"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Невен", "Хвойна", "Фъстък", "Фикус", "Памук", "Босилек", "Клен", "Топола", "Клементина", "Ориз", "Авокадо", "Черен пипер", "Целина", "Маруля", "Горчица", "Мандаринов портокал", "Шипки", "Лотос", "Мащерка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Метла", "Пръчици за хранене", "Чаша", "Ножици", "Сито", "Алуминиево фолио", "Хавлиена кърпа"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Картофена салата", "Крем карамел", "Кнедли", "Тиквен пай", "Суфле", "Сандвич със сирене", "Гювеч", "Мариновани краставици", "Кренвирши", "Къривурст", "Шам фъстък", "Кускус", "Сирене на скара", "Моцарела", "Пармезан", "Пържен ориз", "Бисквити", "Суши", "Ябълков пай", "Риба и пържени картофи"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Афганистан", "Саудитска Арабия", "Бряг на слоновата кост", "Бахами", "Бахрейн", "Коста Рика", "Ел Салвадор", "Кения", "Гватемала", "Хондурас", "Йордания", "Ливан", "Катар", "Панама", "Либерия", "Сингапур", "Тайланд", "Йемен", "Малта", "Ватикана"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Бобър", "Кралска кобра", "Фламинго", "Албатрос", "Чайка", "Чакал", "Скакалец", "Лорис", "Омар", "Мартен", "Морж", "Норка", "Бизон", "Дикобраз", "Червена панда", "Саламандър", "Стингрей", "Славей", "Видра", "Херинга"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Алое вера", "Папрат", "Кестен", "Евкалипт", "Бреза", "Елша", "Ревен", "Финикова палма", "Леща", "Аспержи", "Палма", "Карамфил", "Лен", "Тютюн", "Окра", "Детелина", "Хмел", "Имел", "Магнолия", "Снежанка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Карафа", "Ренде", "Перколатор", "Сапун", "Лъжица"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Песто", "Доматен сос", "Мюсли", "Швейцарско сирене", "Тортиля", "Баклава", "Къри", "Гуакамоле", "Бял шоколад", "Оцет", "Горещ шоколад", "Дим сума", "Паста карбонара", "Оризов пудинг", "Печено говеждо месо", "Мъфин", "Шоколадова торта", "Зеленчукова супа", "Супа от юфка", "Салата Цезар"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Антигуа и Барбуда", "Бруней", "Бурунди", "Етиопия", "Филипините", "Гамбия", "Казахстан", "Лаос", "Лихтенщайн", "Барбадос", "Мадагаскар", "Сан Марино", "Сирия", "Сомалия", "Судан", "Того", "Уганда", "Замбия", "Зимбабве", "Бенин"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Алпака", "Броненосец", "Чинчила", "Ехидна", "Енот", "Чапла", "Тасманийски дявол", "Комодски дракон", "Баракуда", "Сврака", "Манатарки", "Прерийно куче", "Звездоброец", "Тапир", "Тарсир", "Лемур", "Сурикат", "Токачкови", "Посум"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Анасон", "Бонсай", "Маргаритка", "Гранат", "Бамбук", "Пшеница", "Брюкселско зеле", "Нахут", "Уасаби", "Секвоя", "Снапдрагон", "Анемона", "Папая", "Пащърнак", "Помело", "Розмарин", "Хризантема"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Кухня", "Нож", "Салфетка", "Хладилник", "Термометър", "Мивка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Извара", "Паеля", "Гноки", "Рататуй", "Тортелини", "Шаурма", "Тофу", "Кордон бльо", "Кефир", "Фалафел", "Рикота", "Еклер", "Хумус", "Сос цацики", "Тирамису", "Картофени клинове", "Антипасто", "Щрудел", "Сос"]);
  }

  void addCS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.cs;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Rakousko", "Belgie", "Brazílie", "Kanada", "Čína", "Francie", "Německo", "Itálie", "Mexiko", "Rusko", "Španělsko", "Spojené státy", "Japonsko", "Holandsko", "Austrálie", "Portugalsko", "Turecko", "Bulharsko", "Indie", "Řecko"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Myš", "Opice", "Levhart", "Delfín", "Gepard", "Šimpanz", "Krokodýl", "Vrána", "Jelen", "Králičí", "Žralok", "Tygr", "Holub", "Kachna", "Orel", "Slon", "Žirafa", "Lev", "Medvěd", "Kůň"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Brambor", "Orchidej", "Fazole", "Jablko", "Růže", "Kukuřice", "Slunečnice", "Česnek", "Maliny", "Jahoda", "Citrón", "Broskev", "Pomeranče", "Hruška", "Švestka", "Banán", "Okurka", "Hroznový", "Rajče", "Mrkev"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Zástěra", "Láhev", "Otvírák na láhve", "Miska", "Kuchařka", "Příbory", "Vidlička"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Kobliha", "Těstoviny", "Kebab", "Rohlík", "Lasagna", "Sýr", "Pizza", "Špagety", "Omeleta", "Zmrzlina", "Chléb", "Dort", "Pečeně", "Jogurt", "Fast Food", "Nakládané okurky", "Javorový sirup", "Čokoláda", "Bramborová kaše"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Kypr", "Kolumbie", "Česká republika", "Chorvatsko", "Dánsko", "Egypt", "Švýcarsko", "Finsko", "Ghana", "Maroko", "Írán", "Nigérie", "Srbsko", "Norsko", "Bělorusko", "Švédsko", "Jižní Korea", "Ukrajina", "Maďarsko", "Alžírsko"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Aligátor", "Antilopa", "Osel", "Nosorožec", "Zebra", "Lední medvěd", "Koza", "Velryba", "Gorila", "Koala", "Velbloud", "Hyenovití", "Žába", "Zlatá rybka", "Jaguár", "Panda", "Ovce", "Vlk", "Želva", "Tučňák"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipán", "Cibule", "Třešně", "Dýně", "Káva", "Pampeliška", "Ananas", "Arašídy", "Kopřiva", "Meruňka", "Kokosový ořech", "Grapefruit", "Vodní meloun", "Meloun", "Višně", "Máta", "Papriky", "Zelí", "Hrách"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Myčka", "Jídlo", "Odpadkový koš", "Odšťavňovač", "Trouba", "Recept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Burákové máslo", "Bramborové hranolky", "Tacos", "Pudink", "Masové koule", "Pečené kuře", "Miláček", "Plody moře", "Hranolky", "Klobásy", "Hamburger", "Majonéza", "Popcorn", "Cheeseburger", "Párek v rohlíku", "Košíček", "Slanina", "Kečup", "Máslo", "Lívanec"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolívie", "Kamerun", "Jižní Afrika", "Island", "Rumunsko", "Izrael", "Ekvádor", "Estonsko", "Peru", "Lotyšsko", "Slovensko", "Slovinsko", "Polsko", "Tunisko", "Argentina", "Vietnam", "Gruzie", "Albánie", "Monako", "Nepál"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Husa", "Jezevec", "Kanec", "Čáp", "Klokan", "Anakonda", "Veverka", "Papoušek", "Křeček", "Ježek", "Hroch", "Brouk", "Panter", "Chobotnice", "Krajta", "Pavián", "Fretka", "Medvěd hnědý", "Pelikán", "Havran"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Borůvka", "Kdoule", "Kaktus", "Ředkev", "Červená řepa", "Kakao", "Kiwi", "Mango", "Křen", "Dobromysl obecná", "Smrk", "Rybíz", "Lilek", "Dřišťál", "Olivový", "Brokolice", "Kopr", "Špenát", "Květák"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Mrazák", "Pánev", "Konvice", "Stůl", "Toustovač", "Cedník", "Špachtle"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompot", "Musaka", "Pastrami", "Olivový olej", "Ravioly", "Koktejl", "Vepřová kotleta", "Kuřecí polévka", "Tvarohový koláč", "Francouzský toast", "Marcipán", "Guláš", "Sekaná na maso", "Burrito", "Hořká čokoláda", "Makaróny", "Perník", "Vafle"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Arménie", "Severní Korea", "Indonésie", "Chile", "Litva", "Malajsie", "Mali", "Černá Hora", "Senegal", "Paraguay", "Lucembursko", "Haiti", "Ázerbajdžán", "Uruguay", "Venezuela", "Irák", "Kuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Kondor", "Zmije", "Sokol", "Morče", "Pstruh", "Černá mamba", "Medúza", "Sob", "Lama", "Labuť", "Bažant", "Křepelka", "Velký bílý žralok", "Losos", "Štír", "Mezek", "Skunkovití", "Gazela", "Kojot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Měsíček", "Jalovec", "Pistácie", "Fíkovník", "Bavlna", "Bazalka", "Javor", "Topol", "Rýže", "Avokádo", "Černý pepř", "Celer", "Listový salát", "Hořčice", "Mandarinka", "Tymián"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Koště", "Tyčinky", "Pohár", "Nůžky", "Síto", "Hliníková fólie", "Ručník"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Bramborový salát", "Krémový karamel", "Knedlík", "Dýňový koláč", "Suflé", "Sýrový sendvič", "Dusit", "Preclík", "Currywurst", "Kuskus", "Grilovaný sýr", "Mozzarella", "Parmezán", "Smažená rýže", "Sušenky", "Sushi", "Jablečný koláč", "Ryba a hranolky"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghánistán", "Saudská arábie", "Pobřeží slonoviny", "Bahamy", "Bahrajn", "Kostarika", "El Salvador", "Keňa", "Guatemala", "Honduras", "Jordán", "Libanon", "Katar", "Panama", "Libérie", "Singapur", "Thajsko", "Jemen", "Malta", "Vatikán"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Bobr", "Král kobra", "Plameňák", "Albatros", "Racek", "Šakal", "Skřivan", "Humr", "Kuna", "Mrož", "Norek", "Bizon", "Dikobraz", "Červená panda", "Mlok", "Slavík", "Vydra", "Sleď"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Kapradina", "Kaštan", "Eukalyptus", "Bříza", "Olše", "Rebarbora", "Datlovník", "Čočka", "Chřest", "Dlaň", "Karafiát", "Tabák", "Jetel", "Chmel", "Jmelí", "Magnólie", "Sněženka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karafa", "Struhadlo", "Mýdlo", "Houba na mytí", "Lžíce"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Rajčatová omáčka", "Müsli", "Švýcarský sýr", "Tortilla", "Baklava", "Kari", "Guacamole", "Bílá čokoláda", "Ocet", "Horká čokoláda", "Dim sum", "Těstoviny carbonara", "Rýžový nákyp", "Hovězí pečeně", "Čokoládový dort", "Zeleninová polévka", "Nudlová polévka", "Caesarův salát"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua a Barbuda", "Brunej", "Burundi", "Etiopie", "Filipíny", "Gambie", "Kazachstán", "Laos", "Lichtenštejnsko", "Barbados", "Madagaskar", "San Marino", "Sýrie", "Somálsko", "Súdán", "Togo", "Ugandě", "Zambie", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Pásovec", "Činčila", "Mýval", "Tasmánský čert", "Varan komodský", "Straka", "Prerijní pes", "Špaček", "Tapír", "Tarsier", "Surikata", "Perlička"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anýz", "Sedmikráska", "Granátové jablko", "Bambus", "Pšenice", "Růžičková kapusta", "Cizrna", "Wasabi", "Sekvoje", "Hledík", "Mucholapka", "Sasanka", "Papája", "Fenykl", "Pastinák", "Rozmarýn", "Chryzantéma", "Zázvor"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kuchyně", "Nůž", "Ubrousek", "Lednička", "Konvice na čaj", "Teploměr", "Dřez"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Tvaroh", "Paella", "Noky", "Shawarma", "Tofu", "Kefir", "Mleté hovězí maso", "Falafel", "Ricotta", "Tzatziki omáčka", "Tiramisu", "Bramborové klínky", "Jablečný závin", "Omáčka"]);
  }

  void addDA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.da;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Østrig", "Belgien", "Brasilien", "Canada", "Kina", "Frankrig", "Tyskland", "Italien", "Mexico", "Rusland", "Spanien", "Forenede Stater", "Japan", "Holland", "Australien", "Portugal", "Tyrkiet", "Bulgarien", "Indien", "Grækenland"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Mus", "Abe", "Leopard", "Delfin", "Gepard", "Chimpanse", "Krokodille", "Krage", "Hjort", "Kanin", "Haj", "Tiger", "Due", "And", "Ørn", "Elefant", "Giraf", "Løve", "Bjørn", "Hest"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Kartoffel", "Orkide", "Bønne", "Æble", "Rose", "Majs", "Hvidløg", "Hindbær", "Jordbær", "Citron", "Fersken", "Appelsiner", "Pære", "Blomme", "Banan", "Agurk", "Tomat", "Gulerod"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Forklæde", "Flaske", "Flaskeåbner", "Skål", "Kogebog", "Bestik", "Gaffel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Donut", "Pasta", "Kebab", "Croissant", "Lasagne", "Pizza", "Spaghetti", "Æggekage", "Flødeis", "Brød", "Kage", "Stege", "Yoghurt", "Fastfood", "Syltede agurker", "Ahornsirup", "Ristet brød", "Chokolade", "Kartoffelmos"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cypern", "Colombia", "Tjekkiet", "Kroatien", "Danmark", "Egypten", "Schweiz", "Finland", "Ghana", "Marokko", "Iran", "Nigeria", "Serbien", "Norge", "Hviderusland", "Sverige", "Sydkorea", "Ukraine", "Ungarn", "Algeriet"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligatorer", "Antilope", "Æsel", "Næsehorn", "Zebraer", "Isbjørn", "Ged", "Hval", "Gorilla", "Koala", "Kamel", "Hyæne", "Frø", "Guldfisk", "Jaguar", "Pandaen", "Får", "Ulv", "Skildpadde", "Pingvin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipan", "Løg", "Kirsebær", "Græskar", "Kaffe", "Mælkebøtte", "Ananas", "Jordnødder", "Abrikos", "Kokosnød", "Grapefrugt", "Vandmelon", "Melon", "Surkirsebær", "Kål", "Ærter"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Laver mad", "Opvaskemaskine", "Mad", "Skraldespand", "Saftpresser", "Ovn", "Opskrift"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Jordnøddesmør", "Chips", "Budding", "Kødboller", "Stegt kylling", "Honning", "Fisk og skaldyr", "Pommes frites", "Pølser", "Hamburger", "Mayonnaise", "Popcorn", "Cheeseburger", "Hotdog", "Cupcake", "Bacon", "Ketchup", "Smør", "Pandekage"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Cameroun", "Sydafrika", "Island", "Rumænien", "Israel", "Ecuador", "Estland", "Peru", "Letland", "Slovakiet", "Slovenien", "Polen", "Tunesien", "Argentina", "Vietnam", "Georgien", "Albanien", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Gås", "Grævling", "Orne", "Kænguru", "Anaconda", "Egern", "Papegøje", "Hamstere", "Pindsvin", "Bille", "Panter", "Blæksprutte", "Pyton", "Bavian", "Fritte", "Brun bjørn", "Pelikan", "Ravn"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Blåbær", "Kvæde", "Kaktus", "Radise", "Rødbede", "Kakao", "Kiwi", "Mango", "Peberrod", "Figner", "Oregano", "Gran", "Korender", "Aubergine", "Berberis", "Oliven", "Broccoli", "Dild", "Spinat", "Blomkål"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Fryser", "Stegepande", "Kedel", "Bord", "Brødrister", "Spatel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompot", "Olivenolie", "Milkshake", "Svinekotelet", "Hønsekødssuppe", "Ostekage", "Fransk toast", "Marcipan", "Gullasch", "Farsbrød", "Mørk chokolade", "Honningkage", "Vaffel", "Grill"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenien", "Nordkorea", "Indonesien", "Chile", "Litauen", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxembourg", "Haiti", "Aserbajdsjan", "Uruguay", "Venezuela", "Irak", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Falk", "Marsvin", "Ørred", "Sort mamba", "Vandmand", "Rensdyr", "Hvid haj", "Laks", "Skorpion", "Muldyr", "Stinkdyr", "Gazeller", "Prærieulv"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Fløjlsblomst", "Eneslægten", "Figen", "Bomuld", "Basilikum", "Avocado", "Sort peber", "Selleri", "Salat", "Sennep", "Timian"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Gyvel", "Spisepinde", "Kop", "Saks", "Si", "Sølvpapir", "Håndklæde"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Kartoffelsalat", "Creme karamel", "Græskartærte", "Oste sandwich", "Stuvning", "Kringle", "Currywurst", "Couscous", "Grillet ost", "Mozzarella", "Parmesan", "Stegte ris", "Kiks", "Sushi", "Æbletærte"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Saudi Arabien", "Elfenbenskysten", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenya", "Guatemala", "Honduras", "Jordan", "Libanon", "Qatar", "Panama", "Liberia", "Singapore", "Thailand", "Yemen", "Malta", "Vatikanet"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Bæver", "Kongekobra", "Flamingo", "Albatrosser", "Måge", "Hummer", "Hvalros", "Mink", "Bisoner", "Rød panda", "Halepadder", "Nattergal", "Odder", "Sild"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Læge-aloe", "Kastanje", "Eukalyptus", "Rabarber", "Daddelpalme", "Linser", "Asparges", "Håndflade", "Nellike", "Hør", "Tobak", "Okra", "Kløver", "Humle", "Magnolie", "Vintergæk"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karaffel", "Rivejern", "Espressokande", "Sæbe", "Svamp", "Ske"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Tomatsovs", "Müesli", "Schweizisk ost", "Baklava", "Karry", "Guacamole", "Hvid chokolade", "Eddike", "Varm chokolade", "Pasta carbonara", "Risengrød", "Roastbeef", "Chokoladekage", "Grøntsagssuppe", "Nuddel suppe", "Cæsar salat"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua og Barbuda", "Brunei", "Burundi", "Etiopien", "Filippinerne", "Gambia", "Kasakhstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Syrien", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Armadillo", "Chinchilla", "Vaskebjørn", "Tasmansk djævel", "Komodo drage", "Barracudaer", "Søko", "Præriehund", "Tapirer", "Tarsier", "Meerkat", "Perlehøne"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anis", "Bonsai", "Granatæble", "Bambus", "Hvede", "Rosenkål", "Kikærter", "Wasabi", "Sequoia", "Anemone", "Fennikel", "Pastinak", "Pomelo", "Rosmarin", "Ingefær"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Køkken", "Kniv", "Serviet", "Køleskab", "Tepotte", "Termometer", "Håndvask"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Hytteost", "Shawarma", "Tofu", "Kefir", "Hakket oksekød", "Falafel", "Tzatziki-sauce", "Tiramisu", "Kartoffelkiler"]);
  }

  void addDE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.de;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Österreich", "Belgien", "Brasilien", "Kanada", "China", "Frankreich", "Deutschland", "Italien", "Mexiko", "Russland", "Spanien", "Vereinigte Staaten", "Japan", "Niederlande", "Australien", "Portugal", "Türkei", "Bulgarien", "Indien", "Griechenland"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Maus", "Affe", "Leopard", "Delphin", "Gepard", "Schimpanse", "Krokodile", "Krähe", "Hirsch", "Kaninchen", "Katze", "Tiger", "Taube", "Ente", "Adler", "Elefanten", "Giraffe", "Löwe", "Hund", "Pferd"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Kartoffel", "Orchidee", "Bohnen", "Apfel", "Rose", "Mais", "Sonnenblume", "Knoblauch", "Himbeeren", "Erdbeere", "Zitrone", "Pfirsich", "Orangen", "Birne", "Pflaume", "Banane", "Gurke", "Traube", "Tomate", "Karotte"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Schürze", "Flasche", "Flaschenöffner", "Schüssel", "Kochbuch", "Besteck", "Gabel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Nudel", "Pasta", "Döner Kebab", "Croissant", "Lasagne", "Käse", "Pizza", "Spaghetti", "Omelett", "Sauerkraut", "Brot", "Kuchen", "Braten", "Joghurt", "Fast Food", "Spiegelei", "Bratwurst", "Toastbrot", "Schokolade", "Kartoffelpüree"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Zypern", "Kolumbien", "Tschechien", "Kroatien", "Dänemark", "Ägypten", "Schweiz", "Finnland", "Ghana", "Marokko", "Iran", "Nigeria", "Serbien", "Norwegen", "Weißrussland", "Schweden", "Südkorea", "Ukraine", "Ungarn", "Algerien"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligatoren", "Antilope", "Esel", "Nashörner", "Zebra", "Eisbär", "Ziege", "Schwein", "Gorilla", "Koala", "Kamel", "Hyäne", "Frosch", "Goldfisch", "Jaguar", "Großer Panda", "Schaf", "Wolf", "Schildkröte", "Pinguin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulpe", "Zwiebel", "Kirschen", "Kürbis", "Bambus", "Kaffee", "Löwenzahn", "Ananas", "Erdnüsse", "Weizen", "Aprikose", "Kokosnuss", "Grapefruit", "Wassermelone", "Melone", "Sauerkirschen", "Minze", "Paprika", "Kohl", "Erbsen"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Koch", "Geschirrspüler", "Essen", "Mülleimer", "Entsafter", "Ofen", "Rezept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Erdnussbutter", "Pommes frites", "Taco", "Pudding", "Olivenöl", "Hühnersuppe", "Honig", "Meeresfrüchte", "Bratkartoffeln", "Wurst", "Hamburger", "Mayonnaise", "Popcorn", "Cheeseburger", "Hot Dog", "Cupcake", "Speck", "Ketchup", "Butter", "Pfannkuchen"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivien", "Kamerun", "Südafrika", "Island", "Rumänien", "Israel", "Ecuador", "Estland", "Peru", "Lettland", "Slowakei", "Slowenien", "Polen", "Tunesien", "Argentinien", "Vietnam", "Georgia", "Albanien", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Gans", "Dachs", "Wildschwein", "Storch", "Känguru", "Anakonda", "Eichhörnchen", "Papagei", "Hamster", "Igel", "Nilpferd", "Käfer", "Panther", "Krake", "Python", "Pavian", "Eule", "Braunbär", "Pelikan", "Rabe"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Heidelbeere", "Kaktus", "Rettiche", "Rote Bete", "Kakao", "Kiwi", "Mango", "Meerrettich", "Pomelo", "Oregano", "Fichte", "Johannisbeeren", "Aubergine", "Rucola", "Olive", "Brokkoli", "Reis", "Spinat", "Blumenkohl"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Gefrierschrank", "Bratpfanne", "Kessel", "Tabelle", "Toaster", "Sieb", "Spatel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompott", "Moussaka", "Bagel", "Pastrami", "Kefir", "Ravioli", "Milchshake", "Kotelett", "Grissini", "Käsekuchen", "Salami", "Steak", "Gulasch", "Wiener Schnitzel", "Burrito", "Bitterschokolade", "Makkaroni", "Lebkuchen", "Waffel", "Saure Gurken"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenien", "Nord Korea", "Indonesien", "Chile", "Litauen", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxemburg", "Haiti", "Aserbaidschan", "Uruguay", "Venezuela", "Irak", "Kuba", "Jamaika"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Elch", "Kondor", "Vipern", "Falke", "Meerschweinchen", "Forelle", "Schakal", "Ratte", "Rentier", "Lama", "Schwan", "Fasan", "Fledermaus", "Weißer Hai", "Lachs", "Skorpion", "Maultier", "Stinktier", "Gazelle", "Kojote"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Bonsai", "Ringelblume", "Wacholder", "Pistazie", "Wasabi", "Baumwolle", "Basilikum", "Ahorn", "Pappel", "Magnolia", "Avocado", "Schwarzer Pfeffer", "Sellerie", "Salat", "Senf", "Mandarine", "Hagebutten", "Papaya", "Thymian"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Besen", "Essstäbchen", "Tasse", "Schere", "Aluminiumfolie", "Handtuch"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Kartoffelsalat", "Tiramisu", "Leberkäse", "Cabanossi", "Marzipan", "Kürbissuppe", "Eintopf", "Blutwurst", "Brezel", "Currywurst", "Hackbraten", "Couscous", "Sauerbraten", "Mozzarella", "Parmesan", "Kartoffelsuppe", "Kekse", "Sushi", "Apfelkuchen", "Fish and Chips"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Saudi Arabien", "Elfenbeinküste", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenia", "Guatemala", "Honduras", "Jordanien", "Libanon", "Katar", "Panama", "Liberia", "Singapur", "Thailand", "Jemen", "Malta", "Vatikan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Biber", "Königskobra", "Flamingo", "Albatros", "Möwe", "Dromedar", "Lerche", "Loris", "Hummer", "Marder", "Walross", "Nerz", "Stachelschwein", "Kleiner Panda", "Salamander", "Stachelrochen", "Nachtigall", "Otter", "Hering"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Farne", "Kastanie", "Eukalypten", "Birke", "Rosmarin", "Rhabarber", "Dattelpalmen", "Linsen", "Spargel", "Palme", "Nelken", "Flachs", "Tabak", "Okra", "Klee", "Hopfen", "Misteln", "Anemone", "Schneeglöckchen"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karaffe", "Reibe", "Kaffeemaschine", "Seife", "Schwamm", "Löffel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Tomatensauce", "Müsli", "Emmentaler", "Tortilla", "Soufflee", "Curry", "Guacamole", "Weiße Schokolade", "Essig", "Heiße Schokolade", "Dim sum", "Spaghetti carbonara", "Milchreis", "Baumkuchen", "Muffin", "Schokoladenkuchen", "Gemüsesuppe", "Nudelsuppe", "Caesar Salad"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua und Barbuda", "Brunei", "Burundi", "Äthiopien", "Philippinen", "Gambia", "Kasachstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Syrien", "Somalia", "Sudan", "Togo", "Uganda", "Sambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Gürteltier", "Chinchilla", "Quallen", "Ameisenigel", "Waschbär", "Silberreiher", "Tasmanische Teufel", "Komodowaran", "Barrakuda", "Elster", "Seekuh", "Präriehund", "Tapire", "Koboldmakis", "Lemuren", "Sibirischer Tiger", "Perlhuhn", "Opossums"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Lilien", "Gänseblümchen", "Granatapfel", "Ginseng", "Pfefferminze", "Rosenkohl", "Kichererbsen", "Berberitze", "Mammutbaum", "Venusfliegenfalle", "Thymiane", "Gerste", "Fenchel", "Pastinak", "Rotkohl", "Einkorn", "Chrysantheme", "Ingwer"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Küche", "Messer", "Serviette", "Kühlschrank", "Teekanne", "Thermometer", "Sinken"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Hüttenkäse", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Linguine", "Tofu", "Cordon bleu", "Ahornsirup", "Hackfleisch", "Falafel", "Ricotta", "Eclair", "Hummus", "Tsatsiki", "Flan", "Grießbrei", "Antipasto", "Krautsalat", "Baklava"]);
  }

  void addEL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.el;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Αυστρία", "Βέλγιο", "Βραζιλία", "Καναδάς", "Κίνα", "Γαλλία", "Γερμανία", "Ιταλία", "Μεξικό", "Ρωσία", "Ισπανία", "Ηνωμένες Πολιτείες", "Ιαπωνία", "Ολλανδία", "Αυστραλία", "Πορτογαλία", "Τουρκία", "Βουλγαρία", "Ινδία", "Ελλάδα"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Ποντίκι", "Πίθηκος", "Λεοπάρδαλη", "Δελφίνι", "Γατόπαρδος", "Χιμπατζής", "Κροκόδειλος", "Κοράκι", "Ελάφι", "Κουνέλι", "Καρχαρίας", "Τίγρη", "Περιστέρι", "Πάπια", "Αετός", "Ελέφαντας", "Καμηλοπάρδαλη", "Λιοντάρι", "Αρκούδα", "Αλογο"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Πατάτα", "Ορχιδέα", "Φασόλια", "Μήλο", "Τριαντάφυλλο", "Καλαμπόκι", "Ηλιοτρόπιο", "Σκόρδο", "Σμέουρα", "Φράουλα", "Λεμόνι", "Ροδάκινο", "Πορτοκάλια", "Αχλάδι", "Δαμάσκηνο", "Μπανάνα", "Αγγούρι", "Σταφύλι", "Ντομάτα", "Καρότο"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Ποδιά", "Μπουκάλι", "Ανοιχτήρι μπουκαλιών", "Γαβάθα", "Βιβλίο μαγειρικής", "Μαχαιρικά είδη", "Πιρούνι"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Ντόνατ", "Ζυμαρικά", "Κεμπάπ", "Κρουασάν", "Λαζάνια", "Τυρί", "Πίτσα", "Μακαρόνια", "Ομελέτα", "Παγωτό", "Ψωμί", "Κέικ", "Ψητό", "Γιαούρτι", "Γρήγορο φαγητό", "Τυριά", "Σιρόπι από σφένδαμο", "Τοστ", "Σοκολάτα", "Πατάτες πουρέ"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Κύπρος", "Κολομβία", "Τσεχική Δημοκρατία", "Κροατία", "Δανία", "Αίγυπτος", "Ελβετία", "Φινλανδία", "Γκάνα", "Μαρόκο", "Ιράν", "Νιγηρία", "Σερβία", "Νορβηγία", "Λευκορωσία", "Σουηδία", "Νότια Κορέα", "Ουκρανία", "Ουγγαρία", "Αλγερία"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Αλλιγάτορας", "Αντιλόπη", "Γάιδαρος", "Ρινόκερος", "Ζέβρα", "Πολική αρκούδα", "Γίδα", "Φάλαινα", "Γορίλλας", "Καμήλα", "Υαινα", "Βάτραχος", "Χρυσόψαρο", "Ιαγουάρος", "Πρόβατο", "Λύκος", "Χελώνα", "Πιγκουίνος"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Τουλίπα", "Κρεμμύδι", "Κεράσια", "Κολοκύθι", "Καφές", "Πικραλίδα", "Ανανάς", "Φιστίκια", "Τσουκνίδα", "Βερύκοκκο", "Καρύδα", "Φράπα", "Καρπούζι", "Πεπόνι", "Βύσσινα", "Μέντα", "Πιπεριές", "Λάχανο", "Αρακάς"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Μάγειρας", "Πλυντήριο πιάτων", "Φαγητό", "Σκουπιδοτενεκές", "Αποχυμωτή", "Φούρνος", "Συνταγή"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Φυστικοβούτυρο", "Μάρκες", "Πουτίγκα", "Κεφτεδάκια", "Ψητό κοτόπουλο", "Μέλι", "Θαλασσινά", "Τηγανιτές πατάτες", "Λουκάνικα", "Χάμπουργκερ", "Μαγιονέζα", "Ποπ κορν", "Τσίσμπεργκερ", "Λουκάνικο", "Κεκάκι", "Μπέικον", "Κέτσαπ", "Βούτυρο", "Τηγανίτα"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Βολιβία", "Καμερούν", "Νότια Αφρική", "Ισλανδία", "Ρουμανία", "Ισραήλ", "Εκουαδόρ", "Εσθονία", "Περού", "Λετονία", "Σλοβακία", "Σλοβενία", "Πολωνία", "Τυνησία", "Αργεντίνη", "Βιετνάμ", "Γεωργία", "Αλβανία", "Μονακό", "Νεπάλ"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Χήνα", "Ασβός", "Κάπρος", "Πελαργός", "Καγκουρώ", "Ανακόνδας", "Σκίουρος", "Παπαγάλος", "Χάμστερ", "Σκατζόχοιρος", "Ιπποπόταμος", "Σκαθάρι", "Πανθήρ", "Χταπόδι", "Πύθων", "Βαβουίνος", "Κουνάβι", "Καφέ αρκούδα", "Πελεκάνος"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Είδος βατόμουρου", "Κυδώνι", "Κάκτος", "Ραπανάκι", "Παντζάρι", "Κακάο", "Ακτινίδια", "Μάνγκο", "Χρένο", "Εικ", "Ρίγανη", "Ελατο", "Φραγκοστάφυλα", "Μελιτζάνα", "Οξυάκανθα", "Ελιά", "Μπρόκολο", "Ανηθο", "Σπανάκι", "Κουνουπίδι"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Καταψύκτης", "Τηγάνι", "Βραστήρας", "Τραπέζι", "Φρυγανιέρα", "Σουρωτήρι", "Σπαθί"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Κομπόστα", "Μουσακάς", "Ελαιόλαδο", "Ραβιόλι", "Χοιρινή μπριζόλα", "Κοτόσουπα", "Τσεισκέικ", "Αυγόφετες", "Αμυγδαλωτό", "Γκούλας", "Ρολό κιμά", "Μαύρη σοκολάτα", "Μελόπιτα", "Φλυαρώ", "Μπαρμπεκιου"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Ανδόρα", "Αγκόλα", "Αρμενία", "Βόρεια Κορέα", "Ινδονησία", "Χιλή", "Λιθουανία", "Μαλαισία", "Μάλι", "Μαυροβούνιο", "Σενεγάλη", "Παραγουάη", "Λουξεμβούργο", "Αΐτη", "Αζερμπαϊτζάν", "Ουρουγουάη", "Βενεζουέλα", "Ιράκ", "Κούβα", "Ιαμαϊκή"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Κόνδωρ", "Οχιά", "Γεράκι", "Ινδικό χοιρίδιο", "Τρώκτης", "Μαυρο μαμπα", "Μέδουσα", "Τάρανδος", "Κύκνος", "Φασιανός", "Ορτύκι", "Σολομός", "Σκορπιός", "Μουλάρι", "Παλιάνθρωπος", "Είδος αντιλόπης"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Κατιφές", "Αρκευθος", "Φυστίκι αιγίνης", "Βαμβάκι", "Βασιλικός", "Σφεντάμι", "Λεύκα", "Κλεμεντίνη", "Ρύζι", "Αβοκάντο", "Μαύρο πιπέρι", "Σέλινο", "Μαρούλι", "Μουστάρδα", "Ροζ γοφούς", "Λωτός", "Θυμάρι"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Σκούπα", "Ξυλάκια", "Φλιτζάνι", "Ψαλίδι", "Κόσκινο", "Αλουμινόχαρτο", "Πετσέτα"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Πατατοσαλάτα", "Κρέμα καραμελέ", "Είδος ζυμαρικών", "Κολοκυθόπιτα", "Αφρώδης", "Στιφάδο", "Αγγουράκια τουρσί", "Κουλουράκι", "Κουκούτσι", "Μοτσαρέλα", "Παρμεζάνα", "Τηγανιτό ρύζι", "Μπισκότα", "Σούσι", "Μηλόπιτα"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Αφγανιστάν", "Σαουδική Αραβία", "Ακτή Ελεφαντοστού", "Μπαχάμες", "Μπαχρέιν", "Κόστα Ρίκα", "Ελ Σαλβαδόρ", "Κενύα", "Γουατεμάλα", "Ονδούρα", "Ιορδανία", "Λίβανος", "Κατάρ", "Παναμάς", "Λιβερία", "Σιγκαπούρη", "Ταϊλάνδη", "Γέμενη", "Μάλτα", "Βατικανό"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Κάστορας", "Βασιλιάς κόμπρα", "Φοινικόπτερος", "Αλμπατρός", "Γλάρος", "Τσακάλι", "Κορυδαλλός", "Λόρις", "Αστακός", "Θαλάσσιος ίππος", "Βιζόν", "Βόνασος", "Ακανθόχοιρος", "Κόκκινο πάντα", "Σαλαμάνδρα", "Αηδόνι", "Βίδρα", "Ρέγγα"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Αλόη", "Φτέρη", "Κάστανο", "Ευκάλυπτος", "Σημύδα", "Κλήθρα", "Ραβέντι", "Χουρμαδιά", "Φακές", "Σπαράγγι", "Παλάμη", "Γαρύφαλλο", "Λινάρι", "Καπνός", "Μπάμια", "Τριφύλλι", "Λυκίσκος", "Γκι", "Μαγνολία", "Λευκόιο"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Καράφα", "Τρίφτης", "Διηθητήριο", "Σαπούνι", "Σφουγγάρι", "Κουτάλι"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Πέστο", "Σάλτσα ντομάτας", "Μούσλι", "Ελβετικό τυρί", "Μπακλάβα", "Κάρι", "Λευκή σοκολάτα", "Ξύδι", "Ζεστή σοκολάτα", "Ριζόγαλο", "Ψητό βοδινό", "Σοκολατένιο κέικ", "Χορτόσουπα", "Νούτλ σούπα", "Σαλάτα του Καίσαρα"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Αντίγκουα και Μπαρμπούντα", "Μπρουνέι", "Μπουρούντι", "Αιθιοπία", "Φιλιππίνες", "Γκάμπια", "Καζακστάν", "Λάος", "Λιχτενστάιν", "Μπαρμπάντος", "Μαδαγασκάρη", "Σαν Μαρίνο", "Συρία", "Σομαλία", "Σουδάν", "Τόγκο", "Ουγκάντα", "Ζάμπια", "Ζιμπάμπουε", "Μπενίν"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Αιγοκάμηλος", "Ρακούν", "Ερωδιός", "Δράκος του Κομόντο", "Σφυραίνα", "Καρακάξα", "Ψαρόνι", "Τάπιρος", "Κερκοπίθηκος"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Γλυκάνισο", "Μαργαρίτα", "Ρόδι", "Μπαμπού", "Σιτάρι", "Λαχανάκια Βρυξελλών", "Ρεβύθια", "Αντίρριο", "Ανεμώνη", "Παπάγια", "Μάραθο", "Είδος δαυκίου", "Δενδρολίβανο", "Χρυσάνθεμο", "Τζίντζερ"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Κουζίνα", "Μαχαίρι", "Χαρτοπετσέτα", "Ψυγείο", "Τσαγιέρα", "Θερμόμετρο", "Νεροχύτης"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Τυροκομείο", "Ρατάτουιλ", "Τορτελίνι", "Κεφίρ", "Χούμους", "Σάλτσα Τζατζίκι", "Τιραμισού", "Πατάτες σφήνες", "Ιταλικό ορεκτικό", "Είδος ζυμαρικού", "Σάλτσα"]);
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.en;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austria", "Belgium", "Brazil", "Canada", "China", "France", "Germany", "Italy", "Mexico", "Russia", "Spain", "United States", "Japan", "Netherlands", "Australia", "Portugal", "Turkey", "Bulgaria", "India", "Greece"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Mouse", "Monkey", "Leopard", "Dolphin", "Cheetah", "Chimpanzee", "Crocodile", "Crow", "Deer", "Rabbit", "Shark", "Tiger", "Pigeon", "Duck", "Eagle", "Elephant", "Giraffe", "Lion", "Bear", "Horse"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Potato", "Orchid", "Beans", "Apple", "Rose", "Corn", "Sunflower", "Garlic", "Raspberries", "Lemon", "Peach", "Oranges", "Pear", "Plum", "Banana", "Cucumber", "Grape", "Tomato", "Carrot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Apron", "Bottle", "Bottle opener", "Bowl", "Cookbook", "Cutlery", "Fork"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Donut", "Pasta", "Kebab", "Croissant", "Lasagna", "Cheese", "Pizza", "Spaghetti", "Omelette", "Ice cream", "Bread", "Cake", "Roast", "Yogurt", "Fast food", "Pickles", "Maple syrup", "Toast", "Chocolate", "Mashed potatoes"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cyprus", "Colombia", "Czech Republic", "Croatia", "Denmark", "Egypt", "Switzerland", "Finland", "Ghana", "Morocco", "Iran", "Nigeria", "Serbia", "Norway", "Belarus", "Sweden", "South Korea", "Ukraine", "Hungary", "Algeria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligator", "Antelope", "Donkey", "Rhino", "Zebra", "Polar Bear", "Goat", "Whale", "Gorilla", "Koala", "Camel", "Hyena", "Frog", "Goldfish", "Jaguar", "Panda", "Sheep", "Wolf", "Tortoise", "Penguin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulip", "Onion", "Cherries", "Pumpkin", "Strawberry", "Coffee", "Dandelion", "Pineapple", "Peanuts", "Nettle", "Apricot", "Coconut", "Grapefruit", "Watermelon", "Melon", "Sour cherries", "Mint", "Peppers", "Cabbage", "Peas"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Cook", "Dishwasher", "Food", "Garbage can", "Juicer", "Oven", "Recipe"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Peanut Butter", "Chips", "Tacos", "Pudding", "Meatballs", "Roast chicken", "Honey", "Seafood", "French fries", "Sausages", "Hamburger", "Mayonnaise", "Popcorn", "Cheeseburger", "Hot Dog", "Cupcake", "Bacon", "Ketchup", "Butter", "Pancake"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Cameroon", "South Africa", "Iceland", "Romania", "Israel", "Ecuador", "Estonia", "Peru", "Latvia", "Slovakia", "Slovenia", "Poland", "Tunisia", "Argentina", "Vietnam", "Georgia", "Albania", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Goose", "Badger", "Boar", "Stork", "Kangaroo", "Anaconda", "Squirrel", "Parrot", "Hamster", "Hedgehog", "Hippo", "Beetle", "Panther", "Octopus", "Python", "Baboon", "Ferret", "Brown bear", "Pelican", "Raven"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Bilberry", "Quince", "Cactus", "Radish", "Beetroot", "Cocoa", "Kiwi", "Mango", "Horseradish", "Figs", "Oregano", "Spruce", "Currants", "Eggplant", "Barberry", "Olive", "Broccoli", "Dill", "Spinach", "Cauliflower"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Freezer", "Frying pan", "Kettle", "Table", "Toaster", "Colander"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Compote", "Moussaka", "Pastrami", "Olive oil", "Ravioli", "Milkshake", "Pork chop", "Chicken Soup", "Cheesecake", "French Toast", "Marzipan", "Goulash", "Meatloaf", "Burrito", "Dark chocolate", "Macaroni", "Gingerbread", "Waffle", "Barbecue"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "North Korea", "Indonesia", "Chile", "Lithuania", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxembourg", "Haiti", "Azerbaijan", "Uruguay", "Venezuela", "Iraq", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Moose", "Condor", "Viper", "Falcon", "Guinea pig", "Trout", "Black mamba", "Jellyfish", "Reindeer", "Llama", "Swan", "Pheasant", "Quail", "Great white shark", "Salmon", "Scorpion", "Mule", "Skunk", "Gazelle", "Coyote"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Marigold", "Juniper", "Pistachio", "Ficus", "Cotton", "Basil", "Maple", "Poplar", "Clementine", "Rice", "Avocado", "Black pepper", "Celery", "Lettuce", "Mustard", "Mandarin orange", "Rose hips", "Lotus", "Thyme"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Broom", "Chopsticks", "Cup", "Shears", "Sieve", "Aluminum Foil", "Towel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Potato salad", "Creme caramel", "Dumpling", "Pumpkin pie", "Souffle", "Cheese sandwich", "Stew", "Pickled cucumbers", "Pretzel", "Currywurst", "Couscous", "Grilled cheese", "Mozzarella", "Parmesan", "Fried Rice", "Biscuits", "Sushi", "Apple Pie", "Fish and chips"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Saudi Arabia", "Ivory Coast", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenya", "Guatemala", "Honduras", "Jordan", "Lebanon", "Qatar", "Panama", "Liberia", "Singapore", "Thailand", "Yemen", "Malta", "Vatican City"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Beaver", "King cobra", "Flamingo", "Albatross", "Seagull", "Jackal", "Lark", "Loris", "Lobster", "Marten", "Walrus", "Mink", "Bison", "Porcupine", "Red Panda", "Salamander", "Stingray", "Nightingale", "Otter", "Herring"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Fern", "Chestnut", "Eucalyptus", "Birch", "Alder", "Rhubarb", "Date palm", "Lentils", "Asparagus", "Palm", "Carnation", "Flax", "Tobacco", "Okra", "Clover", "Hops", "Mistletoe", "Magnolia", "Snowdrop"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Carafe", "Grater", "Percolator", "Soap", "Spatula", "Sponge", "Spoon"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Tomato sauce", "Muesli", "Swiss cheese", "Tortilla", "Baklava", "Curry", "Guacamole", "White chocolate", "Vinegar", "Hot chocolate", "Dim sum", "Pasta carbonara", "Rice pudding", "Roast beef", "Muffin", "Chocolate Cake", "Vegetable soup", "Noodle soup", "Caesar salad"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua and Barbuda", "Brunei", "Burundi", "Ethiopia", "Philippines", "Gambia", "Kazakhstan", "Laos", "Liechtenstein", "Barbados", "Madagascar", "San Marino", "Syria", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaca", "Armadillo", "Chinchilla", "Echidna", "Raccoon", "Egret", "Tasmanian devil", "Komodo dragon", "Barracuda", "Magpie", "Manatee", "Prairie dog", "Starling", "Tapir", "Tarsier", "Lemur", "Meerkat", "Guineafowl", "Possum"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anise", "Bonsai", "Daisy", "Pomegranate", "Bamboo", "Wheat", "Brussels sprouts", "Chickpeas", "Wasabi", "Sequoia", "Snapdragon", "Venus flytrap", "Anemone", "Papaya", "Fennel", "Parsnip", "Pomelo", "Rosemary", "Chrysanthemum", "Ginger"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kitchen", "Knife", "Napkin", "Refrigerator", "Teapot", "Thermometer", "Sink"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Cottage cheese", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon Bleu", "Kefir", "Ground beef", "Falafel", "Ricotta", "Eclair", "Hummus", "Tzatziki sauce", "Tiramisu", "Potato wedges", "Antipasto", "Strudel", "Gravy"]);
  }

  void addES(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.es;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austria", "Bélgica", "Brasil", "Canadá", "China", "Francia", "Alemania", "Italia", "Mexico", "Rusia", "España", "Estados Unidos", "Japón", "Países Bajos", "Australia", "Portugal", "Turquía", "Bulgaria", "India", "Grecia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Ratón", "Delfín", "Leopardo", "Chimpancé", "Cocodrilo", "Cuervo", "Ciervo", "Conejo", "Tiburón", "Tigre", "Paloma", "Pato", "Águila", "Elefante", "Jirafa", "León", "Oso", "Caballo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Patata", "Orquídea", "Frijoles", "Manzana", "Rosa", "Maíz", "Girasol", "Ajo", "Frambuesas", "Fresa", "Limón", "Melocotón", "Naranjas", "Pera", "Ciruela", "Plátano", "Pepino", "Uva", "Tomate", "Zanahoria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Delantal", "Botella", "Abrebotellas", "Cuenco", "Libro de cocina", "Cuchillería", "Tenedor"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Rosquilla", "Pastas", "Brocheta", "Cuerno", "Lasaña", "Queso", "Pizza", "Espaguetis", "Tortilla", "Helado", "Pan de molde", "Pastel", "Asado", "Yogur", "Comida rápida", "Pepinillos", "Tostada", "Chocolate", "Puré"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Chipre", "Colombia", "Republica checa", "Croacia", "Dinamarca", "Egipto", "Suiza", "Finlandia", "Ghana", "Marruecos", "Iran", "Nigeria", "Serbia", "Noruega", "Bielorrusia", "Suecia", "Corea del Sur", "Ucrania", "Hungría", "Argelia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Caimán", "Antílope", "Burro", "Rinoceronte", "Cebra", "Oso polar", "Cabra", "Ballena", "Gorila", "Coala", "Camello", "Hiena", "Jaguar", "Panda", "Oveja", "Lobo", "Tortuga"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipán", "Cebolla", "Calabaza", "Café", "Diente de león", "Piña", "Ortiga", "Albaricoque", "Coco", "Pomelo", "Sandía", "Melón", "Guindas", "Menta", "Pimientos", "Repollo", "Chícharos"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Cocinar", "Lavavajillas", "Comida", "Basura", "Exprimidor", "Horno", "Receta"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Tacos", "Pudín", "Albóndigas", "Pollo asado", "Miel", "Mariscos", "Papas fritas", "Salchichas", "Hamburguesa", "Mayonesa", "Tocino", "Salsa de tomate", "Mantequilla", "Crepe"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Camerún", "Sudáfrica", "Islandia", "Rumania", "Israel", "Ecuador", "Estonia", "Perú", "Letonia", "Eslovaquia", "Eslovenia", "Polonia", "Túnez", "Argentina", "Vietnam", "Georgia", "Albania", "Mónaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Ganso", "Tejón", "Jabali", "Canguro", "Ardilla", "Loro", "Hámster", "Erizo", "Hipopótamo", "Escarabajo", "Pantera", "Pulpo", "Pitón", "Babuino", "Hurón", "Pelícano"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Arándano", "Membrillo", "Rábano", "Raíz de remolacha", "Rábano picante", "Higos", "Orégano", "Picea", "Grosellas", "Berenjena", "Bérbero", "Aceituna", "Brócoli", "Espinacas", "Coliflor"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Congelador", "Sartén", "Tetera", "Mesa", "Tostadora", "Colador", "Espátula"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Compota", "Musaca", "Pastrami", "Aceite de oliva", "Ravioles", "Batido", "Chuleta de cerdo", "Sopa de pollo", "Tarta de queso", "Mazapán", "Pastel de carne", "Burrito", "Chocolate negro", "Macarrones", "Pan de jengibre", "Gofre", "Parilla"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "Corea del Norte", "Indonesia", "Chile", "Lituania", "Malasia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxemburgo", "Haití", "Azerbaiyán", "Uruguay", "Venezuela", "Irak", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Cóndor", "Víbora", "Halcón", "Trucha", "Mamba negro", "Medusa", "Reno", "Cisne", "Faisán", "Codorniz", "Salmón", "Escorpión", "Mula", "Zorrillo", "Gacela"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Enebro", "Pistacho", "Ficus", "Algodón", "Albahaca", "Arce", "Álamo", "Clementina", "Arroz", "Aguacate", "Pimienta negra", "Apio", "Lechuga", "Mostaza", "Mandarina", "Escaramujos", "Loto", "Tomillo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Escoba", "Palillos", "Taza", "Tijeras", "Tamiz", "Papel de aluminio", "Toalla"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Ensalada de papas", "Crema de caramelo", "Pastel de calabaza", "Soufflé", "Sándwich de queso", "Estofado", "Galleta salada", "Currywurst", "Queso asado", "Queso Mozzarella", "Parmesano", "Arroz frito", "Galletas", "Sushi", "Pie de manzana"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistán", "Arabia Saudita", "Costa de Marfil", "Bahamas", "Bahrein", "Costa Rica", "El Salvador", "Kenia", "Guatemala", "Honduras", "Jordán", "Líbano", "Katar", "Panamá", "Liberia", "Singapur", "Tailandia", "Yemen", "Malta", "Ciudad del Vaticano"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Castor", "Cobra real", "Flamenco", "Albatros", "Gaviota", "Chacal", "Alondra", "Langosta", "Marta", "Morsa", "Visón", "Bisonte", "Puerco espín", "Panda rojo", "Salamandra", "Mantarraya", "Ruiseñor", "Nutria", "Arenque"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Helecho", "Castaña", "Eucalipto", "Abedul", "Aliso", "Ruibarbo", "Palmera datilera", "Lentejas", "Espárragos", "Palma", "Clavel", "Lino", "Tabaco", "Okra", "Trébol", "Muérdago"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Jarra", "Rallador", "Percolador", "Jabón", "Esponja", "Cuchara"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Muesli", "Queso suizo", "Curry", "Guacamole", "Chocolate blanco", "Vinagre", "Dim sum", "Pasta carbonara", "Arroz con leche", "Carne asada", "Mollete", "Sopa de verduras", "Sopa de fideos", "Ensalada César"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua y Barbuda", "Brunei", "Burundi", "Etiopía", "Filipinas", "Gambia", "Kazajstán", "Laos", "Liechtenstein", "Barbados", "Madagascar", "San Marino", "Siria", "Somalia", "Sudán", "Togo", "Uganda", "Zambia", "Zimbabue", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Echidna", "Mapache", "Garceta", "Demonio de Tasmania", "Dragon de Komodo", "Sphyraena", "Urraca", "Manatí", "Estornino", "Tarsier", "Lémur", "Meerkat"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anís", "Margarita", "Granada", "Trigo", "Coles de Bruselas", "Garbanzos", "Wasabi", "Secoya", "Boca de dragón", "Anémona", "Papaya", "Hinojo", "Chirivía", "Romero", "Crisantemo", "Jengibre"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Cocina", "Cuchillo", "Servilleta", "Refrigerador", "Termómetro", "Lavabo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Queso cottage", "Paella", "Ñoquis", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon Bleu", "Kéfir", "Carne molida", "Falafel", "Ricotta", "Eclair", "Hummus", "Salsa tzatziki", "Tiramisu", "Cuñas de patata", "Antipasto", "Strudel", "Salsa"]);
  }

  void addFI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.fi;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Itävalta", "Belgia", "Brasilia", "Kanada", "Kiina", "Ranska", "Saksa", "Italia", "Meksiko", "Venäjä", "Espanja", "Yhdysvallat", "Japani", "Alankomaat", "Australia", "Portugali", "Turkki", "Bulgaria", "Intia", "Kreikka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Hiiri", "Apina", "Leopardi", "Delfiini", "Gepardi", "Simpanssi", "Krokotiili", "Varis", "Peura", "Kani", "Hai", "Tiikeri", "Kyyhkynen", "Ankka", "Kotka", "Norsu", "Kirahvi", "Leijona", "Karhu", "Hevonen"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Peruna", "Orkidea", "Pavut", "Omena", "Ruusu", "Maissi", "Auringonkukka", "Valkosipuli", "Vadelmat", "Mansikka", "Sitruuna", "Persikka", "Appelsiinit", "Päärynä", "Luumu", "Banaani", "Kurkku", "Viinirypäle", "Tomaatti", "Porkkana"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Esiliina", "Pullo", "Pullonavaaja", "Kulho", "Keittokirja", "Ruokailuvälineet", "Haarukka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Donitsi", "Pasta", "Kebab", "Voisarvi", "Lasagne", "Juusto", "Pizza", "Spagetti", "Munakas", "Jäätelö", "Leipä", "Kakku", "Paisti", "Jogurtti", "Pikaruoka", "Maustekurkut", "Vaahterasiirappi", "Paahtoleipä", "Suklaa", "Perunamuusi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Kypros", "Kolumbia", "Tšekki", "Kroatia", "Tanska", "Egypti", "Sveitsi", "Suomi", "Ghana", "Marokko", "Iran", "Nigeria", "Serbia", "Norja", "Valko-Venäjä", "Ruotsi", "Etelä-Korea", "Ukraina", "Unkari", "Algeria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligaattori", "Antilooppi", "Aasi", "Sarvikuono", "Seepra", "Jääkarhu", "Vuohi", "Valas", "Gorilla", "Koala", "Kameli", "Hyeena", "Sammakko", "Kultakala", "Jaguaari", "Panda", "Lammas", "Susi", "Kilpikonna", "Pingviini"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulppaani", "Sipuli", "Kirsikat", "Kurpitsa", "Kahvi", "Voikukka", "Ananas", "Maapähkinät", "Nokkonen", "Aprikoosi", "Kookospähkinä", "Greippi", "Vesimeloni", "Meloni", "Hapankirsikat", "Minttu", "Paprikat", "Kaali", "Herneet"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Kokki", "Astianpesukone", "Ruoka", "Roskakori", "Mehulinko", "Uuni", "Resepti"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Maapähkinävoi", "Perunalastut", "Tacos", "Vanukas", "Lihapullat", "Paistettu kana", "Hunaja", "Merenelävät", "Ranskanperunat", "Makkarat", "Hampurilainen", "Majoneesi", "Paukkumaissi", "Juustohampurilainen", "Kuuma koira", "Kuppikakku", "Pekoni", "Ketsuppi", "Pannukakku"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Kamerun", "Etelä-Afrikka", "Islanti", "Romania", "Israel", "Ecuador", "Togo", "Peru", "Latvia", "Slovakia", "Slovenia", "Puola", "Tunisia", "Argentiina", "Vietnam", "Georgia", "Albania", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Hanhi", "Mäyrä", "Villisika", "Kattohaikara", "Kenguru", "Anakondat", "Orava", "Papukaija", "Hamsteri", "Siili", "Virtahepo", "Kuoriainen", "Pantteri", "Mustekala", "Pytonkäärme", "Paviaani", "Fretti", "Ruskea karhu", "Pelikaani", "Korppi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Mustikka", "Kvitteni", "Kaktus", "Retiisi", "Punajuuri", "Kaakao", "Kiivi", "Mango", "Piparjuuri", "Viikunat", "Mäkimeirami", "Herukat", "Munakoiso", "Happomarjapensas", "Oliivi", "Parsakaali", "Pinaatti", "Kukkakaali"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Pakastin", "Paistinpannu", "Kattila", "Pöytä", "Leivänpaahdin", "Siivilä", "Lasta"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompotti", "Moussakan", "Pastrami", "Oliiviöljy", "Ravioli", "Pirtelö", "Porsaankyljys", "Kanakeitto", "Juustokakku", "Köyhät ritarit", "Marsipaani", "Gulassi", "Lihamureke", "Burrito", "Tumma suklaa", "Makaroni", "Piparkakku", "Höpöttää", "Grilli"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "Pohjois-Korea", "Indonesia", "Chile", "Liettua", "Malesia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxemburg", "Haiti", "Azerbaijan", "Uruguay", "Venezuela", "Irak", "Kuuba", "Jamaika"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Hirvi", "Kondori", "Kyykäärme", "Haukka", "Marsu", "Taimen", "Musta Mamba", "Meduusa", "Poro", "Laama", "Joutsen", "Fasaani", "Viiriäinen", "Valkohai", "Lohi", "Skorpioni", "Muuli", "Haisunäätä", "Gaselli", "Kojootti"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Kehäkukka", "Kataja", "Pistaasi", "Puuvilla", "Basilika", "Vaahtera", "Poppeli", "Riisi", "Avokado", "Mustapippuri", "Selleri", "Lehtisalaatti", "Sinappi", "Mandariini appelsiini", "Rose lantio", "Lootus", "Timjami"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Luuta", "Syömäpuikot", "Kuppi", "Sakset", "Seula", "Alumiinifolio", "Pyyhe"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Perunasalaatti", "Kermakaramelli", "Kokkare", "Kurpitsapiirakka", "Kohokas", "Juustovoileipä", "Muhennos", "Marinoidut kurkut", "Suolarinkilä", "Currywurst", "Kuskus", "Grillattu juusto", "Mozzarella", "Parmesaania", "Paistettu riisi", "Keksit", "Sushi", "Omenapiirakka", "Kala ja sirut"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistan", "Saudi-Arabia", "Norsunluurannikko", "Bahama", "Bahrain", "Costa Rica", "El Salvador", "Kenia", "Guatemala", "Honduras", "Jordania", "Libanon", "Qatar", "Panama", "Liberia", "Singapore", "Thaimaa", "Jemen", "Malta", "Vatikaani"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Majava", "Kuningaskobra", "Flamingo", "Albatrossi", "Lokki", "Sakaali", "Kiuru", "Hummeri", "Näätä", "Mursu", "Minkki", "Biisoni", "Piikkisika", "Punainen panda", "Salamanteri", "Keihäsrausku", "Satakieli", "Saukko", "Silli"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Saniainen", "Kastanja", "Eukalyptus", "Koivu", "Leppä", "Raparperi", "Taatelipalmu", "Linssit", "Parsa", "Palmu", "Neilikka", "Pellava", "Tupakka", "Okra", "Apila", "Humala", "Misteli", "Magnolia", "Lumikello"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karahvi", "Raastin", "Aromikeitin", "Saippua", "Sieni", "Lusikka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Tomaattikastike", "Mysli", "Sveitsiläinen juusto", "Tortilla", "Baklava", "Curry", "Guacamole", "Valkosuklaa", "Etikka", "Määrä summa", "Pasta carbonara", "Riisipuuro", "Paahtopaisti", "Muffinssi", "Suklaakakku", "Kasviskeitto", "Nuudelikeitto", "Caesar-salaatti"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua ja Barbuda", "Brunei", "Burundi", "Etiopia", "Filippiinit", "Gambia", "Kazakstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Syyria", "Somalia", "Sudan", "Mennä", "Uganda", "Sambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpakka", "Vyötiäinen", "Tshintshilla", "Pesukarhu", "Jalohaikara", "Tasmanian paholainen", "Komodon lohikäärme", "Barrakuda", "Harakka", "Preeriakoira", "Kottarainen", "Tapiiri", "Puoliapina", "Meerkat", "Helmikananliha", "Opossumi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anis", "Bonsai", "Päivänkakkara", "Granaattiomena", "Bambu", "Vehnä", "Ruusukaalia", "Kikherneet", "Wasabi", "Mammuttipetäjä", "Leijonankita", "Kärpäsloukku", "Vuokko", "Papaija", "Fenkoli", "Palsternakka", "Pomelo", "Rosmariini", "Krysanteemi", "Inkivääri"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Keittiö", "Veitsi", "Lautasliina", "Jääkaappi", "Teekannu", "Lämpömittari", "Pesuallas"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Raejuusto", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon Bleu", "Kefir", "Jauheliha", "Falafel", "Tuulihattu", "Hummus", "Tzatziki-kastike", "Tiramisu", "Lohkoperunat", "Paistinkastike"]);
  }

  void addFR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.fr;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["L'Autriche", "Belgique", "Brésil", "Canada", "Chine", "France", "Allemagne", "Italie", "Mexique", "Russie", "Espagne", "États Unis", "Japon", "Pays-Bas", "Australie", "Le Portugal", "Turquie", "Bulgarie", "Inde", "Grèce"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Souris", "Léopard", "Dauphin", "Guépard", "Chimpanzé", "Crocodile", "Corbeau", "Cerf", "Lapin", "Réquin", "Tigre", "Pigeon", "Canard", "Aigle", "Éléphant", "Girafe", "Lion", "Ours", "Cheval"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Pomme de terre", "Orchidée", "Haricot", "Pomme", "Rosier", "Maïs", "Tournesol", "Ail cultivé", "Framboises", "Fraise", "Citron", "Pêche", "Orange", "Poire", "Prune", "Banane", "Concombre", "Grain de raisin", "Tomate", "Carotte"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Tablier", "Bouteille", "Ouvre-bouteille", "Bol", "Livre de recettes", "Coutellerie", "Fourchette"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Donut", "Pâtes", "Kebab", "Croissant", "Lasagne", "Fromage", "Pizza", "Spaghetti", "Omelette", "Crème glacée", "Pain", "Gâteau", "Rôti", "Yogourt", "Fast-food", "Cornichons", "Sirop d'érable", "Pain grillé", "Chocolat", "Pommes de terre Purée"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Chypre", "Colombie", "République Tchèque", "Croatie", "Danemark", "Egypte", "Suisse", "Finlande", "Ghana", "Maroc", "L'Iran", "Nigeria", "Serbie", "Norvège", "Biélorussie", "Suède", "Corée du Sud", "Ukraine", "Hongrie", "Algérie"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligator", "Antilope", "Rhinocéros", "Zèbre", "Ours polaire", "Chèvre", "Baleine", "Gorille", "Koala", "Chameau", "Hyène", "Grenouille", "Poisson rouge", "Jaguar", "Panda", "Mouton", "Loup", "Tortue", "Manchot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipe", "Oignon", "Citrouille", "Café", "Pissenlit", "Ananas", "Cacahuètes", "Ortie", "Abricot", "Noix de coco", "Pamplemousse", "Pastèque", "Melon", "Cerises", "Menthe", "Poivrons", "Chou", "Pois"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Cuisinier", "Lave-vaisselle", "Aliments", "Poubelle", "Presse-agrumes", "Four", "Recette"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Beurre d'arachide", "Chips", "Tacos", "Pudding", "Boulettes de viande", "Rôti de poulet", "Miel", "Fruit de mer", "Frittes", "Saucisses", "Hamburger", "Mayonnaise", "Pop-corn", "Cheeseburger", "Hot-dog", "Cupcake", "Bacon", "Ketchup", "Beurre", "Crêpe"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivie", "Cameroun", "Afrique du Sud", "Islande", "Roumanie", "Israël", "Equateur", "Estonie", "Pérou", "Lettonie", "Slovaquie", "Slovénie", "Pologne", "Tunisie", "Argentine", "Vietnam", "Géorgie", "Albanie", "Monaco", "Népal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Anserini", "Blaireau", "Sanglier", "Cigogne", "Kangourou", "Anaconda", "Écureuil", "Perroquet", "Hamster", "Hérisson", "Hippopotame", "Scarabée", "Panthère", "Poulpe", "Python", "Babouin", "Furet", "Ours brun", "Pélican"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Myrtille", "Coing", "Cactus", "Radis", "Betterave", "Cacao", "Kiwi", "Mangue", "Raifort", "Origan", "Épicéa", "Groseilles", "Aubergine", "Vinette", "Olive", "Brocoli", "Aneth", "Épinards", "Chou-fleur"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Congélateur", "Poêle à frire", "Bouilloire", "Table", "Grille-pain", "Passoire", "Spatule"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Compote", "Moussaka", "Pastrami", "Huile d'olive", "Ravioli", "Milk-shake", "Côtelette de porc", "Soupe au poulet", "Gâteau au fromage", "Massepain", "Goulache", "Pain de viande", "Burrito", "Chocolat noir", "Macaroni", "Pain d'épice", "Gaufre", "Barbecue"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorre", "Angola", "Arménie", "Corée du Nord", "Indonésie", "Chili", "Lituanie", "Malaisie", "Mali", "Monténégro", "Sénégal", "Paraguay", "Luxembourg", "Haïti", "Azerbaïdjan", "Uruguay", "Venezuela", "Irak", "Cuba", "Jamaïque"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Élan", "Condor", "Vipère", "Faucon", "Guinée de porc", "Truite", "Mamba Noir", "Méduse", "Renne", "Lama", "Cygne", "Faisan", "Caille", "Grand requin blanc", "Saumon", "Scorpion", "Moufette", "Gazelle", "Coyote"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Orge", "Souci", "Genévrier", "Pistache", "Ficus", "Coton", "Basilic", "Érable", "Peuplier", "Tilia", "Avocat", "Poivre noir", "Céleri", "Laitue", "Moutarde", "Mandarines", "Rose Hanches", "Lotus", "Thym"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Balai", "Baguettes", "Coupe", "Cisailles", "Tamis", "Feuille d'aluminium", "Serviette"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Salade de pommes de terre", "Crème caramel", "Boulette de pâte", "Tarte à la citrouille", "Souffle", "Sandwich au fromage", "Concombres marinés", "Bretzel", "Currywurst", "Couscous", "Fromage grillé", "Mozzarella", "Parmesan", "Riz frit", "Biscuit", "Sushi", "Tarte aux pommes", "Poisson et frites"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Arabie Saoudite", "Côte d'Ivoire", "Bahamas", "Bahreïn", "Costa Rica", "Le Salvador", "Kenya", "Guatemala", "Honduras", "Jordan", "Liban", "Qatar", "Panama", "Libéria", "Singapour", "Thaïlande", "Yémen", "Malte", "Vatican"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Castor", "Roi cobra", "Flamant", "Albatros", "Mouette", "Chacal", "Alouette", "Loris", "Homard", "Martre", "Morse", "Vison", "Bison", "Porc-épic", "Panda rouge", "Salamandre", "Rossignol", "Loutre", "Hareng"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Fougère", "Châtaigne", "Eucalyptus", "Bouleau", "Aulne", "Rhubarbe", "Palmier dattier", "Lentilles", "Asperges", "Paume", "Dianthus", "Lin cultivé", "Tabac", "Gombo", "Trèfle", "Houblon", "Papayer", "Magnolia", "Perce-neige"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Carafe", "Râpe", "Percolateur", "Savon", "Éponge", "Cuillère"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Sauce tomate", "Muesli", "Fromage suisse", "Tortilla", "Baklava", "Curry", "Guacamole", "Chocolat blanc", "Vinaigre", "Chocolat chaud", "Dim sum", "Pâtes à la carbonara", "Riz au lait", "Rôti de boeuf", "Muffin", "Gâteau au chocolat", "Soupe aux légumes", "Soupe de nouilles", "Salade César"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua-et-Barbuda", "Brunei", "Burundi", "Ethiopie", "Philippines", "Gambie", "Kazakhstan", "Laos", "Liechtenstein", "Barbade", "Madagascar", "Saint Marin", "Syrie", "Somalie", "Soudan", "Togo", "Ouganda", "Zambie", "Zimbabwe", "Bénin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaga", "Tatou", "Chinchilla", "Anguille", "Echidna", "Raton laveur", "Egret", "Diable de Tasmanie", "Dragon de Komodo", "Barracuda", "Pie bavarde", "Lamantin", "Chien de prairie", "Étourneau", "Tapir", "Tarsier", "Maki", "Suricate", "Pintade", "Opossum"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anis", "Bonsaï", "Marguerite", "Bambou", "Chêne pédonculé", "Choux de Bruxelles", "Pois chiche", "Wasabi", "Séquoia", "Muflier", "Dionée attrape-mouche", "Anémone", "Papaye", "Fenouil", "Panais", "Pomélo", "Romarin", "Chrysanthème", "Gingembre"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Cuisine", "Couteau", "Serviette de table", "Réfrigérateur", "Théière", "Thermomètre", "Évier"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Fromage cottage", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon bleu", "Kéfir", "Rez-de-boeuf", "Falafel", "Ricotta", "Eclair", "Houmous", "Sauce Tzatziki", "Tiramisu", "Pièces de pommes de terre", "Antipasto", "Strudel", "Sauce"]);
  }

  void addHR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.hr;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austrija", "Belgija", "Brazil", "Kanada", "Kina", "Francuska", "Njemačka", "Italija", "Meksiko", "Rusija", "Španija", "Sjedinjene Američke Države", "Japan", "Nizozemska", "Australija", "Portugal", "Turska", "Bugarska", "Indija", "Grčka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Miš", "Majmun", "Leopard", "Dupin", "Gepard", "Čimpanza", "Krokodil", "Vrana", "Jelen", "Zec", "Morski pas", "Tigar", "Golub", "Patka", "Orao", "Slon", "Žirafa", "Lav", "Snositi", "Konj"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Krumpir", "Orhideja", "Grah", "Jabuka", "Ruža", "Kukuruz", "Suncokret", "Češnjak", "Maline", "Jagoda", "Limun", "Breskva", "Naranče", "Kruška", "Šljiva", "Banana", "Krastavac", "Zrno grožđa", "Rajčica", "Mrkva"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Stajanka", "Boca", "Otvarač za boce", "Zdjela", "Kuharica", "Pribor za jelo", "Viljuška"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Krafna", "Tjestenina", "Kebab", "Kroasan", "Lazanje", "Sir", "Pizza", "Špageti", "Omlet", "Sladoled", "Kruh", "Torta", "Pečenje", "Jogurt", "Brza hrana", "Kiseli krastavci", "Javorov sirup", "Tost", "Čokolada", "Pire krompir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Kipar", "Kolumbija", "Češka Republika", "Hrvatska", "Danska", "Egipat", "Švicarska", "Finska", "Gana", "Maroko", "Iran", "Nigerija", "Srbija", "Norveška", "Bjelorusija", "Švedska", "Južna Korea", "Ukrajina", "Mađarska", "Alžir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Aligator", "Antilopa", "Magarac", "Nosorog", "Zebra", "Polarni medvjed", "Jarac", "Kitovi", "Gorila", "Koala", "Deva", "Hijena", "Žabe", "Zlatna ribica", "Jaguar", "Panda", "Ovca", "Vuk", "Kornjača", "Pingvin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Lala", "Luk", "Bundeva", "Kava", "Maslačak", "Ananas", "Kikiriki", "Kopriva", "Marelica", "Kokos", "Grejp", "Lubenica", "Dinja", "Višnje", "Menta", "Paprike", "Kupus", "Grašak"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Kuhati", "Perilica suđa", "Hrana", "Kanta za smeće", "Sokovnik", "Pećnica", "Recept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Maslac od kikirikija", "Čips", "Tacos", "Puding", "Mesne okruglice", "Pečeno pile", "Med", "Plodovi mora", "Pomfrit", "Kobasice", "Hamburger", "Majoneza", "Kokice", "Cheeseburger", "Hot dog", "Kolačić", "Slanina", "Kečap", "Maslac", "Palačinka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivija", "Kamerun", "Južna Afrika", "Island", "Rumunjska", "Izrael", "Ekvador", "Estonija", "Peru", "Letonija", "Slovačka", "Slovenija", "Poljska", "Tunis", "Argentina", "Vijetnam", "Gruzija", "Albanija", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Guska", "Jazavac", "Vepar", "Roda", "Klokan", "Anakonda", "Vjeverica", "Papiga", "Hrčak", "Jež", "Buba", "Panter", "Hobotnica", "Piton", "Babun", "Omčica", "Smeđi medvjed", "Pelikan", "Gavran"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Borovnica", "Dunja", "Kaktus", "Rotkvica", "Cikla", "Kakao", "Kivi", "Mango", "Hren", "Smokve", "Origano", "Dotjerati", "Struja", "Patlidžan", "Žutikovina", "Maslina", "Brokula", "Kopar", "Špinat", "Cvjetača"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Zamrzivač", "Tava", "Kotlić", "Stol", "Toster", "Cjedilo", "Lopatica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompot", "Musaka", "Pastrami", "Maslinovo ulje", "Ravioli", "Milkshake", "Svinjski odrezak", "Pileća juha", "Torta od sira", "Francuski tost", "Marcipan", "Gulaš", "Mesna štruca", "Burrito", "Tamna čokolada", "Makaroni", "Medenjak", "Blebetanje", "Roštilj"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andora", "Angola", "Armenija", "Sjeverna Koreja", "Indonezija", "Čile", "Litva", "Malezija", "Mali", "Crna Gora", "Senegal", "Paragvaj", "Luksemburg", "Haiti", "Azerbejdžan", "Urugvaj", "Venecuela", "Irak", "Kuba", "Jamajka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Kondor", "Poskok", "Sokol", "Zamorac", "Pastrva", "Crna mamba", "Meduza", "Sob", "Lama", "Labud", "Fazan", "Prepelica", "Losos", "Škorpion", "Mazga", "Tvor", "Gazela", "Kojot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Neven", "Smreka", "Pistać", "Ficus", "Pamuk", "Bosiljak", "Javor", "Topola", "Riža", "Avokado", "Crni papar", "Celer", "Zelena salata", "Senf", "Lotos", "Timijan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Metla", "Štapići za jelo", "Kupa", "Škare", "Sito", "Aluminijska folija", "Ručnik"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Krumpir salata", "Kremna karamela", "Knedla", "Pita od bundeve", "Sufle", "Sendvič sa sirom", "Paprikaš", "Pereca", "Currywurst", "Kuskus", "Sir na žaru", "Mozzarella", "Parmezan", "Pržena riža", "Keksi", "Sushi", "Pita od jabuka", "Riba i čips"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Avganistan", "Saudijska Arabija", "Obala Slonovače", "Bahami", "Bahrein", "Kostarika", "El Salvador", "Kenija", "Gvatemala", "Honduras", "Jordan", "Liban", "Katar", "Panama", "Liberija", "Singapur", "Tajland", "Jemen", "Malta", "Vatikan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Dabar", "Kralj kobra", "Flamingo", "Albatros", "Galeb", "Šakal", "Ševa", "Lorisi", "Jastog", "Kuna", "Morž", "Kanadska kuna", "Bizon", "Dikobraz", "Crvena panda", "Pjegavi daždevnjak", "Slavuj", "Vidra", "Haringa"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloja", "Paprat", "Kesten", "Eukaliptus", "Breza", "Joha", "Rabarbara", "Datula", "Leća", "Šparoga", "Dlan", "Karanfil", "Lan", "Duhan", "Okra", "Djetelina", "Hmelj", "Imela", "Magnolija", "Visibaba"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Bokal", "Rende", "Cjediljka", "Sapun", "Spužva", "Žlica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Umak od rajčice", "Muesli", "Švicarski sir", "Tortilja", "Baklava", "Curry", "Guacamole", "Bijela čokolada", "Ocat", "Vruća čokolada", "Dim sum", "Karbonara od tjestenine", "Puding od riže", "Pečena govedina", "Kolač", "Čokoladna torta", "Juha od povrća", "Juha od rezanci", "Cezar salata"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigva i Barbuda", "Brunei", "Burundi", "Etiopija", "Filipini", "Gambija", "Kazahstan", "Laos", "Lihtenštajn", "Barbados", "Madagaskar", "San Marino", "Sirija", "Somalija", "Sudan", "Togo", "Uganda", "Zambija", "Zimbabve", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Oklopnik", "Cincila", "Echidna", "Rakun", "Bijela čaplja", "Tasmanski vrag", "Zmaj Komodo", "Barracuda", "Svraka", "Morska krava", "Prerijski pas", "Čvorak", "Tapiri", "Tarsius", "Lemuri", "Merkat", "Biserke", "Oposum"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anis", "Bonsai", "Tratinčica", "Nar", "Bambus", "Pšenica", "Briselske klice", "Slanutak", "Wasabi", "Sekvoja", "Zijevalica", "Venerina muholovka", "Anemona", "Papaja", "Komorač", "Paškanat", "Grejpfrut", "Ruzmarin", "Hrizantema", "Đumbir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kuhinja", "Nož", "Ubrus", "Hladnjak", "Čajnik", "Termometar", "Umivaonik"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Posni sir", "Paella", "Njoki", "Ratatouille", "Tortelini", "Shawarma", "Tofu", "Plava traka", "Kefir", "Mljevena junetina", "Falafel", "Ricotta", "Umak Tzatziki", "Tiramisu", "Krumpir krumpira", "Štrudla"]);
  }

  void addHU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.hu;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Ausztria", "Belgium", "Brazília", "Kanada", "Kína", "Franciaország", "Németország", "Olaszország", "Mexikó", "Oroszország", "Spanyolország", "Egyesült Államok", "Japán", "Hollandia", "Ausztrália", "Portugália", "Törökország", "Bulgária", "India", "Görögország"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Egér", "Majom", "Leopárd", "Delfin", "Gepárd", "Csimpánz", "Krokodil", "Varjú", "Szarvas", "Nyúl", "Cápa", "Tigris", "Galamb", "Kacsa", "Sas", "Elefánt", "Zsiráf", "Oroszlán", "Medve", "Ló"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Burgonya", "Orchidea", "Alma", "Rózsa", "Kukorica", "Napraforgó", "Fokhagyma", "Málna", "Eper", "Citrom", "Őszibarack", "Narancs", "Körte", "Szilva", "Banán", "Uborka", "Paradicsom", "Sárgarépa"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Kötény", "Üveg", "Sörnyitó", "Tál", "Szakácskönyv", "Evőeszköz", "Villa"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Fánk", "Tészta", "Kebab", "Lasagne", "Sajt", "Pizza", "Spagetti", "Omlett", "Jégkrém", "Kenyér", "Torta", "Sült", "Joghurt", "Gyors kaja", "Savanyúság", "Juharszirup", "Pirítós", "Csokoládé", "Krumplipüré"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Ciprus", "Colombia", "Cseh Köztársaság", "Horvátország", "Dánia", "Egyiptom", "Svájc", "Finnország", "Ghána", "Marokkó", "Irán", "Nigéria", "Szerbia", "Norvégia", "Fehéroroszország", "Svédország", "Dél-Korea", "Ukrajna", "Magyarország", "Algéria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Aligátor", "Antilop", "Szamár", "Zebra", "Jegesmedve", "Kecske", "Bálna", "Gorilla", "Koala", "Teve", "Hiéna", "Béka", "Aranyhal", "Jaguár", "Pandamackó", "Juh", "Farkas", "Teknős", "Pingvin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipán", "Hagyma", "Cseresznye", "Tök", "Kávé", "Pitypang", "Ananász", "Földimogyoró", "Csalán", "Sárgabarack", "Kókuszdió", "Grépfrút", "Görögdinnye", "Dinnye", "Savós cseresznye", "Menta", "Fejes káposzta", "Borsó"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Szakács", "Mosogatógép", "Étel", "Szemetes", "Facsaró", "Sütő", "Recept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Mogyoróvaj", "Játékpénz", "Tacok", "Puding", "Húsgolyók", "Sült csirke", "Édesem", "Tenger gyümölcsei", "Sult krumpli", "Kolbász", "Hamburger", "Majonéz", "Pattogatott kukorica", "Sajtburger", "Hot dog", "Muffin", "Szalonna", "Ketchup", "Vaj", "Palacsinta"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolívia", "Kamerun", "Dél-Afrika", "Izland", "Románia", "Izrael", "Ecuador", "Észtország", "Peru", "Lettország", "Szlovákia", "Szlovénia", "Lengyelország", "Tunézia", "Argentína", "Vietnam", "Grúzia", "Albánia", "Monaco", "Nepál"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Házilúd", "Borz", "Vaddisznó", "Gólya", "Kenguru", "Anakonda", "Mókus", "Papagáj", "Hörcsög", "Sündisznó", "Viziló", "Bogár", "Párduc", "Polip", "Piton", "Pávián", "Vadászmenyét", "Barna medve", "Pelikán", "Holló"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Fekete áfonya", "Birsalma", "Kaktusz", "Retek", "Cékla", "Kakaó", "Mangó", "Torma", "Füge", "Szurokfű", "Lucfenyő", "Ribizli", "Padlizsán", "Borbolya", "Olajbogyó", "Brokkoli", "Kapor", "Spenót", "Karfiol"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Mélyhűtő", "Serpenyő", "Vízforraló", "Asztal", "Kenyérpirító", "Szűrőedény"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompót", "Olivaolaj", "Sertésszelet", "Csirkehúsleves", "Sajttorta", "Francia pirítós", "Marcipán", "Gulyás", "Fasírt", "Étcsokoládé", "Makaróni", "Mézeskalács", "Kerti sütés"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Örményország", "Észak Kórea", "Indonézia", "Chile", "Litvánia", "Malaysia", "Mali", "Montenegró", "Szenegál", "Paraguay", "Luxemburg", "Haiti", "Azerbajdzsán", "Uruguay", "Venezuela", "Irak", "Kuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Jávorszarvas", "Kondorkeselyű", "Vipera", "Sólyom", "Tengerimalac", "Pisztráng", "Fekete mamba", "Medúza", "Rénszarvas", "Láma", "Hattyú", "Fácán", "Fürj", "Lazac", "Skorpió", "Öszvér", "Bűzös borz", "Gazella", "Prérifarkas"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Körömvirág", "Boróka", "Pisztácia", "Pamut", "Bazsalikom", "Juharfa", "Nyárfa", "Rizs", "Avokádó", "Fekete bors", "Zeller", "Saláta", "Mustár", "Csipkebogyó", "Lótusz", "Kakukkfű"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Seprű", "Kínai evőpálcikák", "Csésze", "Nyírók", "Szita", "Alufólia", "Törülköző"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Krumplisaláta", "Karamell krém", "Gombóc", "Tökös pite", "Pörkölt", "Savanyú uborka", "Perec", "Kuszkusz", "Grillezett sajt", "Mozzarella", "Parmezán", "Sült rizs", "Keksz", "Sushi", "Almás pite"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganisztán", "Szaud-Arábia", "Elefántcsontpart", "Bahamák", "Bahrein", "Costa Rica", "El Salvador", "Kenya", "Guatemala", "Honduras", "Jordánia", "Libanon", "Katar", "Panama", "Libéria", "Singapore", "Thaiföld", "Jemen", "Málta", "Vatikán"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Hód", "Királykobra", "Flamingó", "Albatrosz", "Sirály", "Sakál", "Pacsirta", "Homár", "Nyest", "Rozmár", "Nyérc", "Bölény", "Tarajos sül", "Vörös panda", "Szalamandra", "Csalogány", "Vidra", "Hering"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Páfrány", "Gesztenye", "Eukaliptusz", "Nyír", "Égerfa", "Rebarbara", "Datolyapálma", "Lencse", "Spárga", "Tenyér", "Szegfű", "Len", "Dohány", "Gombó", "Lóhere", "Komló", "Fagyöngy", "Magnólia növény", "Hóvirág"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Kancsó", "Konyhai reszelő", "Kávéfőző gép", "Szappan", "Szivacs", "Kanál"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Paradicsom szósz", "Műzli", "Svájci sajt", "Tortilla", "Baklava", "Curry", "Guacamole", "Fehér csokoládé", "Ecet", "Forró csokoládé", "Tím szam", "Tészta carbonara", "Rizs puding", "Sült marhahús", "Csokoládétorta", "Zöldségleves", "Tészta leves", "Cézár saláta"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua és Barbuda", "Brunei", "Burundi", "Etiópia", "Fülöp-szigetek", "Gambia", "Kazahsztán", "Laosz", "Liechtenstein", "Barbados", "Madagaszkár", "San Marino", "Szíria", "Szomáliában", "Szudán", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Tatú", "Csincsilla", "Echidna", "Mosómedve", "Nemes kócsag", "Tasmaniai ördög", "Komodói sárkány", "Nyilascsukafélék", "Szarka", "Lamantin", "Prérikutya", "Seregély", "Tapír", "Tarsier", "Makimajom", "Meerkat", "Gyöngytyúk", "Oposszum"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Ánizs", "Bonszai", "Százszorszép", "Gránátalma", "Bambusz", "Búza", "Kelbimbó", "Csicseriborsó", "Wasabi", "Tátika", "Kökörcsin", "Papaja", "Édeskömény", "Paszternák", "Citrancs", "Rozmaring", "Krizantém", "Gyömbér"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Konyha", "Kés", "Szalvéta", "Hűtőszekrény", "Teáskanna", "Hőmérő", "Mosogató"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Túró", "Paella", "Lecsó", "Shawarma", "Tofu", "Kefir", "Darált marhahús", "Falafel", "Hummusz", "Tzatziki szósz", "Tiramisu", "Burgonya ékek", "Előétel", "Rétes", "Szaft"]);
  }

  void addID(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.id;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austria", "Belgium", "Brazil", "Kanada", "Cina", "Perancis", "Jerman", "Italia", "Meksiko", "Rusia", "Spanyol", "Amerika Serikat", "Jepang", "Belanda", "Australia", "Portugal", "Turki", "Bulgaria", "India", "Yunani"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Monyet", "Macan tutul", "Lumba-lumba", "Simpanse", "Buaya", "Gagak", "Rusa", "Kelinci", "Harimau", "Merpati", "Bebek", "Burung rajawali", "Gajah", "Jerapah", "Singa", "Beruang", "Kuda"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Kentang", "Anggrek", "Kacang polong", "Apel", "Mawar", "Jagung", "Bunga matahari", "Bawang putih", "Raspberi", "Stroberi", "Persik", "Jeruk", "Pir", "Prem", "Pisang", "Timun", "Anggur", "Tomat", "Wortel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Celemek", "Botol", "Pembuka botol", "Mangkuk", "Buku masak", "Alat makan", "Garpu"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Donat", "Kebab", "Kroisan", "Lasagna", "Keju", "Pizza", "Spageti", "Dadar", "Roti", "Kue", "Memanggang", "Yoghurt", "Makanan cepat saji", "Acar", "Sirup maple", "Roti panggang", "Cokelat", "Kentang tumbuk"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Siprus", "Kolumbia", "Republik Ceko", "Kroasia", "Denmark", "Mesir", "Swiss", "Finlandia", "Ghana", "Maroko", "Iran", "Nigeria", "Serbia", "Norway", "Belarus", "Swedia", "Korea Selatan", "Ukraina", "Hungaria", "Aljazair"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Antelop", "Keledai", "Badak", "Beruang kutub", "Kambing", "Ikan paus", "Gorila", "Unta", "Dubuk", "Katak", "Ikan mas", "Domba", "Serigala", "Penyu", "Pinguin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Bawang", "Ceri", "Labu", "Kopi", "Randa tapak", "Nanas", "Kacang kacangan", "Jelatang", "Aprikot", "Kelapa", "Jeruk bali", "Semangka", "Melon", "Ceri asam", "Daun mint", "Paprika", "Kubis"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Memasak", "Pencuci piring", "Makanan", "Tempat sampah", "Oven", "Resep"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Selai kacang", "Keripik", "Taco", "Puding", "Bakso", "Ayam panggang", "Madu", "Makanan laut", "Kentang goreng", "Sosis", "Roti isi daging", "Mayones", "Jagung meletus", "Burger keju kukus", "Hot Dog", "Daging babi asap", "Saus tomat", "Mentega", "Panekuk"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Kamerun", "Afrika Selatan", "Islandia", "Rumania", "Israel", "Ekuador", "Estonia", "Peru", "Latvia", "Slovakia", "Slovenia", "Polandia", "Tunisia", "Argentina", "Vietnam", "Georgia", "Albania", "Monako", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Angsa", "Babi hutan", "Bangau", "Kanguru", "Anakonda", "Tupai", "Burung beo", "Hamster", "Landak", "Kuda nil", "Kumbang", "Harimau kumbang", "Gurita", "Babon", "Musang", "Beruang coklat", "Pelikan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Kaktus", "Lobak", "Akar bit", "Mangga", "Lobak pedas", "Buah ara", "Merapikan", "Kismis", "Terong", "Zaitun", "Brokoli", "Bayam", "Kol bunga"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Penggorengan", "Ketel", "Meja", "Pemanggang roti", "Saringan", "Sudip"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompot", "Moussaka", "Pastrami", "Minyak zaitun", "Ravioli", "Susu kocok", "Potongan daging babi", "Sup ayam", "Kue keju", "Roti bakar", "Marzipan", "Daging cincang", "Burrito", "Makaroni", "Roti jahe", "Omongan", "Panggang"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "Korea Utara", "Indonesia", "Chili", "Lithuania", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luksemburg", "Haiti", "Azerbaijan", "Uruguay", "Venezuela", "Irak", "Kuba", "Jamaika"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Ular berbisa", "Elang", "Ikan forel", "Mamba hitam", "Ubur-ubur", "Rusa kutub", "Pegar", "Burung puyuh", "Hiu putih besar", "Ikan salmon", "Kalajengking", "Bagal", "Sigung", "Anjing hutan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Jintan saru", "Kapas", "Kemangi", "Poplar", "Nasi", "Alpukat", "Lada hitam", "Seledri", "Selada", "Moster", "Jeruk mandarin", "Teratai", "Timi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Sapu", "Sumpit", "Cangkir", "Gunting", "Handuk"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Salad kentang", "Pangsit", "Pai labu", "Roti lapis keju", "Mentimun acar", "Keju panggang", "Keju mozzarella", "Nasi goreng", "Biskuit", "Sushi", "Pai apel", "Ikan dan keripik"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistan", "Arab Saudi", "Pantai Gading", "Bahama", "Bahrain", "Kosta Rika", "El Salvador", "Kenya", "Guatemala", "Honduras", "Yordania", "Libanon", "Qatar", "Panama", "Liberia", "Singapura", "Thailand", "Yaman", "Malta", "Vatikan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Raja kobra", "Elang laut", "Camar", "Kukus", "Anjing laut", "Cerpelai", "Banteng", "Panda Merah", "Ikan pari", "Bulbul", "Berang-berang", "Ikan haring"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Lidah buaya", "Pakis", "Kastanye", "Perkelahian", "Kurma", "Kacang-kacangan", "Telapak tangan", "Anyelir", "Lenan", "Tembakau", "Okra", "Semanggi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Parutan", "Cerek penapis kopi", "Sabun mandi", "Spons", "Sendok"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Saos tomat", "Keju Swiss", "Tortilla", "Kari", "Guacamole", "Cokelat putih", "Cuka", "Coklat panas", "Pasta Carbonara", "Puding beras", "Sapi panggang", "Kue cokelat", "Sup sayuran", "Mie kuah"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua dan Barbuda", "Brunei", "Burundi", "Etiopia", "Filipina", "Gambia", "Kazakhstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Syria", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Rakun", "Kuntul", "Setan Tasmania", "Naga Komodo", "Murai", "Anjing padang rumput", "Jalak", "Tenuk", "Tarsius", "Pukang", "Ayam mutiara"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Adas manis", "Bunga aster", "Delima", "Bambu", "Gandum", "Kubis Brussel", "Buncis", "Wasabi", "Anemon", "Pepaya", "Pomelo", "Krisan", "Jahe"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Dapur", "Pisau", "Serbet", "Kulkas", "Teko", "Termometer", "Wastafel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Pondok keju", "Shawarma", "Tahu", "Kefir", "Daging giling", "Ricotta", "Hummus", "Saus Tzatziki", "Tiramisu", "Irisan kentang", "Saus"]);
  }

  void addIT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.it;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austria", "Belgio", "Brasile", "Canada", "Cina", "Francia", "Germania", "Italia", "Messico", "Russia", "Spagna", "Stati Uniti", "Giappone", "Olanda", "Australia", "Portogallo", "Turchia", "Bulgaria", "India", "Grecia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Topo", "Scimmia", "Leopardo", "Delfino", "Ghepardo", "Scimpanzé", "Coccodrillo", "Corvo", "Cervo", "Coniglio", "Squalo", "Tigre", "Piccione", "Anatra", "Aquila", "Elefante", "Giraffa", "Leone", "Orso", "Cavallo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Patata", "Orchidea", "Fagioli", "Mela", "Mais", "Girasole", "Aglio", "Lamponi", "Fragola", "Limone", "Arance", "Pera", "Prugna", "Banana", "Cetriolo", "Triticum", "Pomodoro", "Carota"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Grembiule", "Bottiglia", "Apri bottiglia", "Ciotola", "Ricettario", "Posate", "Forchetta"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Ciambella", "Pasta", "Kebab", "Croissant", "Lasagna", "Formaggio", "Pizza", "Spaghetti", "Frittata", "Gelato", "Pane", "Torta", "Arrosto", "Yogurt", "Fast food", "Sottaceti", "Sciroppo d'acero", "Brindare", "Cioccolato", "Purè di patate"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cipro", "Colombia", "Repubblica Ceca", "Croazia", "Danimarca", "Egitto", "Svizzera", "Finlandia", "Ghana", "Marocco", "Iran", "Nigeria", "Serbia", "Norvegia", "Bielorussia", "Svezia", "Corea del Sud", "Ucraina", "Ungheria", "Algeria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligatore", "Antilope", "Asino", "Rinoceronte", "Zebra", "Orso polare", "Capra", "Balena", "Gorilla", "Koala", "Cammello", "Iena", "Rana", "Pesce rosso", "Giaguaro", "Panda", "Pecora", "Lupo", "Tartaruga", "Pinguino"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipano", "Cipolla", "Ciliegie", "Zucca", "Caffè", "Dente di leone", "Ananas", "Arachidi", "Ortica", "Albicocca", "Noce di cocco", "Pompelmo", "Anguria", "Melone", "Amarene", "Menta", "Cavolo", "Piselli"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Cucinare", "Lavastoviglie", "Cibo", "Pattumiera", "Spremiagrumi", "Forno", "Ricetta"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Burro d'arachidi", "Tacos", "Budino", "Polpette di carne", "Pollo arrosto", "Miele", "Frutti di mare", "Patatine fritte", "Salsicce", "Hamburger", "Maionese", "Popcorn", "Big Mac", "Hot dog", "Cupcake", "Burro", "Pancake"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Camerun", "Sud Africa", "Islanda", "Romania", "Israele", "Ecuador", "Estonia", "Perù", "Lettonia", "Slovacchia", "Slovenia", "Polonia", "Tunisia", "Argentina", "Vietnam", "Georgia", "Albania", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Cinghiale", "Cicogna", "Canguro", "Anaconda", "Scoiattolo", "Pappagallo", "Criceto", "Riccio", "Ippopotamo", "Scarafaggio", "Pantera", "Polpo", "Pitone", "Babbuino", "Furetto", "Orso bruno", "Pellicano"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Mirtillo", "Mela cotogna", "Ravanello", "Barbabietola rossa", "Cacao", "Kiwi", "Mango", "Rafano", "Fichi", "Origano", "Abete rosso", "Ribes", "Melanzana", "Crespino", "Oliva", "Broccolo", "Aneto", "Spinaci", "Cavolfiore"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Congelatore", "Padella", "Bollitore", "Tavolo", "Tostapane", "Colino", "Spatola"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Pastrami", "Olio d'oliva", "Ravioli", "Frappè", "Braciola di maiale", "Zuppa di pollo", "Torta di formaggio", "Toast alla francese", "Marzapane", "Gulasch", "Polpettone", "Burrito", "Cioccolato fondente", "Maccheroni", "Pan di zenzero", "Cialda", "Barbecue"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "Corea del nord", "Indonesia", "Chile", "Lituania", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Lussemburgo", "Haiti", "Azerbaijan", "Uruguay", "Venezuela", "Iraq", "Cuba", "Giamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Alce", "Condor", "Vipera", "Falco", "Porcellino d'India", "Trota", "Mamba nero", "Medusa", "Renna", "Lama", "Cigno", "Fagiano", "Quaglia", "Grande squalo bianco", "Salmone", "Scorpione", "Mulo", "Puzzola", "Gazzella"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Pistacchio", "Ficus", "Cotone", "Basilico", "Acero", "Pioppo", "Riso", "Avocado", "Pepe nero", "Sedano", "Lattuga", "Senape", "Mandarino", "Rosa canina", "Loto", "Timo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Scopa", "Bastoncini", "Tazza", "Cesoie", "Setaccio", "Foglio di alluminio", "Asciugamano"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Insalata di patate", "Creme caramel", "Gnocco", "Torta di zucca", "Soffio", "Panino al formaggio", "Stufato", "Cetrioli marinati", "Salatino", "Currywurst", "Couscous", "Formaggio alla griglia", "Mozzarella", "Parmigiano", "Riso fritto", "Biscotti", "Sushi", "Torta di mele", "Pesce e patatine fritte"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Arabia Saudita", "Costa d'Avorio", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenia", "Guatemala", "Honduras", "Giordania", "Libano", "Qatar", "Panama", "Liberia", "Singapore", "Tailandia", "Yemen", "Malta", "Vaticano"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Castoro", "Cobra reale", "Fenicottero", "Albatro", "Gabbiano", "Sciacallo", "Allodola", "Loris", "Aragosta", "Tricheco", "Visone", "Bisonte", "Porcospino", "Panda rosso", "Salamandra", "Usignolo", "Lontra", "Aringa"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe Vera", "Felce", "Castagna", "Eucalipto", "Betulla", "Ontano", "Rabarbaro", "Dattero", "Lenticchie", "Asparago", "Palma", "Garofano", "Lino", "Tabacco", "Gombo", "Trifoglio", "Luppolo", "Vischio", "Magnolia", "Bucaneve"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Caraffa", "Grattugia", "Caffettiera a filtro", "Sapone", "Spugna", "Cucchiaio"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Salsa di pomodoro", "Muesli", "Formaggio svizzero", "Tortilla", "Baklava", "Curry", "Guacamole", "Cioccolato bianco", "Aceto", "Cioccolata calda", "Dim sum", "Pasta alla carbonara", "Budino di riso", "Arrosto di manzo", "Focaccina", "Torta al cioccolato", "Zuppa di verdure", "Zuppa di noodle", "Insalata Caesar"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua e Barbuda", "Brunei", "Burundi", "Etiopia", "Filippine", "Gambia", "Kazakistan", "Laos", "Liechtenstein", "Barbados", "Madagascar", "San Marino", "Siria", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Cincilla", "Anguilla", "Procione", "Garzetta", "Diavolo della Tasmania", "Gazza", "Lamantino", "Cane della prateria", "Tapiro", "Tarsier", "Lemure"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anice", "Bonsai", "Margherita", "Melograno", "Bambu", "Grano", "Cavoletti di Bruxelles", "Ceci", "Wasabi", "Sequoia", "Anemone", "Papaia", "Finocchio", "Pastinaca", "Pomelo", "Rosmarino", "Crisantemo", "Zenzero"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Cucina", "Coltello", "Tovagliolo", "Frigorifero", "Teiera", "Termometro", "Lavello"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Fiocchi di latte", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon bleu", "Kefir", "Carne di manzo macinata", "Falafel", "Ricotta", "Pasticcino", "Hummus", "Salsa tzatziki", "Tiramisu", "Fette di patate", "Antipasto", "Sugo"]);
  }

  void addMS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.ms;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austria", "Belgium", "Brazil", "Kanada", "China", "Perancis", "Jerman", "Itali", "Mexico", "Rusia", "Sepanyol", "Amerika Syarikat", "Jepun", "Belanda", "Australia", "Portugal", "Turki", "Bulgaria", "India", "Yunani"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Tetikus", "Monyet", "Lumba-lumba", "Buaya", "Rusa", "Arnab", "Ikan yu", "Harimau", "Merpati", "Itik", "Gajah", "Singa", "Kuda"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Kentang", "Orkid", "Kacang", "Epal", "Jagung", "Bunga matahari", "Bawang putih", "Raspberi", "Jeruk", "Pisang", "Timun", "Tomato", "Wortel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Botol", "Pembuka botol", "Mangkuk", "Buku masak", "Peralatan makan", "Garpu"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Keju", "Pizza", "Telur dadar", "Ais krim", "Roti", "Panggang", "Makanan segera", "Sirap maple", "Coklat", "Kentang lenyek"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cyprus", "Colombia", "Republik Czech", "Croatia", "Denmark", "Mesir", "Switzerland", "Finland", "Ghana", "Maghribi", "Iran", "Nigeria", "Serbia", "Norway", "Belarus", "Sweden", "Korea Selatan", "Ukraine", "Hungary", "Algeria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Keldai", "Badak", "Zebra", "Beruang kutub", "Kambing", "Paus", "Koala", "Unta", "Dubuk belang", "Katak", "Ikan emas", "Jaguar", "Panda", "Kambing biri-biri", "Kura-Kura"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Bawang", "Ceri", "Labu", "Kopi", "Nenas", "Kacang tanah", "Aprikot", "Kelapa", "Limau gedang", "Tembikai", "Ceri asam", "Kobis"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Masak", "Mesin basuh pinggan mangkuk", "Makanan", "Tin sampah", "Ketuhar", "Resipi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Mentega kacang", "Taco", "Puding", "Ayam panggang", "Madu", "Makanan laut", "Goreng Perancis", "Hamburger", "Mayonis", "Burger keju", "Sosej"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Kamerun", "Afrika Selatan", "Iceland", "Romania", "Israel", "Ecuador", "Estonia", "Peru", "Latvia", "Slovakia", "Slovenia", "Poland", "Tunisia", "Argentina", "Vietnam", "Georgia", "Albania", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Angsa", "Upeh", "Tupai", "Burung nuri", "Gurita", "Beruang coklat"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Kaktus", "Kakao", "Kiwi", "Mangga", "Buah ara", "Zaitun", "Brokoli", "Bayam", "Kembang kol"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Penyejuk beku", "Kuali", "Cerek", "Jadual", "Pemanggang roti"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Pastrami", "Minyak zaitun", "Ravioli", "Susu kocak", "Sup ayam", "Kek keju", "Roti Bakar", "Coklat gelap", "Barbeku"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "Korea Utara", "Indonesia", "Cili", "Lithuania", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxembourg", "Haiti", "Azerbaijan", "Uruguay", "Venezuela", "Iraq", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Babi Guinea", "Ubur-ubur", "Llama", "Swan", "Puyuh", "Jerung putih besar"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Pokok ara", "Kapas", "Nasi", "Alpukat", "Lada hitam", "Saderi", "Limau Mandarin", "Pinggang Rose"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Penyapu", "Penyepit", "Cawan", "Gunting", "Ayakan", "Kertas aluminium", "Tuala"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Salad kentang", "Karamel krim", "Pai labu", "Sandwich keju", "Timun jeruk", "Currywurst", "Keju panggang", "Mozzarella", "Nasi goreng", "Biskut", "Sushi", "Pai epal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Arab Saudi", "Pantai Gading", "Bahama", "Bahrain", "Costa rica", "El Salvador", "Kenya", "Guatemala", "Honduras", "Jordan", "Lubnan", "Qatar", "Panama", "Liberia", "Singapura", "Thailand", "Yaman", "Malta", "Vatican"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Raja cobra", "Albatros", "Landak", "Panda merah", "Salamander"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Lidah Buaya", "Berangan", "Eucalyptus", "Tarikh sawit", "Tembakau"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Teko", "Parut", "Sabun", "Span", "Sudu"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Sos tomato", "Muesli", "Keju Switzerland", "Tortilla", "Balavah", "Kari", "Guacamole", "Coklat putih", "Cuka", "Coklat panas", "Dim sum", "Pasta carbonara", "Puding beras", "Daging panggang", "Kek coklat", "Sup sayur-sayuran", "Mi sup"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua dan Barbuda", "Negara Brunei", "Burundi", "Ethiopia", "Filipina", "Gambia", "Kazakhstan", "Laos", "Liechtenstein", "Barbados", "Madagascar", "San Marino", "Syria", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Syaitan Tasmania", "Naga komodo", "Ikan Alu-alu", "Anjing prairie", "Tarsier"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anise", "Bonsai", "Buah delima", "Buluh", "Gandum", "Pucuk Brussels", "Wasabi", "Sequoia", "Anemone", "Papaya", "Adas", "Pomelo", "Halia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Dapur", "Pisau", "Serbet", "Peti sejuk", "Termometer", "Tenggelam"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Keju kotej", "Paella", "Ratatouille", "Tortellini", "Shawarma", "Tauhu", "Kefir", "Daging lembu", "Falafel", "Ricotta", "Hummus", "Sos Tzatziki", "Tiramisu", "Baji kentang", "Antipasto"]);
  }

  void addNL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.nl;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Oostenrijk", "België", "Brazilië", "Canada", "China", "Frankrijk", "Duitsland", "Italië", "Mexico", "Rusland", "Spanje", "Verenigde Staten", "Japan", "Nederland", "Australië", "Portugal", "Turkije", "Bulgarije", "India", "Griekenland"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Muis", "Aap", "Luipaard", "Dolfijn", "Jachtluipaard", "Chimpansee", "Krokodil", "Kraai", "Hert", "Konijn", "Haai", "Tijger", "Duif", "Eend", "Adelaar", "Olifant", "Giraffa", "Leeuw", "Beer", "Paard"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Aardappel", "Orchidee", "Bonen", "Appel", "Roos", "Maïs", "Zonnebloem", "Knoflook", "Frambozen", "Aardbei", "Citroen", "Perzik", "Sinaasappels", "Peer", "Pruim", "Banaan", "Komkommer", "Druif", "Tomaat", "Wortel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Schort", "Fles", "Flesopener", "Kom", "Kookboek", "Bestek", "Vork"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Donut", "Pasta", "Kebab", "Croissant", "Lasagne", "Kaas", "Pizza", "Spaghetti", "Omelet", "Ijsje", "Brood", "Gebraden", "Yoghurt", "Fast food", "Augurken", "Ahornsiroop", "Geroosterd brood", "Chocolade", "Aardappelpuree"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cyprus", "Colombia", "Tsjechische Republiek", "Kroatië", "Denemarken", "Egypte", "Zwitserland", "Finland", "Ghana", "Marokko", "Iran", "Nigeria", "Servië", "Noorwegen", "Wit-Rusland", "Zweden", "Zuid-Korea", "Oekraïne", "Hongarije", "Algerije"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligator", "Antilope", "Ezel", "Neushoorn", "Zebra", "Ijsbeer", "Geit", "Walvis", "Gorilla", "Koala", "Kameel", "Hyena", "Kikker", "Goudvis", "Jaguar", "Schapen", "Wolf", "Schildpad", "Pinguïn"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulp", "Ui", "Kersen", "Pompoen", "Koffie", "Paardebloem", "Ananas", "Brandnetel", "Abrikoos", "Kokosnoot", "Grapefruit", "Watermeloen", "Meloen", "Zure kersen", "Munt", "Kool", "Erwten"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Koken", "Vaatwasser", "Voedsel", "Vuilnisbak", "Oven", "Recept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Pindakaas", "Gehaktballen", "Gebraden kip", "Honing", "Zeevruchten", "Franse frietjes", "Worsten", "Hamburger", "Mayonaise", "Popcorn", "Cheeseburger", "Hotdog", "Koekje", "Spek", "Ketchup", "Boter", "Pannenkoek"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Kameroen", "Zuid-Afrika", "IJsland", "Roemenië", "Israël", "Ecuador", "Estland", "Peru", "Letland", "Slowakije", "Slovenië", "Polen", "Tunesië", "Argentinië", "Vietnam", "Georgië", "Albanië", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Gans", "Das", "Mannetjesvarken", "Ooievaar", "Kangoeroe", "Anaconda", "Eekhoorn", "Papegaai", "Hamster", "Egel", "Nijlpaard", "Kever", "Panter", "Octopoda", "Baviaan", "Fret", "Bruine beer", "Pelikaan", "Raaf"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Blauwe bosbes", "Kweepeer", "Cactus", "Radijs", "Rode biet", "Cacao", "Kiwi", "Mango", "Mierikswortel", "Vijgen", "Wilde marjolein", "Krenten", "Aubergine", "Berberis", "Olijf", "Broccoli", "Dille", "Spinazie", "Bloemkool"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Diepvries", "Frituurpan", "Waterkoker", "Tafel", "Tosti apparaat", "Vergiet", "Spatel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Compote", "Moussaka", "Pastrami", "Olijfolie", "Ravioli", "Milkshake", "Varkenskarbonade", "Kippensoep", "Kwarktaart", "Franse toast", "Marsepein", "Goulash", "Gehakt", "Burrito", "Donkere chocolade", "Macaroni", "Peperkoek", "Wafel", "Barbecue"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenië", "Noord Korea", "Indonesië", "Chili", "Litouwen", "Maleisië", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxemburg", "Haïti", "Azerbeidzjan", "Uruguay", "Venezuela", "Irak", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Eland", "Condor", "Adder", "Valk", "Cavia", "Forel", "Zwarte mamba", "Kwal", "Rendier", "Lama", "Zwaan", "Fazant", "Kwartel", "Zalm", "Schorpioen", "Muildier", "Stinkdier", "Gazellen", "Coyote"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Goudsbloem", "Jenever", "Pistache", "Ficus", "Katoen", "Basilicum", "Esdoorn", "Populier", "Rijst", "Avocado", "Zwarte peper", "Selderij", "Sla", "Mosterd", "Rozebottels", "Tijm"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Bezem", "Eetstokjes", "Kop", "Scharen", "Zeef", "Aluminiumfolie", "Handdoek"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Aardappelsalade", "Crème caramel", "Knoedel", "Pompoentaart", "Soufflé", "Kaas broodje", "Stoven", "Gepekelde komkommers", "Zoute krakeling", "Currywurst", "Couscous", "Gegrilde kaas", "Mozzarella", "Parmezaan", "Gebakken rijst", "Sushi", "Appeltaart"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Saoedi-Arabië", "Ivoorkust", "Bahamas", "Bahrein", "Costa Rica", "El Salvador", "Kenia", "Guatemala", "Honduras", "Jordanië", "Libanon", "Qatar", "Panama", "Liberia", "Singapore", "Thailand", "Jemen", "Malta", "Vaticaan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Bever", "Koningscobra", "Flamingo", "Albatros", "Zeemeeuw", "Jakhals", "Leeuwerik", "Kreeft", "Marter", "Walrus", "Nerts", "Bizon", "Stekelvarken", "Rode panda", "Salamanders", "Pijlstaartrog", "Nachtegaal", "Otter", "Haring"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloë vera", "Kastanje", "Eucalyptus", "Berk", "Els", "Rabarber", "Dadelpalm", "Linzen", "Asperge", "Anjer", "Vlas", "Tabak", "Okra", "Klaver", "Maretak", "Magnoliaslekten", "Sneeuwklokje"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karaf", "Rasp", "Filtreerkan", "Zeep", "Spons", "Lepel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Tomatensaus", "Müsli", "Zwitserse kaas", "Tortilla", "Baklava", "Kerrie", "Guacamole", "Witte chocolade", "Azijn", "Warme chocolademelk", "Dimsum", "Pasta carbonara", "Rijstpudding", "Rosbief", "Muffin", "Chocoladetaart", "Groentesoep", "Noedelsoep", "Caesar salade"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua en Barbuda", "Brunei", "Burundi", "Ethiopië", "Filippijnen", "Gambia", "Kazachstan", "Laos", "Liechtenstein", "Barbados", "Madagascar", "San Marino", "Syrië", "Somalië", "Soedan", "Togo", "Oeganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Gordeldier", "Chinchillaer", "Mierenegel", "Wasbeer", "Reiger", "Tasmaanse duivel", "Komodovaraan", "Barrakuda", "Ekster", "Lamantijnen", "Prairiehond", "Spreeuw", "Tapirs", "Tarsier", "Lemuren", "Meerkatten", "Parelhoen", "Buidelrat"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anijs", "Bonsai", "Madeliefje", "Granaatappel", "Bamboe", "Tarwe", "Spruitjes", "Kikkererwten", "Wasabi", "Sequoila", "Leeuwenbek", "Anemoon", "Papaja", "Venkel", "Pastinaak", "Pomelo", "Rosmarijn", "Chrysant", "Gember"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Keuken", "Mes", "Servet", "Koelkast", "Theepot", "Thermometer", "Wastafel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Kwark", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shoarma", "Tofu", "Kefir", "Rundergehakt", "Falafel", "Ricotta", "Eclair", "Hummus", "Tzatziki-saus", "Tiramisu", "Aardappelpartjes", "Voorgerechten"]);
  }

  void addNB(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.nb;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Østerrike", "Belgia", "Brasil", "Canada", "Kina", "Frankrike", "Tyskland", "Italia", "Mexico", "Russland", "Spania", "Forente Stater", "Japan", "Nederland", "Australia", "Portugal", "Tyrkia", "Bulgaria", "India", "Hellas"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Mus", "Ape", "Leopard", "Delfin", "Gepard", "Sjimpanse", "Krokodille", "Kråke", "Hjort", "Kanin", "Hai", "Tiger", "Due", "And", "Ørn", "Elefant", "Sjiraff", "Løve", "Bjørn", "Hest"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Potet", "Bønner", "Eple", "Rose", "Korn", "Hvitløk", "Bringebær", "Jordbær", "Sitron", "Fersken", "Appelsiner", "Pære", "Plomme", "Banan", "Agurk", "Drue", "Tomat", "Gulrot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Forkle", "Flaske", "Flaskeåpner", "Bolle", "Kokebok", "Bestikk", "Gaffel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Smultring", "Pasta", "Kebab", "Croissant", "Lasagne", "Ost", "Pizza", "Spagetti", "Omelett", "Iskrem", "Brød", "Kake", "Yoghurt", "Hurtigmat", "Sylteagurker", "Lønnesirup", "Skål", "Sjokolade", "Potetmos"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Kypros", "Colombia", "Tsjekkisk Republikk", "Kroatia", "Danmark", "Egypt", "Sveits", "Finland", "Ghana", "Marokko", "Iran", "Nigeria", "Serbia", "Norge", "Hviterussland", "Sverige", "Sør-Korea", "Ukraina", "Ungarn", "Algerie"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligatorer", "Antilope", "Esel", "Sebra", "Isbjørn", "Geit", "Hval", "Kamel", "Hyene", "Frosk", "Gullfisk", "Sau", "Ulv", "Skilpadde", "Pingvin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipan", "Løk", "Kirsebær", "Gresskar", "Kaffe", "Løvetann", "Ananas", "Peanøtter", "Nettle", "Aprikos", "Kokosnøtt", "Grapefrukt", "Vannmelon", "Melon", "Sure kirsebær", "Pepper", "Kål", "Erter"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Kokk", "Oppvaskmaskin", "Mat", "Søppelkasse", "Stekeovn", "Oppskrift"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Peanøttsmør", "Potetgull", "Taco", "Pudding", "Kjøttboller", "Stekt kylling", "Honning", "Sjømat", "Pommes frites", "Pølser", "Hamburger", "Majones", "Popcorn", "Osteburger", "Pølse", "Cupcake", "Bacon", "Ketchup", "Smør", "Pannekake"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Kamerun", "Sør-Afrika", "Island", "Romania", "Israel", "Ecuador", "Estland", "Peru", "Latvia", "Slovakia", "Slovenia", "Polen", "Tunisia", "Argentina", "Vietnam", "Georgia", "Albania", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Gås", "Villsvin", "Kenguru", "Anaconda", "Ekorn", "Papegøye", "Hamster", "Pinnsvin", "Flodhest", "Panter", "Blekksprut", "Bavian", "Brunbjørn", "Pelikan", "Ravn"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Blåbær", "Kaktus", "Reddik", "Rødbet", "Kakao", "Kiwi", "Mango", "Pepperrot", "Fiken", "Gran", "Solbær", "Aubergine", "Berberis", "Oliven", "Brokkoli", "Spinat", "Blomkål"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Fryseboks", "Stekepanne", "Kjele", "Bord", "Brødrister", "Dørslag", "Stekespade"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompott", "Moussaka", "Pastrami", "Oliven olje", "Ravioli", "Milkshake", "Kotelett", "Kyllingsuppe", "Ostekake", "Marsipan", "Gulasj", "Kjøttpudding", "Burrito", "Mørk sjokolade", "Makaroni", "Pepperkake"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "Nord-Korea", "Indonesia", "Chile", "Litauen", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxembourg", "Haiti", "Aserbajdsjan", "Uruguay", "Venezuela", "Irak", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Elg", "Condor", "Viper", "Falk", "Marsvin", "Ørret", "Svart mamba", "Manet", "Reinsdyr", "Stor hvithai", "Laks", "Skorpion", "Muldyr", "Stinkdyr", "Prærieulv"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Ficus", "Bomull", "Basilikum", "Lønnetre", "Poplar", "Ris", "Avokado", "Svart pepper", "Selleri", "Salat", "Sennep", "Mandarin appelsin", "Rose hofter", "Lotus", "Timian"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Kost", "Spisepinner", "Kopp", "Saks", "Sil", "Aluminiumsfolie", "Håndkle"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Potetsalat", "Kremkaramell", "Gresskarpai", "Ostesmørbrød", "Lapskaus", "Syltede agurker", "Pretzel", "Currywurst", "Pistachio", "Couscous", "Grillet ost", "Mozzarella", "Parmesan", "Stekt ris", "Kjeks", "Sushi", "Eple pai", "Fisk og chips"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Saudi-Arabia", "Elfenbenskysten", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenya", "Guatemala", "Honduras", "Jordan", "Libanon", "Qatar", "Panama", "Liberia", "Singapore", "Thailand", "Jemen", "Malta", "Vatikanet"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Bever", "Kongekobra", "Flamingo", "Albatrosser", "Måke", "Hummer", "Marten", "Hvalross", "Mink", "Bison", "Rød panda", "Salamander", "Nattergal", "Otter", "Sild"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Kastanje", "Bjørk", "Rabarbra", "Dato håndflate", "Linser", "Asparges", "Nellik", "Tobakk", "Okra", "Kløver", "Misteltein"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karaffel", "Rivjern", "Trakter", "Såpe", "Svamp", "Skje"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Tomatsaus", "Müsli", "Sveitsisk ost", "Tortilla", "Baklava", "Karri", "Guacamole", "Hvit sjokolade", "Eddik", "Varm sjokolade", "Dim sum", "Pasta carbonara", "Risgrøt", "Roastbiff", "Muffin", "Sjokoladekake", "Grønnsakssuppe", "Nudelsuppe", "Cæsarsalat"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua og Barbuda", "Brunei", "Burundi", "Etiopia", "Filippinene", "Gambia", "Kasakhstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Syria", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Vaskebjørn", "Hegre", "Tasmanisk djevel", "Komodovaran", "Præriehund", "Surikat", "Perlehøns"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anis", "Bonsai", "Tusenfryd", "Granateple", "Bambus", "Hvete", "Rosenkål", "Kikerter", "Wasabi", "Redwoodslekten", "Venusfluefanger", "Symreslekta", "Papaya", "Fenikkel", "Pastinakk", "Pomelo", "Ingefær"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kjøkken", "Kniv", "Serviett", "Kjøleskap", "Tekanne", "Termometer", "Synke"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Kesam", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Tofu", "Cordon Bleu", "Kefir", "Kjøttdeig", "Falafel", "Ricotta", "Hummus", "Tzatziki saus", "Tiramisu", "Potetbåter", "Antipasto", "Strudel", "Saus"]);
  }

  void addPL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.pl;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austria", "Belgia", "Brazylia", "Kanada", "Chiny", "Francja", "Niemcy", "Włochy", "Meksyk", "Rosja", "Hiszpania", "Stany Zjednoczone", "Japonia", "Holandia", "Australia", "Portugalia", "Turcja", "Bułgaria", "Indie", "Grecja"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Mysz", "Małpa", "Lampart", "Gepard", "Szympans", "Krokodyl", "Królik", "Tygrys", "Gołąb", "Kaczka", "Słoń", "Żyrafa", "Niedźwiedź"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Ziemniak", "Orchidea", "Fasola", "Kukurydza", "Słonecznik", "Czosnek", "Maliny", "Truskawka", "Brzoskwinia", "Pomarańcze", "Gruszka", "Śliwka", "Banan", "Ogórek", "Winogrono", "Pomidor", "Marchew"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Fartuch", "Butelka", "Otwieracz do butelek", "Miska", "Książka kucharska", "Sztućce", "Widelec"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Pączek", "Makaron", "Kebab", "Croissant", "Lasagne", "Ser", "Pizza", "Spaghetti", "Omlet", "Lody", "Chleb", "Ciasto", "Pieczeń", "Jogurt", "Fast food", "Syrop klonowy", "Czekolada", "Tłuczone ziemniaki"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cypr", "Kolumbia", "Republika Czeska", "Chorwacja", "Dania", "Egipt", "Szwajcaria", "Finlandia", "Ghana", "Maroko", "Iran", "Nigeria", "Serbia", "Norwegia", "Białoruś", "Szwecja", "Korea Południowa", "Ukraina", "Węgry", "Algieria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Aligator", "Antylopa", "Osioł", "Zebra", "Niedźwiedź polarny", "Koza", "Wieloryb", "Goryl", "Koala", "Wielbłąd", "Hiena", "Żaba", "Złota Rybka", "Jaguar", "Pandkowate", "Owce", "Żółw", "Pingwin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipan", "Cebula", "Wiśnie", "Dynia", "Kawa", "Ananas", "Orzeszki ziemne", "Pokrzywa", "Kokos", "Grejpfruty", "Arbuz", "Mennica", "Papryka", "Kapusta", "Groch"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Gotować", "Zmywarka", "Jedzenie", "Kosz na śmieci", "Sokowirówka", "Piekarnik", "Przepis"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Masło orzechowe", "Chipsy", "Taco", "Pudding", "Klopsiki", "Pieczony kurczak", "Kochanie", "Owoce morza", "Frytki", "Kiełbasy", "Hamburger", "Majonez", "Popcorn", "Hot Dog", "Cupcake", "Bekon", "Ketchup", "Masło", "Naleśnik"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Boliwia", "Kamerun", "Afryka Południowa", "Islandia", "Rumunia", "Izrael", "Ekwador", "Estonia", "Peru", "Łotwa", "Słowacja", "Słowenia", "Polska", "Tunezja", "Argentyna", "Wietnam", "Gruzja", "Albania", "Monako", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Gęś", "Borsuk", "Dzik", "Bocian", "Kangur", "Anaconda", "Wiewiórka", "Papuga", "Jeż", "Pantera", "Ośmiornica", "Pawian", "Fretka", "Brązowy niedźwiedź", "Pelikan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Borówka", "Pigwa", "Kaktus", "Rzodkiewka", "Buraki", "Kakao", "Chrzan", "Świerk", "Porzeczki", "Bakłażan", "Berberys", "Brokuły", "Szpinak", "Kalafior"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Zamrażarka", "Patelnia", "Czajnik", "Stół", "Opiekacz", "Durszlak", "Szpatułka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompot", "Oliwa z oliwek", "Kotlet schabowy", "Zupa z kurczaka", "Sernik", "Francuskie tosty", "Marcepan", "Gulasz", "Ciemna czekolada", "Makarony", "Piernik", "Wafel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andora", "Angola", "Armenia", "Korea Północna", "Indonezja", "Chile", "Litwa", "Malezja", "Mali", "Czarnogóra", "Senegal", "Paragwaj", "Luksemburg", "Haiti", "Azerbejdżan", "Urugwaj", "Wenezuela", "Irak", "Kuba", "Jamajka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Świnka morska", "Pstrąg", "Czarna mamba", "Meduza", "Renifer", "Łabędź", "Bażant", "Przepiórki", "Wielki biały rekin", "Łosoś", "Gazela", "Kojot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Pistacje", "Bawełna", "Klon", "Topola", "Awokado", "Czarny pieprz", "Seler", "Sałata", "Musztarda", "Mandarynka", "Różane biodra", "Tymianek"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Miotła", "Pałeczki do jedzenia", "Puchar", "Nożyce", "Sito", "Folia aluminiowa", "Ręcznik"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Pierogi", "Ciasto z dyni", "Suflet", "Kanapka z serem", "Kiszone ogórki", "Precel", "Currywurst", "Kuskus", "Grillowany ser", "Mozzarella", "Parmezan", "Smażony ryż", "Ciastka", "Sushi", "Szarlotka", "Ryba z frytkami"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistan", "Arabia Saudyjska", "Wybrzeże Kości Słoniowej", "Bahamy", "Bahrajn", "Kostaryka", "Salwador", "Kenia", "Gwatemala", "Honduras", "Jordania", "Liban", "Katar", "Panama", "Liberia", "Singapur", "Tajlandia", "Jemen", "Malta", "Watykan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Kobra królewska", "Mewa", "Szakal", "Żubr", "Jeżozwierz", "Czerwona Panda", "Salamandra", "Płaszczka", "Słowik", "Wydra", "Śledź"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloes", "Paproć", "Kasztan", "Brzoza", "Olcha", "Rabarbar", "Palma daktylowa", "Soczewica", "Szparagi", "Goździk", "Tytoń", "Koniczyna", "Chmiel", "Jemioła", "Przebiśnieg"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karafka", "Tarka", "Perkolator", "Mydło", "Gąbka", "Łyżka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Sos pomidorowy", "Musli", "Szwajcarski ser", "Biała czekolada", "Ocet", "Gorąca czekolada", "Makaron carbonara", "Pudding ryżowy", "Pieczona wołowina", "Ciasto czekoladowe", "Zupa jarzynowa", "Zupa z makaronem", "Sałatka Cezara"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua i Barbuda", "Brunei", "Burundi", "Etiopia", "Filipiny", "Gambia", "Kazachstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Syria", "Somali", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Pancernik", "Szynszyla", "Szop pracz", "Diabeł tasmański", "Smok Komodo", "Tarsier", "Surykatka", "Perliczka", "Opos"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anyż", "Bambus", "Pszenica", "Brukselka", "Ciecierzyca", "Wasabi", "Sekwoja", "Koper włoski", "Pomelo", "Chryzantema", "Imbir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kuchnia", "Nóż", "Serwetka", "Lodówka", "Czajniczek", "Termometr", "Tonąć"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Twaróg", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon Bleu", "Kefir", "Mielona wołowina", "Falafel", "Ricotta", "Hummus", "Sos Tzatziki", "Tiramisu", "Strudel", "Sos"]);
  }

  void addPT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.pt;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Áustria", "Bélgica", "Brasil", "Canadá", "China", "França", "Alemanha", "Itália", "México", "Rússia", "Espanha", "Estados Unidos", "Japão", "Países Baixos", "Austrália", "Portugal", "Turquia", "Bulgária", "Índia", "Grécia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Rato", "Macaco", "Leopardo", "Golfinho", "Guepardo", "Chimpanzé", "Crocodilo", "Corvo", "Coelho", "Tubarão", "Tigre", "Pombo", "Pato", "Águia", "Elefante", "Girafa", "Leão", "Urso", "Cavalo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Batata", "Orquídea", "Feijões", "Maçã", "Milho", "Girassol", "Alho", "Framboesas", "Morango", "Limão", "Pêssego", "Laranjas", "Pera", "Ameixa", "Pepino", "Tomate", "Cenoura"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Avental", "Garrafa", "Abridor de garrafa", "Tigela", "Livro de receitas", "Talheres", "Garfo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Rosquinha", "Massa", "Churrasquinho", "Lasanha", "Queijo", "Espaguete", "Omelete", "Sorvete", "Bolo", "Assado", "Iogurte", "Comida rápida", "Picles", "Torrada", "Purê de batata"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Chipre", "Colômbia", "República Checa", "Croácia", "Dinamarca", "Egito", "Suíça", "Finlândia", "Gana", "Marrocos", "Irã", "Nigéria", "Sérvia", "Noruega", "Bielorrússia", "Suécia", "Coreia do Sul", "Ucrânia", "Hungria", "Argélia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Jacaré", "Antílope", "Asno", "Rinoceronte", "Urso-polar", "Baleia", "Gorila", "Coala", "Camelo", "Hiena", "Peixinho", "Ovelhas", "Lobo", "Tartaruga", "Pinguim"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipa", "Cebola", "Cerejas", "Abóbora", "Café", "Dente De Leão", "Abacaxi", "Amendoim", "Urtiga", "Damasco", "Toranja", "Melancia", "Melão", "Cereja azeda", "Hortelã", "Pimentas", "Repolho", "Ervilhas"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Cozinhar", "Lava-louças", "Comida", "Lata de lixo", "Espremedor", "Forno", "Receita"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Salgadinhos", "Pudim", "Almôndegas", "Frango assado", "Frutos do mar", "Batatas fritas", "Salsichas", "Maionese", "Pipoca", "Cachorro quente", "Bolinho", "Manteiga", "Panqueca"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolívia", "Camarões", "África do Sul", "Islândia", "Romênia", "Israel", "Equador", "Estônia", "Peru", "Letônia", "Eslováquia", "Eslovênia", "Polônia", "Tunísia", "Argentina", "Vietnã", "Geórgia", "Albânia", "Mônaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Ganso", "Texugo", "Javali", "Cegonha", "Canguru", "Esquilo", "Papagaio", "Ouriço", "Hipopótamo", "Besouro", "Pantera", "Polvo", "Babuíno", "Furão", "Urso marrom", "Pelicano"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Boldo", "Marmelo", "Cacto", "Rabanete", "Beterraba", "Cacau", "Manga", "Rábano", "Figos", "Orégano", "Enfeitar", "Groselhas", "Berinjela", "Bérberis", "Oliva", "Brócolis", "Aneto", "Espinafre", "Couve-flor"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Congelador", "Frigideira", "Chaleira", "Mesa", "Torradeira", "Espátula"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Compota", "Azeite", "Sopa de galinha", "Bolo de queijo", "Torrada francesa", "Rolo de carne", "Chocolate escuro", "Macarrão", "Pão de gengibre", "Churrasco"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armênia", "Coreia do Norte", "Indonésia", "Chile", "Lituânia", "Malásia", "Mali", "Montenegro", "Senegal", "Paraguai", "Luxemburgo", "Haiti", "Azerbaijão", "Uruguai", "Venezuela", "Iraque", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Alce", "Víbora", "Falcão", "Cobaia", "Truta", "Mamba negra", "Cisne", "Faisão", "Codorna", "Salmão", "Escorpião", "Mula", "Gazela", "Coiote"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Zimbro", "Pistache", "Algodão", "Manjericão", "Bordo", "Álamo", "Arroz", "Abacate", "Pimenta preta", "Aipo", "Alface", "Mostarda", "Mandarina", "Lótus", "Tomilho"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Vassoura", "Pauzinhos", "Copo", "Tesoura de jardim", "Peneira", "Folha de alumínio", "Toalha"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Bolinho de massa", "Torta de abóbora", "Suflê", "Bobó", "Currywurst", "Cuscuz", "Mussarela", "Parmesão", "Arroz frito", "Biscoitos", "Sushi", "Torta de maçã"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afeganistão", "Arábia Saudita", "Costa do Marfim", "Bahamas", "Barém", "Costa Rica", "El Salvador", "Quênia", "Guatemala", "Honduras", "Jordânia", "Líbano", "Catar", "Panamá", "Libéria", "Cingapura", "Tailândia", "Iémen", "Malta", "Vaticano"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Albatroz", "Gaivota", "Chacal", "Cotovia", "Lagosta", "Morsa", "Vison", "Bisonte", "Porco-espinho", "Panda vermelho", "Salamandra", "Arraia", "Rouxinol", "Lontra", "Arenque"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Babosa", "Samambaia", "Castanha", "Eucalipto", "Bétula", "Amieiro", "Ruibarbo", "Tamareira", "Lentilhas", "Espargos", "Palma", "Cravo", "Linho", "Tabaco", "Quiabo", "Trevo", "Lúpulo", "Visco", "Magnólia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Jarra", "Ralador", "Coador", "Sabonete", "Esponja", "Colher"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Molho de tomate", "Muesli", "Tortilha", "Chocolate branco", "Vinagre", "Chocolate quente", "Macarrão Carbonara", "Arroz doce", "Carne assada", "Bolo de chocolate", "Sopa de vegetais", "Sopa de macarrão", "Salada César"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antígua e Barbuda", "Brunei", "Burundi", "Etiópia", "Filipinas", "Gâmbia", "Cazaquistão", "Laos", "Liechtenstein", "Barbados", "Madagáscar", "San Marino", "Síria", "Somália", "Sudão", "Togo", "Uganda", "Zâmbia", "Zimbábue", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Tatu", "Chinchila", "Equidna", "Guaxinim", "Garça", "Dragão-de-komodo", "Barracuda", "Pega", "Peixe-boi", "Estorninho", "Anta", "Társio", "Suricata", "Gambá"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anis", "Margarida", "Romã", "Bambu", "Trigo", "Couve de Bruxelas", "Grão de bico", "Wasabi", "Sequóia", "Planta carnívora", "Anêmona", "Mamão", "Funcho", "Pastinaga", "Pomelo", "Alecrim", "Crisântemo", "Gengibre"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Cozinha", "Faca", "Guardanapo", "Geladeira", "Termômetro", "Pia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Paelha", "Nhoque", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon Bleu", "Kefir", "Carne moída", "Falafel", "Ricota", "Homus", "Molho Tzatziki", "Tiramisu", "Antepasto", "Apfelstrudel", "Molho"]);
  }

  void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.ro;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Austria", "Belgia", "Brazilia", "Canada", "China", "Franţa", "Germania", "Italia", "Mexic", "Rusia", "Spania", "Statele Unite", "Japonia", "Olanda", "Australia", "Portugalia", "Turcia", "Bulgaria", "India", "Grecia"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Furnică", "Maimuţă", "Albină", "Pisică", "Ghepard", "Cimpanzeu", "Crocodil", "Cioară", "Cerb", "Câine", "Rechin", "Porc", "Porumbel", "Raţă", "Vultur", "Elefant", "Vulpe", "Girafă", "Balenă", "Iepure"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Brad", "Orhidee", "Fasole", "Cafea", "Trandafir", "Porumb", "Stejar", "Usturoi", "Zmeură", "Căpşună", "Lămâie", "Piersică", "Portocale", "Cartof", "Prun", "Banană", "Castravete", "Strugure", "Roşie", "Morcov"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Şorţ", "Sticlă", "Deschizător de sticle", "Castron", "Carte de bucate", "Tacâmuri", "Furculiţă"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Ciorbă de burtă", "Gulaş", "Mămăligă", "Sarmale", "Zacuscă", "Caşcaval", "Pizza", "Spaghete", "Omletă", "Îngheţată", "Pâine", "Prăjitură", "Friptură", "Iaurt", "Plăcintă", "Murătură", "Mititei", "Cozonac", "Ciocolată", "Piure de cartofi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cipru", "Columbia", "Republica Cehă", "Croaţia", "Danemarca", "Egipt", "Elveţia", "Finlanda", "Ghana", "Maroc", "Iran", "Nigeria", "Serbia", "Norvegia", "Belarus", "Suedia", "Coreea de Sud", "Ucraina", "Ungaria", "Algeria"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Aligator", "Antilopă", "Măgar", "Rinocer", "Delfin", "Bursuc", "Capră", "Hamster", "Gorilă", "Panteră", "Cămilă", "Leopard", "Broască", "Şoarece", "Tigru", "Bufniţă", "Oaie", "Cangur", "Pelican", "Pinguin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Lalea", "Ceapă", "Cireşe", "Dovleac", "Ovăz", "Nucă", "Păpădie", "Ananas", "Alune", "Spanac", "Caisă", "Nucă de cocos", "Grapefruit", "Pepene verde", "Pepene galben", "Vişine", "Floarea soarelui", "Ardei", "Varză", "Mazăre"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Bucătar", "Alimente", "Coş de gunoi", "Storcător", "Cuptor", "Reţetă"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Frigărui", "Cartofi prăjiţi", "Telemea", "Budincă", "Chiftele", "Fast food", "Salam", "Ardei umpluţi", "Chipsuri", "Cârnaţi", "Hamburger", "Maioneză", "Gogoaşă", "Pateu", "Hot Dog", "Covrig", "Slănină", "Ketchup", "Varză călită", "Clătite"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Camerun", "Africa de Sud", "Islanda", "România", "Israel", "Ecuador", "Estonia", "Peru", "Letonia", "Slovacia", "Slovenia", "Polonia", "Tunisia", "Argentina", "Vietnam", "Georgia", "Albania", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Gâscă", "Urs panda", "Mistreţ", "Barză", "Condor", "Zebră", "Veveriţă", "Papagal", "Păstrăv", "Arici", "Hipopotam", "Hienă", "Lebădă", "Caracatiţă", "Broască ţestoasă", "Jaguar", "Dihor", "Liliac", "Şobolan", "Corb"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Afin", "Gutui", "Cactus", "Ridiche", "Sfeclă roşie", "Cacao", "Kiwi", "Mango", "Hrean", "Smochine", "Urzică", "Molid", "Coacăze", "Vânătă", "Agrişă", "Măslin", "Broccoli", "Mărar", "Nufăr", "Conopidă"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Ladă frigorifică", "Tigaie", "Fierbător", "Masă", "Prăjitor de pâine", "Strecurătoare"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Compot", "Musaca", "Salată de vinete", "Urdă", "Salata de boeuf", "Caltaboş", "Milkshake", "Floricele de porumb", "Papanaşi", "Tochitură", "Pastramă", "Ghiveci", "Papricaş", "Borş", "Brânză topită", "Saramură", "Bacon", "Cuşcuş", "Iahnie", "Salată de icre"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenia", "Coreea de Nord", "Indonezia", "Chile", "Lituania", "Malaezia", "Mali", "Muntenegru", "Senegal", "Paraguay", "Luxemburg", "Haiti", "Azerbaidjan", "Uruguay", "Venezuela", "Irak", "Cuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Elan", "Salamandră", "Viperă", "Şoim", "Cobai", "Şacal", "Urs polar", "Meduză", "Koala", "Lamă", "Privighetoare", "Fazan", "Prepeliţă", "Ponei", "Somon", "Scorpion", "Catâr", "Sconcs", "Gazelă", "Coiot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Frasin", "Gălbenele", "Ienupăr", "Fistic", "Fragi", "Bumbac", "Busuioc", "Arţar", "Plop", "Clementină", "Orez", "Avocado", "Piper negru", "Ţelină", "Salată verde", "Muştar", "Mandarine", "Arahide", "Soia", "Cimbru"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Mătură", "Betişoare", "Ceaşcă", "Foarfece", "Sită", "Folie de aluminiu", "Prosop"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Colivă", "Cremă de zahăr ars", "Găluşte cu prune", "Piftie", "Şniţel vienez", "Lipie", "Pomana porcului", "Drob", "Lasagna", "Pufuleţi", "Smântână", "Mozzarella", "Parmezan", "Ciulama", "Salată orientală", "Sushi", "Mujdei", "Shaorma"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistan", "Arabia Saudită", "Coasta de Fildes", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenia", "Guatemala", "Honduras", "Iordania", "Liban", "Qatar", "Panama", "Liberia", "Singapore", "Tailanda", "Yemen", "Malta", "Vatican"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Castor", "Lemur", "Flamingo", "Albatros", "Pescăruş", "Coţofană", "Ciocârlie", "Babuin", "Homar", "Jder", "Morsă", "Nurcă", "Bizon", "Porc spinos", "Panda roşu", "Bibilică", "Pisică de mare", "Bivol", "Vidră", "Hering"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Ferigă", "Castan", "Eucalipt", "Mesteacăn", "Arin", "Rabarbăr", "Curmală", "Linte", "Sparanghel", "Palmier", "Garoafă", "Margaretă", "Tutun", "Gulie", "Bostan", "Hamei", "Iederă", "Magnolie", "Ghiocel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Carafă", "Răzătoare", "Percolator", "Săpun", "Spatulă", "Burete", "Linguriţă"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Fasole bătută", "Ciorbă de pui a la grec", "Musli", "Tacos", "Tortilla", "Baclava", "Curry", "Guacamole", "Varză a la Cluj", "Ciuperci umplute", "Ciorbă de perişoare", "Supă de pui", "Paste carbonara", "Ciocolată de casă", "Cartofi la cuptor", "Brioşe", "Tort de ciocolată", "Supă de legume", "Castraveţi muraţi", "Salata Caesar"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua si Barbuda", "Brunei", "Burundi", "Etiopia", "Filipine", "Gambia", "Kazahstan", "Laos", "Liechtenstein", "Barbados", "Madagascar", "San Marino", "Siria", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaca", "Armadillo", "Urs brun", "Anghilă", "Echidna", "Urs grizzly", "Egretă", "Gaiţă", "Dragonul de Komodo", "Loris", "Acvilă", "Lamantin", "Câine de preerie", "Graur", "Tapir", "Tarsier", "Şinşilă", "Suricată", "Cârtiţă", "Oposum"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anason", "Bonsai", "Corcoduş", "Rodie", "Bambus", "Grâu", "Varză de Bruxelles", "Năut", "Wasabi", "Sequoia", "Gura leului", "Ceai", "Anemonă", "Papaya", "Fenicul", "Păstârnac", "Pomelo", "Rozmarin", "Crizantemă", "Ghimbir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Bucătărie", "Cuţit", "Şerveţel", "Frigider", "Ceainic", "Termometru", "Chiuvetă"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Pandişpan", "Bulion de roşii", "Gnocchi", "Ratatouille", "Tortellini", "Fish and chips", "Tofu", "Cordon Bleu", "Salata iceberg", "Salam de biscuiţi", "Falafel", "Ricotta", "Ecler", "Hummus", "Sos tzatziki", "Tiramisu", "Cartofi wedges", "Cremşnit", "Ştrudel", "Ciorbă de spanac"]);
  }

  void addRU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.ru;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Австрия", "Бельгия", "Бразилия", "Канада", "Китай", "Франция", "Германия", "Италия", "Мексика", "Россия", "Испания", "Соединенные Штаты", "Япония", "Нидерланды", "Австралия", "Португалия", "Турция", "Болгария", "Индия", "Греция"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Мышь", "Обезьяна", "Леопард", "Дельфин", "Гепард", "Шимпанзе", "Крокодил", "Ворона", "Олень", "Кролик", "Акула", "Тигр", "Голубь", "Утка", "Орел", "Слон", "Жирафа", "Лев", "Лошадь"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Картофель", "Орхидея", "Фасоль", "Яблоко", "Роза", "Кукуруза", "Подсолнух", "Чеснок", "Малина", "Клубника", "Лимон", "Персик", "Апельсины", "Груша", "Слива", "Банан", "Огурец", "Виноград", "Помидор", "Морковь"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Фартук", "Бутылка", "Открывашка", "Миска", "Поваренная книга", "Столовые приборы", "Вилка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Пончик", "Макаронные изделия", "Кебаб", "Круассан", "Лазанья", "Сыр", "Пицца", "Спагетти", "Омлет", "Мороженое", "Хлеб", "Кекс", "Йогурт", "Быстрое питание", "Соленья", "Кленовый сироп", "Тост", "Шоколад", "Картофельное пюре"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Кипр", "Колумбия", "Республика Чехия", "Хорватия", "Дания", "Египет", "Швейцария", "Финляндия", "Гана", "Марокко", "Иран", "Нигерия", "Сербия", "Норвегия", "Беларусь", "Швеция", "Южная Корея", "Украина", "Венгрия", "Алжир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Аллигатор", "Антилопа", "Осел", "Носорог", "Зебра", "Полярный медведь", "Козел", "Горилла", "Коала", "Верблюд", "Гиена", "Лягушка", "Золотая рыбка", "Ягуар", "Панда", "Овца", "Волк", "Черепаха", "Пингвин"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Тюльпан", "Лук", "Черешня", "Тыква", "Кофе", "Одуванчик", "Ананас", "Арахис", "Крапива", "Абрикос", "Кокос", "Грейпфрут", "Арбуз", "Дыня", "Вишня кислая", "Мятный", "Капуста", "Горох"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Готовить", "Посудомоечная машина", "Питание", "Мусорное ведро", "Соковыжималка", "Духовой шкаф", "Рецепт"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Арахисовое масло", "Чипсы", "Тако", "Пудинг", "Фрикадельки", "Жареный цыпленок", "Мед", "Морепродукты", "Жареный картофель", "Колбасы", "Гамбургер", "Майонез", "Попкорн", "Чизбургер", "Хот-дог", "Бекон", "Кетчуп", "Сливочное масло", "Блин"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Боливия", "Камерун", "Южная Африка", "Исландия", "Румыния", "Израиль", "Эквадор", "Эстония", "Перу", "Латвия", "Словакия", "Словения", "Польша", "Тунис", "Аргентина", "Вьетнам", "Грузия", "Албания", "Монако", "Непал"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Гусь", "Барсук", "Боров", "Аист", "Кенгуру", "Анаконда", "Белочка", "Попугай", "Хомяк", "Ежик", "Гиппопотам", "Жук", "Пантера", "Осьминог", "Питон", "Бабуин", "Хорек", "Бурый медведь", "Пеликан", "Ворон"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Черника", "Айва", "Кактус", "Редис", "Бурак", "Какао", "Киви", "Манго", "Хрен", "Инжир", "Орегано", "Ель", "Смородина", "Баклажан", "Барбарис", "Оливковый", "Брокколи", "Укроп", "Шпинат", "Цветная капуста"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Морозилка", "Сковорода", "Чайник", "Таблица", "Тостер", "Дуршлаг", "Шпатель"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Компот", "Мусака", "Пастрами", "Оливковое масло", "Равиоли", "Молочный коктейль", "Свиная отбивная", "Куриный суп", "Чизкейк", "Французский тост", "Марципан", "Гуляш", "Мясной рулет", "Буррито", "Темный шоколад", "Макароны", "Имбирный пряник", "Вафельный", "Барбекю"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Андорра", "Ангола", "Армения", "Северная Корея", "Индонезия", "Чили", "Литва", "Малайзия", "Мали", "Черногория", "Сенегал", "Парагвай", "Люксембург", "Гаити", "Азербайджан", "Уругвай", "Венесуэла", "Ирак", "Куба", "Ямайка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Лось", "Кондор", "Гадюка", "Сокол", "Морская свинка", "Форель", "Черная мамба", "Медуза", "Северный олень", "Гуанако", "Лебедь", "Фазан", "Перепел", "Большая белая акула", "Лосось", "Скорпион", "Мул", "Скунс", "Газель", "Койот"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Ноготки", "Можжевельник", "Фисташковый", "Фикус", "Хлопок", "Бэзил", "Кленовый", "Тополь", "Клементин", "Рис", "Авокадо", "Черный перец", "Сельдерей", "Салат", "Горчичный", "Мандарин", "Шиповника", "Лотос", "Тимьян"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Метла", "Палочки для еды", "Чашка", "Ножницы", "Сито", "Алюминиевая фольга", "Полотенце"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Картофельный салат", "Крем-карамель", "Клецка", "Тыквенный пирог", "Суфле", "Сэндвич с сыром", "Тушеное мясо", "Маринованные огурцы", "Кренделек", "Кускус", "Жареный сыр", "Моцарелла", "Пармезан", "Жареный рис", "Булочки", "Суши", "Яблочный пирог", "Рыба и чипсы"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Афганистан", "Саудовская Аравия", "Кот-д'Ивуар", "Багамские о-ва", "Бахрейн", "Коста Рика", "Сальвадор", "Кения", "Гватемала", "Гондурас", "Иордания", "Ливан", "Катар", "Панама", "Либерия", "Сингапур", "Таиланд", "Йемен", "Мальта", "Ватикан"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Бобр", "Королевская кобра", "Фламинго", "Альбатрос", "Шакал", "Жаворонок", "Лорис", "Омар", "Куница", "Морж", "Норка", "Бизон", "Дикобраз", "Красная панда", "Саламандра", "Соловей", "Выдра", "Сельдь"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Алоэ вера", "Папоротник", "Каштан", "Эвкалипт", "Березовый", "Ольха", "Ревень", "Финиковая пальма", "Чечевица", "Спаржа", "Пальма", "Гвоздика", "Льняной", "Табак", "Окра", "Клевер", "Хмель", "Омела белая", "Магнолия", "Подснежник"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Графин", "Терка", "Перколятор", "Мыло", "Губка", "Ложка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Песто", "Томатный соус", "Мюсли", "Швейцарский сыр", "Пахлава", "Карри", "Гуакамоле", "Белый шоколад", "Уксус", "Горячий шоколад", "Дим сумма", "Паста карбонара", "Рисовый пудинг", "Жареная говядина", "Оладья", "Шоколадный торт", "Овощной суп", "Суп с лапшой", "Салат Цезарь"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Антигуа и Барбуда", "Бруней", "Бурунди", "Эфиопия", "Филиппины", "Гамбия", "Казахстан", "Лаос", "Лихтенштейн", "Барбадос", "Мадагаскар", "Сан-Марино", "Сирия", "Сомали", "Судан", "Того", "Уганда", "Замбия", "Зимбабве", "Бенин"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Альпака", "Броненосец", "Шиншилла", "Ехидна", "Енот", "Эгрет", "Тасманский дьявол", "Дракон Комодо", "Барракуда", "Ламантин", "Прерий собака", "Скворец", "Тапир", "Долгопят", "Лемур", "Опоссум"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Анис", "Маргаритка", "Гранатовый", "Бамбуковый", "Пшеница", "Нут", "Васаби", "Секвойя", "Львиный зев", "Анемон", "Папайя", "Пастернак", "Розмари", "Хризантема", "Имбирь"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Кухня", "Нож", "Салфетка", "Холодильник", "Заварочный чайник", "Термометр", "Раковина"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Творог", "Паэлья", "Ньокки", "Рататуй", "Пельмени", "Шаурма", "Тофу", "Кордон Блю", "Кефир", "Говяжий фарш", "Фалафель", "Рикотта", "Эклер", "Хумус", "Соус Цацики", "Тирамису", "Струдель", "Подливка"]);
  }

  void addSK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.sk;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Rakúsko", "Belgicko", "Brazília", "Kanada", "Čína", "Francúzsko", "Nemecko", "Taliansko", "Mexiko", "Rusko", "Španielsko", "Spojené štáty", "Japonsko", "Holandsko", "Austrália", "Portugalsko", "Turecko", "Bulharsko", "India", "Grécko"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Myš", "Opice", "Leopard", "Delfín", "Gepard", "Šimpanz", "Krokodíl", "Vrana", "Jeleň", "Králik", "Žralok", "Tiger", "Holub", "Kačica", "Orol", "Slon", "Žirafa", "Lev", "Medveď", "Kôň"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Zemiak", "Orchidea", "Fazuľa", "Jablko", "Rose", "Kukurica", "Slnečnica", "Cesnak", "Maliny", "Jahoda", "Citrón", "Broskyňa", "Pomaranče", "Hruška", "Slivka", "Banán", "Uhorka", "Zrnko vína", "Paradajka", "Mrkva"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Zástera", "Fľaša", "Otvárač na fľaše", "Miska", "Kuchárka", "Príbory", "Vidlička"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Šiška", "Cestoviny", "Kebab", "Rožok", "Lasagne", "Syr", "Pizza", "Špagety", "Omeleta", "Zmrzlina", "Chlieb", "Torta", "Pečienka", "Jogurt", "Rýchle občerstvenie", "Nakladaná zelenina", "Javorový sirup", "Toast", "Čokoláda", "Zemiaková kaša"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cyprus", "Kolumbia", "Česká republika", "Chorvátsko", "Dánsko", "Egypt", "Švajčiarsko", "Fínsko", "Ghana", "Maroko", "Irán", "Nigéria", "Srbsko", "Nórsko", "Bielorusko", "Švédsko", "Južná Kórea", "Ukrajina", "Maďarsko", "Alžírsko"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Aligátor", "Antilopa", "Somár", "Zebra", "Ľadový medveď", "Koza", "Veľrybie", "Gorila", "Koala", "Ťava", "Hyena", "Žaba", "Zlatá rybka", "Jaguár", "Panda", "Ovce", "Vlk", "Korytnačka", "Tučniak"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipán", "Cibuľa", "Čerešne", "Tekvica", "Káva", "Púpava", "Ananás", "Arašidy", "Žihľava", "Marhuľa", "Kokosový orech", "Grapefruit", "Vodný melón", "Melón", "Višne", "Mäta", "Kapusta", "Hrach"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Kuchár", "Umývačka riadu", "Jedlo", "Odpadkový kôš", "Odšťavovač", "Rúra", "Recept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Arašidové maslo", "Lupienky", "Tacos", "Puding", "Karbonátky", "Pečené kura", "Med", "Morské plody", "Hranolky", "Salámy", "Hamburger", "Majonéza", "Pražená kukurica", "Párok v rožku", "Košíček", "Slanina", "Kečup", "Maslo", "Palacinka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolívia", "Kamerun", "Južná Afrika", "Island", "Rumunsko", "Izrael", "Ekvádor", "Estónsko", "Peru", "Lotyšsko", "Slovensko", "Slovinsko", "Poľsko", "Tunisko", "Argentína", "Vietnam", "Georgia", "Albánsko", "Monaco", "Nepál"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Husia", "Jazvec", "Kanec", "Bocian", "Klokan", "Anakonda", "Veverička", "Papagáj", "Škrečok", "Ježko", "Chrobák", "Panter", "Chobotnica", "Krajta", "Pavián", "Fretka", "Hnedý medveď", "Pelikán", "Havran"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Čučoriedka", "Kaktus", "Reďkev", "Červená repa", "Kakao", "Kiwi", "Mango", "Chren", "Figy", "Oregano", "Fešný", "Ríbezle", "Baklažán", "Dráč", "Olivový", "Brokolica", "Kôpor", "Špenát", "Karfiol"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Mrazák", "Panvica", "Kanvice", "Stôl", "Opekač hrianok", "Cedidlo", "Špachtľa"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompót", "Pastrami", "Olivový olej", "Raviola", "Bravčová kotleta", "Kuracia polievka", "Tvarohový koláč", "Francúzsky toast", "Marcipán", "Guláš", "Sekaná", "Tmavá čokoláda", "Makarónmi", "Perník", "Vafle", "Opekačka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Arménsko", "Severná Kórea", "Indonézia", "Čile", "Litva", "Malajzia", "Mali", "Čierna Hora", "Senegal", "Paraguaj", "Luxembursko", "Haiti", "Azerbajdžan", "Uruguaj", "Venezuela", "Irak", "Kuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Kondor", "Zmija", "Sokol", "Morské prasa", "Pstruh", "Čierna Mamba", "Medúza", "Sob", "Lama", "Labuť", "Bažant", "Prepelica", "Veľký biely žralok", "Losos", "Škorpión", "Mulica", "Gazela", "Kojot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Nechtík", "Jalovec", "Pistácie", "Bavlna", "Bazalka", "Javor", "Topoľ", "Ryža", "Avokádo", "Čierne korenie", "Zeler", "Šalát", "Horčica", "Mandarinka oranžová", "Tymián"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Metla", "Paličky", "Pohár", "Nožnice", "Sito", "Alobal", "Uterák"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Zemiakový šalát", "Creme karamel", "Knedľa", "Tekvicový koláč", "Suflé", "Syrový sendvič", "Dusené mäso", "Nakladané uhorky", "Praclík", "Currywurst", "Kuskus", "Grilovaný syr", "Mozzarella", "Parmezán", "Vyprážaná ryža", "Sušienky", "Sushi", "Jablkový koláč", "Ryba a hranolky"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistan", "Saudská Arábia", "Pobrežie Slonoviny", "Bahamské ostrovy", "Bahrain", "Kostarika", "El Salvador", "Keňa", "Guatemala", "Honduras", "Jordán", "Libanon", "Katar", "Panama", "Libéria", "Singapore", "Thailand", "Jemen", "Malta", "Vatikán"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Bobor", "Kráľ kobra", "Plameniak", "Albatros", "Čajka", "Šakal", "Škovránok", "Homár", "Kuna", "Mrož", "Norok", "Bizón", "Dikobraz", "Červená Panda", "Slávik", "Vydra", "Sleď"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloa pravá", "Papraď", "Gaštan", "Eukalyptus", "Breza", "Jelša", "Rebarbora", "Dátum dlaň", "Šošovka", "Špargľa", "Dlaň", "Karafiát", "Ľan", "Tabak", "Ďatelina", "Chmeľ", "Imelo", "Magnólie", "Snežienka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karafa", "Strúhadlo", "Mydlo", "Špongia", "Lyžice"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Paradajková omáčka", "Musli", "Švajčiarsky syr", "Kari", "Biela čokoláda", "Ocot", "Horúca čokoláda", "Dim sum", "Cestoviny carbonara", "Ryžový nákyp", "Pečené hovädzie", "Mafin", "Čokoládový koláč", "Zeleninová polievka", "Rezancová polievka", "Cézar šalát"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua a Barbuda", "Brunej", "Burundi", "Etiópia", "Filipíny", "Gambia", "Kazachstan", "Laos", "Lichtenštajnsko", "Barbados", "Madagaskar", "San Maríno", "Sýria", "Somálsko", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Pásavec", "Činčila", "Medvedík čistotný", "Volavka", "Tasmánsky diabol", "Komodský drak", "Škorec", "Tapír", "Nártoun", "Šelmy", "Perlička", "Vačica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Aníz", "Bonsai", "Sedmokráska", "Granátové jablko", "Bambus", "Pšenica", "Ružičkový kel", "Cícer", "Wasabi", "Sekvoje", "Papuľka", "Venuša muchotrávka", "Sasanka", "Papája", "Fenikel", "Paštrnák", "Pomelo", "Rozmarín", "Chryzantéma", "Zázvor"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kuchyňa", "Nôž", "Obrúsok", "Chladnička", "Kanvica na čaj", "Teplomer", "Drez"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Tvaroh", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Kefír", "Mleté hovädzie mäso", "Falafel", "Tzatziki omáčka", "Tiramisu", "Zemiakové kliny", "Predjedál", "Závin", "Omáčka"]);
  }

  void addSL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.sl;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Avstrija", "Belgija", "Brazilija", "Kanada", "Kitajska", "Francija", "Nemčija", "Italija", "Mehika", "Rusija", "Španija", "Združene države", "Japonska", "Nizozemska", "Avstralija", "Portugalska", "Turčija", "Bolgarija", "Indija", "Grčija"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Miška", "Opica", "Leopard", "Delfin", "Gepard", "Šimpanz", "Krokodil", "Vrana", "Jelen", "Zajec", "Morski psi", "Tiger", "Golob", "Raca", "Orel", "Slon", "Žirafa", "Lev", "Medved", "Konj"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Krompir", "Orhideja", "Fižol", "Jabolko", "Vrtnica", "Koruza", "Sončnica", "Česen", "Maline", "Limona", "Breskev", "Pomaranče", "Hruška", "Slive", "Banana", "Kumare", "Grozdje", "Paradižnik", "Korenje"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Predpasnik", "Steklenice", "Odpirač za steklenice", "Skleda", "Kuharska knjiga", "Jedilni pribor", "Vilice"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Testenine", "Kebab", "Lazanja", "Sir", "Pizza", "Špageti", "Omleta", "Sladoled", "Kruh", "Torta", "Pečenka", "Jogurt", "Hitra hrana", "Kisle kumarice", "Javorjev sirup", "Čokolada", "Pire krompir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Ciper", "Kolumbija", "Češka", "Hrvaška", "Danska", "Egipt", "Švica", "Finska", "Gana", "Maroko", "Iran", "Nigerija", "Srbija", "Norveška", "Belorusija", "Švedska", "Južna Koreja", "Ukrajina", "Madžarska", "Alžirija"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Aligator", "Antilopa", "Osel", "Nosorog", "Zebra", "Polarni medved", "Koza", "Kit", "Gorila", "Koala", "Kamela", "Hijena", "Žaba", "Zlata ribica", "Jaguar", "Panda", "Ovca", "Volk", "Želva", "Pingvin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulipan", "Čebula", "Češnje", "Buče", "Jagode", "Kava", "Regrat", "Ananas", "Arašidi", "Koprive", "Marelice", "Kokos", "Grenivka", "Lubenica", "Melona", "Kisle češnje", "Meta", "Paprika", "Zelje", "Grah"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Kuhar", "Pomivalni stroj", "Hrana", "Posoda za smeti", "Sokovnik", "Pečica", "Recept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Arašidovo maslo", "Čips", "Tacosi", "Puding", "Mesne kroglice", "Pečen piščanec", "Medeni", "Morski sadeži", "Ocvrt krompirček", "Klobase", "Majoneza", "Pokovka", "Slanina", "Kečap", "Maslo", "Palačinka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivija", "Kamerun", "Južna Afrika", "Islandija", "Romunija", "Izrael", "Ekvador", "Estonija", "Peru", "Latvija", "Slovaška", "Slovenija", "Poljska", "Tunizija", "Argentina", "Vietnam", "Gruzija", "Albanija", "Monako", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Jazbec", "Kanec", "Štorklja", "Kenguru", "Anakonda", "Veverica", "Papiga", "Hrček", "Jež", "Hrošč", "Panter", "Hobotnica", "Piton", "Pavijan", "Fretka", "Rjavi medved", "Pelikan", "Krokar"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Borovnica", "Kutina", "Kaktus", "Redkev", "Rdeča pesa", "Kakav", "Kivi", "Hren", "Fige", "Origano", "Smreka", "Ribez", "Jajčevec", "Barbareša", "Oljka", "Brokoli", "Koper", "Špinača", "Cvetača"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Zamrzovalnik", "Ponev za cvrtje", "Kuhalnik", "Miza", "Opekač kruha", "Cedilo", "Lopatka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompot", "Oljčno olje", "Mlečni koktajl", "Svinjski kotlet", "Piščančja juha", "Francoski toast", "Marcipan", "Golaž", "Mesna pečenka", "Temna čokolada", "Makaroni", "Medenjaki", "Vaflji"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andora", "Angola", "Armenija", "Severna Koreja", "Indonezija", "Čile", "Litva", "Malezija", "Mali", "Črna gora", "Senegal", "Paragvaj", "Luksemburg", "Haiti", "Azerbajdžan", "Urugvaj", "Venezuela", "Irak", "Kuba", "Jamajka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Kondor", "Sokol", "Gvinejski prašiček", "Postrv", "Črna mamba", "Meduza", "Severni jelen", "Labod", "Fazan", "Prepelica", "Beli morski volk", "Losos", "Škorpijon", "Mula", "Skunk", "Gazela", "Kojot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Ognjič", "Brin", "Pistacija", "Fikus", "Bombaž", "Bazilika", "Javor", "Topol", "Riž", "Avokado", "Črni poper", "Zelena", "Solata", "Gorčica", "Šipek", "Lotos", "Timijan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Metla", "Paličice za rezanje", "Skodelica", "Škarje", "Sito", "Aluminijasta folija", "Brisača"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Krompirjeva solata", "Kremna karamela", "Bučna pita", "Sendvič s sirom", "Kuskus", "Sir na žaru", "Mocarela", "Parmezan", "Ocvrti riž", "Piškoti", "Suši", "Jabolčna pita", "Ribe in čips"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistan", "Savdska Arabija", "Slonokoščena obala", "Bahami", "Bahrajn", "Kostarika", "El Salvador", "Kenija", "Gvatemala", "Honduras", "Jordan", "Libanon", "Katar", "Panama", "Liberija", "Singapur", "Tajska", "Jemen", "Malta", "Vatikan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Bobri", "Kraljeva kobra", "Plamenci", "Albatros", "Čajka", "Šakal", "Škrjanec", "Humar", "Kuna", "Mrož", "Norka", "Bizon", "Ježevec", "Rdeča panda", "Salamandra", "Slavec", "Vidra", "Sled"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Aloe vera", "Praprot", "Kostanj", "Evkaliptus", "Breza", "Jelša", "Rabarbara", "Datljeva palma", "Leča", "Šparglji", "Palma", "Nageljni", "Lan", "Tobak", "Detelja", "Hmelj", "Omelo", "Magnolija", "Snežna kapica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karafa", "Strgalnik", "Perkolator", "Milo", "Gobica", "Žlica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Paradižnikova omaka", "Müsli", "Švicarski sir", "Kari", "Bela čokolada", "Kis", "Vroča čokolada", "Testenine carbonara", "Rižev puding", "Goveja pečenka", "Čokoladna torta", "Zelenjavna juha", "Juha z rezanci", "Cezarjeva solata"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigva in Barbuda", "Brunej", "Burundi", "Etiopija", "Filipini", "Gambija", "Kazahstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Sirija", "Somalija", "Sudan", "Togo", "Uganda", "Zambija", "Zimbabve", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Oklepnik", "Činčila", "Echidna", "Čaplja", "Tasmanski hudič", "Komodski zmaj", "Barakuda", "Straka", "Prerijski pes", "Škorec", "Tarzier", "Surikata", "Gvinejska ptica", "Osluna"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Janež", "Bonsaj", "Marjetica", "Granatno jabolko", "Bambus", "Pšenica", "Brstični ohrovt", "Čičerika", "Wasabi", "Sekvoja", "Sladkorja", "Venerina mušnica", "Podlesna vetrnica", "Papaja", "Koromač", "Pastinak", "Pomelo", "Rožmarin", "Krizantema", "Ingver"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kuhinja", "Nož", "Prtiček", "Hladilnik", "Čajnik", "Termometer", "Umivalnik"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Skuta", "Njoki", "Tortelini", "Shawarma", "Cordon Bleu", "Kefir", "Mleto goveje meso", "Falafel", "Rikota", "Tzatziki omaka", "Tiramisu", "Krompirjevi klini", "Antipasto", "Štrudelj", "Sivka"]);
  }

  void addSR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.sr;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Аустрија", "Белгија", "Бразил", "Канада", "Кина", "Француска", "Немачка", "Италија", "Мексико", "Русија", "Спаин", "Америка", "Јапан", "Нидерланды", "Аустралија", "Португал", "Турска", "Бугарска", "Индија", "Грчка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Миш", "Мајмун", "Леопард", "Делфин", "Гепард", "Шимпанза", "Крокодил", "Врана", "Јелен", "Зец", "Ајкула", "Тигер", "Голуб", "Дуцк", "Еагле", "Елепхант", "Жирафа", "Лав", "Медвед", "Хорсе"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Кромпир", "Орхидеја", "Пасуљ", "Јабука", "Ружа", "Кукуруз", "Сунцокрет", "Бели лук", "Малине", "Лимун", "Бресква", "Наранџе", "Крушка", "Шљива", "Банана", "Краставац", "Грожђа", "Парадајз", "Шаргарепа"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Кецеља", "Флаша", "Отварач за флаше", "Чинија", "Куварица", "Прибор за јело", "Виљушка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Крофна", "Тестенина", "Ћевап", "Кроасан", "Лазање", "Сир", "Пица", "Шпагети", "Омлет", "Сладолед", "Хлеб", "Торта", "Роаст", "Јогурт", "Кисели краставци", "Сируп од јавора", "Тост", "Чоколада", "Пире кромпир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Кипар", "Колумбија", "Чешка", "Хрватска", "Данска", "Египат", "Швајцарска", "Финланд", "Гана", "Мароко", "Иран", "Нигериа", "Србија", "Норвешка", "Белорусија", "Шведска", "Јужна Кореја", "Украјина", "Мађарска", "Алжир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Алигатор", "Антилопа", "Магарац", "Рхино", "Зебра", "Поларни медвед", "Коза", "Кит", "Горилла", "Коала", "Камила", "Хијена", "Жаба", "Златна рибица", "Јагуар", "Панда", "Овце", "Вук", "Корњача", "Пенгуин"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Тулип", "Лук", "Трешње", "Бундева", "Јагода", "Кафу", "Маслачак", "Ананас", "Кикирики", "Коприва", "Кајсија", "Кокос", "Грејпфрут", "Лубеница", "Диња", "Вишње", "Пепперс", "Купус", "Грашак"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Кувати", "Машина за прање судова", "Храна", "Смеће канта", "Соковник", "Пећница", "Рецепт"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Путер од кикирикија", "Чипс", "Тацос", "Пудинг", "Ћуфте", "Печена пилетина", "Душо", "Плодови мора", "Помфрит", "Кобасице", "Хамбургер", "Мајонез", "Кокице", "Цхеесебургер", "Хот дог", "Колачићу", "Сланина", "Кечап", "Маслац", "Палачинка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Боливија", "Камерун", "Јужна Африка", "Исланд", "Румунија", "Израел", "Еквадор", "Естонија", "Перу", "Летонија", "Словачка", "Словенија", "Пољска", "Тунис", "Аргентина", "Вијетнам", "Георгиа", "Албанија", "Монако", "Непал"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Гуска", "Салетати", "Вепар", "Рода", "Кенгур", "Анаконда", "Веверица", "Папагај", "Хамстер", "Јеж", "Нилски коњ", "Буба", "Пантер", "Оцтопус", "Питхон", "Бабуни", "Феррет", "Мрки медвед", "Пеликан", "Гавран"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Боровница", "Дуња", "Цацтус", "Ротквица", "Цвекла", "Какао", "Киви", "Манго", "Хрен", "Фиг", "Оригано", "Спруце", "Рибизле", "Плави патлиџан", "Барберри", "Маслина", "Броколи", "Мирођија", "Спанаћ", "Карфиол"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Замрзивач", "Тигањ", "Чајник", "Тостер", "Цоландер", "Спатула"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Компот", "Мусака", "Пастрами", "Маслиново уље", "Равиоли", "Милксхаке", "Крменадла", "Пилећа супа", "Чизкејк", "Прженица", "Марципан", "Гулаш", "Меатлоаф", "Буррито", "Тамна чоколада", "Макарони", "Гингербреад", "Вафл", "Роштиљ"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Андорра", "Ангола", "Јерменија", "Северна Кореја", "Индонезија", "Чиле", "Литванија", "Малезија", "Мали", "Црна Гора", "Сенегал", "Парагвај", "Луксембург", "Хаити", "Азербејџан", "Уругвај", "Венецуела", "Ирак", "Куба", "Јамајка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Лос", "Цондор", "Випер", "Фалцон", "Заморче", "Пастрмка", "Црна мамба", "Медузе", "Ирваси", "Ллама", "Сван", "Фазан", "Препелица", "Велика бела ајкула", "Лосос", "Сцорпион", "Муле", "Скунк", "Газела", "Којот"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Невен", "Клека", "Пистацхио", "Фицус", "Памук", "Босиљак", "Мапле", "Топол", "Пиринач", "Авокадо", "Црни бибер", "Целер", "Зелена салата", "Сенф", "Мандарина", "Шипурак", "Лотус", "Мајчина душица"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Метла", "Штапићи за јело", "Чаша", "Маказе", "Сито", "Алуминијумска фолија", "Пешкир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Кромпир салата", "Крем карамел", "Кнедле", "Пита од тикве", "Соуффле", "Сендвич са сиром", "Паприкаш", "Перец", "Цурривурст", "Кускус", "Сир на жару", "Моцарела", "Пармезан", "Пржени пиринач", "Кекс", "Сусхи", "Пита с јабукама", "Риба и помфрит"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Авганистан", "Саудијска Арабија", "Обала Слоноваче", "Бахами", "Бахреин", "Костарика", "Ел Салвадор", "Кенија", "Гватемала", "Хондурас", "Јордан", "Либан", "Катар", "Панама", "Либерија", "Сингапур", "Тајланд", "Јемен", "Малта", "Ватикан"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Беавер", "Краљевска кобра", "Фламинго", "Албатрос", "Галеб", "Шакал", "Ларк", "Лорис", "Јастог", "Мартен", "Морж", "Минк", "Бисон", "Бодљикаво прасе", "Црвена панда", "Саламандер", "Стинграи", "Славуј", "Видра", "Харинга"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Алое вера", "Ферн", "Кестен", "Еукалиптус", "Бреза", "Алдер", "Рабарбара", "Урма", "Сочиво", "Аспарагус", "Палма", "Каранфил", "Лан", "Дуван", "Бамија", "Цловер", "Хмељ", "Имела", "Магнолија"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Бокал", "Ренде", "Перцолатор", "Сапун", "Сунђер", "Кашика"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Песто", "Парадајз сос", "Мусли", "Швајцарски сир", "Тортиља", "Баклава", "Цурри", "Гуацамоле", "Бела чоколада", "Сирће", "Топла чоколада", "Дим сум", "Паста царбонара", "Сутлијаш", "Говеђе печење", "Муффин", "Чоколадна торта", "Супа од поврћа", "Супа са резанцима", "Цезар салата"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Антигва и Барбуда", "Брунеј", "Бурунди", "Етиопија", "Филипини", "Гамбија", "Казахстан", "Лаос", "Лихтенштајн", "Барбадос", "Мадагасцар", "Сан-Марино", "Сирија", "Сомалија", "Судан", "Того", "Уганда", "Замбија", "Зимбабве", "Бенин"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Алпаца", "Армадилло", "Цхинцхилла", "Ецхидна", "Ракун", "Егрет", "Тасманијски ђаво", "Комодо змај", "Баррацуда", "Сврака", "Манатее", "Преријски пас", "Старлинг", "Тапир", "Тарсиер", "Лемур", "Меркат", "Опсум"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Анис", "Бонсаи", "Бела Рада", "Шипак", "Бамбус", "Пшеница", "Прокељ", "Леблебије", "Васаби", "Секуоиа", "Венерина мухоловка", "Анемоне", "Папаја", "Коморач", "Пастрњак", "Помело", "Рузмарин", "Хризантема", "Ђумбир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Кухиња", "Нож", "Салвета", "Фрижидер", "Термометар", "Лавабо"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Швапски сир", "Паелла", "Њоке", "Рататоуилле", "Тортеллини", "Схаварма", "Тофу", "Плава трака", "Кефир", "Млевена јунетина", "Фалафел", "Рицотта", "Ецлаир", "Хумус", "Цацики сос", "Тирамису", "Кромпира клинови", "Антипасто", "Штрудла", "Умак"]);
  }

  void addSV(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.sv;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Österrike", "Belgien", "Brasilien", "Kanada", "Kina", "Frankrike", "Tyskland", "Italien", "Mexico", "Ryssland", "Spanien", "Förenta staterna", "Japan", "Nederländerna", "Australien", "Portugal", "Turkiet", "Bulgarien", "Indien", "Grekland"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Mus", "Apa", "Leopard", "Delfin", "Gepard", "Schimpans", "Krokodil", "Kråka", "Rådjur", "Kanin", "Haj", "Tiger", "Duva", "Anka", "Örn", "Elefant", "Giraff", "Lejon", "Björn", "Häst"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Potatis", "Orkide", "Bönor", "Äpple", "Reste sig", "Majs", "Solros", "Vitlök", "Hallon", "Citron", "Persika", "Apelsin", "Päron", "Plommon", "Banan", "Gurka", "Druva", "Tomat", "Morot"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Förkläde", "Flaska", "Flasköppnare", "Skål", "Kokbok", "Bestick", "Gaffel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Pasta", "Kebab", "Croissant", "Lasagne", "Ost", "Pizza", "Spagetti", "Omelett", "Glass", "Bröd", "Kaka", "Steka", "Yoghurt", "Snabbmat", "Ättiksgurka", "Lönnsirap", "Rostat bröd", "Choklad", "Potatismos"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Cypern", "Colombia", "Tjeckien", "Kroatien", "Danmark", "Egypten", "Schweiz", "Finland", "Ghana", "Marocko", "Iran", "Nigeria", "Serbien", "Norge", "Vitryssland", "Sverige", "Sydkorea", "Ukraina", "Ungern", "Algeriet"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Alligatorer", "Antilop", "Åsna", "Noshörning", "Zebror", "Isbjörn", "Gorillor", "Koala", "Kamel", "Hyenor", "Groda", "Guldfisk", "Jaguar", "Panda", "Varg", "Sköldpadda", "Pingvin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Tulpan", "Lök", "Körsbär", "Pumpa", "Kaffe", "Maskros", "Ananas", "Jordnötter", "Nässla", "Aprikos", "Kokos", "Grapefrukt", "Vattenmelon", "Melon", "Sura körsbär", "Mynta", "Kål", "Ärtor"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Kock", "Diskmaskin", "Mat", "Papperskorg", "Juicepress", "Ugn", "Recept"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Jordnötssmör", "Tacos", "Pudding", "Köttbullar", "Rostad kyckling", "Honung", "Skaldjur", "Pommes frites", "Korv", "Hamburgare", "Majonnäs", "Popcorn", "Ostburgare", "Varmkorv", "Cupcake", "Bacon", "Ketchup", "Smör", "Pannkaka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivia", "Kamerun", "Sydafrika", "Island", "Rumänien", "Israel", "Ecuador", "Estland", "Peru", "Lettland", "Slovakien", "Slovenien", "Polen", "Tunisien", "Argentina", "Vietnam", "Georgien", "Albanien", "Monaco", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Gås", "Grävling", "Vildsvin", "Känguru", "Anakonda", "Ekorre", "Papegoja", "Hamster", "Igelkott", "Flodhäst", "Skalbagge", "Panter", "Bläckfisk", "Pytonorm", "Babian", "Snoka", "Brun björn", "Pelikan", "Korp"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Blåbär", "Kvitten", "Kaktus", "Rädisa", "Rödbeta", "Kakao", "Kiwi", "Mango", "Pepparrot", "Fikon", "Oregano", "Gran", "Vinbär", "Äggplanta", "Berberis", "Oliv", "Broccoli", "Spenat", "Blomkål"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Frys", "Stekpanna", "Vattenkokare", "Tabell", "Brödrost", "Durkslag", "Spatel"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Kompott", "Moussaka", "Pastrami", "Olivolja", "Ravioli", "Milkshake", "Fläskkotlett", "Kycklingsoppa", "Cheesecake", "Fattiga riddare", "Marsipan", "Gulasch", "Köttfärslimpa", "Burrito", "Mörk choklad", "Makaroner", "Pepparkaka", "Våffla", "Utegrill"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angola", "Armenien", "Nordkorea", "Indonesien", "Chile", "Litauen", "Malaysia", "Mali", "Montenegro", "Senegal", "Paraguay", "Luxemburg", "Haiti", "Azerbajdzjan", "Uruguay", "Venezuela", "Irak", "Kuba", "Jamaica"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Älg", "Kondor", "Huggorm", "Falk", "Marsvin", "Forell", "Svart mamba", "Manet", "Ren", "Lama", "Svan", "Fasan", "Vaktel", "Stor vithaj", "Lax", "Mula", "Gasell", "Prärievarg"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Pistasch", "Ficus", "Bomull", "Basilika", "Lönn", "Poppel", "Ris", "Avokado", "Svartpeppar", "Selleri", "Sallad", "Senap", "Mandarin apelsin", "Nypon", "Lotus", "Timjan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Kvast", "Ätpinnar", "Kopp", "Sax", "Sikt", "Aluminiumfolie", "Handduk"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Potatissallad", "Kräm karamell", "Klimp", "Pumpa paj", "Ostmacka", "Gryta", "Inlagda gurkor", "Currywurst", "Couscous", "Grillad ost", "Mozzarella", "Parmesan", "Friterat ris", "Kex", "Sushi", "Äppelpaj", "Fisk och pommes frites"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afghanistan", "Saudiarabien", "Elfenbenskusten", "Bahamas", "Bahrain", "Costa Rica", "El Salvador", "Kenya", "Guatemala", "Honduras", "Jordanien", "Libanon", "Qatar", "Panama", "Liberia", "Singapore", "Thailand", "Jemen", "Malta", "Vatikanen"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Bäver", "Flamingor", "Albatrosser", "Fiskmås", "Schakal", "Lärka", "Hummer", "Mård", "Valross", "Mink", "Röd panda", "Salamandrar", "Stingrocka", "Näktergal", "Utter", "Sill"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Äkta aloe", "Ormbunke", "Kastanj", "Eukalyptus", "Björkar", "Rabarber", "Dadelpalm", "Linser", "Sparris", "Handflatan", "Nejlika", "Lin", "Tobak", "Okra", "Klöver", "Humle", "Mistel", "Snödroppe"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Karaff", "Rivjärn", "Perkolator", "Tvål", "Svamp", "Sked"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Tomatsås", "Mysli", "Schweizisk ost", "Tortilla", "Baklava", "Curry", "Guacamole", "Vit choklad", "Vinäger", "Varm choklad", "Dim sum", "Pasta carbonara", "Risgrynsgröt", "Rostbiff", "Muffin", "Chokladkaka", "Vegetarisk soppa", "Nudelsoppa", "Caesarsallad"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua och Barbuda", "Brunei", "Burundi", "Etiopien", "Filippinerna", "Gambia", "Kazakstan", "Laos", "Liechtenstein", "Barbados", "Madagaskar", "San Marino", "Syrien", "Somalia", "Sudan", "Togo", "Uganda", "Zambia", "Zimbabwe", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpacka", "Bälta", "Tasmansk djävul", "Komodovaran", "Barracuda", "Skata", "Präriehund", "Stare", "Tarsier", "Meerkat", "Pärlhöns"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anis", "Bonsai", "Granatäpple", "Bambu", "Vete", "Brysselkål", "Kikärtor", "Wasabi", "Sequoia", "Lejongap", "Anemon", "Papaya", "Fänkål", "Palsternacka", "Pomelo", "Rosmarin", "Krysantemum", "Ingefära"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Kök", "Kniv", "Servett", "Kylskåp", "Tekanna", "Termometer", "Sjunka"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Keso", "Paella", "Gnocchi", "Ratatouille", "Tortellini", "Shawarma", "Tofu", "Cordon bleu", "Kefir", "Köttfärs", "Falafel", "Ricotta", "Eclair", "Hummus", "Tzatziki-sås", "Tiramisu", "Potatisklyftor", "Antipasto", "Strudel", "Sås"]);
  }

  void addTR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.tr;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Avusturya", "Belçika", "Brezilya", "Kanada", "Çin", "Fransa", "Almanya", "İtalya", "Meksika", "Rusya", "Ispanya", "Amerika Birleşik Devletleri", "Japonya", "Hollanda", "Avustralya", "Portekiz", "Türkiye", "Bulgaristan", "Hindistan", "Yunanistan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Maymun", "Leopar", "Yunus", "Çita", "Şempanze", "Timsah", "Karga", "Geyik", "Tavşan", "Köpekbalığı", "Kaplan", "Güvercin", "Ördek", "Kartal", "Fil", "Zürafa", "Aslan", "Ayı", "At"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Patates", "Orkide", "Fasulyeler", "Elma", "Mısır", "Ayçiçeği", "Sarımsak", "Ahududu", "Çilek", "Limon", "Şeftali", "Portakal", "Armut", "Erik", "Muz", "Salatalık", "Üzüm", "Domates", "Havuç"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Önlük", "Şişe", "Şişe açacağı", "Kase", "Yemek kitabı", "Çatal bıçak takımı", "Çatal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Tatlı çörek", "Makarna", "Kebap", "Kruvasan", "Lazanya", "Peynir", "Pizza", "Spagetti", "Omlet", "Dondurma", "Ekmek", "Kek", "Rosto", "Yoğurt", "Salatalık turşusu", "Akçaağaç şurubu", "Kızarmış ekmek", "Çikolata", "Patates püresi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Kıbrıs", "Kolombiya", "Çek Cumhuriyeti", "Hırvatistan", "Danimarka", "İsviçre", "Finlandiya", "Gana", "Fas", "İran", "Nijerya", "Sırbistan", "Norveç", "Belarus", "İsveç", "Güney Kore", "Ukrayna", "Macaristan", "Cezayir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Antilop", "Eşek", "Gergedan", "Zebra", "Kutup ayısı", "Keçi", "Balina", "Goril", "Koala", "Deve", "Sırtlan", "Kurbağa", "Akvaryum balığı", "Jaguar", "Panda", "Koyun", "Tosbağa", "Penguen"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Lale", "Soğan", "Kirazlar", "Kabak", "Kahve", "Karahindiba", "Ananas", "Yer fıstığı", "Isırgan", "Kayısı", "Hindistan cevizi", "Greyfurt", "Karpuz", "Kavun", "Ekşi kirazlar", "Nane", "Biberler", "Lahana", "Bezelye"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Pişirmek", "Bulaşık makinesi", "Gıda", "Çöp tenekesi", "Sıkacağı", "Fırın", "Yemek tarifi"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Fıstık ezmesi", "Cips", "Tacos", "Puding", "Köfteler", "Kızarmış tavuk", "Bal", "Deniz ürünleri", "Sosisler", "Hamburger", "Mayonez", "Patlamış mısır", "Çizburger", "Sosisli", "Domuz pastırması", "Ketçap", "Tereyağı"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Bolivya", "Kamerun", "Güney Afrika", "İzlanda", "Romanya", "İsrail", "Ekvador", "Estonya", "Peru", "Letonya", "Slovakya", "Slovenya", "Polonya", "Tunus", "Arjantin", "Vietnam", "Gürcistan", "Arnavutluk", "Monako", "Nepal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Kaz", "Porsuk", "Domuz", "Leylek", "Kanguru", "Anakonda", "Sincap", "Papağan", "Hamster", "Kirpi", "Suaygırı", "Böcek", "Panter", "Ahtapot", "Habeş maymunu", "Dağgelinciği", "Kahverengi ayı", "Pelikan", "Kuzgun"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Yaban mersini", "Ayva", "Kaktüs", "Turp", "Pancar kökü", "Kakao", "Kivi", "Bayır turpu", "Incir", "Kekik", "Ladin", "Kuş üzümü", "Patlıcan", "Sarıçalı", "Zeytin", "Brokoli", "Dereotu", "Ispanak", "Karnıbahar"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Dondurucu", "Kızartma tavası", "Su ısıtıcısı", "Tablo", "Tost makinası", "Kevgir"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Komposto", "Musakka", "Pastırma", "Zeytin yağı", "Aromalı süt", "Domuz pirzolası", "Tavuk çorbası", "Çizkek", "Fransız usulü tost", "Badem ezmesi", "Gulaş", "Et Dilimi", "Börek", "Bitter çikolata", "Zencefilli çörek", "Barbekü"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Andorra", "Angora", "Ermenistan", "Kuzey Kore", "Endonezya", "Şili", "Litvanya", "Malezya", "Mali", "Karadağ", "Senegal", "Paraguay", "Lüksemburg", "Haiti", "Azerbeycan", "Uruguay", "Venezuela", "Irak", "Küba", "Jamaika"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Engerek", "Şahin", "Gine domuzu", "Alabalık", "Siyah mamba", "Deniz anası", "Ren geyiği", "Kuğu", "Sülün", "Bıldırcın", "Somon", "Akrep", "Katır", "Kokarca", "Ceylân", "Çakal"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Kadife çiçeği", "Ardıç", "Fıstık", "Pamuk", "Fesleğen", "Akçaağaç", "Kavak", "Pirinç", "Avokado", "Karabiber", "Kereviz", "Marul", "Hardal", "Mandalina", "Kuşburnu"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Süpürge", "Çin yemek çubukları", "Fincan", "Makas", "Elek", "Aliminyum folyo", "Havlu"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Patates salatası", "Krem Karamel", "Meyveli börek", "Balkabağı pastası", "Sufle", "Peynirli sandviç", "Güveç", "Çubuk kraker", "Currywurst", "Kuskus", "Izgara peynir", "Parmesan Peyniri", "Kızarmış pirinç", "Bisküvi", "Suşi", "Elmalı turta"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Afganistan", "Suudi Arabistan", "Fildişi Sahili", "Bahamalar", "Bahreyn", "Kosta Rika", "El Salvador", "Kenya", "Guatemala", "Honduras", "Ürdün", "Lübnan", "Katar", "Panama", "Liberya", "Singapur", "Tayland", "Yemen", "Malta", "Vatikan"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Kunduz", "Kral Kobra", "Albatros", "Martı", "Istakoz", "Sansar", "Mors", "Vizon", "Bizon", "Kırmızı panda", "Semender", "Vatoz", "Bülbül", "Su samuru", "Ringa"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Eğrelti", "Kestane", "Okaliptüs", "Huş ağacı", "Kızılağaç", "Ravent", "Hurma ağacı", "Mercimek", "Kuşkonmaz", "Avuç içi", "Karanfil", "Keten", "Tütün", "Bamya", "Yonca", "Şerbetçiotu", "Ökseotu", "Manolya", "Kardelen"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Sürahi", "Rende", "Süzücü", "Sabun", "Sünger", "Kaşık"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Pesto", "Domates sosu", "Müsli", "Isviçre peyniri", "Tortilla", "Baklava", "Köri", "Guacamole", "Beyaz çikolata", "Sirke", "Sıcak çikolata", "Dim toplamı", "Makarna Carbonara", "Sütlaç", "Dana rosto", "Çikolatalı kek", "Sebze çorbası", "Şehriye çorbası", "Sezar salatası"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Antigua ve Barbuda", "Brunei", "Burundi", "Etiyopya", "Filipinler", "Gambiya", "Kazakistan", "Laos", "Lihtenştayn", "Barbados", "Madagaskar", "San Marino", "Suriye", "Somali", "Sudan", "Togo", "Uganda", "Zambiya", "Zimbabve", "Benin"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Alpaka", "Armadillo", "Çinçilla", "Echidna", "Rakun", "Tazmanya Canavarı", "Komodo Ejderhası", "Saksağan", "Denizayısı", "Çayırköpeği", "Sığırcık", "Tapir", "Tarsier", "Maki", "Mirket", "Beç"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Anason", "Bonsai", "Papatya", "Bambu", "Buğday", "Brüksel lahanası", "Nohut", "Wasabi", "Sekoya", "Aslanağzı", "Anemon", "Papaya", "Rezene", "Yaban havucu", "Biberiye", "Krizantem", "Zencefil"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Mutfak", "Bıçak", "Peçete", "Buzdolabı", "Demlik", "Termometre", "Lavabo"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Süzme peynir", "Ratatouille", "Tortellini", "Şavurma", "Soya peyniri", "Cordon Bleu", "Kefir", "Dana kıyma", "Falafel", "İtalyan peyniri", "Cacık Sosu", "Tiramisu", "Patates dilimleri", "Antipsto"]);
  }

  void addUK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      HangmanGameQuestionConfig questionConfig) {
        var language = Language.uk;
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff0, //
            ["Австрія", "Бельгія", "Бразилія", "Канада", "Китай", "Франція", "Німеччина", "Італія", "Мексика", "Росія", "Іспанія", "Сполучені Штати", "Японія", "Нідерланди", "Австралія", "Португалія", "Туреччина", "Болгарія", "Індія", "Греція"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff0, //
            ["Миша", "Мавпа", "Леопард", "Дельфін", "Гепард", "Шимпанзе", "Крокодил", "Ворона", "Олень", "Кролик", "Акула", "Тигр", "Голуб", "Качка", "Орел", "Слон", "Жирафа", "Лев", "Ведмідь", "Кінь"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff0, //
            ["Картопля", "Орхідея", "Квасоля", "Яблуня", "Роза", "Кукурудза", "Соняшник", "Часник", "Малина", "Полуниця", "Лимон", "Персик", "Апельсини", "Груша", "Слива", "Банан", "Огірок", "Виноград", "Помідор", "Морква"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff0, //
            ["Фартух", "Пляшка", "Відкривачка для пляшок", "Миску", "Кулінарна книга", "Столові прибори", "Вилка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff0, //
            ["Пончик", "Кебаб", "Круасан", "Лазанья", "Сир", "Піца", "Спагетті", "Омлет", "Морозиво", "Хліб", "Торт", "Смажена", "Йогурт", "Фастфуд", "Соління", "Кленовий сироп", "Тост", "Шоколад", "Картопляне пюре"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff1, //
            ["Кіпр", "Колумбія", "Чеська Республіка", "Хорватія", "Данія", "Єгипет", "Швейцарія", "Фінляндія", "Гана", "Марокко", "Іран", "Нігерія", "Сербія", "Норвегія", "Білорусь", "Швеція", "Південна Корея", "Україна", "Угорщина", "Алжир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff1, //
            ["Алігатор", "Антилопа", "Осел", "Носоріг", "Зебра", "Полярний ведмідь", "Козел", "Кит", "Горила", "Коала", "Верблюд", "Гієна", "Жаба", "Золота рибка", "Ягуар", "Панда", "Вівці", "Вовк", "Черепаха", "Пінгвін"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff1, //
            ["Тюльпан", "Цибуля", "Вишні", "Гарбуз", "Кава", "Кульбаба", "Ананас", "Арахіс", "Кропива", "Абрикос", "Кокосовий горіх", "Грейпфрут", "Кавун", "Диня", "Вишня", "М’ятний", "Перець", "Капуста", "Горох"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff1, //
            ["Готувати", "Посудомийна машина", "Їжа", "Сміттєвий бак", "Соковижималка", "Піч", "Рецепт"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff1, //
            ["Арахісове масло", "Фішки", "Тако", "Пудинг", "Фрикадельки", "Смажена курка", "Морепродукти", "Картопля фрі", "Ковбаски", "Гамбургер", "Майонез", "Попкорн", "Чізбургер", "Хот-дог", "Кекс", "Бекон", "Кетчуп", "Масло вершкове", "Млинець"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff2, //
            ["Болівія", "Камерун", "Південна Африка", "Ісландія", "Румунія", "Ізраїль", "Еквадор", "Естонія", "Перу", "Латвія", "Словаччина", "Словенія", "Польща", "Туніс", "Аргентина", "В'єтнам", "Грузія", "Албанія", "Монако", "Непал"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff2, //
            ["Гуска", "Барсук", "Кабан", "Лелека", "Кенгуру", "Анаконда", "Білка", "Папуга", "Хом'як", "Їжак", "Бегемот", "Жук", "Пантера", "Восьминіг", "Пітон", "Бабуїн", "Ferret", "Бурий ведмідь", "Пелікан", "Ворон"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff2, //
            ["Чорниця", "Айва", "Кактус", "Редька", "Буряк", "Какао", "Ківі", "Манго", "Хрін", "Рис", "Орегано", "Ялина", "Смородина", "Баклажани", "Барбарис", "Оливкова", "Брокколі", "Кріп", "Шпинат", "Цвітна капуста"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff2, //
            ["Морозильна камера", "Сковорідка", "Чайник", "Стіл", "Тостер", "Друшляк", "Шпатель"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff2, //
            ["Компот", "Мусака", "Пастрамі", "Оливкова олія", "Равіолі", "Молочний коктейль", "Свиняча відбивна", "Курячий суп", "Чізкейк", "Французький тост", "Марципан", "Гуляш", "М’ясний хліб", "Буріто", "Темний шоколад", "Макарони", "Пряники", "Вафлі", "Барбекю"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff3, //
            ["Андорра", "Ангола", "Вірменія", "Північна Корея", "Індонезія", "Чилі", "Литва", "Малайзія", "Малі", "Чорногорія", "Сенегал", "Парагвай", "Люксембург", "Гаїті", "Азербайджан", "Уругвай", "Венесуела", "Ірак", "Куба", "Ямайка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff3, //
            ["Лось", "Кондор", "Гадюка", "Сокіл", "Морська свинка", "Форель", "Чорна мамба", "Медузи", "Олені", "Лама", "Лебідь", "Фазан", "Перепелиці", "Велика біла акула", "Лосось", "Скорпіон", "Скункс", "Газель", "Койот"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff3, //
            ["Ялівець", "Фісташки", "Фікус", "Бавовна", "Василь", "Клен", "Тополя", "Клементин", "Авокадо", "Чорний перець", "Селера", "Листя салату", "Гірчиця", "Мандарин апельсин", "Шипшина", "Лотос", "Чебрець"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff3, //
            ["Мітла", "Палички для їжі", "Чашка", "Ножиці", "Решето", "Алюмінієва фольга", "Рушник"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff3, //
            ["Картопляний салат", "Крем-карамель", "Пельмені", "Гарбузовий пиріг", "Суфле", "Сирний сендвіч", "Тушковане м'ясо", "Мариновані огірки", "Крендель", "Кускус", "Смажений сир", "Моцарелла", "Пармезан", "Смажений рис", "Печиво", "Суші", "Яблучний пиріг", "Риба і чіпси"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff4, //
            ["Афганістан", "Саудівська Аравія", "Берег Слонової Кістки", "Багами", "Бахрейн", "Коста-Ріка", "Сальвадор", "Кенія", "Гватемала", "Гондурас", "Йорданія", "Ліван", "Катар", "Панама", "Ліберія", "Сінгапур", "Таїланд", "Ємен", "Мальта", "Ватикан"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff4, //
            ["Бобр", "Кобра короля", "Фламінго", "Альбатрос", "Чайка", "Шакал", "Жайворонок", "Лоріс", "Омари", "Куниця", "Морж", "Норка", "Зубр", "Дикобраз", "Червона панда", "Саламандра", "Соловей", "Видра", "Оселедець"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff4, //
            ["Алое віра", "Папороть", "Каштан", "Евкаліпт", "Береза", "Ольха", "Ревінь", "Фінікова пальма", "Сочевиця", "Спаржа", "Долоня", "Гвоздика", "Льон", "Тютюн", "Конюшина", "Хміль", "Омела", "Магнолія", "Пролісок"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff4, //
            ["Графин", "Терка", "Перколятор", "Мило", "Шпателем", "Губка", "Ложка"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff4, //
            ["Песто", "Томатний соус", "Мюслі", "Швейцарський сир", "Тортилья", "Баклава", "Каррі", "Гуакамоле", "Білий шоколад", "Оцет", "Гарячий шоколад", "Невиразна сума", "Рисовий пудинг", "Ростбіф", "Булочка", "Шоколадний торт", "Овочевий суп", "Суп з локшиною", "Салат Цезар"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat0, //
            questionConfig.diff5, //
            ["Антигуа та Барбуда", "Бруней", "Бурунді", "Ефіопія", "Філіппіни", "Гамбія", "Казахстан", "Лаос", "Ліхтенштейн", "Барбадос", "Мадагаскар", "Сан-Марино", "Сирія", "Сомалі", "Судан", "Того", "Уганда", "Замбія", "Зімбабве", "Бенін"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat1, //
            questionConfig.diff5, //
            ["Альпака", "Армаділло", "Шиншила", "Ехідна", "Єнот", "Чапля", "Тасманійський диявол", "Дракон Комодо", "Барракуда", "Сорока", "Менеджер", "Прерійний пес", "Старлінг", "Тапір", "Тарсьє", "Лемур", "Цесарки"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat2, //
            questionConfig.diff5, //
            ["Аніс", "Бонсай", "Ромашка", "Гранат", "Бамбук", "Пшениця", "Брюсельська капуста", "Нут", "Васабі", "Секвоя", "Венера мухоловка", "Анемона", "Папайя", "Фенхель", "Помело", "Розмарин", "Хризантема", "Імбир"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat3, //
            questionConfig.diff5, //
            ["Кухня", "Ніж", "Серветка", "Холодильник", "Термометр", "Раковина"]);
        addQuestions(
            result, //
            language, //
            questionConfig.cat4, //
            questionConfig.diff5, //
            ["Паелья", "Клецки", "Рататуй", "Тортелліні", "Шаурма", "Тофу", "Кордон Блю", "Кефір", "Яловичий фарш", "Фалафель", "Рікотта", "Еклер", "Хумус", "Соус Цацікі", "Тирамісу", "Картопляні клини", "Антипасто", "Штрудель", "Граві"]);
  }

}
