import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class QuizQuestionContainer {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  static final QuizQuestionContainer singleton =
      QuizQuestionContainer.internal();

  factory QuizQuestionContainer() {
    return singleton;
  }

  QuizQuestionContainer.internal();

  Widget createQuestionTextContainer(
    Question? question,
    int questionPrefixMaxLines,
    int questionTextMaxLines, {
    double? questionContainerHeight,
    double? marginBetweenPrefixAndQuestion,
    BoxDecoration? questionContainerDecoration,
    double? questionFontSize,
    Color? questionColor,
    Color? prefixColor,
  }) {
    var vertMargin = _screenDimensions.dimen(1);
    var horizMargin = _screenDimensions.dimen(1);
    var questionPrefixToBeDisplayed = question?.questionPrefixToBeDisplayed;
    var questionToBeDisplayed = question?.questionToBeDisplayed;
    Widget questionPrefix;
    var questionToBeDisplayedIsEmpty = (questionToBeDisplayed ?? "").isEmpty;
    Color processedQuestionColor = questionColor ?? Colors.grey.shade900;
    if ((questionPrefixToBeDisplayed ?? "").isEmpty) {
      questionPrefix = Container();
    } else {
      questionPrefix = Padding(
          padding: EdgeInsets.fromLTRB(horizMargin, 0, horizMargin,
              questionToBeDisplayedIsEmpty ? 0 : vertMargin),
          child: MyText(
            fontColor: questionToBeDisplayedIsEmpty
                ? processedQuestionColor
                : prefixColor ?? Colors.grey.shade700,
            width: _screenDimensions.dimen(95),
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
        fontColor: processedQuestionColor,
        width: _screenDimensions.dimen(95),
        maxLines: questionTextMaxLines,
        text: questionToBeDisplayed ?? "",
        fontSize: questionFontSize ?? FontConfig.getCustomFontSize(1.1),
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
        SizedBox(
          height: marginBetweenPrefixAndQuestion ?? 0,
        ),
        questionText,
        SizedBox(height: vertMargin)
      ],
    );

    var bottomTopQuestionContainerMargin =
        SizedBox(height: _screenDimensions.dimen(3));
    return Column(children: [
      bottomTopQuestionContainerMargin,
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          height: questionContainerHeight,
          decoration: questionContainerDecoration ??
              BoxDecoration(
                  color: Colors.green.shade100.withAlpha(150),
                  border: Border.all(
                      color: Colors.green.shade200,
                      width: _screenDimensions.dimen(1)),
                  borderRadius:
                      BorderRadius.circular(FontConfig.standardBorderRadius)),
          child: questionColumn,
        ),
        bottomTopQuestionContainerMargin,
      ])
    ]);
  }
}
