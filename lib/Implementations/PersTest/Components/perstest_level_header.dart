import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestLevelHeader extends StatelessWidget {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  String questionNr;

  PersTestLevelHeader(this.questionNr);

  @override
  Widget build(BuildContext context) {
    var headerHeight = _screenDimensions.dimen(13);

    return SizedBox(
        height: headerHeight,
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(0)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: _screenDimensions.dimen(10)),
                MyText(
                  text: questionNr,
                ),
                const Spacer(),
              ],
            )));
  }
}
