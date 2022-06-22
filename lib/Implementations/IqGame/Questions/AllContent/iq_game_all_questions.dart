import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class IqGameAllQuestions extends AllQuestionsService {
  static final IqGameAllQuestions singleton = IqGameAllQuestions.internal();

  factory IqGameAllQuestions() {
    return singleton;
  }

  IqGameAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = IqGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
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
      IqGameQuestionConfig questionConfig) {
    var language = Language.ar;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "‎‎‎‎‎‎‎‎‎‎‎‎أي كوكب هو الأقرب إلى الشمس؟‎‎‎‎::‎‎عطارد##كوكب الزهرة##زحل##كوكب المشتري‎‎‎‎::‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎ما هي العلامة الذرية للهليوم في الجدول الدوري؟‎‎‎‎::‎‎O##He##Fe##Se‎‎::‎‎1‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎أين يقع تاج محل؟‎‎‎‎::‎‎الصين##الهند##فرنسا##اليابان‎‎‎‎::‎‎1‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎أين يقع جبل كليمنجارو؟‎‎‎‎::‎‎تنزانيا##البرازيل##مصر##اليابان‎‎‎‎::‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎أي رسام ينتمي إلى الحركة السريالية؟‎‎‎‎::‎‎ليوناردو دافنشي##سلفادور دالي##بابلو بيكاسو##مارك شاغال‎‎‎‎::‎‎1‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎في أي بلد نشأت الأولمبياد؟‎‎‎‎::‎‎فرنسا##إيطاليا##اليونان##سويسرا‎‎‎‎::‎‎2‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎كم عدد الفصوص التي يمتلكها دماغ الإنسان؟‎‎‎‎::‎‎1##2##3##4‎‎‎‎::‎‎3‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎ما هو الطائر الذي شاع استخدامه من قبل البشر لإرسال الرسائل؟‎‎‎‎::‎‎حمامة##هوك##نسر##عصفور‎‎‎‎::‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎رهاب العناكب هو الخوف من ماذا؟‎‎‎‎::‎‎العناكب##مساحات صغيرة##يحشد##مطار‎‎‎‎::‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎ما هي أقدم حضارة نعرفها؟‎‎‎‎::‎‎الحضارة السومرية##الحضارة المصرية##الحضارة الصينية##الحضارة الهندية‎‎‎‎::‎‎0‎‎"
        ]);
  }

  void addBG(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.bg;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Коя планета е най-близо до слънцето?::Меркурий##Венера##Сатурн##Юпитер::0",
          "Какъв е атомният знак за хелия в периодичната таблица?::O##He##Fe##Se::1",
          "Къде се намира Тадж Махал?::Китай##Индия##Франция##Япония::1",
          "Къде се намира планината Килиманджаро?::Танзания##Бразилия##Египет##Япония::0",
          "Кой художник принадлежи към движението сюрреализъм?::Леонардо да Винчи##Салвадор Дали##Пабло Пикасо##Марк Шагал::1",
          "В коя държава е възникнала олимпиадата?::Франция##Италия##Гърция##Швейцария::2",
          "Колко лоба има човешкият мозък?::1##2##3##4::3",
          "Коя птица обикновено е била използвана от хората за изпращане на съобщения?::гълъб##Ястреб##орел##Врабче::0",
          "Арахнофобията е страх от какво?::паяци##Малки пространства##Тълпа##Самолет::0",
          "Коя е най-старата цивилизация, която познаваме?::Шумерската цивилизация##Египетската цивилизация##Китайската цивилизация##Индийската цивилизация::0"
        ]);
  }

  void addCS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.cs;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Která planeta je nejblíže Slunci?::Merkur##Venuše##Saturn##Jupiter::0",
          "Jaký je atomový znak pro helium v ​​periodické tabulce?::O##He##Fe##Se::1",
          "Kde se nachází Taj Mahal?::Čína##Indie##Francie##Japonsko::1",
          "Kde se nachází Mount Kilimanjaro?::Tanzanie##Brazílie##Egypt##Japonsko::0",
          "Který malíř patří k hnutí surrealismu?::Leonardo da Vinci##Salvador dali##Pablo Picasso##Marc Chagall::1",
          "Ve které zemi vznikla olympiáda?::Francie##Itálie##Řecko##Švýcarsko::2",
          "Kolik laloků má lidský mozek?::1##2##3##4::3",
          "Kterého ptáka lidé běžně používali k odesílání zpráv?::Holub##Jestřáb##Orel##Vrabec::0",
          "Arachnofobie je strach z čeho?::Pavouci##Malé prostory##Dav##Letoun::0",
          "Jaká je nejstarší civilizace, kterou známe?::Sumerská civilizace##Egyptská civilizace##Čínská civilizace##Indická civilizace::0"
        ]);
  }

  void addDA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.da;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Hvilken planet er tættest på solen?::Merkur##Venus##Saturn##Jupiter::0",
          "Hvad er atomtegnet for helium i det periodiske system?::O##He##Fe##Se::1",
          "Hvor ligger Taj Mahal?::Kina##Indien##Frankrig##Japan::1",
          "Hvor ligger Mount Kilimanjaro?::Tanzania##Brasilien##Egypten##Japan::0",
          "Hvilken maler tilhører surrealismebevægelsen?::Leonardo Da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "I hvilket land blev de olympiske lege oprindeligt afholdt?::Frankrig##Italien##Grækenland##Schweiz::2",
          "Hvor mange lapper har den menneskelige hjerne?::1##2##3##4::3",
          "Hvilken fugl blev almindeligvis brugt af mennesker til at sende beskeder?::Due##Høg##Ørn##spurv::0",
          "Arachnophobia er frygten for hvad?::Edderkopper##Små rum##Crowd##Fly::0",
          "Hvad er den ældste civilisation, vi kender til?::Den sumeriske civilisation##Den egyptiske civilisation##Den kinesiske civilisation##Den indiske civilisation::0"
        ]);
  }

  void addDE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.de;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Welcher Planet ist der Sonne am nächsten?::Merkur##Venus##Saturn##Jupiter::0",
          "Welches Atomzeichen hat Helium im Periodensystem?::O##He##Fe##Se::1",
          "Wo steht das Taj Mahal?::China##Indien##Frankreich##Japan::1",
          "Wo befindet sich der Kilimandscharo?::Tansania##Brasilien##Ägypten##Japan::0",
          "Welcher Maler gehört zur Bewegung des Surrealismus?::Leonardo daVinci##Salvador Dalí##Pablo Picasso##Marc Chagall::1",
          "In welchem ​​Land haben die Olympischen Spiele ihren Ursprung?::Frankreich##Italien##Griechenland##Schweiz::2",
          "Wie viele Lappen hat das menschliche Gehirn?::1##2##3##4::3",
          "Welcher Vogel wurde üblicherweise von Menschen verwendet, um Nachrichten zu senden?::Taube##Falke##Adler##Spatz::0",
          "Arachnophobie ist die Angst wovor?::Spinnen##Kleine Plätze##Menge##Flugzeug::0",
          "Was ist die älteste uns bekannte Zivilisation?::Die sumerische Zivilisation##Die ägyptische Zivilisation##Die chinesische Zivilisation##Die indische Zivilisation::0"
        ]);
  }

  void addEL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.el;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Ποιος πλανήτης είναι πιο κοντά στον ήλιο;::Ερμής##Αφροδίτη##Κρόνος##Δίας::0",
          "Ποιο είναι το ατομικό πρόσημο του Ήλιου στον περιοδικό πίνακα;::O##He##Fe##Se::1",
          "Πού βρίσκεται το Ταζ Μαχάλ;::Κίνα##Ινδία##Γαλλία##Ιαπωνία::1",
          "Πού βρίσκεται το όρος Κιλιμάντζαρο;::Τανζανία##Βραζιλία##Αίγυπτος##Ιαπωνία::0",
          "Ποιος ζωγράφος ανήκει στο κίνημα του σουρεαλισμού;::Λεονάρντο Ντα Βίντσι##Σαλβαδόρ Νταλί##Πάμπλο Πικάσο##Μαρκ Σαγκάλ::1",
          "Σε ποια χώρα ξεκίνησαν οι Ολυμπιακοί Αγώνες;::Γαλλία##Ιταλία##Ελλάδα##Ελβετία::2",
          "Πόσους λοβούς έχει ο ανθρώπινος εγκέφαλος;::1##2##3##4::3",
          "Ποιο πουλί χρησιμοποιήθηκε συνήθως από τους ανθρώπους για να στείλουν μηνύματα;::Περιστέρι##Γεράκι##Αετός##Σπουργίτης::0",
          "Η αραχνοφοβία είναι ο φόβος για ποιο πράγμα;::Αράχνες##Μικροί χώροι##Πλήθος##Αεροπλάνο::0",
          "Ποιος είναι ο αρχαιότερος πολιτισμός που γνωρίζουμε;::Ο πολιτισμός των Σουμερίων##Ο αιγυπτιακός πολιτισμός##Ο κινεζικός πολιτισμός##Ο ινδικός πολιτισμός::0"
        ]);
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Which planet is the closest to the sun?::Mercury##Venus##Saturn##Jupiter::0",
          "What is the atomic sign for Helium on the periodic table?::O##He##Fe##Se::1",
          "Where is the Taj Mahal located?::China##India##France##Japan::1",
          "Where is Mount Kilimanjaro located?::Tanzania##Brazil##Egypt##Japan::0",
          "Which painter belongs to the Surrealism movement?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "In which country did the Olympics originate?::France##Italy##Greece##Switzerland::2",
          "How many lobes does the human brain have?::1##2##3##4::3",
          "Which bird was commonly used by humans to send messages?::Pigeon##Hawk##Eagle##Sparrow::0",
          "Arachnophobia is the fear of what?::Spiders##Small spaces##Crowd##Airplane::0",
          "What is the oldest civilization we know of?::The Sumerian civilization##The Egyptian civilization##The Chinese civilization##The Indian civilization::0"
        ]);
  }

  void addES(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.es;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "¿Qué planeta es el más cercano al sol?::Mercurio##Venus##Saturno##Júpiter::0",
          "¿Cuál es el signo atómico del helio en la tabla periódica?::O##He##Fe##Se::1",
          "¿Dónde se encuentra el Taj Mahal?::China##India##Francia##Japón::1",
          "¿Dónde se encuentra el Monte Kilimanjaro?::Tanzania##Brasil##Egipto##Japón::0",
          "¿Qué pintor pertenece al movimiento surrealista?::leonardo da vinci##Salvador Dalí##Pablo Picasso##marc chagall::1",
          "¿En qué país se originaron los Juegos Olímpicos?::Francia##Italia##Grecia##Suiza::2",
          "¿Cuántos lóbulos tiene el cerebro humano?::1##2##3##4::3",
          "¿Qué ave era comúnmente utilizada por los humanos para enviar mensajes?::Paloma##Halcón##Águila##Gorrión::0",
          "¿La aracnofobia es el miedo a qué?::Arañas##Pequenos espacios##Multitud##Avión::0",
          "¿Cuál es la civilización más antigua que conocemos?::La civilización sumeria##La civilización egipcia##La civilización china##La civilización india::0"
        ]);
  }

  void addFI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.fi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Mikä planeetta on lähimpänä aurinkoa?::Merkurius##Venus##Saturnus##Jupiter::0",
          "Mikä on heliumin atomimerkki jaksollisessa taulukossa?::O##He##Fe##Se::1",
          "Missä Taj Mahal sijaitsee?::Kiina##Intia##Ranska##Japani::1",
          "Missä Kilimanjaro-vuori sijaitsee?::Tansania##Brasilia##Egypti##Japani::0",
          "Kuka taidemaalari kuuluu surrealismiliikkeeseen?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "Mistä maasta olympialaiset syntyivät?::Ranska##Italia##Kreikka##Sveitsi::2",
          "Kuinka monta lohkoa ihmisen aivoissa on?::1##2##3##4::3",
          "Mitä lintua ihmiset käyttivät yleisesti viestien lähettämiseen?::Kyyhkynen##Haukka##Kotka##varpunen::0",
          "Mitä araknofobia on pelko?::Hämähäkit##Pienet paikat##Väkijoukko##Lentokone::0",
          "Mikä on vanhin sivilisaatio, jonka tiedämme?::Sumerilainen sivilisaatio##Egyptin sivilisaatio##Kiinalainen sivilisaatio##Intian sivilisaatio::0"
        ]);
  }

  void addFR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.fr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Quelle planète est la plus proche du soleil ?::Mercure##Vénus##Saturne##Jupiter::0",
          "Quel est le signe atomique de l'hélium dans le tableau périodique ?::O##He##Fe##Se::1",
          "Où se situe le Taj Mahal ?::Chine##Inde##France##Japon::1",
          "Où se trouve le mont Kilimandjaro ?::Tanzanie##Brésil##Egypte##Japon::0",
          "Quel peintre appartient au mouvement surréaliste ?::Léonard de Vinci##Salvador Dalí##Pablo Picasso##Marc Chagall::1",
          "Dans quel pays les Jeux Olympiques sont-ils originaires ?::France##Italie##Grèce##Suisse::2",
          "Combien de lobes le cerveau humain possède-t-il ?::1##2##3##4::3",
          "Quel oiseau était couramment utilisé par les humains pour envoyer des messages ?::Pigeon##Faucon##Aigle##Moineau::0",
          "L'arachnophobie est la peur de quoi ?::Araignées##Petites espaces##Foule##Avion::0",
          "Quelle est la plus ancienne civilisation connue ?::La civilisation sumérienne##La civilisation égyptienne##La civilisation chinoise##La civilisation indienne::0"
        ]);
  }

  void addHE(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.he;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "‎‎‎‎‎‎‎‎‎‎‎‎איזה כוכב לכת הכי קרוב לשמש?‎‎‎‎::‎‎‎‎כוכב חמה##וֵנוּס##שַׁבְתַאִי##צדק‎‎‎‎::‎‎‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎מהו הסימן האטומי של הליום בטבלה המחזורית?‎‎‎‎::‎‎O##He##Fe##Se‎‎::‎‎1‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎היכן ממוקם הטאג' מאהל?‎‎‎‎::‎‎‎‎חרסינה##הוֹדוּ##צָרְפַת##יפן‎‎‎‎::‎‎‎‎1‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎היכן ממוקם הר קילימנג'רו?‎‎‎‎::‎‎‎‎טנזניה##בְּרָזִיל##מִצְרַיִם##יפן‎‎‎‎::‎‎‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎איזה צייר שייך לתנועת הסוריאליזם?‎‎‎‎::‎‎‎‎לאונרדו דה וינצ'י##סלבדור דאלי##פאבלו פיקאסו##מארק שאגאל‎‎‎‎::‎‎‎‎1‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎באיזו מדינה נוצרה האולימפיאדה?‎‎‎‎::‎‎‎‎צָרְפַת##אִיטַלִיָה##יָוָן##שוויץ‎‎‎‎::‎‎‎‎2‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎כמה אונות יש למוח האנושי?‎‎‎‎::‎‎‎‎1##2##3##4‎‎‎‎::‎‎‎‎3‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎איזו ציפור שימשה בדרך כלל בני אדם לשליחת הודעות?‎‎‎‎::‎‎‎‎יוֹנָה##נֵץ##נשר##דְרוֹר‎‎‎‎::‎‎‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎ארכנופוביה היא הפחד ממה?‎‎‎‎::‎‎‎‎עכבישים##חללים קטנים##קָהָל##מטוס‎‎‎‎::‎‎‎‎0‎‎",
          "‎‎‎‎‎‎‎‎‎‎‎‎מהי הציוויליזציה העתיקה ביותר שאנו מכירים?‎‎‎‎::‎‎‎‎הציוויליזציה השומרית##הציוויליזציה המצרית##הציוויליזציה הסינית##הציוויליזציה ההודית‎‎‎‎::‎‎‎‎0‎‎"
        ]);
  }

  void addHI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.hi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "कौन सा ग्रह सूर्य के सबसे निकट है?::बुध##शुक्र##शनि ग्रह##बृहस्पति::0",
          "आवर्त सारणी पर हीलियम के लिए परमाणु चिन्ह क्या है?::O##He##Fe##Se::1",
          "ताजमहल कहाँ स्थित है?::चीन##भारत##फ्रांस##जापान::1",
          "किलिमंजारो पर्वत कहाँ स्थित है?::तंजानिया##ब्राज़िल##मिस्र##जापान::0",
          "अतियथार्थवाद आंदोलन का संबंध किस चित्रकार से है?::लियोनार्डो दा विंसी##साल्वाडोर डाली##पब्लो पिकासो##मार्क चागलो::1",
          "ओलंपिक की शुरुआत किस देश में हुई थी?::फ्रांस##इटली##यूनान##स्विट्ज़रलैंड::2",
          "मानव मस्तिष्क में कितने लोब होते हैं?::1##2##3##4::3",
          "मनुष्य आमतौर पर संदेश भेजने के लिए किस पक्षी का उपयोग करता था?::कबूतर##बाज़##गरुड़##गौरैया::0",
          "अरकोनोफोबिया किससे डरता है?::मकड़ियों##छोटी जगहें##जन सैलाब##विमान::0",
          "हम किस प्राचीनतम सभ्यता के बारे में जानते हैं?::सुमेरियन सभ्यता##मिस्र की सभ्यता##चीनी सभ्यता##भारतीय सभ्यता::0"
        ]);
  }

  void addHR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.hr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Koji je planet najbliži suncu?::Merkur##Venera##Saturn##Jupiter::0",
          "Koji je atomski predznak za helij u periodnom sustavu?::O##He##Fe##Se::1",
          "Gdje se nalazi Taj Mahal?::Kina##Indija##Francuska##Japan::1",
          "Gdje se nalazi planina Kilimandžaro?::Tanzanija##Brazil##Egipat##Japan::0",
          "Koji slikar pripada pokretu nadrealizma?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "U kojoj zemlji su nastale Olimpijske igre?::Francuska##Italija##Grčka##Švicarska::2",
          "Koliko režnjeva ima ljudski mozak?::1##2##3##4::3",
          "Koju pticu su ljudi obično koristili za slanje poruka?::Golub##Sokol##Orao##Vrabac::0",
          "Arahnofobija je strah od čega?::Pauci##Mali prostori##Gomila##Zrakoplov::0",
          "Koja je najstarija civilizacija za koju znamo?::Sumerska civilizacija##Egipatska civilizacija##Kineska civilizacija##Indijska civilizacija::0"
        ]);
  }

  void addHU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.hu;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Melyik bolygó van a legközelebb a Naphoz?::Merkúr##Vénusz##Szaturnusz##Jupiter::0",
          "Mi a hélium atomjele a periódusos rendszerben?::O##He##Fe##Se::1",
          "Hol található a Tádzs Mahal?::Kína##India##Franciaország##Japán::1",
          "Hol található a Kilimandzsáró-hegy?::Tanzánia##Brazília##Egyiptom##Japán::0",
          "Melyik festő tartozik a szürrealizmus mozgalomhoz?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "Melyik országban indult az olimpia?::Franciaország##Olaszország##Görögország##Svájc::2",
          "Hány lebenye van az emberi agynak?::1##2##3##4::3",
          "Melyik madarat használtak általában üzenetküldésre?::Galamb##Sólyom##Sas##Veréb::0",
          "Az arachnofóbia mitől való félelem?::Pókok##Kis helyek##Tömeg##Repülőgép::0",
          "Melyik az általunk ismert legrégebbi civilizáció?::A sumér civilizáció##Az egyiptomi civilizáció##A kínai civilizáció##Az indiai civilizáció::0"
        ]);
  }

  void addID(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.id;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Planet manakah yang paling dekat dengan matahari?::Merkurius##Venus##Saturnus##Jupiter::0",
          "Apa tanda atom Helium pada tabel periodik?::O##He##Fe##Se::1",
          "Di manakah lokasi Taj Mahal?::Cina##India##Perancis##Jepang::1",
          "Di manakah lokasi Gunung Kilimanjaro?::Tanzania##Brazil##Mesir##Jepang::0",
          "Pelukis mana yang termasuk dalam gerakan Surealisme?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "Di negara mana Olimpiade berasal?::Perancis##Italia##Yunani##Swiss::2",
          "Berapa banyak lobus yang dimiliki otak manusia?::1##2##3##4::3",
          "Burung apa yang biasa digunakan manusia untuk berkirim pesan?::Merpati##Elang##Burung rajawali##Burung gereja::0",
          "Arachnophobia adalah ketakutan akan apa?::laba-laba##Ruangan kecil##Kerumunan##Pesawat terbang::0",
          "Apa peradaban tertua yang kita ketahui?::Peradaban Sumeria##Peradaban Mesir##Peradaban Tiongkok##Peradaban India::0"
        ]);
  }

  void addIT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.it;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Qual è il pianeta più vicino al sole?::Mercurio##Venere##Saturno##Giove::0",
          "Qual è il segno atomico dell'elio sulla tavola periodica?::O##He##Fe##Se::1",
          "Dove si trova il Taj Mahal?::Cina##India##Francia##Giappone::1",
          "Dove si trova il Monte Kilimangiaro?::Tanzania##Brasile##Egitto##Giappone::0",
          "Quale pittore appartiene al movimento del Surrealismo?::Leonardo Da Vinci##Salvador Dalì##Pablo Picasso##Marc Chagall::1",
          "In quale paese sono nate le Olimpiadi?::Francia##Italia##Grecia##Svizzera::2",
          "Quanti lobi ha il cervello umano?::1##2##3##4::3",
          "Quale uccello era comunemente usato dagli esseri umani per inviare messaggi?::Piccione##Falco##Aquila##Passero::0",
          "L'aracnofobia è la paura di cosa?::Ragni##Piccoli spazi##Folla##Aereo::0",
          "Qual è la civiltà più antica che conosciamo?::La civiltà sumera##La civiltà egizia##La civiltà cinese##La civiltà indiana::0"
        ]);
  }

  void addJA(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.ja;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "どの惑星が太陽に最も近いですか？::水星##金星##土星##木星::0",
          "周期表のヘリウムの原子記号は何ですか？::O##He##Fe##Se::1",
          "タージマハルはどこにありますか？::中国##インド##フランス##日本::1",
          "キリマンジャロ山はどこにありますか？::タンザニア##ブラジル##エジプト##日本::0",
          "どの画家がシュルレアリスム運動に属していますか？::レオナルド・ダ・ヴィンチ##サルバドール・ダリ##パブロ・ピカソ##マルク・シャガール::1",
          "オリンピックはどの国で始まりましたか？::フランス##イタリア##ギリシャ##スイス::2",
          "人間の脳にはいくつの葉がありますか？::1##2##3##4::3",
          "メッセージを送信するために人間が一般的に使用した鳥はどれですか？::鳩##鷹##鷲##スズメ::0",
          "クモ恐怖症は何の恐れですか？::蜘蛛##小さな空間##群衆##飛行機::0",
          "私たちが知っている最も古い文明は何ですか？::サマー文明##エジプト文明##中国文明##インド文明::0"
        ]);
  }

  void addKO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.ko;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "태양에 가장 가까운 행성은?::수성##금성##토성##목성::0",
          "주기율표에서 헬륨의 원자 기호는 무엇입니까?::O##He##Fe##Se::1",
          "타지마할은 어디에 있습니까?::중국##인도##프랑스##일본::1",
          "킬리만자로 산은 어디에 있습니까?::탄자니아##브라질##이집트##일본::0",
          "초현실주의 운동에 속하는 화가는?::레오나르도 다빈치##살바도르 달리##파블로 피카소##마크 샤갈::1",
          "올림픽이 시작된 나라는?::프랑스##이탈리아##그리스##스위스::2",
          "인간의 뇌에는 몇 개의 엽이 있습니까?::1##2##3##4::3",
          "인간이 메시지를 보낼 때 주로 사용했던 새는 무엇입니까?::비둘기##매##독수리##참새::0",
          "거미 공포증은 무엇에 대한 두려움입니까?::거미##작은 공간들##군중##비행기::0",
          "우리가 알고 있는 가장 오래된 문명은 무엇입니까?::수메르 문명##이집트 문명##중국 문명##인도 문명::0"
        ]);
  }

  void addMS(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.ms;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Planet manakah yang paling hampir dengan matahari?::Utarid##Zuhrah##Zuhal##Musytari::0",
          "Apakah tanda atom bagi Helium pada jadual berkala?::O##He##Fe##Se::1",
          "Di manakah terletaknya Taj Mahal?::China##India##Perancis##Jepun::1",
          "Di manakah terletaknya Gunung Kilimanjaro?::Tanzania##Brazil##Mesir##Jepun::0",
          "Pelukis manakah yang tergolong dalam gerakan Surealisme?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "Di negara manakah Sukan Olimpik bermula?::Perancis##Itali##Greece##Switzerland::2",
          "Berapakah bilangan cuping otak manusia?::1##2##3##4::3",
          "Burung manakah yang biasa digunakan oleh manusia untuk menghantar mesej?::Merpati##ayam##Helang##Burung pipit::0",
          "Arachnophobia ialah ketakutan terhadap apa?::labah-labah##Ruang kecil##Orang ramai##kapal terbang::0",
          "Apakah tamadun tertua yang kita ketahui?::Tamadun Sumeria##Tamadun Mesir##Tamadun Cina##Tamadun India::0"
        ]);
  }

  void addNL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.nl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Welke planeet staat het dichtst bij de zon?::Mercurius##Venus##Saturnus##Jupiter::0",
          "Wat is het atoomteken voor helium in het periodiek systeem?::O##He##Fe##Se::1",
          "Waar staat de Taj Mahal?::China##India##Frankrijk##Japan::1",
          "Waar ligt de Kilimanjaro?::Tanzania##Brazilië##Egypte##Japan::0",
          "Welke schilder behoort tot de surrealistische beweging?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "In welk land zijn de Olympische Spelen ontstaan?::Frankrijk##Italië##Griekenland##Zwitserland::2",
          "Hoeveel lobben heeft het menselijk brein?::1##2##3##4::3",
          "Welke vogel werd gewoonlijk door mensen gebruikt om berichten te verzenden?::Duif##Havik##Adelaar##Mus::0",
          "Arachnofobie is de angst voor wat?::Spinnen##Kleine ruimtes##Menigte##Vliegtuig::0",
          "Wat is de oudste beschaving die we kennen?::De Sumerische beschaving##De Egyptische beschaving##De Chinese beschaving##De Indiase beschaving::0"
        ]);
  }

  void addNB(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.nb;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Hvilken planet er nærmest solen?::Merkur##Venus##Saturn##Jupiter::0",
          "Hva er atomtegnet for helium i det periodiske systemet?::O##He##Fe##Se::1",
          "Hvor ligger Taj Mahal?::Kina##India##Frankrike##Japan::1",
          "Hvor ligger Mount Kilimanjaro?::Tanzania##Brasil##Egypt##Japan::0",
          "Hvilken maler tilhører surrealismebevegelsen?::Leonardo da Vinci##Salvador Dali##Pablo picasso##Marc Chagall::1",
          "I hvilket land oppsto OL?::Frankrike##Italia##Hellas##Sveits::2",
          "Hvor mange lober har den menneskelige hjernen?::1##2##3##4::3",
          "Hvilken fugl ble ofte brukt av mennesker til å sende meldinger?::Due##Hauk##Ørn##spurv::0",
          "Hva er araknofobi frykten for?::Edderkopper##Små mellomrom##Publikum##Fly::0",
          "Hva er den eldste sivilisasjonen vi kjenner til?::Den sumeriske sivilisasjonen##Den egyptiske sivilisasjonen##Den kinesiske sivilisasjonen##Den indiske sivilisasjonen::0"
        ]);
  }

  void addPL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.pl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Która planeta jest najbliżej Słońca?::Merkury##Wenus##Saturn##Jowisz::0",
          "Jaki jest atomowy znak helu w układzie okresowym pierwiastków?::O##He##Fe##Se::1",
          "Gdzie znajduje się Taj Mahal?::Chiny##Indie##Francja##Japonia::1",
          "Gdzie znajduje się Kilimandżaro?::Tanzania##Brazylia##Egipt##Japonia::0",
          "Który malarz należy do ruchu surrealizmu?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagalla::1",
          "W jakim kraju powstały igrzyska olimpijskie?::Francja##Włochy##Grecja##Szwajcaria::2",
          "Ile płatów ma ludzki mózg?::1##2##3##4::3",
          "Który ptak był powszechnie używany przez ludzi do wysyłania wiadomości?::Gołąb##Jastrząb##Orzeł##Wróbel::0",
          "Arachnofobia to strach przed czym?::Pająki##Małe przestrzenie##Tłum##Samolot::0",
          "Jaka jest najstarsza cywilizacja, jaką znamy?::Cywilizacja sumeryjska##Cywilizacja egipska##Cywilizacja chińska##Cywilizacja indyjska::0"
        ]);
  }

  void addPT(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.pt;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Qual planeta está mais próximo do sol?::Mercúrio##Vênus##Saturno##Júpiter::0",
          "Qual é o sinal atômico do hélio na tabela periódica?::O##He##Fe##Se::1",
          "Onde fica o Taj Mahal?::China##Índia##França##Japão::1",
          "Onde está localizado o Monte Kilimanjaro?::Tanzânia##Brasil##Egito##Japão::0",
          "Qual pintor pertence ao movimento surrealista?::Leonardo da Vinci##Salvador Dalí##Pablo Picasso##Marc Chagall::1",
          "Em que país surgiram as olimpíadas?::França##Itália##Grécia##Suíça::2",
          "Quantos lobos tem o cérebro humano?::1##2##3##4::3",
          "Qual ave era comumente usada pelos humanos para enviar mensagens?::Pombo##Falcão##Águia##Pardal::0",
          "Aracnofobia é o medo de quê?::Aranhas##Espaços pequenos##Multidão##Avião::0",
          "Qual é a civilização mais antiga que conhecemos?::A civilização suméria##A civilização egípcia##A civilização chinesa##A civilização indiana::0"
        ]);
  }

  void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.ro;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Care planetă este cea mai apropiată de Soare?::Mercur##Venus##Saturn##Jupiter::0",
          "Care este semnul atomic pentru Heliu pe tabelul periodic?::O##He##Fe##Se::1",
          "Unde se află Taj Mahal?::China##India##Franţa##Japonia::1",
          "Unde se află Muntele Kilimanjaro?::Tanzania##Brazilia##Egipt##Japonia::0",
          "Care pictor aparține mișcării suprarealismului?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "În ce țară au început Jocurile Olimpice?::Franţa##Italia##Grecia##Elveţia::2",
          "Câți lobi are creierul uman?::1##2##3##4::3",
          "Ce pasăre a fost folosită în mod obișnuit de oameni pentru a trimite mesaje?::Porumbel##Şoim##Vultur##Vrabie::0",
          "Arahnofobia este frica de ce?::Păianjeni##Spații mici##Mulțime##Avion::0",
          "Care este cea mai veche civilizație despre care știm?::Civilizația sumeriană##Civilizația egipteană##Civilizația chineză##Civilizația indiană::0"
        ]);
  }

  void addRU(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.ru;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Какая планета находится ближе всего к Солнцу?::Меркурий##Венера##Сатурн##Юпитер::0",
          "Какой атомный знак у гелия в периодической таблице?::O##He##Fe##Se::1",
          "Где находится Тадж-Махал?::Китай##Индия##Франция##Япония::1",
          "Где находится гора Килиманджаро?::Танзания##Бразилия##Египет##Япония::0",
          "Какой художник принадлежит к движению сюрреализм?::Леонардо да Винчи##Сальвадор Дали##Пабло Пикассо##Марк Шагал::1",
          "В какой стране возникли Олимпийские игры?::Франция##Италия##Греция##Швейцария::2",
          "Сколько долей у человеческого мозга?::1##2##3##4::3",
          "Какая птица обычно использовалась людьми для отправки сообщений?::Голубь##Ястреб##Орел##Воробей::0",
          "Арахнофобия боязнь чего?::Пауки##Маленькие пространства##Толпа##Самолет::0",
          "Какая самая древняя известная нам цивилизация?::Шумерская цивилизация##Египетская цивилизация##Китайская цивилизация##Индийская цивилизация::0"
        ]);
  }

  void addSK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.sk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Ktorá planéta je najbližšie k Slnku?::Merkúr##Venuša##Saturn##Jupiter::0",
          "Aké je atómové znamenie pre hélium v ​​periodickej tabuľke?::O##He##Fe##Se::1",
          "Kde sa nachádza Tádž Mahal?::Čína##India##Francúzsko##Japonsko::1",
          "Kde sa nachádza Mount Kilimanjaro?::Tanzánia##Brazília##Egypt##Japonsko::0",
          "Ktorý maliar patrí k surrealistickému hnutiu?::Leonardo da Vinci##Salvador Dalí##Pablo Picasso##Marc Chagall::1",
          "V ktorej krajine vznikla olympiáda?::Francúzsko##Taliansko##Grécko##Švajčiarsko::2",
          "Koľko lalokov má ľudský mozog?::1##2##3##4::3",
          "Ktorého vtáka ľudia bežne používali na odosielanie správ?::Holub##Jastrab##Orol##Vrabec::0",
          "Arachnofóbia je strach z čoho?::Pavúky##Malé priestory##Dav##Lietadlo::0",
          "Aká je najstaršia civilizácia, o ktorej vieme?::Sumerská civilizácia##Egyptská civilizácia##Čínska civilizácia##Indická civilizácia::0"
        ]);
  }

  void addSL(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.sl;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Kateri planet je najbližji soncu?::Merkur##Venera##Saturn##Jupiter::0",
          "Kakšen je atomski znak za helij v periodnem sistemu?::O##He##Fe##Se::1",
          "Kje se nahaja Taj Mahal?::Kitajska##Indija##Francija##Japonska::1",
          "Kje se nahaja Mount Kilimanjaro?::Tanzanija##Brazilija##Egipt##Japonska::0",
          "Kateri slikar pripada gibanju nadrealizma?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "V kateri državi so nastale olimpijske igre?::Francija##Italija##Grčija##Švica::2",
          "Koliko rež ima človeški možgani?::1##2##3##4::3",
          "Katero ptico so ljudje običajno uporabljali za pošiljanje sporočil?::Golob##Sokol##orel##Vrabec::0",
          "Arahnofobija je strah pred čem?::Pajki##Majhni prostori##Množica##Letalo::0",
          "Katera je najstarejša civilizacija, ki jo poznamo?::Sumerska civilizacija##Egipčanska civilizacija##Kitajska civilizacija##Indijska civilizacija::0"
        ]);
  }

  void addSR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.sr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Која је планета најближа сунцу?::Меркур##Венера##Сатурн##Јупитер::0",
          "Који је атомски знак за хелијум на периодном систему?::O##He##Fe##Se::1",
          "Где се налази Таџ Махал?::Кина##Индија##Француска##Јапан::1",
          "Где се налази планина Килиманџаро?::Танзанија##Бразил##Египат##Јапан::0",
          "Који сликар припада покрету надреализма?::Леонардо да Винчи##Салвадор дали##Пабло пицассо##Марц Цхагалл::1",
          "У којој земљи је настала Олимпијада?::Француска##Италија##Грчка##Швајцарска::2",
          "Колико режњева има људски мозак?::1##2##3##4::3",
          "Коју птицу су људи обично користили за слање порука?::Голуб##Јастреб##Орао##врабац::0",
          "Арахнофобија је страх од чега?::Пауци##Мали простори##Гомила##Авион::0",
          "Која је најстарија цивилизација за коју знамо?::Сумерска цивилизација##Египатска цивилизација##Кинеска цивилизација##Индијска цивилизација::0"
        ]);
  }

  void addSV(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.sv;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Vilken planet är närmast solen?::Merkurius##Venus##Saturnus##Jupiter::0",
          "Vilket är atomtecknet för helium i det periodiska systemet?::O##He##Fe##Se::1",
          "Var ligger Taj Mahal?::Kina##Indien##Frankrike##Japan::1",
          "Var ligger Mount Kilimanjaro?::Tanzania##Brasilien##Egypten##Japan::0",
          "Vilken målare tillhör surrealismrörelsen?::Leonardo Da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "I vilket land har de olympiska spelen sitt ursprung?::Frankrike##Italien##Grekland##Schweiz::2",
          "Hur många lober har den mänskliga hjärnan?::1##2##3##4::3",
          "Vilken fågel användes vanligtvis av människor för att skicka meddelanden?::Duva##Hök##Örn##Sparv::0",
          "Arachnophobia är rädslan för vad?::Spindlar##Små utrymmen##Folkmassan##Flygplan::0",
          "Vilken är den äldsta civilisationen vi känner till?::Den sumeriska civilisationen##Den egyptiska civilisationen##Den kinesiska civilisationen##Den indiska civilisationen::0"
        ]);
  }

  void addTH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.th;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "ดาวเคราะห์ดวงใดอยู่ใกล้ดวงอาทิตย์ที่สุด?::ดาวพุธ##ดาวศุกร์##ดาวเสาร์##ดาวพฤหัสบดี::0",
          "เครื่องหมายอะตอมของฮีเลียมในตารางธาตุคืออะไร?::O##He##Fe##Se::1",
          "ทัชมาฮาลตั้งอยู่ที่ไหน?::จีน##อินเดีย##ฝรั่งเศส##ญี่ปุ่น::1",
          "ยอดเขาคิลิมันจาโร ตั้งอยู่ที่ไหน::แทนซาเนีย##บราซิล##อียิปต์##ญี่ปุ่น::0",
          "จิตรกรคนใดอยู่ในขบวนการ Surrealism?::เลโอนาร์โด ดา วินชี##ซัลวาดอร์ ดาลี##ปาโบล ปีกัสโซ##มาร์ค ชากาล::1",
          "การแข่งขันกีฬาโอลิมปิกเกิดขึ้นที่ประเทศใด::ฝรั่งเศส##อิตาลี##กรีซ##สวิตเซอร์แลนด์::2",
          "สมองของมนุษย์มีกี่กลีบ?::1##2##3##4::3",
          "มนุษย์ใช้นกชนิดใดในการส่งข้อความ?::นกพิราบ##เหยี่ยว##อินทรี##กระจอก::0",
          "Arachnophobia เป็นโรคกลัวอะไร?::แมงมุม##พื้นที่ขนาดเล็ก##ฝูงชน##เครื่องบิน::0",
          "อารยธรรมที่เก่าแก่ที่สุดที่เรารู้จักคืออะไร?::อารยธรรมสุเมเรียน##อารยธรรมอียิปต์##อารยธรรมจีน##อารยธรรมอินเดีย::0"
        ]);
  }

  void addTR(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.tr;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Güneşe en yakın gezegen hangisidir?::Merkür##Venüs##Satürn##Jüpiter::0",
          "Periyodik tablodaki Helyum'un atom işareti nedir?::O##He##Fe##Se::1",
          "Tac Mahal nerede bulunur?::Çin##Hindistan##Fransa##Japonya::1",
          "Kilimanjaro Dağı nerede bulunur?::Tanzanya##Brezilya##Mısır##Japonya::0",
          "Hangi ressam Sürrealizm akımına aittir?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "Olimpiyatlar hangi ülkede başlamıştır?::Fransa##İtalya##Yunanistan##İsviçre::2",
          "İnsan beyninin kaç lobu vardır?::1##2##3##4::3",
          "İnsanlar tarafından mesaj göndermek için yaygın olarak kullanılan kuş hangisidir?::Güvercin##Şahin##Kartal##Serçe::0",
          "Araknofobi ne korkusudur?::örümcekler##Küçük alanlar##Kalabalık##Uçak::0",
          "Bildiğimiz en eski uygarlık hangisidir?::Sümer uygarlığı##Mısır uygarlığı##Çin uygarlığı##Hint uygarlığı::0"
        ]);
  }

  void addUK(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.uk;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Яка планета найближча до Сонця?::Меркурій##Венера##Сатурн##Юпітер::0",
          "Який атомний знак гелію в періодичній системі?::O##He##Fe##Se::1",
          "Де знаходиться Тадж-Махал?::Китай##Індія##Франція##Японія::1",
          "Де розташована гора Кіліманджаро?::Танзанія##Бразилія##Єгипет##Японія::0",
          "Хто з художників належить до руху сюрреалізму?::Леонардо да Вінчі##Сальвадор Далі##Пабло Пікассо##Марк Шагал::1",
          "У якій країні виникла Олімпіада?::Франція##Італія##Греція##Швейцарія::2",
          "Скільки часточок має мозок людини?::1##2##3##4::3",
          "Який птах зазвичай використовувався людьми для надсилання повідомлень?::Голуб##Яструб##орел##Горобець::0",
          "Арахнофобія - це страх чого?::Павуки##Маленькі простори##Натовп##Літак::0",
          "Яка найдавніша цивілізація, яку ми знаємо?::Шумерська цивілізація##Єгипетська цивілізація##Китайська цивілізація##Індійська цивілізація::0"
        ]);
  }

  void addVI(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.vi;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "Hành tinh nào gần mặt trời nhất?::Sao Thủy##sao Kim##sao Thổ##sao Mộc::0",
          "Kí hiệu nguyên tử cho Helium trong bảng tuần hoàn là gì?::O##He##Fe##Se::1",
          "Taj Mahal nằm ở đâu?::Trung Quốc##Ấn Độ##Nước pháp##Nhật Bản::1",
          "Núi Kilimanjaro nằm ở đâu?::Tanzania##Brazil##Ai cập##Nhật Bản::0",
          "Họa sĩ nào thuộc trào lưu Siêu thực?::Leonardo da Vinci##Salvador Dali##Pablo Picasso##Marc Chagall::1",
          "Thế vận hội bắt nguồn từ quốc gia nào?::Nước pháp##Nước Ý##Hy Lạp##Thụy sĩ::2",
          "Bộ não con người có bao nhiêu thùy?::1##2##3##4::3",
          "Loài chim nào thường được con người sử dụng để gửi tin nhắn?::Chim bồ câu##chim ưng##diều hâu##Chim sẻ::0",
          "Arachnophobia là nỗi sợ hãi của những gì?::con nhện##Không gian nhỏ##Đám đông##Máy bay::0",
          "Nền văn minh lâu đời nhất mà chúng ta biết là gì?::Nền văn minh Sumer##Nền văn minh Ai Cập##Nền văn minh Trung Quốc##Nền văn minh Ấn Độ::0"
        ]);
  }

  void addZH(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      IqGameQuestionConfig questionConfig) {
    var language = Language.zh;
    addQuestions(
        result, //
        language, //
        questionConfig.cat5, //
        questionConfig.diff0, //
        [
          "哪个星球离太阳最近？::水星##金星##土星##木星::0",
          "元素周期表中氦的原子符号是什么？::O##He##Fe##Se::1",
          "泰姬陵在哪里？::中国##印度##法国##日本::1",
          "乞力马扎罗山位于哪里？::坦桑尼亚##巴西##埃及##日本::0",
          "哪位画家属于超现实主义运动？::列奥纳多·达·芬奇##萨尔瓦多·达利##巴勃罗毕加索##马克·夏加尔::1",
          "奥运会起源于哪个国家？::法国##意大利##希腊##瑞士::2",
          "人脑有多少个脑叶？::1##2##3##4::3",
          "人类常用哪种鸟来发送信息？::鸽子##鹰##鸡##麻雀::0",
          "蜘蛛恐惧症是对什么的恐惧？::蜘蛛##小空间##人群##飞机::0",
          "我们所知道的最古老的文明是什么？::苏美尔文明##埃及文明##中华文明##印度文明::0"
        ]);
  }
}
