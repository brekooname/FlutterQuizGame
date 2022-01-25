import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';

import '../../../../main.dart';

class HangmanService {
  static const String standardLetters = "abcdefghijklmnopqrstuvwxyz";
  static const List<String> _charsToBeIgnored = [" ", "-", "'"];

  late String availableLetters;

  static final HangmanService singleton = HangmanService.internal();

  factory HangmanService() {
    singleton.availableLetters = MyApp
        .appLocalizations.l_a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z;
    return singleton;
  }

  HangmanService.internal();

  static bool isHangmanSupported() {
    return false;

    return [
      Language.ar,
      Language.he,
      Language.hi,
      Language.ja,
      Language.ko,
      Language.th,
      Language.zh,
      Language.vi,
    ].where((element) => MyApp.languageCode == element.name).isEmpty;
  }

  String getHangmanWordLastLetter(String hangmanWord) {
    return hangmanWord.substring(hangmanWord.length - 1).toLowerCase();
  }

  String getHangmanWordFirstLetter(String hangmanWord) {
    return hangmanWord.substring(0, 1).toLowerCase();
  }

  String normalizeString(String string) {
    return availableLettersHaveSpecialCharacters()
        ? _normalize(string)
        : string;
  }

  bool availableLettersHaveSpecialCharacters() {
    return availableLetters.replaceAll(",", "") != standardLetters;
  }

  String getCurrentWordState(String hangmanWord, Iterable<String> answerIds) {
    Set<String> wordLettersToProcess = getNormalizedWordLetters(hangmanWord);
    wordLettersToProcess.removeAll(answerIds);
    String processedHangmanWord = normalizeString(hangmanWord);
    for (String letter in wordLettersToProcess) {
      processedHangmanWord =
          _replaceLetter(processedHangmanWord, letter.toLowerCase());
      processedHangmanWord =
          _replaceLetter(processedHangmanWord, letter.toUpperCase());
    }
    List<String> hangmanWordArray = hangmanWord.split("");
    List<String> processedHangmanWordArray = processedHangmanWord.split("");
    for (int i = 0; i < processedHangmanWordArray.length; i++) {
      hangmanWordArray[i] =
          processedHangmanWordArray[i] == '_' ? '_' : hangmanWordArray[i];
    }
    return hangmanWordArray.join(" ");
  }

  String _replaceLetter(String hangmanWord, String letter) {
    return hangmanWord.replaceAll(letter, "_");
  }

  Set<String> getNormalizedWordLetters(String hangmanWord) {
    return _getWordLetters(normalizeString(hangmanWord));
  }

  Set<String> _getWordLetters(String hangmanWord) {
    hangmanWord = removeCharsToBeIgnored(hangmanWord.toLowerCase());
    return hangmanWord.split("").toSet();
  }

  String removeCharsToBeIgnored(String string) {
    for (String charToBeIgnored in _charsToBeIgnored) {
      string = string.replaceAll(charToBeIgnored, "");
    }
    return string;
  }

  String _normalize(String string) {
    return _removeDiacritic(string);
  }

  static const String _tab00c0 = "AAAAAAACEEEEIIII" +
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

  /// Returns string without diacritics - 7 bit approximation.
  ///
  /// @param source string to convert
  /// @return corresponding string without diacritics
  String _removeDiacritic(String source) {
    List<String> vysl = [];
    int one;
    for (int i = 0; i < source.length; i++) {
      one = source.codeUnitAt(i);
      if (one >= '\u00c0'.codeUnitAt(0) && one <= '\u017f'.codeUnitAt(0)) {
        one = _tab00c0.codeUnitAt(one - '\u00c0'.codeUnitAt(0));
      }
      vysl.add(String.fromCharCode(one));
    }
    return vysl.join();
  }
}
