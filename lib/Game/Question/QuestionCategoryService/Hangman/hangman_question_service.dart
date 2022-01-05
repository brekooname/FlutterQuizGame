import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';

import '../../../../main.dart';
import '../question_service.dart';
import 'hangman_question_parser.dart';

class HangmanQuestionService extends QuestionService {
  static const String standard_letters = "abcdefghijklmnopqrstuvwxyz";
  static const List<String> chars_to_be_ignored = [" ", "-", "'"];

  late HangmanQuestionParser questionParser;
  late String availableLetters;

  static final HangmanQuestionService singleton =
      HangmanQuestionService.internal();

  factory HangmanQuestionService(
      {required HangmanQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    singleton.availableLetters = MyApp
        .appLocalizations.l_a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z;

    return singleton;
  }

  HangmanQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question.rawString);
  }

  @override
  int getPrefixCodeForQuestion(Question question) {
    return -1;
  }

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return compareAnswerStrings(question.questionToBeDisplayed, answer);
  }

  @override
  bool isGameFinishedSuccessful(Question question, Set<String> pressedAnswers) {
    return pressedAnswers
        .containsAll(getNormalizedWordLetters(question.questionToBeDisplayed));
  }

  @override
  String getRandomUnpressedCorrectAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getCorrectAnswers(question);
    answers.shuffle();
    return answers.first;
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question.rawString);
  }

  @override
  Set<String> getAllAnswerOptionsForQuestion(Question question) {
    return availableLetters.split(",").toSet();
  }

  String getHangmanWordLastLetter(String hangmanWord) {
    return hangmanWord.substring(hangmanWord.length - 1).toLowerCase();
  }

  String getHangmanWordFirstLetter(String hangmanWord) {
    return hangmanWord.substring(0, 1).toLowerCase();
  }

  @override
  bool compareAnswerStrings(String hangmanWord, String answer) {
    hangmanWord = processHangmanString(hangmanWord);
    answer = processHangmanString(answer);
    return hangmanWord.toLowerCase().contains(answer.toLowerCase());
  }

  String processHangmanString(String string) {
    return !availableLettersHaveSpecialCharacters()
        ? normalize(string)
        : string;
  }

  bool availableLettersHaveSpecialCharacters() {
    return availableLetters.replaceAll(",", "") != standard_letters;
  }

  @override
  int getNrOfWrongAnswersPressed(
      Question question, Set<String> pressedAnswers) {
    Set<String> answerIds = pressedAnswers.toSet();
    answerIds
        .removeAll(getNormalizedWordLetters(question.questionToBeDisplayed));
    return answerIds.length;
  }

  String getCurrentWordState(String hangmanWord, Set<String> answerIds) {
    Set<String> wordLettersToProcess = getNormalizedWordLetters(hangmanWord);
    wordLettersToProcess.removeAll(answerIds);
    String processedHangmanWord = processHangmanString(hangmanWord);
    for (String letter in wordLettersToProcess) {
      processedHangmanWord =
          replaceLetter(processedHangmanWord, letter.toLowerCase());
      processedHangmanWord =
          replaceLetter(processedHangmanWord, letter.toUpperCase());
    }
    List<String> hangmanWordArray = hangmanWord.split("");
    List<String> processedHangmanWordArray = processedHangmanWord.split("");
    for (int i = 0; i < processedHangmanWordArray.length; i++) {
      hangmanWordArray[i] =
          processedHangmanWordArray[i] == '_' ? '_' : hangmanWordArray[i];
    }
    return hangmanWordArray.join(" ");
  }

  String replaceLetter(String hangmanWord, String letter) {
    return hangmanWord.replaceAll(letter, "_");
  }

  Set<String> getNormalizedWordLetters(String hangmanWord) {
    return getWordLetters(processHangmanString(hangmanWord));
  }

  Set<String> getWordLetters(String hangmanWord) {
    hangmanWord = hangmanWord.toLowerCase();
    for (String charToBeIgnored in chars_to_be_ignored) {
      hangmanWord = hangmanWord.replaceAll(charToBeIgnored, "");
    }
    return hangmanWord.split("").toSet();
  }

  String normalize(String answer) {
    return removeDiacritic(answer);
  }

  static final String tab00c0 = "AAAAAAACEEEEIIII" +
      "DNOOOOO\u00d7\u00d8UUUUYI\u00df" +
      "aaaaaaaceeeeiiii" +
      "\u00f0nooooo\u00f7\u00f8uuuuy\u00fey" +
      "AaAaAaCcCcCcCcDd" +
      "DdEeEeEeEeEeGgGg" +
      "GgGgHhHhIiIiIiIi" +
      "IiJjJjKkkLlLlLlL" +
      "lLlNnNnNnnNnOoOo" +
      "OoOoRrRrRrSsSsSs" +
      "SsTtTtTtUuUuUuUu" +
      "UuUuWwYyYZzZzZzF";

  /**
   * Returns string without diacritics - 7 bit approximation.
   *
   * @param source string to convert
   * @return corresponding string without diacritics
   */
  String removeDiacritic(String source) {
    List<String> vysl = [];
    int one;
    for (int i = 0; i < source.length; i++) {
      one = source.codeUnitAt(i);
      if (one >= '\u00c0'.codeUnitAt(0) && one <= '\u017f'.codeUnitAt(0)) {
        one = tab00c0.codeUnitAt(one - '\u00c0'.codeUnitAt(0));
      }
      vysl.add(String.fromCharCode(one));
    }
    return vysl.join();
  }
}
