import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Animation/animation_background.dart';
import '../Components/astronomy_level_header.dart';

class AstronomyQuestionScreen
    extends GameScreen<AstronomyGameContext, AstronomyScreenManagerState>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  final AstronomyGameQuestionConfig _astronomyGameQuestionConfig =
      AstronomyGameQuestionConfig();

  AstronomyQuestionScreen(
    AstronomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AstronomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AstronomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initQuizOptionsScreen(
        QuizQuestionManager<AstronomyGameContext, AstronomyLocalStorage>(
            gameContext, currentQuestionInfo, AstronomyLocalStorage()),
        currentQuestionInfo);
  }

  @override
  State<AstronomyQuestionScreen> createState() =>
      AstronomyQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AstronomyQuestionScreenState extends State<AstronomyQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    var planetDimen = screenDimensions.dimen(25);
    var question = widget.currentQuestionInfo.question;
    var planetId = question.index;
    var quizAnswerOptions =
        question.questionService.getQuizAnswerOptions(question);
    var planetImg = imageService.getSpecificImage(
        maxWidth: planetDimen,
        maxHeight: planetDimen,
        module: "planets",
        imageName: planetId.toString(),
        imageExtension: "png");
    var questionText = MyText(
      width: screenDimensions.dimen(70),
      maxLines: 2,
      fontConfig: FontConfig(
          fontWeight: FontWeight.w700,
          borderColor: Colors.black,
          fontSize: FontConfig.getCustomFontSize(1.0),
          fontColor: Colors.white),
      text: widget._astronomyGameQuestionConfig
          .getPrefixToBeDisplayedForQuestion(
              widget.category, widget.difficulty, 0),
    );
    var firstRowOpts = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createOptionBtn(
          quizAnswerOptions.elementAt(0),
        ),
        createOptionBtn(
          quizAnswerOptions.elementAt(1),
        )
      ],
    );
    var secondRowOpts = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createOptionBtn(
          quizAnswerOptions.elementAt(2),
        ),
        createOptionBtn(
          quizAnswerOptions.elementAt(3),
        )
      ],
    );
    var planetName = MyText(
        fontConfig: FontConfig(
            fontWeight: FontWeight.w700,
            borderColor: Colors.black,
            fontSize: FontConfig.getCustomFontSize(1.3),
            fontColor: Colors.white),
        text: widget._astronomyGameQuestionConfig.planets
            .where((element) => element.id == planetId)
            .first
            .name);
    var margin = SizedBox(
      height: screenDimensions.dimen(2),
    );
    var container = Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _createAstronomyLevelHeader(),
            margin,
            margin,
            questionText,
            margin,
            firstRowOpts,
            planetName,
            margin,
            planetImg,
            secondRowOpts,
          ]),
    );
    return AnimateBackground(
        mainContent: container,
        particleImage: imageService.getSpecificImage(
            imageName: "stars", imageExtension: "png"));
  }

  Widget _createAstronomyLevelHeader() {
    return AstronomyLevelHeader(
      gameContext: widget.gameContext,
      availableHints: widget.gameContext.amountAvailableHints,
      animateScore: widget.quizQuestionManager.isGameFinished(),
      disableHintBtn:
      widget.quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
      hintButtonOnClick: () {},
    );
  }

  Widget createOptionBtn(String optText) {
    Widget? btnContent;
    MyText optMyText = MyText(
      text: optText,
      fontConfig: FontConfig(
          fontWeight: FontWeight.w700,
          borderColor: Colors.black,
          fontSize: FontConfig.getCustomFontSize(1.1),
          fontColor: Colors.white),
    );
    if (widget.category == widget._astronomyGameQuestionConfig.cat1) {
      btnContent = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          optMyText,
          SizedBox(
            width: screenDimensions.dimen(2.5),
          ),
          imageService.getSpecificImage(
              maxWidth: screenDimensions.dimen(10),
              imageName: "earth_stroke",
              imageExtension: "png",
              module: "planets")
        ],
      );
    }
    var btnDimen = screenDimensions.dimen(33);
    return Padding(
        padding: EdgeInsets.all(screenDimensions.dimen(7)),
        child: MyButton(
          buttonSkinConfig: ButtonSkinConfig(
              backgroundColor: Colors.blue.withOpacity(0.5),
              borderRadius: FontConfig.standardBorderRadius * 4),
          size: Size(btnDimen, btnDimen),
          disabled: !widget.currentQuestionInfo.isQuestionOpen(),
          customContent: btnContent ?? optMyText,
          onClick: () {
            widget.quizQuestionManager.onClickAnswerOptionBtn(
                widget.currentQuestionInfo.question,
                optText,
                setStateCallback,
                widget.goToNextGameScreenCallBack(context));
          },
        ));
  }

  void setStateCallback() {
    setState(() {});
  }
}
