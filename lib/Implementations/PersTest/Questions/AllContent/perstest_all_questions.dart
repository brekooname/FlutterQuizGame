import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class PersTestAllQuestions extends AllQuestionsService {
  static final PersTestAllQuestions singleton = PersTestAllQuestions.internal();

  factory PersTestAllQuestions() {
    return singleton;
  }

  PersTestAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    //
    ////
    ///////
    var questionConfig = PersTestGameQuestionConfig();
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

  void addAR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.ar;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["أنا مشهور في المناسبات الاجتماعية", "أنا لا أهتم بالآخرين", "أنا دائما على استعداد", "أشعر بالتوتر بسهولة", "لدي مفردات غنية", "لا اتحدث كثيرا", "أنا مهتم بالناس", "أترك متعلقاتي حولها", "أنا مرتاح معظم الوقت", "أجد صعوبة في فهم الأفكار المجردة", "أشعر بالراحة مع الناس", "أنا أهين الناس", "انتبه للتفاصيل", "أنا قلق بشأن الأشياء", "لدي خيال حي", "أحب أن أكون في الخلفية", "أنا عاطفي", "أنا أرتكب الكثير من الأخطاء", "لا أشعر بالحزن كثيرًا", "أنا لست مهتمًا بالأفكار المجردة", "أبدأ المحادثات", "أنا لست مهتمًا بمشاكل الآخرين", "أنا أنجز الأعمال المنزلية على الفور", "أنا منزعج بسهولة", "لدي أفكار ممتازة", "لدي القليل لأقوله", "لدي قلب رقيق", "غالبًا ما أنسى إعادة الأشياء إلى مكانها الصحيح", "أنا منزعج بسهولة", "ليس لدي خيال جيد", "أتحدث إلى العديد من الأشخاص المختلفين في الحفلات", "أنا لست مهتمًا بالآخرين", "أنا أحب الانضباط", "لقد غيرت مزاجي كثيرا", "أنا سريع في فهم الأشياء", "لا أحب أن ألفت الانتباه إلى نفسي", "أنا أمنح وقتا للأخريين", "أتجنب مسؤولياتي", "لدي تقلبات مزاجية متكررة", "أنا أستخدم كلمات معقدة", "لا مانع من أن أكون مركز الاهتمام", "أشعر بمشاعر الآخرين", "أنا أتبع الجدول الزمني", "أنا غاضب بسهولة", "أقضي الوقت في التفكير في الأشياء", "أنا هادئ حول الغرباء", "أجعل الناس يشعرون بالراحة", "أنا مجبرة في عملي", "كثيرا ما أشعر بالحزن", "أنا مليء بالأفكار"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["أشعر أنني شخص ذو قيمة ، أو على الأقل مساوٍ للآخرين", "أشعر أن لدي عددًا من الصفات الحميدة", "أنا أميل إلى الشعور بأنني فاشل", "يمكنني إنجاز أشياء جيدة مثل الآخرين", "أشعر أنه ليس لدي الكثير لأفخر به", "أتخذ موقفا إيجابيا تجاه نفسي", "بشكل عام ، أنا راضٍ عن نفسي", "أتمنى أن أحظى بمزيد من الاحترام لنفسي", "أشعر أحيانًا بأنني عديم الفائدة", "في بعض الأحيان أعتقد أنني لست جيدًا على الإطلاق"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["أضع الناس تحت الضغط", "لدي حاجة ماسة للسلطة", "أحاول التفوق على الآخرين", "أنا أبحث دائمًا عن طرق لكسب المال", "أنا أستمتع بكوني جزءًا من حشد صاخب", "أريد أن يحبني الغرباء", "أنا أمزح كثيرا", "أنا أحدث الكثير من الضوضاء", "أتردد في انتقاد أفكار الآخرين", "أقدر التعاون على المنافسة", "أريد أن يكون الجميع متساوين", "نادرا ما أتباهى", "أنا متحفظ عاطفيا", "أنا أهتم بالتفاصيل", "أنا أحب النظام والانتظام", "أول رد فعل لي على فكرة ما هو رؤية عيوبها"]);
  }

  void addBG(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.bg;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Популярен съм на социални събития", "Не ми пука за другите", "винаги съм подготвен", "Лесно се стресирам", "Имам богат речник", "не говоря много", "Интересувам се от хората", "Оставям вещите си наоколо", "През повечето време съм спокоен", "Трудно разбирам абстрактните идеи", "Чувствам се комфортно сред хората", "обиждам хората", "Обръщам внимание на детайлите", "Тревожа се за нещата", "Имам живо въображение", "Харесва ми да съм на заден план", "Аз съм сантиментален", "Правя много грешки", "Не се чувствам тъжен често", "Не се интересувам от абстрактни идеи", "Започвам разговори", "Не се интересувам от проблемите на другите", "Свърша си задълженията веднага", "Лесно се смущавам", "Имам страхотни идеи", "Имам малко за казване", "Имам меко сърце", "Често забравям да върна нещата на правилното им място", "Лесно се разстройвам", "Нямам добро въображение", "Говоря с много различни хора на партита", "Други не ме интересуват", "Обичам дисциплината", "Много си променям настроението", "Бързо разбирам нещата", "Не обичам да привличам внимание към себе си", "Отделям време за другите", "Избягвам отговорностите си", "Имам чести промени в настроението", "Използвам сложни думи", "Нямам нищо против да съм център на внимание", "Чувствам другите емоции", "Спазвам график", "Лесно се дразня", "Прекарвам време в размисъл върху нещата", "При непознати съм тих", "Карам хората да се чувстват комфортно", "Взискателна съм в работата си", "Често се чувствам тъжен", "Пълна съм с идеи"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Чувствам, че съм ценен човек или поне равен с другите", "Чувствам, че притежавам редица добри качества", "Склонен съм да чувствам, че съм провал", "Мога да постигам неща толкова добре, колкото другите хора", "Чувствам, че няма с какво да се гордея", "Имам положително отношение към себе си", "Като цяло съм доволен от себе си", "Иска ми се да имам повече уважение към себе си", "Понякога се чувствам безполезен", "Понякога си мисля, че изобщо не съм добър"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Подлагам хората под натиск", "Имам силна нужда от власт", "Опитвам се да надмина другите", "Винаги търся начини да печеля пари", "Харесва ми да съм част от шумна тълпа", "Искам непознатите да ме обичат", "Много се шегувам", "Вдигам много шум", "Колебая се да критикувам идеите на други хора", "Ценя сътрудничеството пред конкуренцията", "Искам всички да са равни", "рядко се хваля", "Аз съм емоционално резервиран", "Интересувам се от детайлите", "Обичам ред и редовност", "Първата ми реакция на една идея е да видя нейните недостатъци"]);
  }

  void addCS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.cs;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Jsem oblíbený na společenských akcích", "O ostatní se nestarám", "Jsem vždy připraven", "Snadno se vystresuji", "Mám bohatou slovní zásobu", "Moc nemluvím", "Zajímají mě lidé", "Nechávám své věci kolem", "Většinu času jsem v klidu", "Mám potíže s chápáním abstraktních myšlenek", "Cítím se dobře mezi lidmi", "Urážím lidi", "Věnuji pozornost detailům", "Dělám si starosti o věci", "Mám bujnou představivost", "Líbí se mi být v pozadí", "Jsem sentimentální", "Dělám mnoho chyb", "Necítím se často smutný", "Nemám zájem o abstraktní myšlenky", "Začínám konverzace", "Problémy ostatních mě nezajímají", "Úkoly mám hotové hned", "Jsem snadno vyrušitelný", "Mám skvělé nápady", "Mám málo co říct", "Mám měkké srdce", "Často zapomínám vrátit věci na správné místo", "Snadno se rozčílím", "Nemám dobrou představivost", "Na večírcích mluvím se spoustou různých lidí", "O ostatní se nezajímám", "Mám rád pořádek", "Hodně měním náladu", "Rychle věcem rozumím", "Nerad na sebe poutám pozornost", "Beru si čas na ostatní", "Vyhýbám se svým povinnostem", "Mám časté výkyvy nálad", "Používám složitá slova", "Nevadí mi být středem pozornosti", "Cítím emoce ostatních", "Řídím se rozvrhem", "Snadno se rozčílím", "Trávím čas přemýšlením o věcech", "Mezi cizími lidmi jsem potichu", "Dávám lidem pocit pohodlí", "Jsem ve své práci náročný", "Často je mi smutno", "Jsem plný nápadů"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Cítím, že jsem hodnotný člověk nebo alespoň rovnocenný s ostatními", "Cítím, že mám řadu dobrých vlastností", "Mám sklon mít pocit, že jsem neúspěšný", "Mohu dělat věci stejně dobře jako ostatní lidé", "Cítím, že nemám být na co hrdý", "Zaujímám k sobě kladný vztah", "Celkově jsem se sebou spokojená", "Přál bych si mít k sobě více respektu", "Někdy si připadám zbytečná", "Občas si myslím, že nejsem vůbec dobrý"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Dostávám lidi pod tlak", "Mám silnou potřebu moci", "Snažím se překonávat ostatní", "Neustále hledám způsoby, jak vydělat peníze", "Baví mě být součástí hlasitého davu", "Chci, aby mě cizí lidé milovali", "Hodně si dělám legraci", "Dělám hodně hluku", "Váhám kritizovat myšlenky jiných lidí", "Vážím si spolupráce před konkurencí", "Chci, aby si byli všichni rovni", "Málokdy se chlubím", "Jsem citově rezervovaný", "Záleží mi na detailech", "Miluji řád a pravidelnost", "Moje první reakce na nápad je vidět jeho nedostatky"]);
  }

  void addDA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.da;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Jeg er populær til sociale arrangementer", "Jeg er ligeglad med andre", "Jeg er altid forberedt", "Jeg bliver nemt stresset", "Jeg har et rigt ordforråd", "Jeg taler ikke meget", "Jeg er interesseret i mennesker", "Jeg efterlader mine ejendele", "Jeg er afslappet det meste af tiden", "Jeg har svært ved at forstå abstrakte ideer", "Jeg føler mig godt tilpas omkring mennesker", "Jeg fornærmer folk", "Jeg er opmærksom på detaljer", "Jeg bekymrer mig om tingene", "Jeg har en levende fantasi", "Jeg kan godt lide at være i baggrunden", "Jeg er sentimental", "Jeg laver mange fejl", "Jeg føler mig ikke ofte ked af det", "Jeg er ikke interesseret i abstrakte ideer", "Jeg starter samtaler", "Jeg er ikke interesseret i andres problemer", "Jeg får lavet gøremål med det samme", "Jeg bliver let forstyrret", "Jeg har fremragende ideer", "Jeg har lidt at sige", "Jeg har et blødt hjerte", "Jeg glemmer ofte at stille tingene tilbage på deres rette plads", "Jeg bliver let ked af det", "Jeg har ikke en god fantasi", "Jeg taler med mange forskellige mennesker til fester", "Jeg er ikke interesseret i andre", "Jeg kan godt lide disciplin", "Jeg ændrer mit humør meget", "Jeg er hurtig til at forstå tingene", "Jeg kan ikke lide at gøre opmærksom på mig selv", "Jeg tager timeout for andre", "Jeg undgår mit ansvar", "Jeg har hyppige humørsvingninger", "Jeg bruger komplekse ord", "Jeg gider ikke være i centrum for opmærksomheden", "Jeg mærker andres følelser", "Jeg følger en tidsplan", "Jeg bliver let irriteret", "Jeg bruger tid på at reflektere over tingene", "Jeg er stille omkring fremmede", "Jeg får folk til at føle sig godt tilpas", "Jeg er krævende i mit arbejde", "Jeg føler mig ofte ked af det", "Jeg er fuld af ideer"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Jeg føler, at jeg er en værdifuld person eller i det mindste ligestillet med andre", "Jeg føler, at jeg har en række gode egenskaber", "Jeg er tilbøjelig til at føle, at jeg er en fiasko", "Jeg kan udrette ting lige så godt som andre mennesker", "Jeg føler, at jeg ikke har meget at være stolt af", "Jeg har en positiv holdning til mig selv", "I det hele taget er jeg tilfreds med mig selv", "Jeg ville ønske, jeg kunne have mere respekt for mig selv", "Jeg føler mig ubrugelig nogle gange", "Nogle gange tror jeg, at jeg slet ikke er god"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Jeg sætter folk under pres", "Jeg har et stærkt behov for magt", "Jeg prøver at overgå andre", "Jeg er altid på udkig efter måder at tjene penge på", "Jeg nyder at være en del af en højlydt skare", "Jeg vil have, at fremmede elsker mig", "Jeg joker meget rundt", "Jeg larmer meget", "Jeg tøver med at kritisere andres ideer", "Jeg værdsætter samarbejde frem for konkurrence", "Jeg ønsker, at alle skal være lige", "Jeg praler sjældent", "Jeg er følelsesmæssigt reserveret", "Jeg bekymrer mig om detaljerne", "Jeg elsker orden og regelmæssighed", "Min første reaktion på en idé er at se dens fejl"]);
  }

  void addDE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.de;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Ich bin beliebt bei gesellschaftlichen Veranstaltungen", "Andere sind mir egal", "Ich bin immer vorbereitet", "Ich werde leicht gestresst", "Ich habe einen reichen Wortschatz", "Ich rede nicht viel", "Ich interessiere mich für Menschen", "Ich lasse meine Sachen herum", "Ich bin die meiste Zeit entspannt", "Ich habe Schwierigkeiten, abstrakte Ideen zu verstehen", "Ich fühle mich unter Menschen wohl", "Ich beleidige Menschen", "Ich achte auf Details", "Ich mache mir Sorgen um Dinge", "Ich habe eine lebhafte Fantasie", "Ich bin gerne im Hintergrund", "Ich bin sentimental", "Ich mache viele Fehler", "Ich bin nicht oft traurig", "Ich interessiere mich nicht für abstrakte Ideen", "Ich beginne Gespräche", "Ich interessiere mich nicht für die Probleme anderer Leute", "Ich bekomme Aufgaben sofort erledigt", "Ich bin leicht störbar", "Ich habe ausgezeichnete Ideen", "Ich habe wenig zu sagen", "Ich habe ein weiches Herz", "Ich vergesse oft, Dinge wieder an ihren richtigen Platz zu stellen", "Ich ärgere mich leicht", "Ich habe keine gute Vorstellungskraft", "Ich spreche auf Partys mit vielen verschiedenen Leuten", "Andere interessieren mich nicht", "Ich mag Disziplin", "Ich ändere meine Stimmung sehr", "Ich begreife Dinge schnell", "Ich mag es nicht, auf mich aufmerksam zu machen", "Ich nehme mir Zeit für andere", "Ich meide meine Verantwortung", "Ich habe häufig Stimmungsschwankungen", "Ich verwende komplexe Wörter", "Es macht mir nichts aus, im Mittelpunkt zu stehen", "Ich spüre die Gefühle anderer", "Ich folge einem Zeitplan", "Ich werde leicht irritiert", "Ich verbringe Zeit damit, über Dinge nachzudenken", "Fremden gegenüber bin ich ruhig", "Bei mir fühlen sich die Menschen wohl", "Ich bin anspruchsvoll in meiner Arbeit", "Ich bin oft traurig", "Ich bin voller Ideen"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Ich habe das Gefühl, dass ich eine wertvolle Person bin oder zumindest anderen gleichgestellt bin", "Ich habe das Gefühl, dass ich eine Reihe guter Eigenschaften habe", "Ich neige dazu, mich als Versager zu fühlen", "Ich kann Dinge genauso gut erreichen wie andere Menschen", "Ich habe das Gefühl, dass ich nicht viel habe, worauf ich stolz sein kann", "Ich nehme eine positive Einstellung zu mir selbst ein", "Im Großen und Ganzen bin ich mit mir zufrieden", "Ich wünschte, ich könnte mehr Respekt vor mir selbst haben", "Ich fühle mich manchmal nutzlos", "Manchmal denke ich, ich bin überhaupt nicht gut"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Ich setze Menschen unter Druck", "Ich habe ein starkes Bedürfnis nach Macht", "Ich versuche, andere zu übertrumpfen", "Ich bin immer auf der Suche nach Möglichkeiten, Geld zu verdienen", "Ich genieße es, Teil einer lauten Menge zu sein", "Ich möchte, dass Fremde mich lieben", "Ich scherze viel herum", "Ich mache viel Lärm", "Ich zögere, die Ideen anderer zu kritisieren", "Ich schätze Kooperation vor Konkurrenz", "Ich möchte, dass alle gleich sind", "Ich prahle selten", "Ich bin emotional zurückhaltend", "Ich kümmere mich um die Details", "Ich liebe Ordnung und Regelmäßigkeit", "Meine erste Reaktion auf eine Idee ist, ihre Fehler zu erkennen"]);
  }

  void addEL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.el;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Είμαι δημοφιλής σε κοινωνικές εκδηλώσεις", "Δεν με νοιάζουν οι άλλοι", "Είμαι πάντα προετοιμασμένος", "Αγχώνομαι εύκολα", "Έχω πλούσιο λεξιλόγιο", "Δεν μιλάω πολύ", "Με ενδιαφέρουν οι άνθρωποι", "Αφήνω τα υπάρχοντά μου τριγύρω", "Τις περισσότερες φορές είμαι χαλαρή", "Δυσκολεύομαι να κατανοήσω αφηρημένες ιδέες", "Νιώθω άνετα με τους ανθρώπους", "προσβάλλω τους ανθρώπους", "Προσέχω τις λεπτομέρειες", "Ανησυχώ για τα πράγματα", "Έχω ζωηρή φαντασία", "Μου αρέσει να είμαι στο παρασκήνιο", "Είμαι συναισθηματικός", "Κάνω πολλά λάθη", "Δεν νιώθω λυπημένος συχνά", "Δεν με ενδιαφέρουν οι αφηρημένες ιδέες", "Αρχίζω συζητήσεις", "Δεν με ενδιαφέρουν τα προβλήματα των άλλων", "Κάνω τις δουλειές αμέσως", "Είμαι εύκολα αναστατωμένος", "Έχω εξαιρετικές ιδέες", "Λίγα έχω να πω", "Έχω μια απαλή καρδιά", "Συχνά ξεχνάω να επαναφέρω τα πράγματα στη θέση τους", "Αναστατώνομαι εύκολα", "Δεν έχω καλή φαντασία", "Μιλάω με πολλούς διαφορετικούς ανθρώπους στα πάρτι", "Δεν με ενδιαφέρουν οι άλλοι", "Μου αρέσει η πειθαρχία", "Αλλάζω πολύ διάθεση", "Γρήγορα καταλαβαίνω τα πράγματα", "Δεν μου αρέσει να τραβάω την προσοχή στον εαυτό μου", "Αφιερώνω χρόνο για τους άλλους", "Αποφεύγω τις ευθύνες μου", "Έχω συχνές εναλλαγές διάθεσης", "Χρησιμοποιώ σύνθετες λέξεις", "Δεν με πειράζει να είμαι το επίκεντρο της προσοχής", "Νιώθω συναισθήματα των άλλων", "Ακολουθώ ένα πρόγραμμα", "Ερεθίζομαι εύκολα", "Ξοδεύω χρόνο σκεπτόμενοι πράγματα", "Είμαι ήσυχος με αγνώστους", "Κάνω τους ανθρώπους να νιώθουν άνετα", "Είμαι απαιτητικός στη δουλειά μου", "Συχνά νιώθω λύπη", "Είμαι γεμάτος ιδέες"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Νιώθω ότι είμαι άνθρωπος με αξία, ή τουλάχιστον ίσος με τους άλλους", "Νιώθω ότι έχω μια σειρά από καλά προσόντα", "Έχω την τάση να νιώθω ότι είμαι αποτυχημένος", "Μπορώ να καταφέρω πράγματα τόσο καλά όσο άλλοι άνθρωποι", "Νιώθω ότι δεν έχω πολλά να είμαι περήφανος", "Παίρνω μια θετική στάση απέναντι στον εαυτό μου", "Σε γενικές γραμμές, είμαι ικανοποιημένος με τον εαυτό μου", "Μακάρι να μπορούσα να έχω περισσότερο σεβασμό για τον εαυτό μου", "Νιώθω άχρηστος μερικές φορές", "Μερικές φορές νομίζω ότι δεν είμαι καθόλου καλός"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Βάζω τους ανθρώπους υπό πίεση", "Έχω έντονη ανάγκη για δύναμη", "Προσπαθώ να ξεπεράσω τους άλλους", "Είμαι πάντα σε επιφυλακή για τρόπους να βγάλω χρήματα", "Μου αρέσει να είμαι μέρος ενός δυνατού πλήθους", "Θέλω να με αγαπούν οι ξένοι", "Αστειεύομαι πολύ", "Κάνω πολύ θόρυβο", "Διστάζω να επικρίνω τις ιδέες των άλλων", "Εκτιμώ τη συνεργασία έναντι του ανταγωνισμού", "Θέλω όλοι να είναι ίσοι", "Σπάνια καυχιέμαι", "Είμαι συναισθηματικά συγκρατημένος", "Με ενδιαφέρουν οι λεπτομέρειες", "Λατρεύω την τάξη και την κανονικότητα", "Η πρώτη μου αντίδραση σε μια ιδέα είναι να δω τα ελαττώματα της"]);
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["I am popular at social events", "I don't care about others", "I am always prepared", "I get stressed out easily", "I have a rich vocabulary", "I don't talk a lot", "I am interested in people", "I leave my belongings around", "I am relaxed most of the time", "I have difficulty understanding abstract ideas", "I feel comfortable around people", "I insult people", "I pay attention to details", "I worry about things", "I have a vivid imagination", "I like being in the background", "I am sentimental", "I make many mistakes", "I don't feel sad often", "I am not interested in abstract ideas", "I start conversations", "I am not interested in other people's problems", "I get chores done right away", "I am easily disturbed", "I have excellent ideas", "I have little to say", "I have a soft heart", "I often forget to put things back in their proper place", "I get upset easily", "I do not have a good imagination", "I talk to a lot of different people at parties", "I am not interested in others", "I like order", "I change my mood a lot", "I am quick to understand things", "I don't like to draw attention to myself", "I take time out for others", "I avoid my responsibilities", "I have frequent mood swings", "I use difficult words", "I don't mind being the center of attention", "I feel others emotions", "I follow a schedule", "I get irritated easily", "I spend time reflecting on things", "I am quiet around strangers", "I make people feel comfortable", "I am exacting in my work", "I often feel sad", "I am full of ideas"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["I feel that I am a person of worth, or at least equal with others", "I feel that I have a number of good qualities", "I am inclined to feel that I am a failure", "I can accomplish things as good as other people", "I feel I do not have much to be proud of", "I take a positive attitude toward myself", "On the whole, I am satisfied with myself", "I wish I could have more respect for myself", "I feel useless sometimes", "At times I think I am no good at all"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["I put people under pressure", "I have a strong need for power", "I try to outdo others", "I am always on the look out for ways to make money", "I enjoy being part of a loud crowd", "I want strangers to love me", "I joke around a lot", "I make lots of noise", "I hesitate to criticize other people's ideas", "I value cooperation over competition", "I want everyone to be equal", "I seldom brag", "I am emotionally reserved", "I care about the details", "I love order and regularity", "My first reaction to an idea is to see its flaws"]);
  }

  void addES(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.es;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Soy popular en los eventos sociales.", "no me importan los demás", "siempre estoy preparado", "Me estreso fácilmente", "tengo un rico vocabulario", "no hablo mucho", "estoy interesado en la gente", "dejo mis pertenencias por ahí", "estoy relajado la mayor parte del tiempo", "Tengo dificultad para entender ideas abstractas.", "Me siento cómodo con la gente.", "insulto a la gente", "presto atención a los detalles", "me preocupo por las cosas", "tengo una imaginación vívida", "me gusta estar en el fondo", "soy sentimental", "cometo muchos errores", "No me siento triste a menudo", "No me interesan las ideas abstractas.", "empiezo conversaciones", "no me interesan los problemas de los demas", "Tengo tareas hechas de inmediato", "me perturbo facilmente", "tengo excelentes ideas", "tengo poco que decir", "tengo un corazón blando", "A menudo me olvido de poner las cosas en su lugar correcto", "me enfado facilmente", "no tengo buena imaginacion", "Hablo con muchas personas diferentes en las fiestas.", "no me interesan los demas", "me gusta la disciplina", "cambio mucho mi estado de animo", "Soy rápido para entender las cosas.", "no me gusta llamar la atencion", "Tomo tiempo para los demás", "Evito mis responsabilidades", "tengo frecuentes cambios de humor", "uso palabras dificiles", "No me importa ser el centro de atención.", "Siento otras emociones", "sigo un horario", "me irrito facilmente", "Paso el tiempo reflexionando sobre las cosas.", "Estoy callado con extraños", "Hago que la gente se sienta cómoda", "soy exigente en mi trabajo", "a menudo me siento triste", "estoy lleno de ideas"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Siento que soy una persona valiosa, o al menos igual a los demás.", "Siento que tengo una serie de buenas cualidades.", "Me inclino a sentir que soy un fracaso.", "Puedo lograr cosas tan buenas como otras personas", "Siento que no tengo mucho de que enorgullecerme", "Tomo una actitud positiva hacia mí", "En general, estoy satisfecho conmigo mismo.", "Ojalá pudiera tener más respeto por mí mismo", "Me siento inútil a veces", "A veces pienso que no soy bueno en absoluto"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Pongo a la gente bajo presión", "Tengo una fuerte necesidad de poder.", "trato de superar a los demas", "Siempre estoy buscando formas de ganar dinero.", "Me gusta ser parte de una multitud ruidosa", "Quiero que los extraños me amen.", "bromeo mucho", "hago mucho ruido", "Dudo en criticar las ideas de otras personas.", "Valoro la cooperación sobre la competencia.", "quiero que todos sean iguales", "rara vez me jacto", "soy emocionalmente reservado", "me importan los detalles", "Me encanta el orden y la regularidad.", "Mi primera reacción ante una idea es ver sus defectos."]);
  }

  void addFI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.fi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Olen suosittu sosiaalisissa tapahtumissa", "En välitä muista", "Olen aina valmis", "Stressaantun helposti", "Minulla on rikas sanavarasto", "En puhu paljon", "Olen kiinnostunut ihmisistä", "Jätän tavarani ympärilleni", "Olen rentoutunut suurimman osan ajasta", "Minun on vaikea ymmärtää abstrakteja ajatuksia", "Tunnen oloni mukavaksi ihmisten seurassa", "loukkaan ihmisiä", "Kiinnitän huomiota yksityiskohtiin", "Olen huolissani asioista", "Minulla on vilkas mielikuvitus", "Tykkään olla taustalla", "Olen sentimentaalinen", "Teen monia virheitä", "En ole usein surullinen", "En ole kiinnostunut abstrakteista ideoista", "Aloitan keskustelut", "En ole kiinnostunut muiden ihmisten ongelmista", "Saan työt tehtyä heti", "Olen helposti häiriintynyt", "Minulla on loistavia ideoita", "Minulla on vähän sanottavaa", "Minulla on pehmeä sydän", "Unohdan usein laittaa tavarat takaisin oikeille paikoilleen", "Hermostun helposti", "Minulla ei ole hyvä mielikuvitus", "Juhlissa puhun monien eri ihmisten kanssa", "En ole kiinnostunut muista", "Pidän kurinalaisuudesta", "Muutan mielialaani paljon", "Olen nopea ymmärtämään asioita", "En halua kiinnittää huomiota itseeni", "Otan aikaa muille", "Välttelen velvollisuuksiani", "Minulla on usein mielialanvaihteluita", "Käytän monimutkaisia sanoja", "Minua ei haittaa olla huomion keskipiste", "Tunnen muiden tunteita", "Noudatan aikataulua", "ärsyyntyy helposti", "Käytän aikaa asioiden pohtimiseen", "Olen hiljainen vieraiden ihmisten seurassa", "Saan ihmiset tuntemaan olonsa mukavaksi", "Olen vaativa työssäni", "Olen usein surullinen", "Olen täynnä ideoita"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Tunnen olevani arvokas ihminen tai ainakin tasa-arvoinen muiden kanssa", "Koen, että minulla on monia hyviä ominaisuuksia", "Olen taipuvainen tuntemaan olevani epäonnistunut", "Pystyn tekemään asioita yhtä hyvin kuin muut ihmiset", "Minusta tuntuu, ettei minulla ole paljoakaan mistä olla ylpeä", "Suhtaudun itseeni positiivisesti", "Kaiken kaikkiaan olen tyytyväinen itseeni", "Toivon, että osaisin kunnioittaa itseäni enemmän", "Tunnen itseni välillä hyödyttömäksi", "Välillä ajattelen, että en ole ollenkaan hyvä"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Asetin ihmiset paineen alle", "Minulla on voimakas vallan tarve", "Yritän ylittää muut", "Etsin aina tapoja ansaita rahaa", "Nautin kuulumisesta kovaääniseen joukkoon", "Haluan tuntemattomien rakastavan minua", "Vitsailen paljon", "Pidän paljon melua", "En epäröi arvostella muiden ihmisten ajatuksia", "Arvostan yhteistyötä enemmän kuin kilpailua", "Haluan kaikkien olevan tasa-arvoisia", "Harvoin kehuin", "Olen emotionaalisesti pidättyväinen", "Minä välitän yksityiskohdista", "Rakastan järjestystä ja säännöllisyyttä", "Ensimmäinen reaktioni ideaan on nähdä sen puutteet"]);
  }

  void addFR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.fr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Je suis populaire lors d'événements sociaux", "je me fous des autres", "je suis toujours prêt", "Je stresse facilement", "J'ai un vocabulaire riche", "je ne parle pas beaucoup", "Je m'intéresse aux gens", "Je laisse mes affaires partout", "Je suis détendu la plupart du temps", "J'ai de la difficulté à comprendre les idées abstraites", "Je me sens à l'aise avec les gens", "j'insulte les gens", "Je fais attention aux détails", "je m'inquiète des choses", "J'ai une imagination débordante", "J'aime être en arrière-plan", "je suis sentimental", "je fais beaucoup d'erreurs", "Je ne me sens pas souvent triste", "Je ne suis pas intéressé par les idées abstraites", "je lance des conversations", "Je ne m'intéresse pas aux problèmes des autres", "Je fais les corvées tout de suite", "Je suis facilement dérangé", "j'ai d'excellentes idées", "j'ai peu à dire", "j'ai un coeur tendre", "J'oublie souvent de remettre les choses à leur place", "je m'énerve facilement", "je n'ai pas une bonne imagination", "Je parle à beaucoup de personnes différentes lors de soirées", "Je ne m'intéresse pas aux autres", "j'aime la rigueur", "Je change beaucoup d'humeur", "je comprends vite les choses", "Je n'aime pas attirer l'attention sur moi", "Je prends du temps pour les autres", "J'évite mes responsabilités", "J'ai des sautes d'humeur fréquentes", "J'utilise des mots difficiles", "Ça ne me dérange pas d'être le centre de l'attention", "Je ressens les émotions des autres", "Je suis un horaire", "Je m'énerve facilement", "Je passe du temps à réfléchir sur les choses", "Je suis calme avec les étrangers", "Je mets les gens à l'aise", "je suis exigeant dans mon travail", "je me sens souvent triste", "je suis plein d'idées"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Je sens que je suis une personne de valeur, ou au moins égale aux autres", "Je sens que j'ai un certain nombre de bonnes qualités", "Je suis enclin à penser que je suis un raté", "Je peux accomplir des choses aussi bonnes que les autres", "Je sens que je n'ai pas beaucoup de raisons d'être fier", "J'adopte une attitude positive envers moi-même", "Dans l'ensemble, je suis satisfait de moi", "J'aimerais avoir plus de respect pour moi-même", "Je me sens inutile parfois", "Parfois je pense que je ne suis pas bon du tout"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Je mets les gens sous pression", "j'ai un fort besoin de puissance", "J'essaie de surpasser les autres", "Je suis toujours à la recherche de moyens de gagner de l'argent", "J'aime faire partie d'une foule bruyante", "Je veux que les étrangers m'aiment", "je plaisante beaucoup", "je fais beaucoup de bruit", "J'hésite à critiquer les idées des autres", "Je privilégie la coopération à la compétition", "Je veux que tout le monde soit égal", "Je me vante rarement", "Je suis émotionnellement réservé", "Je me soucie des détails", "J'aime l'ordre et la régularité", "Ma première réaction à une idée est de voir ses défauts"]);
  }

  void addHE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.he;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["אני פופולרי באירועים חברתיים", "לא אכפת לי מאחרים", "אני תמיד מוכן", "אני נלחץ בקלות", "יש לי אוצר מילים עשיר", "אני לא מדבר הרבה", "אני מתעניין באנשים", "אני משאירה את החפצים שלי בסביבה", "אני רגוע רוב הזמן", "אני מתקשה להבין רעיונות מופשטים", "אני מרגיש בנוח ליד אנשים", "אני מעליב אנשים", "אני שם לב לפרטים", "אני דואג לדברים", "יש לי דמיון חי", "אני אוהב להיות ברקע", "אני סנטימנטלי", "אני עושה הרבה טעויות", "אני לא מרגיש עצוב לעתים קרובות", "אני לא מתעניין ברעיונות מופשטים", "אני מתחיל שיחות", "אני לא מתעניין בבעיות של אחרים", "אני עושה את המטלות מיד", "אני מוטרד בקלות", "יש לי רעיונות מצוינים", "אין לי מה לומר", "יש לי לב רך", "לעתים קרובות אני שוכח להחזיר דברים למקומם הנכון", "אני מתעצבן בקלות", "אין לי דמיון טוב", "אני מדבר עם הרבה אנשים שונים במסיבות", "אני לא מתעניין באחרים", "אני אוהב משמעת", "אני משנה את מצב הרוח שלי הרבה", "אני ממהר להבין דברים", "אני לא אוהב למשוך תשומת לב לעצמי", "אני לוקח זמן לאחרים", "אני מתחמק מהאחריות שלי", "יש לי שינויים תכופים במצב הרוח", "אני משתמש במילים מורכבות", "לא אכפת לי להיות במרכז תשומת הלב", "אני מרגיש רגשות של אחרים", "אני עוקב אחר לוח זמנים", "אני מתעצבן בקלות", "אני מבלה זמן בהרהורים על דברים", "אני שקט ליד זרים", "אני גורם לאנשים להרגיש בנוח", "אני קפדן בעבודתי", "לעתים קרובות אני מרגיש עצוב", "אני מלא ברעיונות"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["אני מרגיש שאני אדם שווה, או לפחות שווה עם אחרים", "אני מרגיש שיש לי מספר תכונות טובות", "אני נוטה להרגיש שאני כישלון", "אני יכול להשיג דברים טובים כמו אנשים אחרים", "אני מרגיש שאין לי הרבה במה להתגאות", "אני נוקט גישה חיובית כלפי עצמי", "בסך הכל, אני מרוצה מעצמי", "הלוואי שיכולתי לכבד את עצמי יותר", "אני מרגיש חסר תועלת לפעמים", "לפעמים אני חושב שאני לא טוב בכלל"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["הכנסתי אנשים ללחץ", "יש לי צורך חזק בכוח", "אני מנסה להתעלות על אחרים", "אני תמיד מחפש דרכים להרוויח כסף", "אני נהנה להיות חלק מקהל רועש", "אני רוצה שזרים יאהבו אותי", "אני מתבדח הרבה", "אני עושה הרבה רעש", "אני מהסס לבקר רעיונות של אנשים אחרים", "אני מעריך שיתוף פעולה על פני תחרות", "אני רוצה שכולם יהיו שווים", "לעתים רחוקות אני מתרברב", "אני מסויג רגשית", "אכפת לי מהפרטים", "אני אוהב סדר וקביעות", "התגובה הראשונה שלי לרעיון היא לראות את הפגמים שלו"]);
  }

  void addHI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.hi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["मैं सामाजिक आयोजनों में लोकप्रिय हूं", "मुझे दूसरों की परवाह नहीं है", "मैं हमेशा तैयार रहता हूं", "मैं आसानी से तनावग्रस्त हो जाता हूं", "मेरे पास एक समृद्ध शब्दावली है", "मैं ज्यादा बात नहीं करता", "मुझे लोगों में दिलचस्पी है", "मैं अपना सामान इधर-उधर छोड़ देता हूं", "मैं ज्यादातर समय आराम से रहता हूं", "मुझे अमूर्त विचारों को समझने में कठिनाई होती है", "मैं लोगों के आसपास सहज महसूस करता हूं", "मैं लोगों का अपमान करता हूँ", "मैं विवरण पर ध्यान देता हूं", "मुझे चीजों की चिंता है", "मेरे पास एक ज्वलंत कल्पना है", "मुझे बैकग्राउंड में रहना पसंद है", "मैं भावुक हूँ", "मैं बहुत सारी गलतियाँ करता हूँ", "मैं अक्सर उदास नहीं होता", "मुझे अमूर्त विचारों में कोई दिलचस्पी नहीं है", "मैं बातचीत शुरू करता हूँ", "मुझे दूसरे लोगों की समस्याओं में कोई दिलचस्पी नहीं है", "मैं काम जल्द ही कर लेता हूँ", "मैं आसानी से परेशान हूँ", "मेरे पास बेहतरीन विचार हैं", "मेरे पास कहने के लिए बहुत कम है", "मेरा दिल कोमल है", "मैं अक्सर चीजों को वापस उनके उचित स्थान पर रखना भूल जाता हूँ", "मैं आसानी से परेशान हो जाता हूँ", "मेरे पास अच्छी कल्पना नहीं है", "मैं पार्टियों में बहुत से अलग-अलग लोगों से बात करता हूं", "मुझे दूसरों में कोई दिलचस्पी नहीं है", "मुझे अनुशासन पसंद है", "मैं अपना मूड बहुत बदलता हूं", "मुझे चीजों को समझने की जल्दी है", "मुझे अपनी ओर ध्यान आकर्षित करना पसंद नहीं है", "मैं दूसरों के लिए समय निकालता हूं", "मैं अपनी जिम्मेदारियों से बचता हूं", "मुझे बार-बार मिजाज होता है", "मैं जटिल शब्दों का उपयोग करता हूं", "मुझे ध्यान का केंद्र होने में कोई आपत्ति नहीं है", "मैं दूसरों की भावनाओं को महसूस करता हूं", "मैं एक शेड्यूल का पालन करता हूं", "मुझे आसानी से जलन होती है", "मैं चीजों पर चिंतन करने में समय बिताता हूं", "मैं अजनबियों के आसपास चुप हूँ", "मैं लोगों को सहज महसूस कराता हूं", "मैं अपने काम में मांग कर रहा हूँ", "मुझे अक्सर दुख होता है", "मैं विचारों से भरा हूँ"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["मुझे लगता है कि मैं एक योग्य व्यक्ति हूं, या कम से कम दूसरों के बराबर हूं", "मुझे लगता है कि मुझमें कई अच्छे गुण हैं", "मैं यह महसूस करने के लिए इच्छुक हूं कि मैं असफल हूं", "मैं चीजों को अन्य लोगों की तरह ही अच्छा कर सकता हूं", "मुझे लगता है कि मेरे पास गर्व करने के लिए बहुत कुछ नहीं है", "मैं अपने प्रति सकारात्मक दृष्टिकोण रखता हूं", "कुल मिलाकर मैं अपने आप से संतुष्ट हूँ", "काश मैं अपने लिए और अधिक सम्मान पाता", "मुझे कभी-कभी बेकार लगता है", "कई बार मुझे लगता है कि मैं बिल्कुल भी अच्छा नहीं हूं"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["मैंने लोगों को दबाव में डाला", "मुझे सत्ता की सख्त जरूरत है", "मैं दूसरों से आगे निकलने की कोशिश करता हूं", "मैं हमेशा पैसे कमाने के तरीकों की तलाश में रहता हूं", "मुझे एक तेज़ भीड़ का हिस्सा बनने में मज़ा आता है", "मैं चाहता हूं कि अजनबी मुझसे प्यार करें", "मैं बहुत मज़ाक करता हूँ", "मैं बहुत शोर करता हूँ", "मुझे दूसरे लोगों के विचारों की आलोचना करने में झिझक होती है", "मैं प्रतिस्पर्धा पर सहयोग को महत्व देता हूं", "मैं चाहता हूं कि सभी समान हों", "मैं शायद ही कभी अपनी बड़ाई करता हूँ", "मैं भावनात्मक रूप से आरक्षित हूं", "मुझे विवरण की परवाह है", "मुझे आदेश और नियमितता पसंद है", "किसी विचार पर मेरी पहली प्रतिक्रिया उसकी खामियों को देखना है"]);
  }

  void addHR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.hr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Popularna sam na društvenim događajima", "Nije me briga za druge", "Uvijek sam spreman", "Lako sam pod stresom", "Imam bogat vokabular", "ne pričam puno", "Zanimaju me ljudi", "Ostavljam svoje stvari", "Većinu sam vremena opuštena", "Imam poteškoća s razumijevanjem apstraktnih ideja", "Osjećam se ugodno među ljudima", "Vrijeđam ljude", "Pazim na detalje", "Brinem se o stvarima", "Ja imam bujnu maštu", "Volim biti u pozadini", "sentimentalna sam", "Činim mnogo pogrešaka", "Ne osjećam se često tužno", "Ne zanimaju me apstraktne ideje", "započinjem razgovore", "Ne zanimaju me tuđi problemi", "Poslove obavljam odmah", "Lako se uznemirim", "Imam izvrsne ideje", "imam malo toga za reći", "Imam meko srce", "Često zaboravim vratiti stvari na svoje mjesto", "Lako se uzrujavam", "Nemam dobru maštu", "Na zabavama razgovaram s puno različitih ljudi", "Drugi me ne zanimaju", "Volim disciplinu", "Mnogo mijenjam raspoloženje", "Brzo razumijem stvari", "Ne volim privlačiti pažnju na sebe", "Odvajam vrijeme za druge", "Izbjegavam svoje odgovornosti", "Imam česte promjene raspoloženja", "Koristim složene riječi", "Ne smeta mi biti u centru pažnje", "Osjećam tuđe emocije", "Pratim raspored", "Lako se iznerviram", "Provodim vrijeme razmišljajući o stvarima", "U blizini sam nepoznatih ljudi", "Činim da se ljudi osjećaju ugodno", "Prezivan sam u svom poslu", "Često se osjećam tužno", "puna sam ideja"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Osjećam da sam osoba koja vrijedi, ili barem jednaka drugima", "Osjećam da imam niz dobrih osobina", "Sklon sam osjećati da sam neuspješan", "Mogu postići stvari jednako dobro kao i drugi ljudi", "Osjećam da se nemam čime ponositi", "Zauzimam pozitivan stav prema sebi", "U cjelini sam zadovoljan sobom", "Volio bih da mogu imati više poštovanja prema sebi", "Ponekad se osjećam beskorisno", "Ponekad mislim da uopće nisam dobar"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Stavljam ljude pod pritisak", "Imam snažnu potrebu za moći", "Pokušavam nadmašiti druge", "Uvijek sam u potrazi za načinima da zaradim novac", "Uživam biti dio bučne gomile", "Želim da me stranci vole", "Mnogo se šalim", "Pravim puno buke", "Ustručavam se kritizirati tuđe ideje", "Cijenim suradnju u odnosu na konkurenciju", "Želim da svi budu jednaki", "Rijetko se hvalim", "Emocionalno sam suzdržana", "Stalo mi je do detalja", "Volim red i pravilnost", "Moja prva reakcija na ideju je vidjeti njezine nedostatke"]);
  }

  void addHU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.hu;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Népszerű vagyok a társadalmi eseményeken", "Nem érdekelnek mások", "Mindig készen állok", "Könnyen stresszes leszek", "Gazdag szókincsem van", "Nem beszélek sokat", "Érdekelnek az emberek", "Otthagyom a holmimat", "Az idő nagy részében nyugodt vagyok", "Nehezen értem az absztrakt gondolatokat", "Jól érzem magam az emberek között", "sértegetem az embereket", "Odafigyelek a részletekre", "Aggódom a dolgok miatt", "Élénk képzelőerőm van", "Szeretek a háttérben lenni", "szentimentális vagyok", "Sok hibát elkövetek", "Nem vagyok gyakran szomorú", "Nem érdekelnek az absztrakt ötletek", "beszélgetéseket kezdek", "Nem érdekelnek mások problémái", "Azonnal elvégzem a házimunkát", "Könnyen megzavarom", "Kiváló ötleteim vannak", "Kevés mondandóm van", "lágy szívem van", "Gyakran elfelejtem visszatenni a dolgokat a megfelelő helyükre", "könnyen kiborulok", "nincs jó képzelőerőm", "Sokféle emberrel beszélgetek a bulikon", "Nem vagyok kíváncsi másokra", "Szeretem a fegyelmet", "Sokat változtat a hangulatom", "Gyorsan megértem a dolgokat", "Nem szeretem felhívni magamra a figyelmet", "Szakítok időt másokra", "kerülöm a kötelességeimet", "Gyakran vannak hangulatingadozásaim", "Összetett szavakat használok", "Nem bánom, hogy a figyelem középpontjában vagyok", "Érzem mások érzelmeit", "betartom a menetrendet", "Könnyen irritálok", "Időt töltök a dolgok elmélkedésével", "Csendes vagyok idegenek közelében", "Kényelembe helyezem az embereket", "Igényes vagyok a munkámban", "Gyakran szomorú vagyok", "Tele vagyok ötletekkel"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Úgy érzem, értékes ember vagyok, vagy legalábbis egyenrangú másokkal", "Úgy érzem, számos jó tulajdonságom van", "Hajlamos vagyok azt érezni, hogy kudarcos vagyok", "Olyan jó dolgokat tudok véghezvinni, mint mások", "Úgy érzem, nincs mire büszkének lennem", "Pozitívan viszonyulok magamhoz", "Összességében elégedett vagyok magammal", "Bárcsak jobban tisztelhetném magam", "Néha haszontalannak érzem magam", "Időnként azt gondolom, hogy egyáltalán nem vagyok jó"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Nyomás alá helyeztem az embereket", "Erős hatalomigényem van", "Próbálok felülmúlni másokat", "Mindig keresem a pénzkeresési módokat", "Élvezem, hogy egy hangos tömeg része lehetek", "Azt akarom, hogy az idegenek szeressenek", "Sokat viccelek", "Sok zajt csapok", "Habozok kritizálni mások ötleteit", "Nagyra értékelem az együttműködést, mint a versenyt", "Azt akarom, hogy mindenki egyenlő legyen", "Ritkán kérkedek", "Érzelmileg visszafogott vagyok", "A részletek érdekelnek", "Szeretem a rendet és a rendszerességet", "Az első reakcióm egy ötletre az, hogy meglátom a hibáit"]);
  }

  void addID(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.id;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Saya populer di acara sosial", "Saya tidak peduli dengan orang lain", "Saya selalu siap", "Saya mudah stres", "Saya memiliki kosakata yang kaya", "Saya tidak banyak bicara", "Saya tertarik pada orang", "Saya meninggalkan barang-barang saya di sekitar", "Saya santai sebagian besar waktu", "Saya mengalami kesulitan memahami ide-ide abstrak", "Saya merasa nyaman di sekitar orang", "saya menghina orang", "Saya memperhatikan detail", "Saya khawatir tentang hal-hal", "Saya memiliki imajinasi yang jelas", "Saya suka berada di latar belakang", "saya sentimental", "Saya membuat banyak kesalahan", "Saya tidak sering merasa sedih", "Saya tidak tertarik pada ide-ide abstrak", "Saya memulai percakapan", "Saya tidak tertarik dengan masalah orang lain", "Saya segera menyelesaikan tugas", "Saya mudah terganggu", "Saya punya ide bagus", "Saya punya sedikit untuk mengatakan", "Saya memiliki hati yang lembut", "Saya sering lupa mengembalikan barang ke tempatnya semula", "Saya mudah marah", "Saya tidak memiliki imajinasi yang baik", "Saya berbicara dengan banyak orang yang berbeda di pesta", "Saya tidak tertarik pada orang lain", "saya suka disiplin", "Saya banyak mengubah suasana hati saya", "Saya cepat memahami sesuatu", "Saya tidak suka menarik perhatian pada diri saya sendiri", "Saya meluangkan waktu untuk orang lain", "Saya menghindari tanggung jawab saya", "Saya sering mengalami perubahan suasana hati", "Saya menggunakan kata-kata yang rumit", "Saya tidak keberatan menjadi pusat perhatian", "Saya merasakan emosi orang lain", "Saya mengikuti jadwal", "Saya mudah tersinggung", "Saya menghabiskan waktu untuk merenungkan berbagai hal", "Saya diam di sekitar orang asing", "Saya membuat orang merasa nyaman", "Saya menuntut dalam pekerjaan saya", "Saya sering merasa sedih", "Saya penuh dengan ide"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Saya merasa bahwa saya adalah orang yang berharga, atau setidaknya setara dengan orang lain", "Saya merasa bahwa saya memiliki sejumlah kualitas yang baik", "Saya cenderung merasa bahwa saya gagal", "Saya dapat mencapai hal-hal sebaik orang lain", "Saya merasa tidak punya banyak hal untuk dibanggakan", "Saya mengambil sikap positif terhadap diri saya sendiri", "Secara keseluruhan, saya puas dengan diri saya sendiri", "Saya berharap saya bisa lebih menghargai diri saya sendiri", "Aku terkadang merasa tidak berguna", "Kadang-kadang saya pikir saya tidak baik sama sekali"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Saya menempatkan orang di bawah tekanan", "Saya memiliki kebutuhan yang kuat akan kekuatan", "Saya mencoba untuk mengungguli orang lain", "Saya selalu mencari cara untuk menghasilkan uang", "Saya senang menjadi bagian dari keramaian", "Aku ingin orang asing mencintaiku", "Saya banyak bercanda", "Saya membuat banyak suara", "Saya ragu untuk mengkritik ide orang lain", "Saya menghargai kerjasama daripada kompetisi", "Saya ingin semua orang sama", "saya jarang menyombongkan diri", "Saya pendiam secara emosional", "Saya peduli dengan detailnya", "Saya suka keteraturan", "Reaksi pertama saya terhadap sebuah ide adalah melihat kekurangannya"]);
  }

  void addIT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.it;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Sono popolare negli eventi sociali", "Non mi importa degli altri", "Sono sempre preparato", "Mi stresso facilmente", "Ho un ricco vocabolario", "Non parlo molto", "Mi interessano le persone", "Lascio le mie cose in giro", "Sono rilassato la maggior parte del tempo", "Ho difficoltà a capire le idee astratte", "Mi sento a mio agio con le persone", "Insulto le persone", "Presto attenzione ai dettagli", "Mi preoccupo per le cose", "Ho una vivida immaginazione", "Mi piace stare sullo sfondo", "Sono sentimentale", "Faccio molti errori", "Non mi sento triste spesso", "Non mi interessano le idee astratte", "Inizio conversazioni", "Non mi interessano i problemi degli altri", "Svolgo subito le faccende", "Sono facilmente disturbato", "Ho ottime idee", "Ho poco da dire", "Ho un cuore tenero", "Spesso mi dimentico di rimettere le cose al loro posto", "Mi arrabbio facilmente", "Non ho una buona immaginazione", "Parlo con molte persone diverse alle feste", "Non mi interessano gli altri", "Mi piace la disciplina", "Cambio molto il mio umore", "Sono veloce a capire le cose", "Non mi piace attirare l'attenzione su di me", "Mi prendo del tempo per gli altri", "Evito le mie responsabilità", "Ho frequenti sbalzi d'umore", "Uso parole complesse", "Non mi dispiace essere al centro dell'attenzione", "Provo le emozioni degli altri", "Seguo un programma", "Mi irrito facilmente", "Passo il tempo a riflettere sulle cose", "Sono tranquillo con gli estranei", "Faccio sentire le persone a proprio agio", "Sono esigente nel mio lavoro", "Mi sento spesso triste", "Sono pieno di idee"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Mi sento una persona di valore, o almeno uguale agli altri", "Sento di avere una serie di buone qualità", "Sono propenso a sentirmi un fallito", "Posso realizzare le cose bene come le altre persone", "Sento di non avere molto di cui essere orgoglioso", "Prendo un atteggiamento positivo verso me stesso", "Nel complesso, sono soddisfatto di me stesso", "Vorrei poter avere più rispetto per me stesso", "Mi sento inutile a volte", "A volte penso di non essere affatto bravo"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Metto le persone sotto pressione", "Ho un forte bisogno di potere", "Cerco di superare gli altri", "Sono sempre alla ricerca di modi per fare soldi", "Mi piace far parte di una folla rumorosa", "Voglio che gli estranei mi amino", "Scherzo molto", "Faccio molto rumore", "Esito a criticare le idee degli altri", "Apprezzo la cooperazione rispetto alla concorrenza", "Voglio che tutti siano uguali", "Raramente mi vanto", "Sono emotivamente riservato", "Mi interessano i dettagli", "Amo l'ordine e la regolarità", "La mia prima reazione a un'idea è vedere i suoi difetti"]);
  }

  void addJA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.ja;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["社会的なイベントで人気があります", "私は他人を気にしません", "私はいつも準備ができています", "ストレスがたまりやすい", "語彙が豊富です", "あまり話さない", "人に興味があります", "持ち物を置き忘れる", "私はほとんどの時間リラックスしています", "抽象的なアイデアを理解するのが難しい", "私は人々の周りで快適に感じます", "人を侮辱する", "細部に気を配っています", "気になる", "私は鮮やかな想像力を持っています", "私はバックグラウンドにいるのが好きです", "私は感傷的です", "私は多くの間違いを犯します", "あまり悲しくない", "私は抽象的なアイデアには興味がありません", "会話を始める", "他人の問題には興味がない", "私はすぐに雑用をします", "私は簡単に邪魔されます", "私は素晴らしいアイデアを持っています", "言うことはほとんどありません", "優しい心があります", "私はしばしば物事を適切な場所に戻すことを忘れます", "簡単に動揺します", "想像力がありません", "パーティーで色んな人と話します", "私は他人には興味がありません", "私は規律が好きです", "気分が大きく変わる", "私は物事をすぐに理解します", "自分に注意を向けたくない", "私は他の人のために時間を取っています", "私は自分の責任を避けます", "気分のむらが頻繁にあります", "複雑な言葉を使う", "私は注目の的であることを気にしません", "他人の感情を感じる", "スケジュールに従います", "イライラしやすい", "私は物事を振り返るのに時間を費やします", "私は見知らぬ人の周りで静かです", "私は人々を快適に感じさせます", "私は自分の仕事に厳格です", "よく悲しくなります", "私はアイデアでいっぱいです"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["私は価値のある人、または少なくとも他の人と同等であると感じています", "私にはたくさんの良い資質があると感じています", "私は自分が失敗だと感じがちです", "私は他の人と同じくらい良いことを成し遂げることができます", "誇りに思うことはあまりない気がします", "私は自分自身に対して前向きな姿勢を取ります", "全体的に、私は自分自身に満足しています", "もっと自分を尊敬できたらいいのに", "時々役に立たないと感じる", "時々私は全然ダメだと思う"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["私は人々に圧力をかけます", "私は力を強く必要としています", "私は他の人をしのぐようにしています", "私は常にお金を稼ぐ方法を探しています", "私は大勢の人の一部であることを楽しんでいます", "見知らぬ人に愛してもらいたい", "私はたくさん冗談を言います", "私はたくさんの音を立てます", "私は他の人の考えを批判することを躊躇します", "私は競争よりも協力を大切にします", "みんな平等になりたい", "自慢することはめったにない", "私は感情的に予約されています", "詳細が気になります", "私は秩序と規則性が大好きです", "アイデアに対する私の最初の反応は、その欠陥を見ることです"]);
  }

  void addKO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.ko;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["나는 사교 행사에서 인기가 있다", "나는 다른 사람들에게 관심이 없다", "나는 항상 준비되어있다", "나는 쉽게 스트레스를 받는다", "나는 풍부한 어휘를 가지고있다", "나는 말을 많이 하지 않는다", "나는 사람들에게 관심이 있다", "나는 내 소지품을 주위에 두고", "나는 대부분의 시간을 여유롭게", "추상적인 생각을 이해하는 데 어려움이 있습니다.", "나는 사람들 주위에 편안함을 느낀다", "나는 사람들을 모욕한다", "나는 세부 사항에주의를 기울입니다", "나는 일에 대해 걱정한다", "생생한 상상이 있어", "나는 배경에 있는 것을 좋아한다", "나는 감상적이다", "나는 많은 실수를 한다", "나는 자주 슬퍼하지 않는다", "나는 추상적인 아이디어에 관심이 없다", "나는 대화를 시작한다", "나는 다른 사람의 문제에 관심이 없다", "나는 집안일을 바로 처리한다", "나는 쉽게 방해받는다", "나는 훌륭한 아이디어를 가지고 있다", "나는 할 말이 거의 없다", "나는 부드러운 마음을 가지고 있습니다", "나는 물건을 제자리에 놓는 것을 자주 잊는다", "나는 쉽게 화를 낸다", "나는 좋은 상상력이 없다", "나는 파티에서 많은 다른 사람들과 이야기한다", "나는 다른 사람에게 관심이 없다", "나는 규율을 좋아한다", "기분이 많이 변한다", "나는 사물을 빨리 이해한다", "나는 나 자신에게 관심을 끄는 것을 좋아하지 않는다", "나는 다른 사람들을 위해 시간을 내어", "나는 내 책임을 회피한다", "나는 기분 변화가 자주 있다", "나는 복잡한 단어를 사용한다", "나는 관심의 중심이 되는 것에 신경 쓰지 않는다", "나는 다른 사람의 감정을 느낀다", "나는 일정을 지킨다", "나는 쉽게 짜증이 난다", "나는 사물에 대해 반성하는 시간을 보낸다", "나는 낯선 사람 주위에서 조용하다", "나는 사람들을 편안하게", "나는 내 일에 엄격하다", "나는 종종 슬프다", "나는 아이디어로 가득 차있다"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["나는 내가 가치 있는 사람이거나 적어도 다른 사람들과 동등하다고 느낀다", "나는 내가 좋은 자질을 많이 가지고 있다고 느낀다", "나는 내가 실패자라고 느끼는 경향이 있다", "나는 다른 사람들처럼 좋은 일을 성취할 수 있다", "자랑할 게 별로 없는 것 같아", "나는 나 자신에 대해 긍정적인 태도를 취한다", "대체로 나는 나 자신에 만족한다", "나 자신을 좀 더 존중할 수 있으면 좋겠어", "나는 가끔 쓸모없다고 느낀다", "때때로 나는 내가 전혀 좋지 않다고 생각한다"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["나는 사람들을 압박한다.", "나는 권력에 대한 강한 욕구가 있다", "나는 다른 사람들을 능가하려고 노력한다", "나는 항상 돈을 버는 방법을 찾고 있습니다", "나는 시끄러운 군중의 일부가 되는 것을 즐긴다", "나는 낯선 사람들이 나를 사랑하기를 원한다", "나는 장난을 많이 친다.", "나는 소리를 많이 낸다.", "나는 다른 사람의 생각을 비판하는 것을 주저한다", "나는 경쟁보다 협력을 중시한다", "나는 모두가 평등하기를 원한다", "나는 좀처럼 자랑하지 않는다", "나는 감정적으로 예약되어있다", "나는 세부 사항에 관심", "나는 질서와 규칙성을 사랑한다", "아이디어에 대한 나의 첫 번째 반응은 그 결함을 보는 것입니다"]);
  }

  void addMS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.ms;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Saya popular di acara sosial", "Saya tidak peduli dengan orang lain", "Saya sentiasa bersedia", "Saya mudah tertekan", "Saya mempunyai perbendaharaan kata yang kaya", "Saya tidak banyak bercakap", "Saya berminat dengan orang", "Saya tinggalkan barang-barang saya", "Saya berehat pada kebanyakan masa", "Saya sukar memahami idea abstrak", "Saya berasa selesa di sekeliling orang", "Saya menghina orang", "Saya memberi perhatian kepada butiran", "Saya bimbang tentang perkara", "Saya mempunyai imaginasi yang jelas", "Saya suka berada di latar belakang", "Saya sentimental", "Saya melakukan banyak kesilapan", "Saya tidak sering berasa sedih", "Saya tidak berminat dengan idea abstrak", "Saya memulakan perbualan", "Saya tidak berminat dengan masalah orang lain", "Saya menyelesaikan kerja-kerja dengan segera", "Saya mudah terganggu", "Saya mempunyai idea yang sangat baik", "Saya ada sedikit perkara untuk diperkatakan", "Saya mempunyai hati yang lembut", "Saya sering terlupa untuk meletakkan semula barang di tempat yang sepatutnya", "Saya mudah marah", "Saya tidak mempunyai imaginasi yang baik", "Saya bercakap dengan ramai orang yang berbeza di parti", "Saya tidak berminat dengan orang lain", "Saya suka disiplin", "Saya banyak mengubah mood saya", "Saya cepat memahami sesuatu", "Saya tidak suka menarik perhatian kepada diri saya sendiri", "Saya mengambil masa untuk orang lain", "Saya mengelak daripada tanggungjawab saya", "Saya sering mengalami perubahan mood", "Saya menggunakan perkataan yang kompleks", "Saya tidak kisah menjadi pusat perhatian", "Saya merasakan emosi orang lain", "Saya mengikut jadual", "Saya mudah meragam", "Saya menghabiskan masa untuk merenung perkara", "Saya pendiam di sekeliling orang yang tidak dikenali", "Saya membuat orang berasa selesa", "Saya tegas dalam kerja saya", "Saya sering berasa sedih", "Saya penuh dengan idea"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Saya merasakan bahawa saya seorang yang bernilai, atau sekurang-kurangnya sama dengan orang lain", "Saya merasakan bahawa saya mempunyai beberapa kualiti yang baik", "Saya cenderung untuk merasakan bahawa saya seorang yang gagal", "Saya boleh mencapai sesuatu yang baik seperti orang lain", "Saya rasa saya tidak mempunyai banyak yang boleh dibanggakan", "Saya mengambil sikap positif terhadap diri saya sendiri", "Secara keseluruhannya, saya berpuas hati dengan diri saya sendiri", "Saya harap saya boleh lebih menghormati diri saya sendiri", "Saya rasa tidak berguna kadang-kadang", "Kadang-kadang saya rasa saya tidak baik langsung"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Saya meletakkan orang di bawah tekanan", "Saya mempunyai keperluan yang kuat untuk kuasa", "Saya cuba mengatasi orang lain", "Saya sentiasa mencari cara untuk membuat wang", "Saya seronok menjadi sebahagian daripada khalayak ramai", "Saya mahu orang yang tidak dikenali menyayangi saya", "Saya banyak bergurau", "Saya membuat banyak bunyi", "Saya teragak-agak untuk mengkritik idea orang lain", "Saya menghargai kerjasama daripada persaingan", "Saya mahu semua orang sama", "Saya jarang bermegah", "Saya terpelihara emosi", "Saya mengambil berat tentang butirannya", "Saya suka ketertiban dan keteraturan", "Reaksi pertama saya terhadap idea adalah melihat kelemahannya"]);
  }

  void addNL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.nl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Ik ben populair bij sociale evenementen", "Ik geef niets om anderen", "Ik ben altijd voorbereid", "Ik raak gemakkelijk gestrest", "Ik heb een rijke woordenschat", "Ik praat niet veel", "Ik ben geïnteresseerd in mensen", "Ik laat mijn spullen rond", "Ik ben meestal ontspannen", "Ik heb moeite met het begrijpen van abstracte ideeën", "Ik voel me op mijn gemak bij mensen", "ik beledig mensen", "Ik let op details", "Ik maak me zorgen over dingen", "Ik heb een levendige fantasie", "Ik ben graag op de achtergrond", "ik ben sentimenteel", "Ik maak veel fouten", "Ik voel me niet vaak verdrietig", "Ik ben niet geïnteresseerd in abstracte ideeën", "ik begin gesprekken", "Ik ben niet geïnteresseerd in de problemen van andere mensen", "Ik krijg klusjes meteen gedaan", "Ik ben snel gestoord", "Ik heb uitstekende ideeën", "ik heb weinig te zeggen", "Ik heb een zacht hart", "Ik vergeet vaak dingen terug op hun juiste plaats te zetten", "Ik raak gemakkelijk van streek", "Ik heb geen goede fantasie", "Ik praat met veel verschillende mensen op feestjes", "Ik ben niet geïnteresseerd in anderen", "Ik hou van discipline", "Ik verander veel van humeur", "Ik begrijp dingen snel", "Ik hou er niet van om de aandacht op mezelf te vestigen", "Ik neem tijd voor anderen", "Ik ontwijk mijn verantwoordelijkheden", "Ik heb vaak stemmingswisselingen", "Ik gebruik complexe woorden", "Ik vind het niet erg om in het middelpunt van de belangstelling te staan", "Ik voel de emoties van anderen", "Ik volg een schema", "Ik raak snel geïrriteerd", "Ik besteed tijd aan het nadenken over dingen", "Ik ben stil bij vreemden", "Ik stel mensen op hun gemak", "Ik ben veeleisend in mijn werk", "Ik voel me vaak verdrietig", "Ik zit vol ideeën"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Ik heb het gevoel dat ik een persoon van waarde ben, of op zijn minst gelijk aan anderen", "Ik heb het gevoel dat ik een aantal goede eigenschappen heb", "Ik ben geneigd te voelen dat ik een mislukkeling ben", "Ik kan dingen net zo goed bereiken als andere mensen", "Ik heb het gevoel dat ik niet veel heb om trots op te zijn", "Ik neem een positieve houding aan ten opzichte van mezelf", "Over het algemeen ben ik tevreden met mezelf", "Ik wou dat ik meer respect voor mezelf kon hebben", "Ik voel me soms nutteloos", "Soms denk ik dat ik helemaal niet goed ben"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Ik zet mensen onder druk", "Ik heb een sterke behoefte aan macht", "Ik probeer anderen te overtreffen", "Ik ben altijd op zoek naar manieren om geld te verdienen", "Ik geniet ervan om deel uit te maken van een luid publiek", "Ik wil dat vreemden van me houden", "Ik maak veel grappen", "Ik maak veel lawaai", "Ik aarzel om de ideeën van andere mensen te bekritiseren", "Ik waardeer samenwerking boven concurrentie", "Ik wil dat iedereen gelijk is", "Ik schep zelden op", "Ik ben emotioneel gereserveerd", "Ik geef om de details", "Ik hou van orde en regelmaat", "Mijn eerste reactie op een idee is om de gebreken ervan te zien"]);
  }

  void addNB(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.nb;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Jeg er populær på sosiale arrangementer", "Jeg bryr meg ikke om andre", "Jeg er alltid forberedt", "Jeg blir lett stresset", "Jeg har et rikt ordforråd", "Jeg snakker ikke mye", "Jeg er interessert i mennesker", "Jeg legger igjen eiendelene mine", "Jeg er avslappet mesteparten av tiden", "Jeg har problemer med å forstå abstrakte ideer", "Jeg føler meg komfortabel rundt mennesker", "Jeg fornærmer folk", "Jeg legger vekt på detaljer", "Jeg bekymrer meg for ting", "Jeg har en levende fantasi", "Jeg liker å være i bakgrunnen", "Jeg er sentimental", "Jeg gjør mange feil", "Jeg føler meg ikke ofte trist", "Jeg er ikke interessert i abstrakte ideer", "Jeg starter samtaler", "Jeg er ikke interessert i andres problemer", "Jeg får gjort gjøremål med en gang", "Jeg blir lett forstyrret", "Jeg har gode ideer", "Jeg har lite å si", "Jeg har et mykt hjerte", "Jeg glemmer ofte å sette ting tilbake på riktig plass", "Jeg blir lett lei meg", "Jeg har ikke god fantasi", "Jeg snakker med mange forskjellige mennesker på fester", "Jeg er ikke interessert i andre", "Jeg liker disiplin", "Jeg endrer humøret mye", "Jeg er rask til å forstå ting", "Jeg liker ikke å trekke oppmerksomhet til meg selv", "Jeg tar meg tid for andre", "Jeg unngår mitt ansvar", "Jeg har hyppige humørsvingninger", "Jeg bruker komplekse ord", "Jeg har ikke noe imot å være i sentrum for oppmerksomheten", "Jeg kjenner andres følelser", "Jeg følger en tidsplan", "Jeg blir lett irritert", "Jeg bruker tid på å reflektere over ting", "Jeg er stille rundt fremmede", "Jeg får folk til å føle seg komfortable", "Jeg er krevende i arbeidet mitt", "Jeg føler meg ofte trist", "Jeg er full av ideer"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Jeg føler at jeg er en person av verdi, eller i det minste likestilt med andre", "Jeg føler at jeg har en rekke gode egenskaper", "Jeg er tilbøyelig til å føle at jeg er en fiasko", "Jeg kan utrette ting like bra som andre mennesker", "Jeg føler jeg ikke har mye å være stolt av", "Jeg har en positiv holdning til meg selv", "I det hele tatt er jeg fornøyd med meg selv", "Jeg skulle ønske jeg kunne hatt mer respekt for meg selv", "Jeg føler meg ubrukelig noen ganger", "Noen ganger tror jeg at jeg ikke er god i det hele tatt"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Jeg setter folk under press", "Jeg har et sterkt behov for makt", "Jeg prøver å overgå andre", "Jeg er alltid på utkikk etter måter å tjene penger på", "Jeg liker å være en del av et høyt publikum", "Jeg vil at fremmede skal elske meg", "Jeg tuller mye", "Jeg lager mye støy", "Jeg nøler med å kritisere andres ideer", "Jeg setter samarbeid fremfor konkurranse", "Jeg vil at alle skal være like", "Jeg skryter sjelden", "Jeg er følelsesmessig reservert", "Jeg bryr meg om detaljene", "Jeg elsker orden og regelmessighet", "Min første reaksjon på en idé er å se dens feil"]);
  }

  void addPL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.pl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Jestem popularny na imprezach towarzyskich", "nie dbam o innych", "zawsze jestem przygotowany", "Łatwo się stresuję", "mam bogate słownictwo", "nie mówię dużo", "interesują mnie ludzie", "Zostawiam swoje rzeczy dookoła", "Przez większość czasu jestem zrelaksowany", "Mam trudności ze zrozumieniem abstrakcyjnych pomysłów", "Czuję się dobrze w towarzystwie ludzi", "obrażam ludzi", "zwracam uwagę na szczegóły", "martwię się o rzeczy", "mam żywą wyobraźnię", "Lubię być w tle", "jestem sentymentalny", "popełniam wiele błędów", "nie jest mi często smutno", "Nie interesują mnie abstrakcyjne pomysły", "zaczynam rozmowy", "Nie interesują mnie problemy innych ludzi", "Od razu wykonuję prace", "łatwo mi się niepokoi", "mam świetne pomysły", "mam niewiele do powiedzenia", "mam miękkie serce", "Często zapominam odłożyć rzeczy na właściwe miejsce", "łatwo się denerwuję", "nie mam dobrej wyobraźni", "Na imprezach rozmawiam z wieloma różnymi osobami", "nie interesują mnie inni", "lubię dyscyplinę", "Bardzo zmieniam nastrój", "Szybko rozumiem rzeczy", "nie lubię zwracać na siebie uwagi", "Wychodzę dla innych", "unikam swoich obowiązków", "mam częste wahania nastroju", "używam skomplikowanych słów", "Nie mam nic przeciwko byciu w centrum uwagi", "Czuję emocje innych", "Postępuję zgodnie z harmonogramem", "łatwo się denerwuję", "Spędzam czas zastanawiając się nad rzeczami", "milczę przy nieznajomych", "Sprawiam, że ludzie czują się komfortowo", "Jestem wymagający w swojej pracy", "często jest mi smutno", "jestem pełen pomysłów"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Czuję, że jestem osobą wartościową, a przynajmniej równą innym", "Czuję, że mam wiele dobrych cech", "Jestem skłonny czuć, że jestem porażką", "Mogę osiągać rzeczy tak dobre, jak inni ludzie", "Czuję, że nie mam z czego być dumnym", "Mam do siebie pozytywne nastawienie", "Ogólnie jestem z siebie zadowolona", "Chciałbym mieć dla siebie więcej szacunku", "Czasami czuję się bezużyteczny", "Czasami myślę, że wcale nie jestem dobry"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["wywieram presję na ludzi", "Mam silną potrzebę władzy", "staram się prześcignąć innych", "Zawsze szukam sposobów na zarabianie pieniędzy", "Lubię być częścią głośnego tłumu", "Chcę, żeby obcy mnie kochali", "Dużo żartuję", "robię dużo hałasu", "Waham się krytykować pomysły innych ludzi", "Cenię współpracę ponad konkurencję", "Chcę, żeby wszyscy byli równi", "rzadko się chwalę", "jestem emocjonalnie powściągliwa", "Dbam o szczegóły", "Uwielbiam porządek i regularność", "Moją pierwszą reakcją na pomysł jest zobaczenie jego wad"]);
  }

  void addPT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.pt;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Sou popular em eventos sociais", "Eu não me importo com os outros", "estou sempre preparado", "fico estressado facilmente", "Eu tenho um vocabulário rico", "eu não falo muito", "estou interessado em pessoas", "deixo meus pertences por aí", "Estou relaxado a maior parte do tempo", "Tenho dificuldade em entender ideias abstratas", "Eu me sinto confortável perto das pessoas", "eu insulto as pessoas", "Eu presto atenção aos detalhes", "eu me preocupo com as coisas", "eu tenho uma imaginação vívida", "eu gosto de ficar em segundo plano", "eu sou sentimental", "eu cometo muitos erros", "Eu não me sinto triste com frequência", "Não estou interessado em ideias abstratas", "eu começo conversas", "Não estou interessado nos problemas dos outros", "Eu faço as tarefas imediatamente", "sou facilmente perturbado", "tenho excelentes ideias", "tenho pouco a dizer", "eu tenho um coração mole", "Muitas vezes eu esqueço de colocar as coisas de volta em seus devidos lugares", "eu fico chateado facilmente", "Eu não tenho uma boa imaginação", "Eu falo com muitas pessoas diferentes em festas", "Eu não estou interessado em outros", "eu gosto de disciplina", "Eu mudo muito meu humor", "Eu sou rápido para entender as coisas", "Eu não gosto de chamar atenção para mim", "eu tiro um tempo para os outros", "Eu evito minhas responsabilidades", "Eu tenho mudanças de humor frequentes", "Eu uso palavras complexas", "Eu não me importo de ser o centro das atenções", "Eu sinto as emoções dos outros", "Eu sigo um cronograma", "me irrito facilmente", "Eu passo o tempo refletindo sobre as coisas", "fico quieto perto de estranhos", "Eu faço as pessoas se sentirem confortáveis", "sou exigente no meu trabalho", "muitas vezes me sinto triste", "estou cheio de ideias"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Sinto que sou uma pessoa de valor, ou pelo menos igual aos outros", "Eu sinto que tenho uma série de boas qualidades", "Estou inclinado a sentir que sou um fracasso", "Eu posso realizar coisas tão boas quanto outras pessoas", "Sinto que não tenho muito do que me orgulhar", "Eu tomo uma atitude positiva em relação a mim mesmo", "No geral, estou satisfeito comigo mesmo", "Eu gostaria de poder ter mais respeito por mim mesmo", "Eu me sinto inútil às vezes", "Às vezes eu acho que não sou bom em tudo"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Eu coloco as pessoas sob pressão", "Eu tenho uma forte necessidade de poder", "Eu tento superar os outros", "Estou sempre procurando maneiras de ganhar dinheiro", "Eu gosto de fazer parte de uma multidão barulhenta", "Eu quero que estranhos me amem", "eu brinco muito", "eu faço muito barulho", "Hesito em criticar as ideias de outras pessoas", "Eu valorizo a cooperação sobre a competição", "Eu quero que todos sejam iguais", "raramente me gabo", "Eu sou emocionalmente reservado", "Eu me importo com os detalhes", "Eu amo ordem e regularidade", "Minha primeira reação a uma ideia é ver suas falhas"]);
  }

  void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.ro;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Sunt popular la evenimentele sociale", "Nu-mi pasă de alții", "Sunt mereu pregătit", "Ma stresez usor", "Am un vocabular bogat", "nu vorbesc mult", "Sunt interesat de oameni", "Îmi las lucrurile prin preajmă", "Sunt relaxat de cele mai multe ori", "Am dificultăți în înțelegerea ideilor abstracte", "Mă simt confortabil în preajma oamenilor", "insult oamenii", "Sunt atent la detalii", "Îmi fac griji pentru lucruri", "Am o imaginație vie", "Îmi place să fiu în fundal", "sunt sentimental", "Fac multe greseli", "Nu mă simt tristă des", "Nu mă interesează ideile abstracte", "Încep conversații", "Nu mă interesează problemele altora", "Îmi fac treburile imediat", "Sunt usor deranjat", "Am idei excelente", "Am puține de spus", "Am o inimă moale", "De multe ori uit să pun lucrurile înapoi la locul lor", "ma supar usor", "Nu am o imaginație bună", "Vorbesc cu o mulțime de oameni diferiți la petreceri", "Nu ma intereseaza altii", "Îmi place ordinea", "Îmi schimb foarte mult starea de spirit", "Sunt rapid să înțeleg lucrurile", "Nu-mi place să atrag atenția asupra mea", "Îmi iau timp pentru alții", "Îmi evit responsabilitățile", "Am frecvente schimbări de dispoziție", "Folosesc cuvinte dificile", "Nu mă deranjează să fiu în centrul atenției", "Simt emoțiile altora", "Urmez un program", "Ma enervez usor", "Petrec timpul reflectând asupra lucrurilor", "Sunt tăcut în preajma străinilor", "Îi fac pe oameni să se simtă confortabil", "Sunt exigent în munca mea", "Adesea mă simt trist", "Sunt plin de idei"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Simt că sunt o persoană de valoare, sau cel puțin egală cu ceilalți", "Simt că am o serie de calități bune", "Sunt înclinat să simt că sunt un eșec", "Pot realiza lucruri la fel de bune ca alții", "Simt că nu am prea multe de ce să fiu mândru", "Iau o atitudine pozitivă față de mine", "Per total, sunt mulțumit de mine", "Mi-aș dori să am mai mult respect pentru mine", "Mă simt inutil uneori", "Uneori cred că nu sunt bun deloc"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Pun oamenii sub presiune", "Am o mare nevoie de putere", "Încerc să-i depășesc pe alții", "Sunt mereu în căutarea modalităților de a câștiga bani", "Îmi place să fac parte dintr-o mulțime zgomotoasă", "Vreau ca străinii să mă iubească", "Glumesc mult", "Fac mult zgomot", "Ezit să critic ideile altora", "Prețuiesc cooperarea în detrimentul concurenței", "Vreau ca toți să fie egali", "Rareori ma laud", "Sunt rezervat emoțional", "Îmi pasă de detalii", "Îmi place ordinea și regularitatea", "Prima mea reacție la o idee este să-i văd defectele"]);
  }

  void addRU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.ru;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Я популярен на светских мероприятиях", "я не забочусь о других", "я всегда готов", "я легко впадаю в стресс", "у меня богатый словарный запас", "я мало говорю", "меня интересуют люди", "Я оставляю свои вещи", "Я расслаблен большую часть времени", "Мне трудно понять абстрактные идеи", "Я чувствую себя комфортно среди людей", "я оскорбляю людей", "Я обращаю внимание на детали", "я беспокоюсь о вещах", "у меня живое воображение", "мне нравится быть на заднем плане", "я сентиментален", "я делаю много ошибок", "мне не часто грустно", "Меня не интересуют абстрактные идеи", "я начинаю разговор", "Меня не интересуют чужие проблемы", "Я делаю работу по дому сразу", "меня легко вывести из себя", "у меня отличные идеи", "мне нечего сказать", "у меня мягкое сердце", "Я часто забываю положить вещи на место", "я легко расстраиваюсь", "у меня плохое воображение", "Я разговариваю со многими разными людьми на вечеринках", "я не интересуюсь другими", "мне нравится дисциплина", "Я часто меняю свое настроение", "Я быстро понимаю вещи", "не люблю привлекать к себе внимание", "Я уделяю время другим", "Я избегаю своих обязанностей", "у меня частые перепады настроения", "Я использую сложные слова", "Я не против быть в центре внимания", "Я чувствую чужие эмоции", "я следую расписанию", "я легко раздражаюсь", "Я провожу время, размышляя о вещах", "Я спокоен среди незнакомцев", "Я заставляю людей чувствовать себя комфортно", "я требовательна в работе", "мне часто грустно", "я полон идей"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Я чувствую себя достойным человеком или, по крайней мере, равным другим", "Я чувствую, что у меня есть ряд хороших качеств", "Я склонен считать себя неудачником", "Я могу делать вещи так же хорошо, как и другие люди", "Я чувствую, что мне нечем гордиться", "Я положительно отношусь к себе", "В целом я доволен собой", "Я хотел бы иметь больше уважения к себе", "иногда я чувствую себя бесполезным", "Иногда я думаю, что я совсем не хорош"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Я подвергаю людей давлению", "У меня есть сильная потребность во власти", "Я стараюсь превзойти других", "Я всегда в поиске способов заработка", "Мне нравится быть частью шумной толпы", "Я хочу, чтобы незнакомцы любили меня", "я много шучу", "я делаю много шума", "Я не решаюсь критиковать идеи других людей", "Я ценю сотрудничество выше конкуренции", "Я хочу, чтобы все были равны", "я редко хвастаюсь", "я эмоционально сдержан", "я забочусь о деталях", "Я люблю порядок и регулярность", "Моя первая реакция на идею — увидеть ее недостатки"]);
  }

  void addSK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.sk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Som obľúbený na spoločenských akciách", "Nestarám sa o ostatných", "Vždy som pripravený", "Ľahko sa dostávam do stresu", "Mám bohatú slovnú zásobu", "Nerozprávam veľa", "Zaujímam sa o ľudí", "Nechávam svoje veci okolo", "Väčšinu času som uvoľnený", "Mám problém pochopiť abstraktné myšlienky", "Cítim sa dobre medzi ľuďmi", "Urážam ľudí", "Všímam si detaily", "Robím si starosti s vecami", "Mám bujnú predstavivosť", "Som rád v pozadí", "Som sentimentálny", "Robím veľa chýb", "Necítim sa často smutný", "Nemám záujem o abstraktné myšlienky", "Začínam rozhovory", "Nemám záujem o problémy iných ľudí", "Úlohy mám hotové hneď", "Som ľahko vyrušiteľný", "Mám výborné nápady", "Mám málo čo povedať", "Mám mäkké srdce", "Často zabúdam dať veci späť na svoje miesto", "Ľahko sa rozčúlim", "Nemám dobrú predstavivosť", "Na večierkoch sa rozprávam s mnohými rôznymi ľuďmi", "Iní ma nezaujímajú", "Mám rád disciplínu", "Veľmi mením náladu", "Rýchlo veciam rozumiem", "Nerada na seba strhávam pozornosť", "Venujem sa ostatným", "Vyhýbam sa svojim povinnostiam", "Mám časté zmeny nálad", "Používam zložité slová", "Nevadí mi byť stredobodom pozornosti", "Cítim emócie iných", "Riadim sa harmonogramom", "Ľahko sa podráždim", "Trávim čas premýšľaním o veciach", "V blízkosti cudzích ľudí som ticho", "Dávam ľuďom pocit pohody", "Vo svojej práci som náročný", "Často mi je smutno", "Som plný nápadov"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Cítim, že som hodnotný človek alebo aspoň rovnocenný s ostatnými", "Mám pocit, že mám množstvo dobrých vlastností", "Mám sklon mať pocit, že som neúspešný", "Dokážem veci rovnako dobre ako ostatní ľudia", "Mám pocit, že nemám byť na čo hrdý", "Mám k sebe pozitívny vzťah", "Celkovo som so sebou spokojný", "Prial by som si mať k sebe väčší rešpekt", "Niekedy sa cítim zbytočný", "Občas si myslím, že nie som vôbec dobrý"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Dostávam ľudí pod tlak", "Silne potrebujem moc", "Snažím sa prekonávať ostatných", "Vždy hľadám spôsoby, ako zarobiť peniaze", "Baví ma byť súčasťou hlasného davu", "Chcem, aby ma cudzinci milovali", "Veľa žartujem", "Robím veľa hluku", "Neváham kritizovať myšlienky iných ľudí", "Oceňujem spoluprácu pred konkurenciou", "Chcem, aby si boli všetci rovní", "Málokedy sa chválim", "Som citovo rezervovaný", "Záleží mi na detailoch", "Milujem poriadok a pravidelnosť", "Moja prvá reakcia na nápad je vidieť jeho nedostatky"]);
  }

  void addSL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.sl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Priljubljena sem na družabnih dogodkih", "Za druge mi je vseeno", "Vedno sem pripravljen", "Z lahkoto sem pod stresom", "Imam bogat besedni zaklad", "Ne govorim veliko", "Zanimajo me ljudje", "Svoje stvari puščam naokoli", "Večino časa sem sproščen", "Težko razumem abstraktne ideje", "V bližini ljudi se počutim udobno", "žalim ljudi", "Pozoren sem na podrobnosti", "Skrbijo me stvari", "Imam živo domišljijo", "Rada sem v ozadju", "Sem sentimentalen", "delam veliko napak", "Ne počutim se pogosto žalostno", "Abstraktne ideje me ne zanimajo", "začnem pogovore", "Težave drugih me ne zanimajo", "Opravila opravim takoj", "zlahka se motim", "Imam odlične ideje", "malo imam za povedati", "Imam mehko srce", "Pogosto pozabim stvari vrniti na pravo mesto", "zlahka se razburim", "Nimam dobre domišljije", "Na zabavah se pogovarjam z veliko različnimi ljudmi", "Drugi me ne zanimajo", "Rad imam disciplino", "Zelo spreminjam svoje razpoloženje", "Hitro razumem stvari", "Ne maram opozarjati nase", "Vzamem si čas za druge", "Izogibam se odgovornosti", "Imam pogoste spremembe razpoloženja", "Uporabljam zapletene besede", "Nimam nič proti temu, da sem v središču pozornosti", "Čutim čustva drugih", "Sledim urniku", "Z lahkoto se razdražim", "Čas porabim za razmišljanje o stvareh", "V bližini neznancev sem tiho", "Poskrbim, da se ljudje počutijo udobno", "Pri svojem delu sem natančna", "Pogosto se počutim žalostno", "polna sem idej"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Čutim, da sem vredna oseba ali vsaj enaka drugim", "Čutim, da imam številne dobre lastnosti", "Nagnjen sem k občutku, da sem neuspeh", "Lahko dosežem stvari tako dobro kot drugi ljudje", "Čutim, da nimam veliko na kaj biti ponosen", "Do sebe imam pozitiven odnos", "Na splošno sem s sabo zadovoljen", "Želim si, da bi imel več spoštovanja do sebe", "Včasih se počutim neuporabnega", "Včasih se mi zdi, da sploh nisem dober"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Spravljam ljudi pod pritisk", "Imam močno potrebo po moči", "Poskušam preseči druge", "Vedno iščem načine, kako zaslužiti denar", "Uživam v tem, da sem del glasne množice", "Želim, da me imajo tujci radi", "Veliko se šalim", "Delam veliko hrupa", "Oklevam kritizirati ideje drugih ljudi", "Cenim sodelovanje pred konkurenco", "Želim si, da bi bili vsi enaki", "Redko se pohvalim", "Čustveno sem zadržan", "Zanimajo me podrobnosti", "Obožujem red in pravilnost", "Moja prva reakcija na idejo je, da vidim njene pomanjkljivosti"]);
  }

  void addSR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.sr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Популаран сам на друштвеним догађајима", "Није ме брига за друге", "Увек сам спреман", "Лако сам под стресом", "Имам богат речник", "Не причам пуно", "Занимају ме људи", "Остављам своје ствари", "Већину времена сам опуштен", "Имам потешкоћа да разумем апстрактне идеје", "Осећам се пријатно међу људима", "вређам људе", "Обраћам пажњу на детаље", "Бринем се о стварима", "Ја имам бујну машту", "Волим да сам у позадини", "Сентименталан сам", "Правим много грешака", "Не осећам се често тужно", "Не занимају ме апстрактне идеје", "Почињем разговоре", "Не занимају ме туђи проблеми", "Послове обављам одмах", "Лако се узнемирим", "Имам одличне идеје", "Имам мало тога да кажем", "Ја имам меко срце", "Често заборавим да вратим ствари на своје место", "Лако се узнемирим", "Немам добру машту", "Разговарам са много различитих људи на забавама", "Други ме не занимају", "Волим дисциплину", "Много мењам расположење", "Брзо схватам ствари", "Не волим да скрећем пажњу на себе", "Одвајам време за друге", "Избегавам своје обавезе", "Имам честе промене расположења", "Користим сложене речи", "Не смета ми да будем у центру пажње", "Осећам туђе емоције", "Пратим распоред", "Лако се изнервирам", "Проводим време размишљајући о стварима", "Ја сам тих у близини странаца", "Чиним да се људи осећају пријатно", "Презиван сам у свом послу", "Често се осећам тужно", "пуна сам идеја"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Осећам да сам вредна особа, или барем једнака другима", "Осећам да имам низ добрих особина", "Склон сам да осећам да сам неуспешан", "Могу да постигнем ствари једнако добро као и други људи", "Осећам да немам чиме да се поносим", "Заузимам позитиван став према себи", "Све у свему, задовољан сам собом", "Волео бих да имам више поштовања према себи", "Понекад се осећам бескорисно", "Понекад мислим да нисам добар"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Стављам људе под притисак", "Имам јаку потребу за моћи", "Трудим се да надмашим друге", "Увек сам у потрази за начинима да зарадим новац", "Уживам што сам део бучне гомиле", "Желим да ме странци воле", "Много се шалим", "Правим много буке", "Оклевам да критикујем идеје других људи", "Ценим сарадњу у односу на конкуренцију", "Желим да сви буду једнаки", "Ретко се хвалим", "Емотивно сам резервисан", "Стало ми је до детаља", "Волим ред и редовност", "Моја прва реакција на идеју је да видим њене мане"]);
  }

  void addSV(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.sv;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Jag är populär på sociala evenemang", "Jag bryr mig inte om andra", "Jag är alltid beredd", "Jag blir lätt stressad", "Jag har ett rikt ordförråd", "Jag pratar inte mycket", "Jag är intresserad av människor", "Jag lämnar kvar mina ägodelar", "Jag är avslappnad för det mesta", "Jag har svårt att förstå abstrakta idéer", "Jag känner mig bekväm med människor", "Jag förolämpar människor", "Jag uppmärksammar detaljer", "Jag oroar mig för saker", "Jag har en livlig fantasi", "Jag gillar att vara i bakgrunden", "Jag är sentimental", "Jag gör många misstag", "Jag känner mig inte ledsen ofta", "Jag är inte intresserad av abstrakta idéer", "Jag börjar konversationer", "Jag är inte intresserad av andras problem", "Jag får sysslor gjorda direkt", "Jag blir lätt störd", "Jag har utmärkta idéer", "Jag har lite att säga", "Jag har ett mjukt hjärta", "Jag glömmer ofta att sätta tillbaka saker på rätt plats", "Jag blir lätt upprörd", "Jag har ingen bra fantasi", "Jag pratar med många olika människor på fester", "Jag är inte intresserad av andra", "Jag gillar ordning och reda", "Jag ändrar mitt humör mycket", "Jag är snabb på att förstå saker", "Jag gillar inte att dra uppmärksamhet till mig själv", "Jag tar time out för andra", "Jag undviker mitt ansvar", "Jag har ofta humörsvängningar", "Jag använder komplicerade ord", "Jag har inget emot att vara i centrum för uppmärksamheten", "Jag känner andras känslor", "Jag följer ett schema", "Jag blir lätt irriterad", "Jag ägnar tid åt att reflektera över saker", "Jag är tyst runt främlingar", "Jag får människor att känna sig bekväma", "Jag är krävande i mitt arbete", "Jag känner mig ofta ledsen", "Jag är full av idéer"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Jag känner att jag är en person av värde, eller åtminstone jämställd med andra", "Jag känner att jag har en rad bra egenskaper", "Jag är benägen att känna att jag är ett misslyckande", "Jag kan åstadkomma saker lika bra som andra människor", "Jag känner att jag inte har mycket att vara stolt över", "Jag har en positiv inställning till mig själv", "På det stora hela är jag nöjd med mig själv", "Jag önskar att jag kunde ha mer respekt för mig själv", "Jag känner mig värdelös ibland", "Ibland tror jag att jag inte är bra alls"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Jag sätter folk under press", "Jag har ett starkt behov av makt", "Jag försöker överträffa andra", "Jag är alltid på jakt efter sätt att tjäna pengar", "Jag tycker om att vara en del av en högljudd skara", "Jag vill att främlingar ska älska mig", "Jag skojar mycket", "Jag gör mycket oväsen", "Jag tvekar att kritisera andras idéer", "Jag värdesätter samarbete framför konkurrens", "Jag vill att alla ska vara lika", "Jag skryter sällan", "Jag är känslomässigt reserverad", "Jag bryr mig om detaljerna", "Jag älskar ordning och reda", "Min första reaktion på en idé är att se dess brister"]);
  }

  void addTH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.th;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["ฉันดังในงานสังคม", "ไม่สนใจคนอื่น", "ฉันพร้อมเสมอ", "เครียดง่าย", "ฉันมีคำศัพท์มากมาย", "ไม่พูดเยอะ", "ฉันสนใจคน", "ฉันทิ้งข้าวของไว้รอบๆ", "ฉันผ่อนคลายเกือบตลอดเวลา", "ฉันมีปัญหาในการเข้าใจความคิดที่เป็นนามธรรม", "ฉันรู้สึกสบายใจเมื่ออยู่ท่ามกลางผู้คน", "ฉันดูถูกคน", "ฉันใส่ใจในรายละเอียด", "ฉันกังวลเกี่ยวกับสิ่งต่าง ๆ", "ฉันมีจินตนาการที่สดใส", "ฉันชอบอยู่ข้างหลัง", "ฉันเป็นคนอารมณ์อ่อนไหว", "ฉันทำผิดพลาดมากมาย", "ไม่ค่อยรู้สึกเศร้า", "ฉันไม่สนใจความคิดที่เป็นนามธรรม", "ฉันเริ่มบทสนทนา", "ไม่สนใจปัญหาของคนอื่น", "ฉันทำงานบ้านเสร็จทันที", "หงุดหงิดง่าย", "ฉันมีความคิดที่ยอดเยี่ยม", "ฉันมีอะไรจะพูดน้อย", "ฉันมีหัวใจที่อ่อนโยน", "ฉันมักจะลืมใส่ของกลับเข้าที่", "หงุดหงิดง่าย", "จินตนาการไม่ค่อยดี", "ฉันพูดคุยกับผู้คนมากมายในงานปาร์ตี้", "ฉันไม่สนใจคนอื่น", "ชอบระเบียบวินัย", "เปลี่ยนอารมณ์ได้เยอะเลย", "ฉันเข้าใจสิ่งต่าง ๆ อย่างรวดเร็ว", "ไม่ชอบดึงความสนใจตัวเอง", "ฉันหาเวลาว่างให้คนอื่น", "ฉันหลีกเลี่ยงความรับผิดชอบของฉัน", "อารมณ์แปรปรวนบ่อย", "ฉันใช้คำที่ซับซ้อน", "ฉันไม่รังเกียจที่จะเป็นศูนย์กลางของความสนใจ", "ฉันรู้สึกถึงอารมณ์อื่น ๆ", "ฉันทำตามตารางเวลา", "หงุดหงิดง่าย", "ฉันใช้เวลาคิดทบทวนสิ่งต่างๆ", "ฉันเงียบกับคนแปลกหน้า", "ฉันทำให้คนรู้สึกสบายใจ", "ฉันขยันในการทำงาน", "ฉันมักจะรู้สึกเศร้า", "ฉันเต็มไปด้วยความคิด"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["รู้สึกว่าตัวเองเป็นคนมีค่า หรืออย่างน้อยก็เท่ากับคนอื่น", "รู้สึกว่าตัวเองมีคุณสมบัติที่ดีหลายอย่าง", "ฉันมีแนวโน้มที่จะรู้สึกว่าฉันเป็นคนล้มเหลว", "ฉันสามารถทำสิ่งที่ดีเหมือนคนอื่นได้", "ฉันรู้สึกว่าฉันไม่มีอะไรน่าภาคภูมิใจมากนัก", "ฉันมีทัศนคติที่ดีต่อตัวเอง", "โดยรวมแล้วฉันพอใจกับตัวเอง", "ฉันหวังว่าฉันจะเคารพตัวเองมากขึ้น", "ฉันรู้สึกไร้ค่าในบางครั้ง", "บางครั้งฉันคิดว่าฉันไม่ดีเลย"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["ฉันทำให้คนอยู่ภายใต้ความกดดัน", "ฉันต้องการพลังอย่างมาก", "ฉันพยายามเอาชนะคนอื่น", "ฉันมองหาวิธีการทำเงินอยู่เสมอ", "ฉันสนุกกับการเป็นส่วนหนึ่งของฝูงชนที่ดัง", "อยากให้คนแปลกหน้ามารัก", "พูดเล่นๆ", "ฉันทำเสียงดังมาก", "ไม่กล้าวิจารณ์ความคิดคนอื่น", "ฉันให้ความสำคัญกับความร่วมมือมากกว่าการแข่งขัน", "อยากให้ทุกคนเท่าเทียมกัน", "ไม่ค่อยได้โม้", "ฉันสงวนอารมณ์", "ฉันใส่ใจในรายละเอียด", "ฉันรักความเป็นระเบียบเรียบร้อย", "ปฏิกิริยาแรกของฉันต่อแนวคิดคือการเห็นข้อบกพร่องของมัน"]);
  }

  void addTR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.tr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Sosyal etkinliklerde popülerim", "başkaları umurumda değil", "ben her zaman hazırım", "kolayca strese girerim", "zengin bir kelime hazinem var", "çok konuşmam", "insanlarla ilgileniyorum", "eşyalarımı etrafta bırakıyorum", "çoğu zaman rahatım", "Soyut fikirleri anlamakta güçlük çekiyorum", "insanların yanında kendimi rahat hissediyorum", "insanlara hakaret ediyorum", "ayrıntılara dikkat ederim", "şeyler için endişeleniyorum", "canlı bir hayal gücüm var", "arka planda olmayı seviyorum", "ben duygusalım", "birçok hata yapıyorum", "sık sık üzgün hissetmiyorum", "Soyut fikirlerle ilgilenmiyorum", "konuşmaları başlatırım", "Başkalarının sorunlarıyla ilgilenmiyorum", "İşlerimi hemen hallederim", "kolayca rahatsız olurum", "harika fikirlerim var", "söyleyecek çok az şeyim var", "yumuşak bir kalbim var", "Çoğu zaman eşyaları uygun yerlerine koymayı unuturum.", "kolay sinirlenirim", "iyi bir hayal gücüm yok", "Partilerde birçok farklı insanla konuşuyorum", "başkalarıyla ilgilenmiyorum", "disiplini severim", "ruh halimi çok değiştiririm", "şeyleri anlamakta hızlıyım", "kendime dikkat çekmeyi sevmiyorum", "başkalarına zaman ayırırım", "sorumluluklarımdan kaçıyorum", "Sık sık ruh hali değişimleri yaşıyorum", "karmaşık kelimeler kullanırım", "İlgi odağı olmayı umursamıyorum", "başka duygular hissediyorum", "bir programa uyuyorum", "kolay sinirlenirim", "Bir şeyler üzerinde düşünmek için zaman harcıyorum", "yabancıların yanında sessizim", "insanları rahat ettiririm", "işimde titizim", "sık sık üzgün hissediyorum", "fikirlerle doluyum"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Değerli bir insan olduğumu veya en azından başkalarıyla eşit olduğumu hissediyorum.", "Bir dizi iyi özelliğim olduğunu hissediyorum", "Başarısız olduğumu hissetmeye meyilliyim", "Diğer insanlar kadar iyi şeyler başarabilirim", "Gurur duyacak çok şeyim olmadığını hissediyorum", "Kendime karşı olumlu bir tavır alıyorum", "Genel olarak kendimden memnunum", "Keşke kendime daha fazla saygı duyabilseydim", "bazen işe yaramaz hissediyorum", "Bazen hiç iyi olmadığımı düşünüyorum"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["insanları baskı altına alırım", "Güçlü bir güce ihtiyacım var", "başkalarını geçmeye çalışıyorum", "Her zaman para kazanmanın yollarını ararım", "Gürültülü bir kalabalığın parçası olmaktan hoşlanırım", "yabancıların beni sevmesini istiyorum", "çok şaka yaparım", "çok gürültü yaparım", "Başkalarının fikirlerini eleştirmekten çekinirim", "Rekabetten çok işbirliğine değer veririm", "herkesin eşit olmasını istiyorum", "nadiren övünürüm", "duygusal olarak kapalıyım", "ayrıntılara önem veririm", "düzen ve düzenliliği severim", "Bir fikre ilk tepkim onun kusurlarını görmektir."]);
  }

  void addUK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.uk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Я популярний на світських заходах", "Мені байдуже до інших", "Я завжди готовий", "Я легко відчуваю стрес", "Маю багатий словниковий запас", "Я мало розмовляю", "Мене цікавлять люди", "Я залишаю свої речі", "Більшу частину часу я розслаблений", "Мені важко зрозуміти абстрактні ідеї", "Мені комфортно поруч з людьми", "Я ображаю людей", "Я звертаю увагу на деталі", "Я хвилююся про речі", "У мене яскрава уява", "Мені подобається бути на задньому плані", "Я сентиментальний", "Я роблю багато помилок", "Я не часто сумую", "Мене не цікавлять абстрактні ідеї", "Починаю розмови", "Мене не цікавлять чужі проблеми", "Я одразу виконую роботу", "Мене легко турбувати", "У мене є чудові ідеї", "Мені мало що сказати", "У мене м’яке серце", "Я часто забуваю повернути речі на місце", "Я легко засмучуюся", "Я не маю гарної уяви", "Я розмовляю з багатьма різними людьми на вечірках", "Мене не цікавлять інші", "Мені подобається дисципліна", "Я дуже міняю настрій", "Я швидко розумію речі", "Я не люблю привертати до себе увагу", "Я беру тайм-аут для інших", "Я уникаю своїх обов’язків", "У мене часті зміни настрою", "Я використовую складні слова", "Я не проти бути в центрі уваги", "Я відчуваю емоції інших", "Я дотримуюся розкладу", "Я легко дратуюся", "Я витрачаю час на роздуми про речі", "Я мовчу біля незнайомців", "Я змушую людей відчувати себе комфортно", "Я вимогливий у своїй роботі", "Я часто сумую", "Я сповнена ідей"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Я відчуваю, що я людина гідна чи, принаймні, рівна з іншими", "Я відчуваю, що маю низку хороших якостей", "Я схильний відчувати, що я невдаха", "Я можу робити речі так само добре, як і інші люди", "Я відчуваю, що мені нема чим пишатися", "Я ставлюся до себе позитивно", "Загалом я задоволений собою", "Я хотів би мати більше поваги до себе", "Іноді я відчуваю себе непотрібним", "Часом мені здається, що я зовсім не хороша"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Я чинив тиск на людей", "Я маю гостру потребу у владі", "Я намагаюся перевершити інших", "Я завжди шукаю способи заробити гроші", "Мені подобається бути частиною гучного натовпу", "Я хочу, щоб мене любили незнайомці", "Я багато жартую", "Я роблю багато шуму", "Я соромлюся критикувати ідеї інших людей", "Я ціную співпрацю над конкуренцією", "Я хочу, щоб усі були рівними", "Я рідко хвалюся", "Я емоційно стриманий", "Мене цікавлять деталі", "Люблю порядок і регулярність", "Моя перша реакція на ідею — побачити її недоліки"]);
  }

  void addVI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.vi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Tôi nổi tiếng ở các sự kiện xã hội", "Tôi không quan tâm đến người khác", "Tôi luôn chuẩn bị", "Tôi dễ bị căng thẳng", "Tôi có một vốn từ vựng phong phú", "Tôi không nói nhiều", "Tôi quan tâm đến mọi người", "Tôi để lại đồ đạc của mình xung quanh", "Tôi thư giãn hầu hết thời gian", "Tôi khó hiểu những ý tưởng trừu tượng", "Tôi cảm thấy thoải mái khi ở bên mọi người", "Tôi xúc phạm mọi người", "Tôi chú ý đến chi tiết", "Tôi lo lắng về mọi thứ", "Tôi có trí tưởng tượng sống động", "Tôi thích ở trong nền", "Tôi đa cảm", "Tôi mắc nhiều lỗi", "Tôi không cảm thấy buồn thường xuyên", "Tôi không quan tâm đến những ý tưởng trừu tượng", "Tôi bắt đầu cuộc trò chuyện", "Tôi không quan tâm đến vấn đề của người khác", "Tôi hoàn thành công việc ngay lập tức", "Tôi dễ bị quấy rầy", "Tôi có những ý tưởng tuyệt vời", "Tôi có ít điều để nói", "Tôi có một trái tim mềm mại", "Tôi thường quên đặt mọi thứ trở lại đúng vị trí của chúng", "Tôi dễ buồn bực", "Tôi không có trí tưởng tượng tốt", "Tôi nói chuyện với rất nhiều người khác nhau trong các bữa tiệc", "Tôi không quan tâm đến người khác", "Tôi thích kỷ luật", "Tôi thay đổi tâm trạng rất nhiều", "Tôi nhanh chóng hiểu mọi thứ", "Tôi không thích thu hút sự chú ý vào bản thân", "Tôi dành thời gian cho người khác", "Tôi trốn tránh trách nhiệm của mình", "Tôi thường xuyên thay đổi tâm trạng", "Tôi sử dụng những từ phức tạp", "Tôi không ngại trở thành trung tâm của sự chú ý", "Tôi cảm thấy những người khác cảm xúc", "Tôi tuân theo một lịch trình", "Tôi dễ bị kích thích", "Tôi dành thời gian suy ngẫm về mọi thứ", "Tôi yên lặng xung quanh những người xa lạ", "Tôi làm cho mọi người cảm thấy thoải mái", "Tôi đang làm việc chính xác", "Tôi thường cảm thấy buồn", "Tôi có đầy đủ các ý tưởng"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["Tôi cảm thấy rằng tôi là một người có giá trị, hoặc ít nhất là ngang hàng với những người khác", "Tôi cảm thấy rằng tôi có một số phẩm chất tốt", "Tôi có xu hướng cảm thấy rằng tôi là một kẻ thất bại", "Tôi có thể hoàn thành mọi thứ tốt như những người khác", "Tôi cảm thấy tôi không có nhiều điều để tự hào", "Tôi có một thái độ tích cực đối với bản thân", "Nhìn chung, tôi hài lòng với bản thân", "Tôi ước mình có thể tôn trọng bản thân mình hơn", "Đôi khi tôi cảm thấy vô dụng", "Có lúc tôi nghĩ mình chẳng giỏi giang gì cả"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["Tôi gây áp lực cho mọi người", "Tôi có nhu cầu mạnh mẽ về quyền lực", "Tôi cố gắng vượt qua những người khác", "Tôi luôn tìm cách kiếm tiền", "Tôi thích là một phần của một đám đông ồn ào", "Tôi muốn người lạ yêu tôi", "Tôi nói đùa rất nhiều", "Tôi tạo ra rất nhiều tiếng ồn", "Tôi ngại phê bình ý tưởng của người khác", "Tôi coi trọng sự hợp tác hơn là cạnh tranh", "Tôi muốn mọi người đều bình đẳng", "Tôi hiếm khi khoe khoang", "Tôi là người dè dặt về tình cảm", "Tôi quan tâm đến các chi tiết", "Tôi yêu trật tự và đều đặn", "Phản ứng đầu tiên của tôi đối với một ý tưởng là nhìn thấy những sai sót của nó"]);
  }

  void addZH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.zh;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["我在社交活动中很受欢迎", "我不在乎别人", "我时刻准备着", "我很容易感到压力", "我有丰富的词汇", "我话不多", "我对人感兴趣", "我把我的东西留在身边", "我大部分时间都很放松", "我很难理解抽象的想法", "我在人们身边感到很自在", "我侮辱人", "我注重细节", "我担心事情", "我有一个生动的想象", "我喜欢在后台", "我很感性", "我犯了很多错误", "我不经常感到难过", "我对抽象的想法不感兴趣", "我开始对话", "我对别人的问题不感兴趣", "我马上做家务", "我很容易被打扰", "我有很棒的想法", "我无话可说", "我有一颗柔软的心", "我经常忘记把东西放回原处", "我很容易生气", "我没有很好的想象力", "我在聚会上和很多不同的人交谈", "我对别人不感兴趣", "我喜欢纪律", "我改变了很多心情", "我很快就明白了", "我不喜欢引起别人注意", "我为别人抽出时间", "我逃避我的责任", "我经常情绪波动", "我用复杂的词", "我不介意成为关注的焦点", "我感觉到别人的情绪", "我遵循时间表", "我很容易生气", "我花时间思考事情", "我对陌生人很安静", "我让人们感到舒适", "我对我的工作要求严格", "我经常感到难过", "我充满了想法"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["我觉得我是一个有价值的人，或者至少与其他人平等", "我觉得我有很多好的品质", "我倾向于觉得我是个失败者", "我可以像其他人一样完成事情", "我觉得我没有什么值得骄傲的", "我对自己采取积极的态度", "总的来说，我对自己很满意", "我希望我能对自己有更多的尊重", "我有时觉得没用", "有时我觉得我一点也不好"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["我让人们承受压力", "我对权力有强烈的需求", "我试图超越别人", "我一直在寻找赚钱的方法", "我喜欢成为喧嚣人群中的一员", "我希望陌生人爱我", "我经常开玩笑", "我制造很多噪音", "我不愿批评别人的想法", "我重视合作胜过竞争", "我希望每个人都平等", "我很少吹嘘", "我在情感上很保守", "我关心细节", "我喜欢秩序和规律", "我对一个想法的第一反应是看到它的缺陷"]);
  }

}
