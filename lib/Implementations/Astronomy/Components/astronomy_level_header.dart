import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_increase_number_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Animation/animation_popin_widget.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../Lib/Image/image_service.dart';
import '../../../main.dart';

class AstronomyLevelHeader extends StatelessWidget {
  final ImageService _imageService = ImageService();
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();

  AstronomyGameContext gameContext;
  bool animateScore;
  bool animateWrongAnswer;
  bool allQuestionsAnswered;
  int score;
  int availableHints;
  int nrOfCorrectAnsweredQuestions;

  VoidCallback hintButtonOnClick;
  bool disableHintBtn;

  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  AstronomyLevelHeader({
    Key? key,
    this.animateScore = false,
    this.animateWrongAnswer = false,
    this.allQuestionsAnswered = false,
    this.disableHintBtn = false,
    required this.gameContext,
    required this.score,
    required this.nrOfCorrectAnsweredQuestions,
    required this.hintButtonOnClick,
    required this.availableHints,
  }) : super(key: key);

  Widget createLevelHeader(BuildContext context) {
    var myBackButton = MyBackButton();
    var hintBtn = HintButton(
        onClick: hintButtonOnClick,
        availableHints: availableHints,
        buttonSize: myBackButton.buttonSize,
        disabled: disableHintBtn,
        watchRewardedAdForHint: MyApp.isExtraContentLocked,
        showAvailableHintsText: true);

    var headerHeight = screenDimensions.dimen(14);
    var headerButtonsContainer = SizedBox(
        height: headerHeight,
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                myBackButton,
                SizedBox(width: screenDimensions.dimen(2)),
                const Spacer(),
                hintBtn,
              ],
            )));

    var progressBarWidth = screenDimensions.dimen(65);
    Widget scoreContainer = SizedBox(
      width: progressBarWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          createScoreContainer(),
          const Spacer(),
        ],
      ),
    );

    Stack stack = Stack(
      alignment: Alignment.center,
      children: [headerButtonsContainer, scoreContainer],
    );

    return stack;
  }

  Widget createScoreContainer() {
    List<Widget> qs = [];
    var dimen = _screenDimensionsService.dimen(5);
    var imgDimen = dimen / 1.2;
    for (QuestionInfo qi in gameContext.gameUser.getAllQuestions([])) {
      qs.add(Padding(
          padding: EdgeInsets.all(screenDimensions.dimen(0.5)),
          child: Container(
            child: AnimatePopInWidget(
              mainContent: _imageService.getSpecificImage(
                  maxWidth: imgDimen,
                  maxHeight: imgDimen,
                  imageName: "star_score",
                  imageExtension: "png"),
            ),
            width: dimen,
            height: dimen,
            // decoration: BoxDecoration(
            //   borderRadius:
            //       BorderRadius.circular(FontConfig.standardBorderRadius * 4),
            //   border: Border.all(
            //       color: Colors.lightGreenAccent.shade400,
            //       width: FontConfig.standardBorderWidth/2),
            // ),
          )));
    }
    Row questionRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: qs,
    );
    return questionRow;
  }
}
