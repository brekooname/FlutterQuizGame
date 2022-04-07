import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
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

class AnatomyLevelsScreen extends StandardScreen {
  QuestionCategory category;
  late Image backgroundImage;

  AnatomyLevelsScreen(GameScreenManagerState gameScreenManagerState,
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
    var btnWidth = screenDimensions.dimen(45);
    var btnHeight = screenDimensions.dimen(45);
    var btnSize = Size(btnWidth, btnHeight);
    var questionConfig = AnatomyGameQuestionConfig();
    var campaignLevelService = AnatomyCampaignLevelService();
    Map<QuestionDifficulty, String> levelIcon = _getLevelIcons(questionConfig);
    Map<QuestionDifficulty, Color> levelColor = _getLevelColors(questionConfig);
    Map<QuestionDifficulty, String> levelString =
        _getLevelLabels(questionConfig);
    for (QuestionDifficulty diff in questionConfig.difficulties) {
      CampaignLevel campaignLevel;
      try {
        campaignLevel =
            campaignLevelService.campaignLevel(diff, widget.category);
      } on StateError {
        //No campaign level found for cat/diff combination
        continue;
      }
      levelBtns.add(MyButton(
        buttonSkinConfig: ButtonSkinConfig(
            backgroundColor: levelColor.get<QuestionDifficulty, Color>(diff)!),
        buttonAllPadding: btnPadding,
        size: btnSize,
        onClick: () {
          MyApp.gameScreenManager.currentScreen!.gameScreenManagerState
              .showNewGameScreen(campaignLevel);
        },
        customContent: _createLevelBtnCustomContent(
            levelIcon, diff, btnWidth, levelString),
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

  Column _createLevelBtnCustomContent(
      Map<QuestionDifficulty, String> levelIcon,
      QuestionDifficulty diff,
      double btnWidth,
      Map<QuestionDifficulty, String> levelString) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imageService.getSpecificImage(
            imageName: levelIcon.get<QuestionDifficulty, String>(diff)!,
            maxWidth: btnWidth / 1.7,
            module: "buttons",
            imageExtension: "png"),
        SizedBox(
          height: screenDimensions.h(1),
        ),
        MyText(
          width: btnWidth / 1.05,
          text: levelString.get<QuestionDifficulty, String>(diff)!,
          maxLines: 2,
        )
      ],
    );
  }

  Map<QuestionDifficulty, String> _getLevelLabels(
      AnatomyGameQuestionConfig questionConfig) {
    Map<QuestionDifficulty, String> levelString = {
      questionConfig.diff0: "Diagram of the human anatomy",
      questionConfig.diff1: "General knowledge",
      questionConfig.diff2: "Anatomy and disease",
      questionConfig.diff3: "Symptoms and signs",
      questionConfig.diff4: "Human anatomy pictures",
    };
    return levelString;
  }

  Map<QuestionDifficulty, Color> _getLevelColors(
      AnatomyGameQuestionConfig questionConfig) {
    Map<QuestionDifficulty, Color> levelColor = {
      questionConfig.diff0: Colors.blue.shade200,
      questionConfig.diff1: Colors.red.shade200,
      questionConfig.diff2: Colors.yellow.shade200,
      questionConfig.diff3: Colors.green.shade200,
      questionConfig.diff4: Colors.purple.shade200,
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
