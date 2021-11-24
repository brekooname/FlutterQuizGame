
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants/contrast.dart';
import 'Constants/game_id.dart';

class Game {
  static final Contrast contrast = Contrast.LIGHT;

  static late SharedPreferences localStorage;

  static init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  static GameId getGameId() {
    return GameIds.history;
  }

}
