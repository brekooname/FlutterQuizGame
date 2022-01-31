import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestGameOverScreen extends StandardScreen {
  final int _maxScoreVal = 40;
  PersTestGameContext gameContext;
  QuestionDifficulty difficulty;
  QuestionCategory category;

  PersTestGameOverScreen(
    GameScreenManagerState gameScreenManagerState, {
    Key? key,
    required this.difficulty,
    required this.category,
    required this.gameContext,
  }) : super(gameScreenManagerState, key: key);

  @override
  State<PersTestGameOverScreen> createState() => PersTestGameOverScreenState();
}

class PersTestGameOverScreenState extends State<PersTestGameOverScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [MyBackButton(), const Spacer()]),
        const Spacer(),
        createAttributes(),
        SizedBox(
          height: screenDimensions.dimen(1),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageService.getMainImage(
                  maxWidth: screenDimensions.dimen(8),
                  imageName: "info",
                  module: "general",
                  imageExtension: "png"),
              SizedBox(
                width: screenDimensions.dimen(1),
              ),
              MyText(
                text: "Click on any of the traits to see it's description",
              )
            ]),
        const Spacer(),
      ],
    );
  }

  int r(int qNr) {
    return widget.gameContext.gameUser
            .getAllQuestions([])
            .where((element) => element.question.index == qNr)
            .first
            .pressedAnswers
            .first
            .parseToInt +
        1;
  }

  Widget createAttributes() {
    var persAttrList = [
      PersAttribute(Colors.lightGreenAccent, "Extroversion", calculateE()),
      PersAttribute(Colors.red, "Emotional stabielt", calculateA()),
      PersAttribute(Colors.tealAccent, "Agreeablesnn", calculateC()),
      PersAttribute(Colors.purpleAccent, "Consitoniouss", calculateN()),
      PersAttribute(Colors.blue, "Intellect/Imagination", calculateO()),
    ];
    List<Widget> attrs = [];
    var attrBarWidth = screenDimensions.dimen(60);
    var btnSize = Size(screenDimensions.dimen(90), screenDimensions.dimen(10));
    var padding = screenDimensions.dimen(1);
    for (PersAttribute r in persAttrList) {
      double percent = r.val / widget._maxScoreVal * 100;
      attrs.add(Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyButton(
                onClick: () {},
                text: r.label,
                size: btnSize,
                buttonSkinConfig: ButtonSkinConfig(
                    backgroundColor: Colors.lightBlueAccent.shade200,
                    borderRadius: FontConfig.standardBorderRadius / 2),
              ),
              Stack(alignment: Alignment.center, children: [
                ProgressBar(
                    fillBarColor: r.color,
                    startNr: 0,
                    endNr: percent.toInt(),
                    totalNr: 100,
                    width: attrBarWidth,
                    height: btnSize.height),
                MyText(
                  text: percent.toInt().toString() + "%",
                  fontConfig: FontConfig(
                    textColor: Colors.white,
                    borderColor: Colors.black,
                  ),
                ),
              ])
            ]),
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: attrs,
    );
  }

  int calculateE() {
    return 20 +
        r(0) -
        r(5) +
        r(10) -
        r(15) +
        r(20) -
        r(25) +
        r(30) -
        r(35) +
        r(40) -
        r(45);
  }

  int calculateA() {
    return 14 -
        r(1) +
        r(6) -
        r(11) +
        r(16) -
        r(21) +
        r(26) -
        r(31) +
        r(36) +
        r(41) +
        r(46);
  }

  int calculateC() {
    return 14 +
        r(2) -
        r(7) +
        r(12) -
        r(17) +
        r(22) -
        r(27) +
        r(32) -
        r(37) +
        r(42) +
        r(47);
  }

  int calculateN() {
    return 38 -
        r(3) +
        r(8) -
        r(13) +
        r(18) -
        r(23) -
        r(28) -
        r(33) -
        r(38) -
        r(43) -
        r(48);
  }

  int calculateO() {
    return 8 +
        r(4) -
        r(9) +
        r(14) -
        r(19) +
        r(24) -
        r(29) +
        r(34) +
        r(39) +
        r(44) +
        r(49);
  }
}

class PersAttribute {
  Color color;
  String label;
  int val;

  PersAttribute(this.color, this.label, this.val);
}
