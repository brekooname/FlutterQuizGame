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
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/ImageClick/image_click_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import 'anatomy_question_screen.dart';

class AnatomyImageClickScreen extends GameScreen<
    AnatomyGameContext,
    AnatomyScreenManagerState,
    AnatomyCampaignLevelService> with ImageClickScreen<QuizQuestionManager> {
  final AnatomyQuestionCollectorService _anatomyQuestionCollectorService =
      AnatomyQuestionCollectorService();
  AnatomyGameQuestionConfig gameQuestionConfig = AnatomyGameQuestionConfig();

  AnatomyImageClickScreen(
    AnatomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AnatomyGameContext gameContext,
  }) : super(gameScreenManagerState, gameContext,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initImageClickScreen(
        QuizQuestionManager<AnatomyGameContext, AnatomyLocalStorage>(
            gameContext, currentQuestionInfo, AnatomyLocalStorage()),
        currentQuestionInfo,
        gameQuestionConfig.categoryDiagramImgDimen.get<QuestionCategory, Size>(
            currentQuestionInfo.question.category)!,
        imageContainerHeightPercent:
            category == AnatomyGameQuestionConfig().cat11 ? 70 : null);
  }

  @override
  AnatomyCampaignLevelService get campaignLevelService =>
      AnatomyCampaignLevelService();

  @override
  State<AnatomyImageClickScreen> createState() =>
      AnatomyImageClickScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AnatomyImageClickScreenState extends State<AnatomyImageClickScreen>
    with ScreenState, LabelMixin, QuizQuestionContainer {
  @override
  void initState() {
    super.initState();
    widget.initImageToClick();
    initScreenState(onUserEarnedReward: () {
      _onHintButtonClick();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(widget.imageToClick.image, context);
  }

  @override
  Widget build(BuildContext context) {
    var mainColumn = Column(children: <Widget>[
      AnatomyLevelHeader(
        totalWonQuestions: widget.quizQuestionManager.quizGameLocalStorage
            .getWonQuestionsForDiffAndCat(widget.difficulty, widget.category)
            .length,
        totalQuestionsLevel: widget._anatomyQuestionCollectorService
                .totalNrOfQuestionsForCategoryDifficulty
                .get<CategoryDifficulty, int>(
                    CategoryDifficulty(widget.category, widget.difficulty)) ??
            0,
        disableHintBtn:
            widget.quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
        hintButtonOnClick: () {
          _onHintButtonClick();
        },
        availableHints: widget.gameContext.amountAvailableHints,
      ),
      createQuestionTextContainer(
        widget.currentQuestionInfo.question,
        2,
        1,
        questionContainerDecoration:
            AnatomyQuestionScreenState.createQuestionContainerDecoration(),
      ),
      widget.createImageClickContainer(() {
        setState(() {});
      }, widget.processNextGameScreenCallBack())
    ]);

    return mainColumn;
  }

  void _onHintButtonClick() {
    widget.quizQuestionManager.onHintButtonClickForCatDiff(setStateCallback);
  }

  void setStateCallback() {
    setState(() {});
  }
}
