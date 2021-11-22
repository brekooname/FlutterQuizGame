import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Components/Text/my_text.dart';

class RateAppPopup extends StatelessWidget {
  @override
  Dialog build(BuildContext context) {
    var width = 360.0;
    var height = 450.0;
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.white),
        height: height,
        width: width,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  "assets/main/general/rate_app_background_stars.png",
                  width: width / 2.6,
                ),
                SizedBox(height: 20),
                MyText(
                    text:
                        'If you enjoy using our app please give it a rating.'),
                SizedBox(height: 40),
                MyButton(
                  text: 'Rate now the app',
                  backgroundColor: Colors.lightGreenAccent,
                ),
                SizedBox(height: 20),
                MyButton(
                    text: 'Rate later', backgroundColor: Colors.grey.shade300),
                SizedBox(height: 10),
              ],
            )),
      ),
    );
  }
}
