import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/int_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/game_finished_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';

class HistoryGameScreen extends StatefulWidget {
  GameContext gameContext;
  MyAppContext myAppContext;
  late HistoryLocalStorage historyLocalStorage;

  CampaignLevel gameLevel;
  String historyEra = "";
  late int currentQuestion;
  late int firstOpenQuestionIndex;

  int? mostPressedCurrentQuestion;
  bool correctAnswerPressed = false;

  HistoryGameScreen(
      {Key? key,
      required this.gameLevel,
      required this.gameContext,
      required this.myAppContext})
      : super(key: key) {
    historyLocalStorage = HistoryLocalStorage(myAppContext: myAppContext);
    historyLocalStorage.clearLevelsPlayed(gameLevel);

    currentQuestion = getCurrentQuestion();
    firstOpenQuestionIndex = getFirstOpenQuestion();
  }

  @override
  State<HistoryGameScreen> createState() => HistoryGameScreenState();

  int getFirstOpenQuestion() {
    Set<int> allQPlayed = historyLocalStorage.getAllLevelsPlayed(gameLevel);
    int questionNrInOrderLength =
        gameContext.currentUserGameUser.allQuestionInfos.length;
    for (int i = 0; i < questionNrInOrderLength; i++) {
      if (!allQPlayed.contains(i)) {
        return i;
      }
    }
    return -1;
  }

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
    return -1;
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
  ItemScrollController itemScrollController = ItemScrollController();
  Map<String, HistoryQuestion> questions = HashMap<String, HistoryQuestion>();
  late Image timelineOptUnknown;
  late Image histAnswWrong;
  late Image arrowRight;

  @override
  void initState() {
    var appKey = widget.myAppContext.appId.appKey;
    timelineOptUnknown = imageService.getSpecificImage(
        appKey: appKey,
        maxWidth: screenDimensions.w(20),
        imageName: "timeline_opt_unknown");
    histAnswWrong = imageService.getSpecificImage(
        maxWidth: screenDimensions.w(20),
        appKey: appKey,
        imageName: "hist_answ_wrong");
    arrowRight = imageService.getSpecificImage(
        imageName: "arrow_right",
        appKey: appKey,
        maxWidth: screenDimensions.w(10));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(timelineOptUnknown.image, context);
    precacheImage(histAnswWrong.image, context);
    precacheImage(arrowRight.image, context);
  }

  @override
  Widget build(BuildContext context) {
    initScreen(widget.myAppContext, context, onRewardedAdLoadedSetState: () {
      setState(() {
        isRewardedAdLoaded = true;
        print("22222222222222222222222222222222222222222ISREWARDEDADLOADED" + isRewardedAdLoaded.toString());
      });
    });

    if (widget.currentQuestion == -1) {
      Future.delayed(
          Duration.zero,
          () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return buildGameFinishedPopup(context);
              }));
      return createScreen(Container());
    }
    Size answerBtnSize = getButtonSizeForCat();

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
          size: answerBtnSize,
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
                widget.correctAnswerPressed = true;
              } else {
                itemScrollController.scrollTo(
                    index: widget.currentQuestion,
                    duration: Duration(milliseconds: 900));
                widget.historyLocalStorage
                    .setLevelLost(widget.currentQuestion, widget.gameLevel);
                widget.correctAnswerPressed = false;
              }
            });
            widget.mostPressedCurrentQuestion = widget.currentQuestion;
            widget.currentQuestion = widget.getCurrentQuestion();
            widget.firstOpenQuestionIndex = widget.getFirstOpenQuestion();
          },
          buttonSkinConfig: ButtonSkinConfig(
              borderColor: Colors.blue.shade600, backgroundColor: btnBackgr),
          fontConfig: FontConfig(),
          customContent: [getOptionContentCat(optionText)]);

      var imgRatio = 1.3;
      var maxHeight = answerBtnSize.height * imgRatio;
      var appKey = myAppContext.appId.appKey;
      Image image = levelsImgShown.contains(i)
          ? imageService.getSpecificImage(
              appKey: appKey,
              maxWidth: screenDimensions.w(20),
              maxHeight: maxHeight,
              imageName: getImagePrefix() + i.toString(),
              module: "questions/images")
          : levelsLost.contains(i)
              ? histAnswWrong
              : timelineOptUnknown;
      questions[optionStrings[i]] =
          HistoryQuestion(image, answerBtn, correctAnswer, optionStrings[i]);
    }

    ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    itemPositionsListener.itemPositions.addListener(() {
      setHistoryEra(getHistoryEraYear(optionStrings,
          itemPositionsListener.itemPositions.value.first.index));
    });

    var header = HistoryGameLevelHeader(
      availableHints: widget.gameContext.amountAvailableHints,
      historyEra: widget.historyEra,
      isRewardedAdLoaded: isRewardedAdLoaded,
      question: widget.currentQuestion == -1
          ? ""
          : questionStrings[widget.currentQuestion],
      myAppContext: widget.myAppContext,
      animateScore: widget.correctAnswerPressed,
      score: widget.historyLocalStorage.getLevelsWon(widget.gameLevel).length,
      hintButtonOnClick: onHintButtonClick,
      onWatchRewardedAdReward: () {
        showRewardedAd(context, onHintButtonClick);
      },
      screenDimensions: screenDimensions,
    );

    ScrollablePositionedList listView = ScrollablePositionedList.builder(
      itemCount: questions.length,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemBuilder: (BuildContext context, int index) {
        var question = questions[optionStrings[index]];
        if (widget.gameLevel.category == HistoryGameQuestionConfig().cat0) {
          return createOptionItemCat0(question!.button, answerBtnSize,
              question.correctAnswer, question.image, index);
        } else {
          return createOptionItemCat1(question!.button, answerBtnSize,
              question.correctAnswer, question.image, index);
        }
      },
    );

    var mainColumn = Column(
      children: <Widget>[header, Expanded(child: listView)],
    );

    return createScreen(mainColumn);
  }

  GameFinishedPopup buildGameFinishedPopup(BuildContext context) {
    var historyLocalStorage = widget.historyLocalStorage;
    return GameFinishedPopup(
      isGameFinishedSuccess: true,
      highScore: historyLocalStorage.isHighScore(widget.gameLevel)
          ? historyLocalStorage.getLevelsWon(widget.gameLevel).length
          : null,
      playAgainClick: () {
        NavigatorService().goTo(
            context,
            HistoryGameScreen(
              myAppContext: widget.myAppContext,
              gameContext:
                  HistoryGameContextService(myAppContext: widget.myAppContext)
                      .createGameContext(
                          widget.gameLevel,
                          HistoryQuestions()
                              .getAllQuestions(myAppContext.languageCode)),
              gameLevel: widget.gameLevel,
            ), () {
          setState(() {});
        });
      },
    );
  }

  String getImagePrefix() {
    if (widget.gameLevel.category == HistoryGameQuestionConfig().cat0) {
      return "i";
    } else {
      return "j";
    }
  }

  int getHistoryEraYear(List<String> optionStrings, int index) {
    if (widget.gameLevel.category == HistoryGameQuestionConfig().cat0) {
      return int.parse(optionStrings[index]);
    } else {
      return getYear2ForCat1(optionStrings[index].split(",")[1]);
    }
  }

  Widget getOptionContentCat(String text) {
    if (widget.gameLevel.category == HistoryGameQuestionConfig().cat0) {
      return MyText(text: text);
    } else {
      var split = text.split("-");
      var v1 = split[0];
      var v2 = split[1];
      double textWidthPercent = 15;
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        MyText(text: v1, width: screenDimensions.w(textWidthPercent)),
        Padding(
            padding: EdgeInsets.all(screenDimensions.w(1)), child: arrowRight),
        MyText(text: v2, width: screenDimensions.w(textWidthPercent))
      ]);
    }
  }

  Size getButtonSizeForCat() {
    if (widget.gameLevel.category == HistoryGameQuestionConfig().cat0) {
      return Size(screenDimensions.w(30), screenDimensions.h(9));
    } else {
      return Size(screenDimensions.w(60), screenDimensions.h(10));
    }
  }

  void onHintButtonClick() {
    widget.gameContext.amountAvailableHints =
        widget.gameContext.amountAvailableHints - 1;

    Set<int> allQPlayed =
        widget.historyLocalStorage.getAllLevelsPlayed(widget.gameLevel);
    Set<int> allImgShown =
        widget.historyLocalStorage.getLevelsImgShown(widget.gameLevel);
    int nrOfImgToShow = 5;
    int indexToShow = widget.firstOpenQuestionIndex;
    while (nrOfImgToShow > 0) {
      if (!allQPlayed.contains(indexToShow) &&
          !allImgShown.contains(indexToShow)) {
        widget.historyLocalStorage
            .setLeveImgShown(indexToShow, widget.gameLevel);
        nrOfImgToShow--;
      }
      indexToShow++;

      if (indexToShow > questions.length) {
        break;
      }
    }
    setState(() {});
  }

  Widget createOptionItemCat0(MyButton answerBtn, Size answerBtnSize,
      bool? correctAnswer, Image questionImg, int index) {
    Widget answerPart = (widget.mostPressedCurrentQuestion != null &&
            widget.mostPressedCurrentQuestion == index)
        ? AnimateZoomInZoomOut(
            zoomInZoomOutOnce: true,
            duration: const Duration(milliseconds: 500),
            toAnimateWidgetSize: answerBtnSize,
            toAnimateWidget: answerBtn,
          )
        : answerBtn;

    var item = Row(children: <Widget>[
      Spacer(),
      Padding(
          padding: EdgeInsets.all(screenDimensions.w(3)), child: answerPart),
      getQuestionSeparator(answerBtnSize, correctAnswer),
      questionImg,
      Spacer()
    ]);

    return Container(
        child: item,
        color: index % 2 == 0
            ? Colors.yellow.shade500.withOpacity(0.1)
            : Colors.yellow.shade500.withOpacity(0.6));
  }

  Widget getQuestionSeparator(Size answerBtnSize, bool? correctAnswer) {
    if (widget.gameLevel.category == HistoryGameQuestionConfig().cat0) {
      return Container(
          child: Row(children: <Widget>[
        SizedBox(
          width: screenDimensions.w(2),
        ),
        Container(
            width: screenDimensions.w(2),
            height: answerBtnSize.height * 2,
            color: correctAnswer == null
                ? Colors.blueGrey
                : correctAnswer
                    ? Colors.green
                    : Colors.red),
        SizedBox(
          width: screenDimensions.w(2),
        ),
      ]));
    } else {
      return Container();
    }
  }

  Widget createOptionItemCat1(MyButton answerBtn, Size answerBtnSize,
      bool? correctAnswer, Image questionImg, int index) {
    Widget answerPart = (widget.mostPressedCurrentQuestion != null &&
            widget.mostPressedCurrentQuestion == index)
        ? AnimateZoomInZoomOut(
            zoomInZoomOutOnce: true,
            duration: const Duration(milliseconds: 500),
            toAnimateWidgetSize: answerBtnSize,
            toAnimateWidget: answerBtn,
          )
        : answerBtn;

    var item = Row(children: <Widget>[
      Spacer(),
      Padding(
          padding: EdgeInsets.all(screenDimensions.w(3)), child: answerPart),
      getQuestionSeparator(answerBtnSize, correctAnswer),
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
    if (widget.gameLevel.category == HistoryGameQuestionConfig().cat0) {
      int year = int.parse(yearString);
      String val =
          year < 0 ? year.abs().formatIntEveryChars(4) : year.toString();
      val = year < 0 ? formatTextWithOneParam(label.l_param0_bc, val) : val;
      return val;
    } else {
      var split = yearString.split(",");
      var split2 = split[1];
      int year1 = int.parse(split[0]);
      int year2 = getYear2ForCat1(split2);
      String val1 =
          year1 < 0 ? year1.abs().formatIntEveryChars(4) : year1.toString();
      val1 = year1 < 0 ? formatTextWithOneParam(label.l_param0_bc, val1) : val1;
      String val2 =
          year2 < 0 ? year2.abs().formatIntEveryChars(4) : year2.toString();
      val2 = year2 < 0 ? formatTextWithOneParam(label.l_param0_bc, val2) : val2;
      return val1 + "-" + val2;
    }
  }

  int getYear2ForCat1(String yearString) {
    return yearString == "x" ? DateTime.now().year : int.parse(yearString);
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }
}
