import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

extension IntExtension on int {
  String formatIntEveryThreeChars() {
    String stringVal = this.toString();
    String result = this.toString();
    int j = 0;
    if (this.abs().toString().length > 3) {
      result = "";
      for (int i = stringVal.length - 1; i >= 0; i--) {
        result = result + stringVal[i];
        if (j == 2) {
          result = result + ".";
          j = 0;
        } else {
          j++;
        }
      }
      result = result.reverse();
    }
    if (result[0] == '.') {
      result = result.substring(1);
    }

    if (result[0] == '-' && result[1] == '.') {
      result = "-" + result.substring(2);
    }
    return result;
  }
}
