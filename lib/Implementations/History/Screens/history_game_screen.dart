import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_level.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/int_extension.dart';
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
  GameLevel gameLevel;
  String historyEra = "";
  int currentQuestion = 0;

  HistoryGameScreen(
      {Key? key,
      required this.gameLevel,
      required this.gameContext,
      required this.myAppContext})
      : super(key: key) {
    historyLocalStorage = HistoryLocalStorage(myAppContext: myAppContext);
    currentQuestion = getCurrentQuestion();

    historyLocalStorage.clearLevelsPlayed(gameLevel);
  }

  @override
  State<HistoryGameScreen> createState() => HistoryGameScreenState();

  int getCurrentQuestion() {
    Set<int> allQPlayed = historyLocalStorage.getAllLevelsPlayed(gameLevel);
    int questionNrInOrderLength =
        gameContext.currentUserGameUser.allQuestionInfos.length;
    int firstOpenQuestionIndex = 0;
    int currentQuestion = 0;
    for (int i = 0; i < questionNrInOrderLength; i++) {
      if (!allQPlayed.contains(i)) {
        firstOpenQuestionIndex = i;
        currentQuestion = getRandomNextQuestion(
            firstOpenQuestionIndex, questionNrInOrderLength);
        while (allQPlayed.contains(currentQuestion)) {
          currentQuestion = getRandomNextQuestion(
              firstOpenQuestionIndex, questionNrInOrderLength);
        }
        return currentQuestion;
      }
    }
    return 0;
  }

  int getRandomNextQuestion(
      int firstOpenQuestionIndex, int questionNrInOrderLength) {
    int nr = Random().nextInt(5) + firstOpenQuestionIndex;
    return min(nr, questionNrInOrderLength - 1);
  }
}

class HistoryQuestion {
  Image image;
  MyButton button;
  bool? correctAnswer;
  String question;

  HistoryQuestion(this.image, this.button, this.correctAnswer, this.question);
}

class HistoryGameScreenState extends State<HistoryGameScreen>
    with StandardScreen {
  final Size answer_btn_size = Size(120, 60);
  ItemScrollController itemScrollController = ItemScrollController();
  Map<String, HistoryQuestion> questions = Map<String, HistoryQuestion>();

  @override
  Widget build(BuildContext context) {
    initScreen(widget.myAppContext, context);

    List<String> rawStrings = widget
        .gameContext.currentUserGameUser.allQuestionInfos
        .map((e) => e.question.rawString)
        .toList();

    List<String> questionStrings =
        rawStrings.map((e) => e.split(":")[0]).toList().reversed.toList();
    List<String> optionStrings =
        rawStrings.map((e) => e.split(":")[1]).toList().reversed.toList();

    var levelsWon = widget.historyLocalStorage.getLevelsWon(widget.gameLevel);
    var levelsLost = widget.historyLocalStorage.getLevelsLost(widget.gameLevel);
    var levelsImgShown =
        widget.historyLocalStorage.getLevelsImgShown(widget.gameLevel);
    for (var i = 0; i < optionStrings.length; i++) {
      var btnBackgr = Colors.lightBlueAccent;
      var disabled = false;


      bool? correctAnswer;
      Color? disabledBackgroundColor;
      if (levelsWon.contains(i)) {
        correctAnswer = true;
        disabledBackgroundColor = Colors.green.shade200;
        disabled = true;
      } else if (levelsLost.contains(i)) {
        correctAnswer = false;
        disabledBackgroundColor = Colors.red.shade300;
        disabled = true;
      }

      var optionText = getOptionText(optionStrings[i]);
      var answerBtn = MyButton(
          width: answer_btn_size.width,
          height: answer_btn_size.height,
          disabled: disabled,
          disabledBackgroundColor: disabledBackgroundColor,
          onClick: () {
            setState(() {
              if (getOptionText(optionStrings[widget.currentQuestion]) ==
                  optionText) {
                widget.historyLocalStorage
                    .setLevelWon(widget.currentQuestion, widget.gameLevel);
                widget.historyLocalStorage
                    .setLeveImgShown(widget.currentQuestion, widget.gameLevel);
              } else {
                itemScrollController.scrollTo(
                    index: widget.currentQuestion,
                    duration: Duration(milliseconds: 300));
                widget.historyLocalStorage
                    .setLevelLost(widget.currentQuestion, widget.gameLevel);
              }
            });
            widget.currentQuestion = widget.getCurrentQuestion();
          },
          buttonSkinConfig: ButtonSkinConfig(
              borderColor: Colors.blue.shade600, backgroundColor: btnBackgr),
          fontConfig: FontConfig(),
          text: optionText);

      var imgRatio = 1.3;
      var imageSize = Size(
          answer_btn_size.width * imgRatio, answer_btn_size.height * imgRatio);
      Image image = levelsImgShown.contains(i)
          ? imageService.getSpecificImage(
              imageName: "i$i", module: "questions/images", size: imageSize)
          : levelsLost.contains(i)
              ? imageService.getSpecificImage(
                  imageName: "hist_answ_wrong", size: imageSize)
              : imageService.getSpecificImage(
                  imageName: "timeline_opt_unknown", size: imageSize);
      questions[optionStrings[i]] = HistoryQuestion(
          image, answerBtn, correctAnswer, optionStrings[i]);
    }

    ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    itemPositionsListener.itemPositions.addListener(() {
      setHistoryEra(int.parse(optionStrings[
          itemPositionsListener.itemPositions.value.first.index]));
    });

    var header = HistoryGameLevelHeader(
      historyEra: widget.historyEra,
      question: questionStrings[widget.currentQuestion],
    );

    ScrollablePositionedList listView = ScrollablePositionedList.builder(
      itemCount: questions.length,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemBuilder: (BuildContext context, int index) {
        var question = questions[optionStrings[index]];
        return createOptionItem(question!.button, question.correctAnswer, question.image, index);
      },
    );

    var mainColumn = Column(
      children: <Widget>[header, Expanded(child: listView)],
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

  void setHistoryEra(int year) {
    String res;
    if (year < -3200) {
      res = label.l_prehistory;
    } else if (year < 499) {
      res = label.l_ancient_history;
    } else if (year < 1499) {
      res = label.l_middle_ages;
    } else {
      res = label.l_modern_history;
    }
    if (res != widget.historyEra) {
      setState(() {
        widget.historyEra = res;
      });
    }
  }

  String getOptionText(String yearString) {
    int year = int.parse(yearString);
    String val =
        year < 0 ? year.abs().formatIntEveryThreeChars() : year.toString();
    val = year < 0 ? formatTextWithOneParam(label.l_param0_bc, val) : val;
    return val;
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }
}
