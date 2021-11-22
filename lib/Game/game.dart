import '../../Constants/contrast.dart';
import 'Constants/game_id.dart';

class Game {
  static final Contrast contrast = Contrast.LIGHT;

  static GameId getGameId(){
    return GameIds.history;
  }
}
