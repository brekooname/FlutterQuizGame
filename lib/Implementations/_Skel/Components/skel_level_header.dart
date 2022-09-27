import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../Lib/Image/image_service.dart';
import '../../../main.dart';
import '../Questions/skel_game_context.dart';

class SkelLevelHeader extends StatelessWidget {
  final ImageService _imageService = ImageService();
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();

  final SkelGameContext gameContext;
  final bool animateScore;
  final int availableHints;

  final VoidCallback hintButtonOnClick;
  final bool disableHintBtn;

  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  SkelLevelHeader({
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

    var headerHeight = _screenDimensions.dimen(14);
    var headerButtonsContainer = SizedBox(
        height: headerHeight,
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                myBackButton,
                SizedBox(width: _screenDimensions.dimen(2)),
                const Spacer(),
                hintBtn,
              ],
            )));

    var progressBarWidth = _screenDimensions.dimen(65);
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

    return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius)),
        child: stack);
  }

  Widget _createScoreContainer() {
    return Container();
  }

  QuestionInfo? getMostRecentAnswered() {
    return gameContext.gameUser.getMostRecentAnsweredQuestion(
      questionInfoStatus: [QuestionInfoStatus.lost, QuestionInfoStatus.won],
    );
  }
}
