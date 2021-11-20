import 'package:flutter/material.dart';
import '../Implementations/History/Screens/history_main_menu_screen.dart';
import '../Constants/constant.dart';
import 'Implementations/History/Screens/history_game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: K_PRIMARY_COLOR,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HistoryGameScreen(),
//      home: HistoryMainMenuScreen(),
    );
  }
}