import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../../Lib/Image/image_service.dart';
import '../../../main.dart';

class AstronomyLevelHeader extends StatelessWidget {
  final ImageService _imageService = ImageService();
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();

  AstronomyGameContext gameContext;
  bool animateScore;
  int availableHints;

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
    this.disableHintBtn = false,
    required this.gameContext,
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
                // hintBtn,
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
          _createScoreContainer(),
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

  Widget _createScoreContainer() {
    List<Widget> scoreColumnRows = [];
    var dimen = _screenDimensionsService.dimen(8);
    var imgDimen = dimen / 1.2;
    var allQuestions = gameContext.gameUser.getAllQuestions([]);
    allQuestions.sort((a, b) {
      var maxYear = DateTime(3000);
      return (a.questionAnsweredAt ?? maxYear)
          .compareTo(b.questionAnsweredAt ?? maxYear);
    });
    List<Widget> qs = [];
    int i = 0;
    for (QuestionInfo qi in allQuestions) {
      var specificImage = _imageService.getSpecificImage(
          maxWidth: imgDimen,
          maxHeight: imgDimen,
          imageName: qi.isQuestionOpen()
              ? "black_hole_score"
              : qi.status == QuestionInfoStatus.won
                  ? "star_score"
                  : "supernova_score",
          imageExtension: "png");
      var image =
          Opacity(opacity: qi.isQuestionOpen() ? 0.5 : 1, child: specificImage);
      qs.add(Padding(
          padding: EdgeInsets.all(screenDimensions.dimen(0.2)),
          child: SizedBox(
            child: animateScore &&
                    qi.question.index == getMostRecentAnswered()?.question.index
                ? AnimateZoomInZoomOut(
                    toAnimateWidget: image,
                    toAnimateWidgetSize: Size(imgDimen, imgDimen),
                  )
                : image,
            width: dimen,
            height: dimen,
          )));
      if (i > 0 && i % 5 == 0) {
        scoreColumnRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: qs.toList(),
        ));
        qs = [];
      }
      i++;
    }
    scoreColumnRows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: qs.toList(),
    ));
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: scoreColumnRows);
  }

  QuestionInfo? getMostRecentAnswered() {
    return gameContext.gameUser.getMostRecentAnsweredQuestion(
      questionInfoStatus: [QuestionInfoStatus.lost, QuestionInfoStatus.won],
    );
  }
}
