import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
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
    var btnPadding = screenDimensions.w(3);
    var btnSide = screenDimensions.w(40);
    var btnSize = Size(btnSide, btnSide);
    var questionConfig = AnatomyGameQuestionConfig();

    Map<QuestionDifficulty, String> levelIcon = {
      questionConfig.diff0: "btn_image_click",
      questionConfig.diff1: "btn_trivia",
      questionConfig.diff2: "btn_disease_trivia",
      questionConfig.diff3: "btn_disease_symp",
      questionConfig.diff4: "btn_image_trivia",
    };
    Map<QuestionDifficulty, Color> levelColor = {
      questionConfig.diff0: Colors.blue.shade200,
      questionConfig.diff1: Colors.red.shade200,
      questionConfig.diff2: Colors.yellow.shade200,
      questionConfig.diff3: Colors.green.shade200,
      questionConfig.diff4: Colors.purple.shade200,
    };
    for (QuestionDifficulty diff in questionConfig.difficulties) {
      levelBtns.add(MyButton(
        buttonSkinConfig: ButtonSkinConfig(
            backgroundColor: levelColor.get<QuestionDifficulty, Color>(diff)!),
        buttonAllPadding: btnPadding,
        size: btnSize,
        customContent: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageService.getSpecificImage(
                imageName: levelIcon.get<QuestionDifficulty, String>(diff)!,
                maxWidth: btnSide / 1.5,
                module: "buttons",
                imageExtension: "png"),
            SizedBox(
              height: screenDimensions.h(1),
            ),
            MyText(text: diff.name)
          ],
        ),
      ));
    }
    List<Row> levelRows = [];
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
}
