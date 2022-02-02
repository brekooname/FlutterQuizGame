import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class PersTestGameTypeColorTestUtils {
  static const String emotionalStateDisturbance = 'D';
  static const String emotionalStateCompensation = 'C';
  static const List<int> anxietyLevels = [1, 2, 3];
  static const String plus = '+';
  static const String minus = '-';
  static const String equal = '=';
  static const String asterisk = '*';

  late PersTestColor blue;
  late PersTestColor green;
  late PersTestColor red;
  late PersTestColor yellow;
  late PersTestColor purple;
  late PersTestColor brown;
  late PersTestColor black;
  late PersTestColor gray;

  late List<PersTestColor> colors;
  late List<PersTestColor> goodColors;
  late List<PersTestColor> badColors;

  List<List<PersTestColor>> pairs = [];

  static final PersTestGameTypeColorTestUtils singleton =
      PersTestGameTypeColorTestUtils.internal();

  factory PersTestGameTypeColorTestUtils() {
    singleton.colors = [
      singleton.blue = PersTestColor(1, '#004983'),
      singleton.green = PersTestColor(2, '#1D9772'),
      singleton.red = PersTestColor(3, '#F12F23'),
      singleton.yellow = PersTestColor(4, '#F2DD00'),
      singleton.purple = PersTestColor(5, '#D42481'),
      singleton.brown = PersTestColor(6, '#C55223'),
      singleton.black = PersTestColor(7, '#231F20'),
      singleton.gray = PersTestColor(0, '#98938D'),
    ];
    singleton.goodColors = [
      singleton.blue,
      singleton.green,
      singleton.red,
      singleton.yellow
    ];
    singleton.goodColors = [
      singleton.gray,
      singleton.brown,
      singleton.black,
    ];
    return singleton;
  }

  PersTestGameTypeColorTestUtils.internal();

  PsychologicalStateResult getPsychologicalStateForSelection(
      List<PersTestColor> selection) {
    Map<int, String> emotionalStates = {};
    Map<int, int> anxietyLevels = {};
    int? lastCompensationIndex;
    int? firstDisturbanceIndex;

    int index = 0;
    for (PersTestColor color in selection) {
      if (index < 3 && badColors.contains(color)) {
        lastCompensationIndex = index;
      }

      if (index > 4 &&
          goodColors.contains(color) &&
          firstDisturbanceIndex == null) {
        firstDisturbanceIndex = index;
      }
      index++;
    }

    index = 0;
    for (PersTestColor color in selection) {
      if (index < 3 && badColors.contains(color)) {
        anxietyLevels.putIfAbsent(color.val, () => (3 - index));
      }

      if (lastCompensationIndex != null && lastCompensationIndex >= index) {
        emotionalStates.putIfAbsent(
            color.val, () => emotionalStateCompensation);
      }

      if (index > 4 && goodColors.contains(color)) {
        anxietyLevels.putIfAbsent(color.val, () => (index - 4));
      }

      if (firstDisturbanceIndex != null && firstDisturbanceIndex <= index) {
        emotionalStates.putIfAbsent(color.val, () => emotionalStateDisturbance);
      }
      index++;
    }

    return PsychologicalStateResult(emotionalStates, anxietyLevels);
  }

  List<List<PersTestColor?>> getGroupsForSelection(
    List<PersTestColor> selection,
    Map<int, String> emotionalStates,
  ) {
    int index = 0;
    List<List<PersTestColor?>> groups = [];
    for (PersTestColor color in selection) {
      bool hasNext = index - 1 < selection.length;
      PersTestColor? nextColor = hasNext ? selection[index + 1] : null;
      bool isEmotional = emotionalStates.containsKey(color.val);
      bool isNextEmotional =
          hasNext && emotionalStates.containsKey(nextColor!.val);
      bool hasGroup =
          groups.where((element) => element.contains(color)).isNotEmpty;
      bool hasPairWithNext = hasNext &&
          pairs
              .where(
                  (pair) => pair.contains(color) && pair.contains(nextColor!))
              .isNotEmpty;
      bool isNextAlreadyInPair = hasNext &&
          pairs
              .where((pair) =>
                  pair.contains(nextColor!) &&
                  index + 2 < selection.length &&
                  pair.contains(selection[index + 2]))
              .isNotEmpty;

      if (hasPairWithNext || (isEmotional && isNextEmotional)) {
        groups.add([color, nextColor]);
        break;
      }
      if (hasGroup) {
        break;
      }
      if (isNextAlreadyInPair || nextColor == null) {
        groups.add([color]);
        break;
      }
      if ((!isEmotional && !isNextEmotional) || index + 2 >= selection.length) {
        groups.add([color, nextColor]);
      }
      index++;
    }
    return groups;
  }

  Map<PersTestColor, List<String>> getSignsForSelection(
      List<PersTestColor> selection,
      List<List<PersTestColor?>> groups,
      Map<int, String> emotionalStates) {
    Map<PersTestColor, List<String>> signs = {};

    if (groups.isNotEmpty) {
      for (PersTestColor? color in groups.first) {
        if (color == null) {
          break;
        }
        signs.putIfAbsent(color, () => [plus]);
      }
      for (PersTestColor? color in groups.last) {
        if (color == null) {
          break;
        }
        signs.putIfAbsent(color, () => [minus]);
      }
    }

    for (PersTestColor color in selection) {
      if (emotionalStates.containsKey(color.val)) {
        String sign = emotionalStates.get<int, String>(color.val) ==
                emotionalStateCompensation
            ? plus
            : minus;
        signs.putIfAbsent(color, () => [sign]);
      }
    }

    PersTestColor firstColorWithoutSign =
        selection.where((color) => !signs.containsKey(color)).first;
    List<PersTestColor?>? asteriskGroup = groups
        .where((group) => group.contains(firstColorWithoutSign))
        .firstOrNull;

    for (PersTestColor? color in asteriskGroup ?? []) {
      if (color == null || selection.indexOf(color) == 1) {
        break;
      }
      if (signs.containsKey(color)) {
        signs.get<PersTestColor, List<String>>(color)!.add(asterisk);
      }
      signs.putIfAbsent(color, () => [asterisk]);
    }

    for (PersTestColor color in selection) {
      if (signs.containsKey(color)) {
        break;
      }
      List<PersTestColor?>? equalGroup =
          groups.where((group) => group.contains(color)).firstOrNull;
      bool hasAsterisk = false;
      for (PersTestColor? color in equalGroup ?? []) {
        if (color == null) {
          break;
        }
        hasAsterisk =
            signs.get<PersTestColor, List<String>>(color)?.contains(asterisk) ??
                false;
        if (hasAsterisk) {
          break;
        }
      }
      if (hasAsterisk) {
        break;
      }

      for (PersTestColor? color in equalGroup ?? []) {
        if (color == null) {
          break;
        }
        bool hasEqual =
            signs.get<PersTestColor, List<String>>(color)?.contains(equal) ??
                false;

        if (signs.containsKey(color) && !hasEqual) {
          signs.get<PersTestColor, List<String>>(color)!.add(equal);
        }
        signs.putIfAbsent(color, () => [equal]);
      }
    }
    return signs;
  }

  Map<String, List<PersTestColor>> getSignMapForSelection(
    List<PersTestColor> selection,
    Map<PersTestColor, List<String>> signs,
  ) {
    Map<String, List<PersTestColor>> signMap = {
      plus: [],
      minus: [],
      asterisk: [],
      equal: [],
    };

    //TODO
    // .sort((a, b) => {
    // const aIndex = indexMap[a[0]];
    // const bIndex = indexMap[b[0]];
    //
    // if (typeof aIndex === 'undefined' || typeof bIndex === 'undefined') return 0;
    //
    // return aIndex - bIndex;
    // })

    for (MapEntry<PersTestColor, List<String>> e in signs.entries) {
      for (String sign in e.value) {
        signMap.get<String, List<PersTestColor>>(sign)!.add(e.key);
      }
    }
    return signMap;
  }

  Map<String, List<PersTestColor>> getInterpretationPairsForSelection(
      Map<String, List<PersTestColor>> signMap) {
    Map<String, List<PersTestColor>> interpretationPairs = {
      plus: [],
      minus: [],
      asterisk: [],
      equal: [],
    };

    for (MapEntry<String, List<PersTestColor>> e in signMap.entries) {
      if (e.value.length == 1) {
        interpretationPairs
            .get<String, List<PersTestColor>>(e.key)!
            .add(e.value.first);
        break;
      }

      int index = 0;
      List<PersTestColor> interpr = [];
      for (PersTestColor color in e.value) {
        if (index != 0) {
          interpr.add(e.value.elementAt(index - 1));
          interpr.add(e.value.elementAt(index));
        }
      }

      interpretationPairs
          .get<String, List<PersTestColor>>(e.key)!
          .addAll(interpr);
    }

    return interpretationPairs;
  }

  int getTotalAnxietyLevelForSelection(List<int> anxietyLevels) {
    int totalAnxietyLevel = 0;
    for (int e in anxietyLevels) {
      totalAnxietyLevel = totalAnxietyLevel + e;
    }
    return totalAnxietyLevel;
  }
}

class PsychologicalStateResult {
  Map<int, String> emotionalStates;

  Map<int, int> anxietyLevels;

  PsychologicalStateResult(this.emotionalStates, this.anxietyLevels);
}

class PersTestColor {
  int val;
  String hex;

  PersTestColor(this.val, this.hex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersTestColor &&
          runtimeType == other.runtimeType &&
          val == other.val &&
          hex == other.hex;

  @override
  int get hashCode => val.hashCode ^ hex.hashCode;
}
