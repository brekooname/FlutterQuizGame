import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/int_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';

//ignore: must_be_immutable
class HistoryGameTimelineScreen extends GameScreen<HistoryGameContext,
    HistoryGameScreenManagerState, HistoryCampaignLevelService> {
  static const int scrollToItemDurationMillis = 600;
  static const int showInterstitialAdEveryNQuestions = 12;
  static const int defaultQuestionsToPlayUntilNextCategory = 1;
  final MyAudioPlayer _audioPlayer = MyAudioPlayer();

  final HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();

  final Map<int, HistoryQuestion> questions = HashMap<int, HistoryQuestion>();
  final Map<QuestionCategory, List<int>> shownImagesForTimeLineHints =
      HashMap();
  late final Set<QuestionInfo> randomQuestionsToDisplay;
  int questionsToPlayUntilNextCategory =
      defaultQuestionsToPlayUntilNextCategory;
  bool correctAnswerPressed = false;
  bool alreadyWentToNextScreen = false;
  bool animateQuestionText = false;
  int? lasPressedQuestionIndex;

  HistoryGameTimelineScreen(
    HistoryGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required HistoryGameContext gameContext,
  }) : super(gameScreenManagerState, gameContext,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    List<QuestionInfo> allAvailableQuestions = gameContext.gameUser
        .getOpenQuestionsForConfig(difficulty, category)
        .toList();

    randomQuestionsToDisplay =
        getRandomIndexToDisplay(currentQuestionInfo, allAvailableQuestions);
  }

  @override
  HistoryCampaignLevelService get campaignLevelService =>
      HistoryCampaignLevelService();

  Set<QuestionInfo> getRandomIndexToDisplay(
      QuestionInfo questionInfo, List<QuestionInfo> allAvailableQuestions) {
    Set<QuestionInfo> res = HashSet();
    res.add(questionInfo);
    int totalNrOfQuestions = 4;
    if (allAvailableQuestions.length <= totalNrOfQuestions) {
      res.addAll(allAvailableQuestions);
    } else {
      while (res.length < totalNrOfQuestions &&
          res.length <= allAvailableQuestions.length) {
        res.add(allAvailableQuestions
            .elementAt(Random().nextInt(allAvailableQuestions.length)));
      }
    }
    return res;
  }

  @override
  State<HistoryGameTimelineScreen> createState() =>
      HistoryGameTimelineScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return HistoryGameTimelineScreen.showInterstitialAdEveryNQuestions;
  }
}

class HistoryQuestion {
  Image image;
  MyButton button;
  bool? correctAnswer;
  String question;
  int questionIndex;

  HistoryQuestion(this.image, this.button, this.correctAnswer, this.question,
      this.questionIndex);
}

class HistoryGameTimelineScreenState extends State<HistoryGameTimelineScreen>
    with ScreenState, LabelMixin {
  final QuizQuestionContainer _quizQuestionContainer = QuizQuestionContainer();
  final ItemScrollController _itemScrollController = ItemScrollController();
  late Image _timelineOptUnknown;
  late Image _histAnswWrong;
  late Image _timelineArrow;
  late Size _answerBtnSize;

  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      _onHintButtonClick();
    });
    _answerBtnSize = _getButtonSizeForCat();

    _timelineOptUnknown = imageService.getSpecificImage(
        maxWidth: _getImageWidth(),
        maxHeight: _getImageMaxHeight(),
        imageName: "timeline_opt_unknown",
        imageExtension: "png");
    _histAnswWrong = imageService.getSpecificImage(
        maxWidth: _getImageWidth(),
        maxHeight: _getImageMaxHeight(),
        imageName: "hist_answ_wrong",
        imageExtension: "png");
    _timelineArrow = imageService.getSpecificImage(
        imageName: FontConfig.isRtlLanguage ? "arrow_left" : "arrow_right",
        imageExtension: "png",
        maxWidth: screenDimensions.dimen(10));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_timelineOptUnknown.image, context);
    precacheImage(_histAnswWrong.image, context);
    precacheImage(_timelineArrow.image, context);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build timeline ");
    int zoomInZoomOutAnswerDuration = 500;

    for (QuestionInfo qi in widget.randomQuestionsToDisplay) {
      var disabled = false;

      bool? correctAnswer;
      Color enabledAnswerBtnBackgroundColor = Colors.lightBlueAccent;
      Color disabledAnswerBtnBackgroundColor = enabledAnswerBtnBackgroundColor;
      var qIndex = qi.question.index;
      if (qIndex == (widget.lasPressedQuestionIndex ?? -1) &&
          widget.correctAnswerPressed) {
        correctAnswer = true;
        disabledAnswerBtnBackgroundColor = Colors.green.shade200;
        disabled = true;
      } else if (qIndex == (widget.lasPressedQuestionIndex ?? -1)) {
        correctAnswer = false;
        disabledAnswerBtnBackgroundColor = Colors.red.shade300;
        disabled = true;
      }

      var questionAnswer = qi.question.rawString.split(":")[1];
      String correctAnswerText =
          widget.currentQuestionInfo.question.rawString.split(":")[1];

      if (_shouldGoToNextGameScreen()) {
        disabled = true;
        if (!widget.alreadyWentToNextScreen) {
          widget.alreadyWentToNextScreen = true;
          Future.delayed(const Duration(milliseconds: 1100),
              () => widget.goToNextGameScreen());
        }
      }

      MyButton answerBtn = _createAnswerButton(
          _answerBtnSize,
          disabled,
          enabledAnswerBtnBackgroundColor,
          disabledAnswerBtnBackgroundColor,
          _getOptionText(correctAnswerText),
          _getOptionText(questionAnswer));
      Image image = _createImageForQuestion(
          qIndex, correctAnswer != null && !correctAnswer);
      widget.questions[qIndex] = HistoryQuestion(
          image, answerBtn, correctAnswer, questionAnswer, qIndex);
    }

    HistoryGameLevelHeader header = _createHeader();
    QuestionInfo? mostRecentQ = _getMostRecentAnswered();
    Widget questionContainer =
        _quizQuestionContainer.createQuestionTextContainer(
            _shouldGoToNextGameScreen()
                ? mostRecentQ?.question
                : widget.currentQuestionInfo.question,
            widget.category == HistoryGameQuestionConfig().cat0 ? 1 : 2,
            widget.category == HistoryGameQuestionConfig().cat3 ? 4 : 2,
            questionContainerHeight: screenDimensions.dimen(30));

    ScrollablePositionedList listView =
        _createListView(_answerBtnSize, zoomInZoomOutAnswerDuration);

    var mainColumn = Column(
      children: <Widget>[header, questionContainer, Expanded(child: listView)],
    );

    return mainColumn;
  }

  double _getImageMaxHeight() {
    var imgRatio = 1.3;
    var maxHeight = _answerBtnSize.height * imgRatio;
    return maxHeight;
  }

  Image _createImageForQuestion(int qIndex, bool isWrongAnswer) {
    Image image = widget.shownImagesForTimeLineHints
            .getOrDefault<QuestionCategory, List<int>>(
                widget.category, []).contains(qIndex)
        ? imageService.getSpecificImage(
            maxWidth: _getImageWidth(),
            maxHeight: _getImageMaxHeight(),
            imageName: "i" + qIndex.toString(),
            imageExtension: "png",
            module: _getQuestionImagePath(widget.difficulty, widget.category))
        : isWrongAnswer
            ? _histAnswWrong
            : _timelineOptUnknown;
    return image;
  }

  ScrollablePositionedList _createListView(
      Size answerBtnSize, int zoomInZoomOutAnswerDuration) {
    ScrollablePositionedList listView = ScrollablePositionedList.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: widget.questions.length,
      itemScrollController: _itemScrollController,
      itemBuilder: (BuildContext context, int index) {
        HistoryQuestion question =
            _getSortedYearValues().elementAt(_getRevertedIndex(index));

        if (widget.category == HistoryGameQuestionConfig().cat0) {
          return _createOptionItemCat0(
              question.button,
              answerBtnSize,
              question.correctAnswer,
              question.image,
              question.questionIndex,
              index,
              zoomInZoomOutAnswerDuration);
        } else {
          return _createOptionItemCat1(
              question.button,
              answerBtnSize,
              question.correctAnswer,
              question.image,
              question.questionIndex,
              index,
              zoomInZoomOutAnswerDuration);
        }
      },
    );
    return listView;
  }

  List<HistoryQuestion> _getSortedYearValues() {
    List<HistoryQuestion> list = List.of(widget.questions.values);
    list.sort((a, b) => a.questionIndex.compareTo(b.questionIndex));
    return list;
  }

  int _getRevertedIndex(int index) => widget.questions.length - index - 1;

  HistoryGameLevelHeader _createHeader() {
    var header = HistoryGameLevelHeader(
      availableHints: widget.gameContext.amountAvailableHints,
      disableHintBtn: widget.shownImagesForTimeLineHints.isNotEmpty,
      animateScore: widget.correctAnswerPressed,
      score: formatTextWithOneParam(
          label.l_score_param0,
          widget.historyLocalStorage
                  .getWonQuestionsForDiff(widget.difficulty)
                  .length
                  .toString() +
              "/" +
              widget.gameContext.totalNrOfQuestionsForCampaignLevel.toString()),
      hintButtonOnClick: () {
        _onHintButtonClick();
      },
    );
    return header;
  }

  bool _shouldGoToNextGameScreen() {
    return widget.questionsToPlayUntilNextCategory == 0;
  }

  MyButton _createAnswerButton(
      Size answerBtnSize,
      bool disabled,
      Color enabledBackgroundColor,
      Color disabledBackgroundColor,
      String correctAnswerOptionText,
      String optionTextToDisplay) {
    var answerBtn = MyButton(
        size: answerBtnSize,
        disabled: disabled,
        disabledBackgroundColor: disabledBackgroundColor,
        onClick: () {
          var currentQuestionInfo = widget.currentQuestionInfo;
          int questionIndex = currentQuestionInfo.question.index;
          setState(() {
            if (correctAnswerOptionText == optionTextToDisplay) {
              widget._audioPlayer.playSuccess();
              widget.shownImagesForTimeLineHints
                  .putIfAbsent(widget.category, () => [])
                  .add(questionIndex);
              widget.gameContext.gameUser.setWonQuestion(currentQuestionInfo);
              widget.correctAnswerPressed = true;
              widget.historyLocalStorage
                  .setWonQuestion(currentQuestionInfo.question);
            } else {
              widget._audioPlayer.playFail();
              var values = _getSortedYearValues();
              _itemScrollController.scrollTo(
                  index: _getRevertedIndex(values.toList().indexOf(
                      values.firstWhere((element) =>
                          element.questionIndex == questionIndex))),
                  duration: const Duration(
                      milliseconds: HistoryGameTimelineScreen
                          .scrollToItemDurationMillis));
              widget.gameContext.gameUser.setLostQuestion(currentQuestionInfo);
              widget.correctAnswerPressed = false;
              widget.historyLocalStorage
                  .setLostQuestion(currentQuestionInfo.question);
            }
          });
          widget.lasPressedQuestionIndex = currentQuestionInfo.question.index;
          widget.animateQuestionText = true;
          widget.questionsToPlayUntilNextCategory--;
        },
        buttonSkinConfig: ButtonSkinConfig(
            borderColor: Colors.blue.shade600,
            backgroundColor: enabledBackgroundColor),
        fontConfig: FontConfig(),
        customContent: _getOptionContentCat(optionTextToDisplay));
    return answerBtn;
  }

  String _getQuestionImagePath(
          QuestionDifficulty difficulty, QuestionCategory category) =>
      "questions/images/" + difficulty.name + "/" + category.name;

  double _getImageWidth() {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      return screenDimensions.dimen(30);
    } else {
      return screenDimensions.dimen(20);
    }
  }

  Widget _getOptionContentCat(String text) {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      return MyText(text: text);
    } else {
      var split = text.split("-");
      var v1 = split[0];
      var v2 = split[1];
      double textWidthPercent = 15;
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        MyText(text: v1, width: screenDimensions.dimen(textWidthPercent)),
        Padding(
            padding: EdgeInsets.all(screenDimensions.dimen(1)),
            child: _timelineArrow),
        MyText(text: v2, width: screenDimensions.dimen(textWidthPercent))
      ]);
    }
  }

  Size _getButtonSizeForCat() {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      return Size(screenDimensions.dimen(30), screenDimensions.dimen(16));
    } else {
      return Size(screenDimensions.dimen(60), screenDimensions.dimen(17));
    }
  }

  void _onHintButtonClick() {
    widget.correctAnswerPressed = false;

    widget.gameContext.amountAvailableHints--;
    widget.historyLocalStorage.setRemainingHintsForDiff(
        widget.difficulty, widget.gameContext.amountAvailableHints);

    widget.shownImagesForTimeLineHints
        .putIfAbsent(widget.category, () => [])
        .addAll(widget.randomQuestionsToDisplay.map((e) => e.question.index));
    setState(() {
      widget.animateQuestionText = false;
    });
  }

  Widget _createOptionItemCat0(
      MyButton answerBtn,
      Size answerBtnSize,
      bool? correctAnswer,
      Image questionImg,
      int questionIndex,
      int listItemIndex,
      int millisForZoomInZoomOut) {
    var mostRecentAnswered = _getMostRecentAnswered();
    Widget answerPart = _createBtnAnswerWithAnimation(mostRecentAnswered,
        questionIndex, millisForZoomInZoomOut, answerBtnSize, answerBtn);

    var margin = screenDimensions.dimen(3);
    var item = Row(children: <Widget>[
      const Spacer(),
      Padding(
          padding: EdgeInsets.fromLTRB(margin, 0, margin, 0),
          child: answerPart),
      _getQuestionSeparator(answerBtnSize, correctAnswer),
      questionImg,
      const Spacer()
    ]);

    Color color = _getColorForAnswerStatus(correctAnswer);
    return Container(
        child: item, color: _getColorOpacityForItemRowNr(listItemIndex, color));
  }

  Color _getColorOpacityForItemRowNr(int index, Color color) =>
      index % 2 == 0 ? color.withOpacity(0.5) : color.withOpacity(0.8);

  Color _getColorForAnswerStatus(bool? correctAnswer) {
    var color = correctAnswer == null
        ? Colors.yellow.shade500
        : correctAnswer
            ? Colors.green.shade200
            : Colors.red.shade200;
    return color;
  }

  Widget _getQuestionSeparator(Size answerBtnSize, bool? correctAnswer) {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      return Row(children: <Widget>[
        SizedBox(
          width: screenDimensions.dimen(2),
        ),
        Container(
            width: screenDimensions.dimen(2),
            height: answerBtnSize.height * 1.6,
            color: correctAnswer == null
                ? Colors.blueGrey
                : correctAnswer
                    ? Colors.green
                    : Colors.red),
        SizedBox(
          width: screenDimensions.dimen(2),
        ),
      ]);
    } else {
      return Container();
    }
  }

  QuestionInfo? _getMostRecentAnswered() {
    return widget.gameContext.gameUser.getMostRecentAnsweredQuestion(
        questionInfoStatus: [QuestionInfoStatus.lost, QuestionInfoStatus.won],
        difficulty: widget.difficulty,
        category: widget.category);
  }

  Widget _createOptionItemCat1(
      MyButton answerBtn,
      Size answerBtnSize,
      bool? correctAnswer,
      Image questionImg,
      int questionIndex,
      int listItemIndex,
      int millisForZoomInZoomOut) {
    var mostRecentAnswered = _getMostRecentAnswered();
    Widget answerPart = _createBtnAnswerWithAnimation(mostRecentAnswered,
        questionIndex, millisForZoomInZoomOut, answerBtnSize, answerBtn);

    var item = Row(children: <Widget>[
      const Spacer(),
      Padding(
          padding: EdgeInsets.all(screenDimensions.dimen(3)),
          child: answerPart),
      _getQuestionSeparator(answerBtnSize, correctAnswer),
      questionImg,
      const Spacer()
    ]);

    Color color = _getColorForAnswerStatus(correctAnswer);
    return Container(
        child: item, color: _getColorOpacityForItemRowNr(listItemIndex, color));
  }

  Widget _createBtnAnswerWithAnimation(
      QuestionInfo? mostRecentAnswered,
      int index,
      int millisForZoomInZoomOut,
      Size answerBtnSize,
      MyButton answerBtn) {
    Widget answerPart = (mostRecentAnswered != null &&
            mostRecentAnswered.question.index == index &&
            widget.questionsToPlayUntilNextCategory !=
                HistoryGameTimelineScreen
                    .defaultQuestionsToPlayUntilNextCategory)
        ? AnimateZoomInZoomOut(
            toAnimateWidgetSize: answerBtnSize,
            zoomInZoomOutOnce: true,
            duration: Duration(milliseconds: millisForZoomInZoomOut),
            toAnimateWidget: answerBtn,
          )
        : answerBtn;
    return answerPart;
  }

  String _getOptionText(String yearString) {
    if (widget.category == HistoryGameQuestionConfig().cat0) {
      int year = yearString.parseToInt;
      String val =
          year < 0 ? year.abs().formatIntEveryChars(4) : year.toString();
      val = year < 0 ? formatTextWithOneParam(label.l_param0_bc, val) : val;
      return val;
    } else {
      var split = yearString.split(",");
      var split2 = split[1];
      int year1 = split[0].parseToInt;
      int year2 = _getYear2ForCat1(split2);
      String val1 =
          year1 < 0 ? year1.abs().formatIntEveryChars(4) : year1.toString();
      val1 = year1 < 0 ? formatTextWithOneParam(label.l_param0_bc, val1) : val1;
      String val2 =
          year2 < 0 ? year2.abs().formatIntEveryChars(4) : year2.toString();
      val2 = year2 < 0 ? formatTextWithOneParam(label.l_param0_bc, val2) : val2;
      return val1 + "-" + val2;
    }
  }

  int _getYear2ForCat1(String yearString) {
    return yearString == "x" ? DateTime.now().year : yearString.parseToInt;
  }
}
