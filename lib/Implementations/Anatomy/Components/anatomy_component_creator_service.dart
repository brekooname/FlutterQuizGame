import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class AnatomyComponentCreatorService {
  static final AnatomyComponentCreatorService singleton =
      AnatomyComponentCreatorService.internal();

  factory AnatomyComponentCreatorService() {
    return singleton;
  }

  AnatomyComponentCreatorService.internal();

  MyText createScoreMyText(int totalWonQuestions,
      int totalQuestionsLevel, double btnWidth) {
    return MyText(
        width: btnWidth / 1.05,
        text: totalWonQuestions.toString() +
            "/" +
            totalQuestionsLevel.toString(),
        maxLines: 1,
        fontConfig: FontConfig(
            fontColor: totalWonQuestions == totalQuestionsLevel
                ? Colors.greenAccent
                : Colors.yellow,
            borderWidth: FontConfig.standardBorderWidth * 1.4,
            fontWeight: FontWeight.w900,
            borderColor: Colors.black));
  }
}
