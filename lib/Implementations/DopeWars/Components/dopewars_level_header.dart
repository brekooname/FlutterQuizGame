import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class DopeWarsLevelHeader extends StatelessWidget {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  DopeWarsLevelHeader();

  @override
  Widget build(BuildContext context) {
    var margin = SizedBox(
      height: _screenDimensions.dimen(1),
    );
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createRow1(),
          margin,
          createRow2(),
          margin,
          createRow3(),
        ]);
  }

  Row createRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        MyText(
          text: "Reputation: 44%",
        ),
        const Spacer(),
      ],
    );
  }

  Row createRow3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyText(
          text: "Budget: 5.000\$",
        ),
        const Spacer(),
        MyText(
          text: "Inventory: 0 / 99",
        )
      ],
    );
  }

  Row createRow1() {
    var myBackButton = MyBackButton();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        myBackButton,
        const Spacer(),
        MyText(
          text: "Remaining Days: 60",
        ),
        const Spacer(),
        SizedBox(
          width: myBackButton.buttonSize.width,
        ),
      ],
    );
  }
}
