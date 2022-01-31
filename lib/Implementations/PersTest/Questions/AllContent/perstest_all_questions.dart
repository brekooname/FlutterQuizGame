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
    addEN(result, questionConfig);
    addRO(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["I am popular at social events", "I don't care about others", "I am always prepared", "I get stressed out easily", "I have a rich vocabulary", "I don't talk a lot", "I am interested in people", "I leave my belongings around", "I am relaxed most of the time", "I have difficulty understanding abstract ideas", "I feel comfortable around people", "I insult people", "I pay attention to details", "I worry about things", "I have a vivid imagination", "I keep in the background", "I am sentimental", "I make a mess of things", "I don't feel sad often", "I am not interested in abstract ideas", "I start conversations", "I am not interested in other people's problems", "I get chores done right away", "I am easily disturbed", "I have excellent ideas", "I have little to say", "I have a soft heart", "I often forget to put things back in their proper place", "I get upset easily", "I do not have a good imagination", "I talk to a lot of different people at parties", "I am not really interested in others", "I like order", "I change my mood a lot", "I am quick to understand things", "I don't like to draw attention to myself", "I take time out for others", "I avoid my responsibilities", "I have frequent mood swings", "I use difficult words", "I don't mind being the center of attention", "I feel others' emotions", "I follow a schedule", "I get irritated easily", "I spend time reflecting on things", "I am quiet around strangers", "I make people feel at ease", "I am exacting in my work", "I often feel sad", "I am full of ideas"]);
  }

  void addRO(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      PersTestGameQuestionConfig questionConfig) {
    var language = Language.ro;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["Sunt popular la evenimentele sociale", "Nu-mi pasă de ceilalți", "Sunt întotdeauna pregătit", "Sunt stresat ușor", "Am un vocabular bogat", "Nu vorbesc prea mult", "Sunt interesat de oameni", "Îmi las lucrurile în jur", "Sunt relaxat de cele mai multe ori", "Am dificultăți în înțelegerea ideilor abstracte", "Mă simt confortabil în jurul oamenilor", "Insult oamenii", "Am atenție la detalii", "Îmi fac griji pentru lucruri", "Am o imaginație vie", "Mă țin în fundal", "Sunt sentimental", "Eu fac o grămadă de lucruri", "Nu mă simt adesea trist", "Nu mă interesează ideile abstracte", "Încep conversații", "Nu mă interesează problemele altora", "Îmi termin treburile imediat", "Sunt ușor deranjat", "Am idei excelente", "Nu prea am de spus", "Am o inimă moale", "Adesea uit să pun lucrurile în locul lor", "M-am supărat ușor", "Nu am o bună imaginație", "Vorbesc cu o mulțime de oameni la petreceri", "Nu mă interesează cu adevărat pe alții", "Îmi place ordinea", "Îmi schimb foarte mult starea de spirit", "Înțeleg rapid lucrurile", "Nu-mi place să atrag atenția asupra mea", "Îmi iau timp pentru alții", "Evit responsabilitățile mele", "Am schimbări frecvente ale dispoziției", "Folosesc cuvinte dificile", "Nu mă deranjează să fiu centrul atenției", "Simt emoțiile altora", "Urmăresc un program", "Sunt iritat ușor", "Îmi petrec timpul reflectând lucrurile", "Sunt liniștită în jurul străinilor", "Îi fac pe oameni să se simtă în largul lor", "Sunt exigent în munca mea", "De multe ori mă simt trist", "Sunt plin de idei"]);
  }


}
