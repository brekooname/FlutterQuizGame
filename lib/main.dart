import 'dart:collection';

import 'package:flutter/material.dart';

import '../Constants/constant.dart';
import '../Implementations/History/Screens/history_main_menu_screen.dart';
import 'File/file_util.dart';
import 'Game/Game/game_context_service.dart';
import 'Game/Question/QuestionCreator/question_creator.dart';
import 'Game/Question/category_difficulty.dart';
import 'Game/Question/question_category.dart';
import 'Game/Question/question_difficulty.dart';
import 'Game/game.dart';
import 'Implementations/History/Constants/history_game_level.dart';
import 'Implementations/History/Screens/history_game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig =
      HashMap<CategoryAndDifficulty, List<String>>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setup();
  }

  setup() async {
    if (widget.allQuestionsWithConfig.isEmpty) {
      Map<CategoryAndDifficulty, List<String>> res =
          HashMap<CategoryAndDifficulty, List<String>>();
      var categories = Game.getGameId().gameConfig.questionCategories();
      var difficulties = Game.getGameId().gameConfig.questionDifficulties();
      for (QuestionCategory category in categories) {
        for (QuestionDifficulty difficulty in difficulties) {
          String questions =
              await FileUtil.getTextForConfig(difficulty, category);
          print(questions);
          CategoryAndDifficulty config =
              CategoryAndDifficulty(category, difficulty);
          res[config] = questions.split("\n");
        }
      }

      setState(() {
        widget.allQuestionsWithConfig = res;
      });
      await Game.init();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget screenToShow = HistoryMainMenuScreen();

    if (widget.allQuestionsWithConfig.isNotEmpty) {
      var gameLevel = HistoryGameLevel().level_0_0;
      var gameContext = GameContextService(widget.allQuestionsWithConfig)
          .createGameContextWithQuestions(
              QuestionCreator().getAllQuestionsForCategoryAndDifficulty(
        widget.allQuestionsWithConfig,
        gameLevel.category,
        gameLevel.difficulty,
      ));

      screenToShow = HistoryGameScreen(gameContext: gameContext, gameLevel: gameLevel,);
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: K_PRIMARY_COLOR,

          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: screenToShow);
  }
}
