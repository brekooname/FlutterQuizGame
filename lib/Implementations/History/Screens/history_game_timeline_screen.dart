import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info_status.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/int_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/game_finished_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';

class HistoryGameTimelineScreen extends StatefulWidget with GameScreen {
  GameContext gameContext;
  MyAppContext myAppContext;
  late HistoryLocalStorage historyLocalStorage;
  late QuestionInfo currentQuestion;

  int? mostPressedCurrentQuestion;
  List<int> shownAnswerImages = [];
  bool correctAnswerPressed = false;

  HistoryGameTimelineScreen(
      {Key? key,
      required QuestionDifficulty difficulty,
      required QuestionCategory category,
      required this.gameContext,
      required this.myAppContext})
      : super(key: key) {
    initScreen(HistoryCampaignLevel(), difficulty, category);
    historyLocalStorage = HistoryLocalStorage(myAppContext: myAppContext);

    currentQuestion =
        gameContext.gameUser.getRandomQuestion(difficulty, category);
  }

  @override
  State<HistoryGameTimelineScreen> createState() =>
      HistoryGameTimelineScreenState();

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

class HistoryGameTimelineScreenState extends State<HistoryGameTimelineScreen>
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
        maxWidth: getImageWidth(),
        imageName: "timeline_opt_unknown");
    histAnswWrong = imageService.getSpecificImage(
        maxWidth: getImageWidth(),
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
    initScreen(widget.myAppContext, context);

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

    var allQuestionsForConfig = widget.gameContext.gameUser
        .getAllQuestionsForConfig(widget.difficulty, widget.category);
    List<String> rawStrings =
        allQuestionsForConfig.map((e) => e.question.rawString).toList();

    List<String> questionStrings =
        rawStrings.map((e) => e.split(":")[0]).toList().reversed.toList();
    List<String> optionStrings =
        rawStrings.map((e) => e.split(":")[1]).toList().reversed.toList();

    var questionIndex = widget.currentQuestion.question.index;
    var levelsWon = allQuestionsForConfig
        .where((element) => element.status == QuestionInfoStatus.WON)
        .map((e) => e.question.index)
        .toList();
    var levelsLost = allQuestionsForConfig
        .where((element) => element.status == QuestionInfoStatus.LOST)
        .map((e) => e.question.index)
        .toList();
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
              if (getOptionText(optionStrings[questionIndex]) == optionText) {
                audioPlayer.playSuccess();
                widget.shownAnswerImages.add(questionIndex);
                widget.gameContext.gameUser
                    .setWonQuestion(widget.currentQuestion);
                widget.correctAnswerPressed = true;
                widget.historyLocalStorage.setHighScore(
                    widget.gameContext.gameUser
                        .countAllQuestions([QuestionInfoStatus.WON]),
                    widget.campaignLevel);
              } else {
                audioPlayer.playFail();
                itemScrollController.scrollTo(
                    index: questionIndex,
                    duration: Duration(milliseconds: 600));
                widget.gameContext.gameUser
                    .setLostQuestion(widget.currentQuestion);
                widget.correctAnswerPressed = false;
              }
            });
            widget.mostPressedCurrentQuestion = questionIndex;
            widget.currentQuestion = widget.gameContext.gameUser
                .getRandomQuestion(widget.difficulty, widget.category);
          },
          buttonSkinConfig: ButtonSkinConfig(
              borderColor: Colors.blue.shade600, backgroundColor: btnBackgr),
          fontConfig: FontConfig(),
          customContent: [getOptionContentCat(optionText)]);
      var imgRatio = 1.3;
      var maxHeight = answerBtnSize.height * imgRatio;
      var appKey = myAppContext.appId.appKey;
      Image image = widget.shownAnswerImages.contains(i)
          ? imageService.getSpecificImage(
              appKey: appKey,
              maxWidth: getImageWidth(),
              maxHeight: maxHeight,
              imageName: "i" + i.toString(),
              module: getQuestionImagePath(widget.difficulty, widget.category))
          : levelsLost.contains(i)
              ? histAnswWrong
              : timelineOptUnknown;
      questions[optionStrings[i]] =
          HistoryQuestion(image, answerBtn, correctAnswer, optionStrings[i]);
    }

    var header = HistoryGameLevelHeader(
      availableHints: widget.gameContext.amountAvailableHints,
      question:
          widget.currentQuestion == -1 ? "" : questionStrings[questionIndex],
      myAppContext: widget.myAppContext,
      animateScore: widget.correctAnswerPressed,
      score: formatTextWithOneParam(label.l_score_param0, levelsWon.length),
      hintButtonOnClick: () {
        onHintButtonClick(levelsWon, levelsLost);
      },
      screenDimensions: screenDimensions,
    );

    ScrollablePositionedList listView = ScrollablePositionedList.builder(
      physics: ClampingScrollPhysics(),
      itemCount: questions.length,
      itemScrollController: itemScrollController,
      itemBuilder: (BuildContext context, int index) {
        var question = questions[optionStrings[index]];
        if (widget.category == HistoryGameQuestionConfig().cat0) {
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

  String getQuestionImagePath(
          QuestionDifficulty difficulty, QuestionCategory category) =>
      "questions/images/" + difficulty.name + "/" + category.name;

  GameFinishedPopup buildGameFinishedPopup(BuildContext context) {
    return GameFinishedPopup(
      isGameFinishedSuccess: true,
      highScore: null,
      playAgainClick: () {},
    );
  }

  double getImageWidth() {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      return screenDimensions.w(30);
    } else {
      return screenDimensions.w(20);
    }
  }

  int getHistoryEraYear(List<String> optionStrings, int index) {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      return int.parse(optionStrings[index]);
    } else {
      return getYear2ForCat1(optionStrings[index].split(",")[1]);
    }
  }

  Widget getOptionContentCat(String text) {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
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
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      return Size(screenDimensions.w(30), screenDimensions.h(9));
    } else {
      return Size(screenDimensions.w(60), screenDimensions.h(10));
    }
  }

  void onHintButtonClick(List<int> levelsWon, List<int> levelsLost) {
    widget.correctAnswerPressed = false;

    widget.gameContext.amountAvailableHints =
        widget.gameContext.amountAvailableHints - 1;

    List<int> availableQuestionsToShowImages = widget.gameContext.gameUser
        .getOpenQuestionsForConfig(widget.difficulty, widget.category)
        .map((e) => e.question.index)
        .toList();
    availableQuestionsToShowImages.shuffle();
    var currentIndex = widget.currentQuestion.question.index;
    availableQuestionsToShowImages.remove(currentIndex);
    availableQuestionsToShowImages.removeAll(widget.shownAnswerImages);
    Set<int> imagesToShow = Set();
    imagesToShow.add(currentIndex);
    while (
        imagesToShow.length < 5 && availableQuestionsToShowImages.isNotEmpty) {
      imagesToShow.add(availableQuestionsToShowImages[0]);
      availableQuestionsToShowImages.removeAt(0);
    }
    widget.shownAnswerImages.addAll(imagesToShow);
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

    var color = correctAnswer == null
        ? Colors.yellow.shade500
        : correctAnswer
            ? Colors.green.shade200
            : Colors.red.shade200;
    return Container(
        child: item,
        color:
            index % 2 == 0 ? color.withOpacity(0.2) : color.withOpacity(0.4));
  }

  Widget getQuestionSeparator(Size answerBtnSize, bool? correctAnswer) {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
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

  String getOptionText(String yearString) {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
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
