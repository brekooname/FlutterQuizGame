import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

extension IntExtension on int {
  String formatIntEveryChars(int everyChars, [suffix = ""]) {
    String stringVal = toString();
    String result = toString();
    int j = 0;
    if (abs().toString().length > everyChars) {
      result = "";
      for (int i = stringVal.length - 1; i >= 0; i--) {
        result = result + stringVal[i];
        if (j == everyChars - 1) {
          result = result + ".";
          j = 0;
        } else {
          j++;
        }
      }
      result = result.reversed;
    }
    if (result[0] == '.') {
      result = result.substring(1);
    }

    if (result[0] == '-' && result[1] == '.') {
      result = "-" + result.substring(2);
    }
    return result + suffix;
  }
}
