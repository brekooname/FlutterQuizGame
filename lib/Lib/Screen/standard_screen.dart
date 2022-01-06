import 'package:flutter/material.dart';

import 'Game/game_screen_manager_state.dart';

abstract class StandardScreen extends StatefulWidget {
  GameScreenManagerState gameScreenManagerState;

  StandardScreen(this.gameScreenManagerState, {Key? key}) : super(key: key);

}
