import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Components/anatomy_component_creator_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/AllContent/anatomy_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class AnatomyLevelsScreen extends StandardScreen<AnatomyScreenManagerState> {
  final AnatomyQuestionCollectorService _anatomyQuestionCollectorService =
      AnatomyQuestionCollectorService();
  final AnatomyComponentCreatorService _anatomyComponentCreatorService =
      AnatomyComponentCreatorService();
  final AnatomyLocalStorage _anatomyLocalStorage = AnatomyLocalStorage();
  QuestionCategory category;
  late Image backgroundImage;

  AnatomyLevelsScreen(AnatomyScreenManagerState gameScreenManagerState,
      {Key? key, required this.category})
      : super(gameScreenManagerState, key: key);

  @override
  State<AnatomyLevelsScreen> createState() => AnatomyLevelsScreenState();
}

class AnatomyLevelsScreenState extends State<AnatomyLevelsScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    widget.backgroundImage = imageService.getSpecificImage(
        imageName: widget.category.index.toString() + "t",
        module: "categories",
        imageExtension: "png");
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> levelBtns = [];
    var btnPadding = screenDimensions.dimen(1);
    var btnSize = Size(_getLevelBtnWidth(), screenDimensions.dimen(49));
    var questionConfig = AnatomyGameQuestionConfig();
    var campaignLevelService = AnatomyCampaignLevelService();
    Map<QuestionDifficulty, Color> levelColor = _getLevelColors(questionConfig);
    for (QuestionDifficulty diff in questionConfig.difficulties) {
      CampaignLevel campaignLevel;
      try {
        campaignLevel =
            campaignLevelService.campaignLevel(diff, widget.category);
      } on StateError {
        //No campaign level found for cat/diff combination
        continue;
      }
      var totalWonQuestions = widget._anatomyLocalStorage
          .getWonQuestionsForDiffAndCat(diff, widget.category)
          .length;
      var totalQuestionsLevel = widget._anatomyQuestionCollectorService
              .totalNrOfQuestionsForCategoryDifficulty
              .get<CategoryDifficulty, int>(
                  CategoryDifficulty(widget.category, diff)) ??
          0;
      var allQuestionsAnswered = totalWonQuestions == totalQuestionsLevel;
      var btnColor = allQuestionsAnswered
          ? Colors.green.shade200
          : levelColor.get<QuestionDifficulty, Color>(diff)!;
      levelBtns.add(MyButton(
        buttonSkinConfig: ButtonSkinConfig(
            borderColor: allQuestionsAnswered ? Colors.green : Colors.white,
            backgroundColor: btnColor),
        buttonAllPadding: btnPadding,
        size: btnSize,
        onClick: () {
          MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
              .showNewGameScreen(campaignLevel);
        },
        customContent: _createLevelBtnCustomContent(
            diff, questionConfig, totalWonQuestions, totalQuestionsLevel),
      ));
    }
    List<Widget> levelRows = [];
    levelRows.add(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyBackButton(
          buttonAllPadding: screenDimensions.dimen(1),
        )
      ],
    ));
    List<Widget> btnsOnRow = [];
    for (Widget btn in levelBtns) {
      btnsOnRow.add(btn);
      if (btnsOnRow.length % 2 == 0) {
        levelRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: btnsOnRow,
        ));
        btnsOnRow = [];
      }
    }
    if (btnsOnRow.isNotEmpty) {
      levelRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: btnsOnRow,
      ));
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.noRepeat,
          image: widget.backgroundImage.image,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: levelRows,
        ));
  }

  double _getLevelBtnWidth() => screenDimensions.dimen(45);

  Column _createLevelBtnCustomContent(
      QuestionDifficulty diff,
      AnatomyGameQuestionConfig questionConfig,
      int totalWonQuestions,
      int totalQuestionsLevel) {
    var margin = SizedBox(
      height: screenDimensions.dimen(1.5),
    );
    var btnWidth = _getLevelBtnWidth();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        margin,
        MyText(
            width: btnWidth / 1.05,
            fontSize: FontConfig.getCustomFontSize(1),
            text: _getLevelLabels(questionConfig)
                .get<QuestionDifficulty, String>(diff)!,
            maxLines: 2),
        margin,
        imageService.getSpecificImage(
            imageName: _getLevelIcons(questionConfig)
                .get<QuestionDifficulty, String>(diff)!,
            maxWidth: btnWidth / 2.2,
            module: "buttons",
            imageExtension: "png"),
        margin,
        widget._anatomyComponentCreatorService.createScoreMyText(
            totalWonQuestions, totalQuestionsLevel, btnWidth),
        margin,
      ],
    );
  }

  Map<QuestionDifficulty, String> _getLevelLabels(
      AnatomyGameQuestionConfig questionConfig) {
    Map<QuestionDifficulty, String> levelString = {
      questionConfig.diff0: "Diagram",
      questionConfig.diff1: "General knowledge",
      questionConfig.diff2: "Diseases",
      questionConfig.diff3: "Symptoms",
      questionConfig.diff4: "Illustrations and Pictures",
    };
    return levelString;
  }

  Map<QuestionDifficulty, Color> _getLevelColors(
      AnatomyGameQuestionConfig questionConfig) {
    Map<QuestionDifficulty, Color> levelColor = {
      questionConfig.diff0: Colors.blue.shade100,
      questionConfig.diff1: Colors.red.shade100,
      questionConfig.diff2: Colors.yellow.shade100,
      questionConfig.diff3: Colors.orange.shade100,
      questionConfig.diff4: Colors.purple.shade100,
    };
    return levelColor;
  }

  Map<QuestionDifficulty, String> _getLevelIcons(
      AnatomyGameQuestionConfig questionConfig) {
    Map<QuestionDifficulty, String> levelIcon = {
      questionConfig.diff0: "btn_image_click",
      questionConfig.diff1: "btn_trivia",
      questionConfig.diff2: "btn_disease_trivia",
      questionConfig.diff3: "btn_disease_symp",
      questionConfig.diff4: "btn_image_trivia",
    };
    return levelIcon;
  }
}
