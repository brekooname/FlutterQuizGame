import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

mixin QuizQuestionGameScreen {
  ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  Widget createQuestionTextContainer(
      Question? question,
      int questionPrefixMaxLines,
      int questionTextMaxLines,
      double? questionContainerHeight) {
    var vertMargin = _screenDimensions.h(1);
    var horizMargin = _screenDimensions.w(1);
    var questionPrefixToBeDisplayed = question?.questionPrefixToBeDisplayed;
    var questionToBeDisplayed = question?.questionToBeDisplayed;
    Widget questionPrefix;
    var questionColor = Colors.grey.shade900;
    var questionToBeDisplayedIsEmpty = (questionToBeDisplayed ?? "").isEmpty;
    if ((questionPrefixToBeDisplayed ?? "").isEmpty) {
      questionPrefix = Container();
    } else {
      questionPrefix = Padding(
          padding: EdgeInsets.fromLTRB(horizMargin, 0, horizMargin,
              questionToBeDisplayedIsEmpty ? 0 : vertMargin),
          child: MyText(
            textColor: questionToBeDisplayedIsEmpty
                ? questionColor
                : Colors.grey.shade700,
            width: _screenDimensions.w(95),
            maxLines: questionPrefixMaxLines,
            text: questionPrefixToBeDisplayed ?? "",
            fontSize: FontConfig.getCustomFontSize(1),
          ));
    }
    Widget questionText;
    if (questionToBeDisplayedIsEmpty) {
      questionText = Container();
    } else {
      var text = MyText(
        textColor: questionColor,
        width: _screenDimensions.w(95),
        maxLines: questionTextMaxLines,
        text: questionToBeDisplayed ?? "",
        fontSize: FontConfig.getCustomFontSize(1.1),
      );
      questionText = Padding(
          padding: EdgeInsets.fromLTRB(horizMargin, 0, horizMargin, 0),
          child: text);
    }
    var questionColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: vertMargin),
        questionPrefix,
        questionText,
        SizedBox(height: vertMargin)
      ],
    );

    return Container(
        child: Column(children: [
      SizedBox(height: _screenDimensions.h(1)),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          height: questionContainerHeight,
          decoration: BoxDecoration(
              color: Colors.green.shade100.withAlpha(150),
              border: Border.all(
                  color: Colors.green.shade200, width: _screenDimensions.w(1)),
              borderRadius:
                  BorderRadius.circular(FontConfig.standardBorderRadius)),
          child: questionColumn,
        ),
        SizedBox(height: _screenDimensions.h(1)),
      ])
    ]));
  }
}
