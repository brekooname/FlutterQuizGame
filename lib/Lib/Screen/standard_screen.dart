import 'package:flutter/material.dart';

import 'Game/game_screen_manager_state.dart';

abstract class StandardScreen<
        TGameScreenManagerState extends GameScreenManagerState>
    extends StatefulWidget {
  TGameScreenManagerState gameScreenManagerState;

  StandardScreen(this.gameScreenManagerState, {Key? key}) : super(key: key);

  Color? get screenBackgroundColor => null;
}
