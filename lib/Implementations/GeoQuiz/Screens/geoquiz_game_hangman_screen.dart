import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_hangman_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_hangman_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Hangman/hangman_letters.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class GeoQuizHangmanScreen extends GameScreen<GeoQuizGameContext> {
  static final int show_interstitial_ad_every_n_questions = 8;
  GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  MyAudioPlayer _audioPlayer = MyAudioPlayer();
  late GeoQuizHangmanQuestionService questionService;
  List<String> pressedAnswers = [];
  List<QuestionInfo> currentQuestions = [];
  List<String> currentQuestionsCountryNames = [];
  List<String> alreadyFoundCountryNames = [];
  bool answerFound = false;

  GeoQuizHangmanScreen(
    GameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required GeoQuizGameContext gameContext,
  }) : super(gameScreenManagerState, GeoQuizCampaignLevelService(), gameContext,
            difficulty, category,
            key: key) {
    questionService =
        GeoQuizHangmanCategoryQuestionService().getQuestionService();
    GeoQuizGameContextService gameContextService = GeoQuizGameContextService();
    if (gameContextService.categoriesWithStatsCriteria.keys
        .contains(category)) {
      currentQuestions = gameContext.gameUser
          .getOpenQuestionsForConfig(difficulty, category)
          .toList();
      currentQuestionsCountryNames = currentQuestions
          .map((e) => questionService.getCountryName(e.question.rawString))
          .toList();
    } else {
      currentQuestions = [gameContext.gameUser.getRandomQuestion(difficulty, category)];
    }
    alreadyFoundCountryNames =
        questionService.getAlreadyFoundCountries(difficulty, category, false);
  }

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return show_interstitial_ad_every_n_questions;
  }

  @override
  State<GeoQuizHangmanScreen> createState() => GeoQuizHangmanScreenState();
}

class GeoQuizHangmanScreenState extends State<GeoQuizHangmanScreen>
    with ScreenState, HangmanLetters {
  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      onHintButtonClick();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("==========> building <============");
    Widget foundCountriesContainer = createFoundCountriesContainer();
    Widget wordContainer = createWordContainer();
    Widget letters = createLettersRows(
        {}, setStateCallback, widget.goToNextGameScreenCallBack(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[foundCountriesContainer, wordContainer, letters],
    );
  }

  Widget createFoundCountriesContainer() {
    List<MyText> foundCountries = widget.alreadyFoundCountryNames
        .map((country) => MyText(text: country))
        .toList();
    return Column(children: foundCountries);
  }

  Widget createWordContainer() {
    var wordBoxHeight = screenDimensions.h(15);
    var wordBoxWidth = screenDimensions.w(100);
    var clearBtnHeight = wordBoxHeight / 2;
    var wordBox = SizedBox(
      height: wordBoxHeight,
      child: MyText(
          maxLines: 1,
          width: wordBoxWidth,
          fontSize: FontConfig.bigFontSize,
          text: widget.pressedAnswers.join()),
    );
    var clearBtn = Container(
        height: wordBoxHeight,
        width: wordBoxWidth,
        alignment: Alignment.centerRight,
        child: MyButton(
            visible: widget.pressedAnswers.isNotEmpty,
            size: Size(clearBtnHeight, clearBtnHeight),
            onClick: () {
              setState(() {
                widget.pressedAnswers.clear();
              });
            },
            buttonSkinConfig: ButtonSkinConfig(
                icon: Icon(Icons.clear,
                    color: Colors.red, size: clearBtnHeight))));
    return Stack(alignment: Alignment.center, children: [wordBox, clearBtn]);
  }

  @override
  void clickAnswerBtn(String btnLetter, VoidCallback goToNextScreenAfterPress,
      VoidCallback refreshSetState) {
    if (!widget.answerFound) {
      setState(() {
        widget.pressedAnswers.add(btnLetter);
        String pressedAnswer = widget.pressedAnswers.join();

        var correctPressedCountries = widget.questionService
            .getCorrectPressedCountries(
                pressedAnswer, widget.currentQuestionsCountryNames, true);

        var minLengthToCheck = 3;
        correctPressedCountries = pressedAnswer.length > minLengthToCheck &&
                correctPressedCountries.isEmpty
            ? widget.questionService.getCorrectPressedCountries(
                pressedAnswer, widget.currentQuestionsCountryNames, false)
            : correctPressedCountries;

        if (correctPressedCountries.isNotEmpty) {
          if (correctPressedCountries.length == 1) {
            widget.answerFound = true;
            widget._audioPlayer.playSuccess();
            QuestionInfo foundCountry = widget.currentQuestions.firstWhere(
                (element) =>
                    widget.questionService
                        .getCountryName(element.question.rawString) ==
                    correctPressedCountries.first);
            widget.gameContext.gameUser.setWonQuestion(foundCountry);
            widget._geoQuizLocalStorage.setWonQuestion(foundCountry.question);
            widget.pressedAnswers.clear();
            widget.alreadyFoundCountryNames = widget.questionService
                .getAlreadyFoundCountries(
                    widget.difficulty, widget.category, false);
            Future.delayed(Duration(milliseconds: 500),
                () => widget.goToNextGameScreen(context));
          }
        } else if (pressedAnswer.length > minLengthToCheck &&
            correctPressedCountries.isEmpty) {
          widget._audioPlayer.playFail();
          widget.pressedAnswers.clear();
        }
      });
    }
  }

  void setStateCallback() {
    setState(() {});
  }

  void onHintButtonClick() {}
}
