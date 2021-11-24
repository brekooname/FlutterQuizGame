import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Components/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_level.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';

import '../../../Components/Button/button_skin_config.dart';
import '../../../Components/Font/font_config.dart';

mixin GameScreen {

  late GameContext gameContextVal;

  get gameContext => gameContextVal;

  Color getBackgroundColor() {
    return Colors.red;
  }
}
