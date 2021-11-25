import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';

class HistoryGameScreen extends StatefulWidget {
  GameContext gameContext;
  MyAppContext myAppContext;
  late HistoryLocalStorage historyLocalStorage;

  int score = 0;
  int availableHints = 6;
  List<String> pressedEntries = [];
  GameLevel gameLevel;
  String historyEra = "";

  HistoryGameScreen(
      {Key? key,
      required this.gameLevel,
      required this.gameContext,
      required this.myAppContext})
      : super(key: key) {
    historyLocalStorage = HistoryLocalStorage(myAppContext: myAppContext);
  }

  @override
  State<HistoryGameScreen> createState() => HistoryGameScreenState();
}

class Question {
  Image image;
  MyButton button;
  String question;

  Question(this.image, this.button, this.question);
}

class HistoryGameScreenState extends State<HistoryGameScreen>
    with StandardScreen {
  final Size answer_btn_size = Size(120, 60);
  ItemScrollController itemScrollController = ItemScrollController();
  Map<String, Question> questions = Map<String, Question>();

  List<QuestionInfo> allQuestionInfos = [];
  int firstOpenQuestionIndex = 0;
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    List<String> rawStrings = widget
        .gameContext.currentUserGameUser.allQuestionInfos
        .map((e) => e.question.rawString)
        .toList();

    List<String> questionStrings =
        rawStrings.map((e) => e.split(":")[0]).toList().reversed.toList();
    List<String> optionStrings =
        rawStrings.map((e) => e.split(":")[1]).toList().reversed.toList();

    for (var i = 0; i < optionStrings.length; i++) {
      var btnBackgr = Colors.lightBlueAccent;
      var disabled = false;
      if (widget.pressedEntries.contains(optionStrings[i])) {
        disabled = true;
      }

      var answerBtn = MyButton(
          width: answer_btn_size.width,
          height: answer_btn_size.height,
          disabled: disabled,
          disabledBackgroundColor: Colors.red.shade100,
          onClick: () {
            setState(() {
              itemScrollController.scrollTo(
                  index: 25, duration: Duration(milliseconds: 300));
              widget.pressedEntries.add(optionStrings[i]);
            });
          },
          buttonSkinConfig: ButtonSkinConfig(
              borderColor: Colors.blue.shade600, backgroundColor: btnBackgr),
          fontConfig: FontConfig(),
          text: optionStrings[i]);

      questions[optionStrings[i]] = Question(
          Image.asset(
            "assets/implementations/history/questions/images/i$i.png",
            alignment: Alignment.center,
            height: answer_btn_size.height * 1.8,
            width: answer_btn_size.height * 1.8,
          ),
          answerBtn,
          optionStrings[i]);
    }

    ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    itemPositionsListener.itemPositions.addListener(() {
      setHistoryEra(int.parse(optionStrings[
          itemPositionsListener.itemPositions.value.first.index]));
    });

    var header = HistoryGameLevelHeader(
      historyEra: widget.historyEra,
      question: questionStrings[0],
    );

    ScrollablePositionedList listView = ScrollablePositionedList.builder(
      itemCount: questions.length,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemBuilder: (BuildContext context, int index) {
        var question = questions[optionStrings[index]];
        return createOptionItem(question!.button, true, question.image, index);
      },
    );

    var mainColumn = Column(
      children: <Widget>[
        SizedBox(height: 5),
        header,
        Expanded(child: listView)
      ],
    );

    return createScreen(mainColumn);
  }

  Widget createOptionItem(
      MyButton answerBtn, bool? correctAnswer, Image questionImg, int index) {
    Widget answerPart = correctAnswer == null
        ? AnimateZoomInZoomOut(
            toAnimateWidgetSize: answer_btn_size,
            toAnimateWidget: answerBtn,
          )
        : answerBtn;

    var item = Row(children: <Widget>[
      Spacer(),
      SizedBox(width: answer_btn_size.width + 10, child: answerPart),
      SizedBox(width: 20),
      Container(
          width: 10,
          height: answer_btn_size.height * 2,
          color: correctAnswer == null
              ? Colors.blueGrey
              : correctAnswer
                  ? Colors.green
                  : Colors.red),
      SizedBox(width: 20),
      questionImg,
      Spacer()
    ]);

    return Container(
        child: item,
        color: index % 2 == 0
            ? Colors.yellow.shade500.withOpacity(0.1)
            : Colors.yellow.shade500.withOpacity(0.6));
  }

  void initNextQuestion() {
    Set<int> allQPlayed =
        widget.historyLocalStorage.getAllLevelsPlayed(widget.gameLevel);
    var questionNrInOrder = getQuestionNrInOrder();
    for (int i in questionNrInOrder) {
      if (!allQPlayed.contains(i)) {
        firstOpenQuestionIndex = questionNrInOrder[i];
        currentQuestion =
            getRandomNextQuestion(firstOpenQuestionIndex, questionNrInOrder);
        while (allQPlayed.contains(currentQuestion)) {
          currentQuestion =
              getRandomNextQuestion(firstOpenQuestionIndex, questionNrInOrder);
        }

        break;
      }
    }
  }

  void setHistoryEra(int year) {
    String res;
    if (year < -3200) {
      res = 0.toString();
    } else if (year < 499) {
      res = 1.toString();
    } else if (year < 1499) {
      res = 2.toString();
    } else {
      res = 3.toString();
    }
    if (res != widget.historyEra) {
      setState(() {
        widget.historyEra = res;
      });
    }
  }

  List<int> getQuestionNrInOrder() {
    List<int> qNr = [];
    for (int i = 0; i < allQuestionInfos.length; i++) {
      qNr.add(i);
    }
    return qNr;
  }

  int getRandomNextQuestion(
      int firstOpenQuestionIndex, List<int> questionNrInOrder) {
    int nr = Random().nextInt(5) + firstOpenQuestionIndex;
    int size = questionNrInOrder.length;
    return questionNrInOrder.elementAt(min(nr, size - 1));
  }
}
