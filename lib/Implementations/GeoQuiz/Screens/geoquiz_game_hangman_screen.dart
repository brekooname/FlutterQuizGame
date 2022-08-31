import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/Hangman/geoquiz_hangman_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/Hangman/geoquiz_hangman_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Hangman/hangman_letters.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class GeoQuizHangmanScreen extends GameScreen<
    GeoQuizGameContext,
    GeoQuizGameScreenManagerState,
    GeoQuizCampaignLevelService> {
  static const int showInterstitialAdEveryNQuestions = 8;
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  final MyAudioPlayer _audioPlayer = MyAudioPlayer();
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  late GeoQuizHangmanQuestionService questionService;
  List<String> pressedAnswers = [];
  List<String> currentQuestionsCountryNames = [];
  List<String> alreadyFoundCountryNames = [];
  bool answerFound = false;

  GeoQuizHangmanScreen(
    GeoQuizGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required GeoQuizGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            GeoQuizCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            getCurrentQuestionInfos(difficulty, category, gameContext),
            key: key) {
    questionService =
        GeoQuizHangmanCategoryQuestionService().getQuestionService();
    if (_geoQuizCountryUtils.isStatsCategory(category)) {
      currentQuestionsCountryNames = listOfCurrentQuestionInfo
          .map((e) => questionService.getCountryName(e.question.rawString))
          .toList();
      alreadyFoundCountryNames =
          questionService.getAlreadyFoundCountries(difficulty, category, false);
    } else {
      currentQuestionsCountryNames = questionService
          .getCountryNamesForOptions(currentQuestionInfo.question.rawString);
    }
  }

  static List<QuestionInfo> getCurrentQuestionInfos(
      QuestionDifficulty difficulty,
      QuestionCategory category,
      GameContext gameContext) {
    return GeoQuizCountryUtils().isStatsCategory(category)
        ? gameContext.gameUser
            .getOpenQuestionsForConfig(difficulty, category)
            .toList()
        : [gameContext.gameUser.getRandomQuestion(difficulty, category)];
  }

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return showInterstitialAdEveryNQuestions;
  }

  @override
  State<GeoQuizHangmanScreen> createState() => GeoQuizHangmanScreenState();
}

class GeoQuizHangmanScreenState extends State<GeoQuizHangmanScreen>
    with ScreenState, HangmanLetters, LabelMixin {
  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      onHintButtonClick();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget foundCountriesContainer = createFoundCountriesContainer();
    Widget wordContainer = createWordContainer();
    Widget letters = createLettersRows({},
        setStateCallback,
        widget.goToNextGameScreenCallBack(context),
        label.l_a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z);
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
    var wordBoxHeight = screenDimensions.dimen(15);
    var wordBoxWidth = screenDimensions.dimen(100);
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
            var countryFound = correctPressedCountries.first;
            if (widget._geoQuizCountryUtils.isStatsCategory(widget.category)) {
              processFoundStatsQuestion(countryFound);
            } else {
              processFoundOptionQuestion(countryFound);
            }
            widget.answerFound = true;
            widget._audioPlayer.playSuccess();
            widget.pressedAnswers.clear();
          }
        } else if (pressedAnswer.length > minLengthToCheck &&
            correctPressedCountries.isEmpty) {
          widget._audioPlayer.playFail();
          widget.pressedAnswers.clear();
        }
      });
    }
  }

  void processFoundOptionQuestion(String countryFound) {
    widget.alreadyFoundCountryNames.add(countryFound);
    widget.currentQuestionsCountryNames.remove(countryFound);
    if (widget.currentQuestionsCountryNames.isEmpty) {
      setWonQuestion(widget.listOfCurrentQuestionInfo.first);
    }
  }

  void processFoundStatsQuestion(String countryFound) {
    QuestionInfo foundQuestionInfo = widget.listOfCurrentQuestionInfo
        .firstWhere((element) =>
            widget.questionService.getCountryName(element.question.rawString) ==
            countryFound);
    widget.alreadyFoundCountryNames = widget.questionService
        .getAlreadyFoundCountries(widget.difficulty, widget.category, false);
    setWonQuestion(foundQuestionInfo);
  }

  void setWonQuestion(QuestionInfo questionInfo) {
    widget.gameContext.gameUser.setWonQuestion(questionInfo);
    widget._geoQuizLocalStorage.setWonQuestion(questionInfo.question);
    Future.delayed(const Duration(milliseconds: 500),
        () => widget.goToNextGameScreen(context));
  }

  void setStateCallback() {
    setState(() {});
  }

  void onHintButtonClick() {}
}
