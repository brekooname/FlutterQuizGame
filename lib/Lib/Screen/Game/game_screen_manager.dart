import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

abstract class GameScreenManager extends StatefulWidget {
  StandardScreen? currentScreen;

  GameScreenManager({Key? key}) : super(key: key);
}
