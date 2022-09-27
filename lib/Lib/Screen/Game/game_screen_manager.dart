import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

//ignore: must_be_immutable
abstract class GameScreenManager extends StatefulWidget {
  StandardScreen? currentScreen;

  GameScreenManager({Key? key}) : super(key: key);
}
