import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Components/anatomy_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/AllContent/anatomy_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class AnatomyQuestionScreen extends GameScreen<AnatomyGameContext,
        AnatomyScreenManagerState, AnatomyCampaignLevelService>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  final AnatomyQuestionCollectorService _anatomyQuestionCollectorService =
      AnatomyQuestionCollectorService();
  late Image backgroundImage;

  AnatomyQuestionScreen(
    AnatomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AnatomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AnatomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    var questionConfig = AnatomyGameQuestionConfig();
    var questionImg = difficulty == questionConfig.diff4
        ? imageService.getSpecificImage(
            module: "questions/" + difficulty.name + "/" + category.name,
            imageExtension: "png",
            imageName: currentQuestionInfo.question.index.toString())
        : null;
    initQuizOptionsScreen(
        QuizQuestionManager<AnatomyGameContext, AnatomyLocalStorage>(
          gameContext,
          currentQuestionInfo,
          AnatomyLocalStorage(),
        ),
        currentQuestionInfo,
        questionImage: questionImg,
        zoomableImage: true,
        optionsButtonSkinConfig:
            ButtonSkinConfig(backgroundColor: Colors.lightBlueAccent.shade100));
  }

  @override
  State<AnatomyQuestionScreen> createState() => AnatomyQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AnatomyQuestionScreenState extends State<AnatomyQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  void initState() {
    super.initState();
    widget.backgroundImage = imageService.getSpecificImage(
        imageName: widget.category.index.toString() + "t",
        module: "categories",
        imageExtension: "png");
    initScreenState(onUserEarnedReward: () {
      _onHintButtonClick();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget questionContainer = createQuestionTextContainer(
        widget.currentQuestionInfo.question, 2, 6,
        questionContainerDecoration: createQuestionContainerDecoration(),
        questionFontSize: FontConfig.getCustomFontSize(1.25),
        marginBetweenPrefixAndQuestion: screenDimensions.dimen(2));
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.processNextGameScreenCallBack(context),
        widgetBetweenImageAndOptionRows: SizedBox(
          height: screenDimensions.dimen(10),
        ));
    var decorationImage = widget.difficulty == AnatomyGameQuestionConfig().diff4
        ? null
        : DecorationImage(
            repeat: ImageRepeat.noRepeat,
            image: widget.backgroundImage.image,
          );
    return Container(
        decoration: BoxDecoration(image: decorationImage),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnatomyLevelHeader(
              totalWonQuestions: widget.quizQuestionManager.quizGameLocalStorage
                  .getWonQuestionsForDiffAndCat(
                      widget.difficulty, widget.category)
                  .length,
              totalQuestionsLevel: widget._anatomyQuestionCollectorService
                      .totalNrOfQuestionsForCategoryDifficulty
                      .get<CategoryDifficulty, int>(CategoryDifficulty(
                          widget.category, widget.difficulty)) ??
                  0,
              disableHintBtn: widget
                  .quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
              hintButtonOnClick: () {
                _onHintButtonClick();
              },
              availableHints: widget.gameContext.amountAvailableHints,
            ),
            const Spacer(),
            questionContainer,
            const Spacer(),
            optionsRows,
            SizedBox(
                height:
                    screenDimensions.dimen(widget.questionHasImage() ? 2 : 5))
          ],
        ));
  }

  void _onHintButtonClick() {
    widget.quizQuestionManager.onHintButtonClickForCatDiff(setStateCallback);
  }

  void setStateCallback() {
    setState(() {});
  }

  static BoxDecoration createQuestionContainerDecoration() {
    return BoxDecoration(
        color: Colors.green.shade100.withOpacity(0.8),
        borderRadius: BorderRadius.circular(FontConfig.standardBorderRadius),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: FontConfig.standardShadowRadius,
              blurRadius: FontConfig.standardShadowRadius)
        ]);
  }
}
