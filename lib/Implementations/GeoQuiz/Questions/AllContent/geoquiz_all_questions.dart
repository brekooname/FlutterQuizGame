import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class GeoQuizAllQuestions extends AllQuestionsService {
  List<String>? _allCountriesCache;
  List<String>? _allSynonymsCache;

  static final GeoQuizAllQuestions singleton = GeoQuizAllQuestions.internal();

  factory GeoQuizAllQuestions() {
    return singleton;
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
    addEN(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      GeoQuizGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["0:1427647786","1:1352642280","2:327096265","26:267670543","72:212228286","3:209469323","36:195874683","118:161376708","4:145734038","6:127202192","5:126190788","98:109224414","73:106651394","14:98423598","34:95545962","129:84068091","8:83124418","9:82340088","7:81800188","12:68863514","11:67141684","10:64990511","13:60627291","15:57792518","95:56313438","83:53708320","75:51392565","16:51171706","30:49661048","17:46692858","18:44361150","20:44246156","87:42729036","31:42228408","126:41801533","53:38433600","21:37921592","54:37171921","22:37074562","33:36029093","40:33702756","82:32476244","48:31989260","47:31528033","92:30809787","108:29496004","63:28887118","96:28498683","51:28206728","67:28095714","90:26262313","94:25549604","81:25216267","88:25069230","29:24898152","97:22442822","74:21228763","120:19751466","39:19506114","78:19077749","37:18729160","52:18319618","125:18143217","111:17351708","132:17247849","65:17084358","25:17059560","100:16945057","76:16249792","66:15854323","107:15477729","68:15008226","136:14438802","114:12414293","119:12301970","70:11565201","112:11485044","19:11482178","86:11353142","50:11338134","91:11123178","133:10975927","64:10665677","102:10627141","134:10524117","27:10522246","28:10256193","35:9971638","101:9965318","69:9949537","38:9707499","103:9630959","104:9587522","80:9452617","105:9100835","23:8891388","46:8802754","113:8606323","24:8525611","55:8381516","115:7889093","139:7650150","117:7061507","41:7051608","116:6956066","122:6859408","121:6678559","165:6465501","164:6420746","123:6304030","124:5850901","110:5757499","42:5752126","43:5522576","62:5453014","45:5337962","149:5244359","99:4999441","128:4862979","130:4829473","135:4818973","44:4818690","60:4743131","127:4666368","146:4403313","138:4176869","32:4156405","137:4137312","143:4051944","49:4002942","141:3452786","84:3449285","57:3323925","71:3170216","58:2951745","85:2934847","61:2882740","77:2801264","93:2781682","144:2448301","145:2280094","147:2254068","148:2119275","151:2108328","150:2082957","59:2077837","152:1928459","153:1874303","154:1569446","157:1389843","109:1322920","155:1308975","156:1267974","158:1189265","89:1170125","160:1136281","159:958923","162:883483","161:832322","163:779006","166:754388","167:652857","79:627809","140:604245","168:575990","169:543767","174:515696","170:439248","171:428963","173:385637","172:383071","56:336713","175:292680","177:286641","178:211028","179:196129","180:181889","181:115847","184:112640","182:111454","185:110589","183:110211","186:97096","187:96286","188:77006","189:71625","190:58413","191:52441","106:38682","131:37910","142:33785","192:17907","194:11508","193:10670","176:801"]);
  }

  List<String> get allCountries {
    _allCountriesCache ??=
        _getAllCountries().get<Language, List<String>>(getLanguage()) ??
            _getAllCountries().get<Language, List<String>>(Language.en);
    return _allCountriesCache!;
  }

  List<String> get allSynonyms {
    _allSynonymsCache ??=
        _getAllSynonyms().get<Language, List<String>>(getLanguage()) ??
            _getAllSynonyms().get<Language, List<String>>(Language.en);
    return _allSynonymsCache!;
  }
  Map<Language, List<String>> _getAllCountries() {
    Map<Language, List<String>> result = HashMap<Language, List<String>>();
    result.putIfAbsent(Language.en, () => _allCountriesEN());
    result.putIfAbsent(Language.ro, () => _allCountriesRO());
    return result;
  }
  List<String> _allCountriesEN() {
    return ["China","India","United States","Brazil","Russia","Mexico","Japan","Iran","Germany","Turkey","France","United Kingdom","Thailand","Italy","Egypt","South Africa","South Korea","Spain","Argentina","Belgium","Ukraine","Poland","Canada","Austria","Switzerland","Netherlands","Indonesia","Greece","Portugal","Australia","Colombia","Algeria","Croatia","Morocco","Vietnam","Sweden","Nigeria","Chile","Hungary","Romania","Saudi Arabia","Bulgaria","Denmark","Finland","Ireland","Norway","Serbia","Malaysia","Peru","Georgia","Cuba","Ghana","Kazakhstan","Iraq","Afghanistan","Israel","Iceland","Bosnia and Herzegovina","Armenia","Slovenia","New Zealand","Albania","Slovakia","Venezuela","Czech Republic","Ecuador","Senegal","Nepal","Somalia","Azerbaijan","Tunisia","Mongolia","Pakistan","Philippines","Sri Lanka","Kenya","Cambodia","Lithuania","Mali","Montenegro","Belarus","Cameroon","Uzbekistan","Myanmar","Uruguay","Jamaica","Bolivia","Uganda","Ivory Coast","Cyprus","Madagascar","Haiti","Angola","Qatar","North Korea","Tanzania","Yemen","Niger","Ethiopia","Costa Rica","Syria","Jordan","Dominican Republic","United Arab Emirates","Honduras","Tajikistan","Monaco","Chad","Mozambique","Estonia","Singapore","Zambia","Benin","Papua New Guinea","Guinea","Togo","Paraguay","Laos","Bangladesh","Rwanda","Burkina Faso","Libya","Lebanon","Kyrgyzstan","Turkmenistan","Malawi","Sudan","Central African Republic","Palestine","Democratic Republic of the Congo","Oman","Liechtenstein","Guatemala","South Sudan","Burundi","Liberia","Zimbabwe","Kuwait","Panama","Sierra Leone","Luxembourg","Eritrea","San Marino","Moldova","Namibia","Gambia","Mauritania","Botswana","Gabon","Congo","North Macedonia","Lesotho","Latvia","Guinea-Bissau","Bahrain","Equatorial Guinea","East Timor","Trinidad and Tobago","Mauritius","Djibouti","Eswatini","Comoros","Fiji","Guyana","El Salvador","Nicaragua","Bhutan","Solomon Islands","Suriname","Cape Verde","Malta","Brunei","Belize","Bahamas","Maldives","Vanuatu","Vatican City","Barbados","São Tomé and Príncipe","Samoa","Saint Lucia","Kiribati","Grenada","Saint Vincent and the Grenadines","Micronesia","Tonga","Seychelles","Antigua and Barbuda","Andorra","Dominica","Marshall Islands","Saint Kitts and Nevis","Palau","Nauru","Tuvalu"];
  }
  List<String> _allCountriesRO() {
    return ["China","India","Statele Unite","Brazilia","Rusia","Mexic","Japonia","Iran","Germania","Turcia","Franţa","Regatul Unit","Tailanda","Italia","Egipt","Africa de Sud","Coreea de Sud","Spania","Argentina","Belgia","Ucraina","Polonia","Canada","Austria","Elveţia","Olanda","Indonezia","Grecia","Portugalia","Australia","Columbia","Algeria","Croaţia","Maroc","Vietnam","Suedia","Nigeria","Chile","Ungaria","România","Arabia Saudită","Bulgaria","Danemarca","Finlanda","Irlanda","Norvegia","Serbia","Malaezia","Peru","Georgia","Cuba","Ghana","Kazahstan","Irak","Afganistan","Israel","Islanda","Bosnia si Hertegovina","Armenia","Slovenia","Noua Zeelanda","Albania","Slovacia","Venezuela","Republica Cehă","Ecuador","Senegal","Nepal","Somalia","Azerbaidjan","Tunisia","Mongolia","Pakistan","Filipine","Sri Lanka","Kenia","Cambogia","Lituania","Mali","Muntenegru","Bielorusia","Camerun","Uzbekistan","Myanmar","Uruguay","Jamaica","Bolivia","Uganda","Coasta de Fildes","Cipru","Madagascar","Haiti","Angola","Qatar","Coreea de Nord","Tanzania","Yemen","Niger","Etiopia","Costa Rica","Siria","Iordania","Republica Dominicana","Emiratele Arabe Unite","Honduras","Tadjikistan","Monaco","Ciad","Mozambic","Estonia","Singapore","Zambia","Benin","Papua Noua Guinee","Guineea","Togo","Paraguay","Laos","Bangladesh","Rwanda","Burkina Faso","Libia","Liban","Kârgâzstan","Turkmenistan","Malawi","Sudan","Republica Centrafricană","Palestina","Republica Democrata din Congo","Oman","Liechtenstein","Guatemala","Sudul Sudanului","Burundi","Liberia","Zimbabwe","Kuweit","Panama","Sierra Leone","Luxemburg","Eritreea","San Marino","Moldova","Namibia","Gambia","Mauritania","Botswana","Gabon","Congo","Macedonia de Nord","Lesotho","Letonia","Guineea-Bissau","Bahrain","Guineea Ecuatorială","Timorul de Est","Trinidad și Tobago","Mauritius","Djibouti","Eswatini","Comore","Fiji","Guyana","El Salvador","Nicaragua","Bhutan","Insulele Solomon","Surinam","Republica Capului Verde","Malta","Brunei","Belize","Bahamas","Maldive","Vanuatu","Vatican","Barbados","Sao Tome și Principe","Samoa","Sfânta Lucia","Kiribati","Grenada","Sfântul Vincent și Grenadine","Micronezia","Tonga","Seychelles","Antigua si Barbuda","Andorra","Dominica","Insulele Marshall","Saint Kitts și Nevis","Palau","Nauru","Tuvalu"];
  }
  Map<Language, List<String>> _getAllSynonyms() {
    Map<Language, List<String>> result = HashMap<Language, List<String>>();
    result.putIfAbsent(Language.en, () => _allSynonymsEN());
    result.putIfAbsent(Language.ro, () => _allSynonymsRO());
    return result;
  }
  List<String> _allSynonymsEN() {
    return ["2:USA","103:UAE","129:DR Congo","183:Saint Vincent"];
  }
  List<String> _allSynonymsRO() {
    return ["2:SUA","103:EAU","129:RD Congo"];
  }
}
