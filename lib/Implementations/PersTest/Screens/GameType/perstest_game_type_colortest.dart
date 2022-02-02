import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_attr_description_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/ColorTest/perstest_game_type_colortest_utils.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestGameTypeColorTest extends PersTestGameType {
  List<PersTestColor> firstColorSelection = [];
  List<PersTestColor> secondColorSelection = [];

  PersTestGameTypeColorTest(
      CampaignLevel campaignLevel,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState)
      : super(campaignLevel, currentQuestionInfo, gameContext,
            gameScreenManagerState);

  @override
  Widget createGamePlayContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [],
    );
  }

  @override
  Widget createGameOverContent(BuildContext context) {
    throw UnimplementedError();
  }
}
