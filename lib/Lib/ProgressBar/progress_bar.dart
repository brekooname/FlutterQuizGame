import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';

class ProgressBar extends StatelessWidget {
  double percentFilled;
  double height;
  double width;

  ProgressBar(
      {Key? key, required this.percentFilled, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filledBar = Container(
      width: width * (percentFilled / 100),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FontConfig.standardBorderRadius),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightGreenAccent.withOpacity(0.5),
              Colors.lightGreenAccent,
            ],
          ),
          border: Border.all(
              color: Colors.lightGreen.shade600,
              width: FontConfig.standardBorderWidth)),
    );
    var emptyBar = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FontConfig.standardBorderRadius),
          color: Colors.grey.shade200,
          border: Border.all(
              color: Colors.grey.shade400,
              width: FontConfig.standardBorderWidth)),
      child: Row(
        children: [filledBar, const Spacer()],
      ),
    );
    return emptyBar;
  }
}
