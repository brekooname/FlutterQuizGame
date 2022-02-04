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
    addQuestions(
        result, //
        language, //
        questionConfig.cat1, //
        questionConfig.diff0, //
        ["I feel that I am a person of worth, at least on an equal plane with others", "I feel that I have a number of good qualities", "All in all, I am inclined to feel that I am a failure", "I am able to do things as well as most other people", "I feel I do not have much to be proud of", "I take a positive attitude toward myself", "On the whole, I am satisfied with myself", "I wish I could have more respect for myself", "I certainly feel useless at times", "At times I think I am no good at all"]);
    addQuestions(
        result, //
        language, //
        questionConfig.cat2, //
        questionConfig.diff0, //
        ["I run to get where I am going faster.", "I like to call people by their last names.", "I put people under pressure.", "I boast about my virtues.", "I am always on the look out for ways to make money.", "I call people out when they tell fake or exaggerated stories.", "I demand the recognition I deserve.", "I speed up to avoid being passed.", "I have a strong need for power.", "I try to outdo others.", "I enjoy being part of a loud crowd.", "I want strangers to love me.", "I joke around a lot.", "I laugh aloud.", "I willing to try anything once.", "I seek adventure.", "I make lots of noise.", "I find humour in everything.", "I love large parties.", "I prefer to participate fully rather than view life from the sidelines.", "I hesitate to criticize other people's ideas.", "I just want everyone to be equal.", "I phrase things diplomatically.", "I have a good word for everyone.", "I believe that others have good intentions.", "I would never cheat on my taxes.", "I value cooperation over competition.", "I seldom toot my own horn.", "I hate to seem pushy.", "If lots of people like something, I usually will too.", "I am emotionally reserved.", "I read the fine print.", "I avoid mistakes.", "I am always guarded.", "I don't ever litter.", "I do not like small talk.", "I hate it when people want to make changes for no reason.", "I love order and regularity.", "My first reaction to an idea is to see its flaws.", "I leave parties early.", "I prefer to make friends with people exactly like me.", "I like to do nice things for people even if I get no credit.", "I always remember when someone compliments me.", "I don't like people who dress messy.", "I lose my patience when I get tired.", "I get jealous of other people's friendships.", "I think some people are just better than others.", "Sometimes I have a hard time taking my eyes off of an attractive person.", "My trust gets broken a lot.", "I ask why things really happened."]);
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
