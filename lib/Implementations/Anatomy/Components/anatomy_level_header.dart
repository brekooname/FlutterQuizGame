import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class AnatomyLevelHeader extends StatelessWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  String questionText;

  AnatomyLevelHeader({
    Key? key,
    required this.questionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  Widget createLevelHeader(BuildContext context) {
    return Container(
        height: screenDimensions.dimen(16),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.3),
        ),
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: screenDimensions.dimen(2)),
                MyText(text: questionText)
              ],
            )));
  }
}
