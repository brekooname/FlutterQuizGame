import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/iq_game_game_type_creator.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import '../../../Lib/Screen/standard_screen.dart';
import '../Components/iq_game_level_header.dart';

class IqGameGameOverScreen extends StandardScreen<IqGameScreenManagerState> {
  IqGameGameTypeCreator iqGameGameTypeCreator;
  IqGameContext gameContext;

  IqGameGameOverScreen(
    this.iqGameGameTypeCreator,
    this.gameContext,
    IqGameScreenManagerState gameScreenManagerState, {
    Key? key,
  }) : super(gameScreenManagerState, key: key);

  @override
  State<IqGameGameOverScreen> createState() => IqGameGameOverScreenState();
}

class IqGameGameOverScreenState extends State<IqGameGameOverScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IqGameLevelHeader(null),
              const Spacer(),
              widget.iqGameGameTypeCreator
                  .createGameOverContainer(context, widget.gameContext),
              const Spacer(),
            ]));
  }

  void setStateCallback() {
    setState(() {});
  }
}
