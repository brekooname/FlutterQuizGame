import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class AnimateColorInColorOutText extends StatefulWidget {
  static const double defaultZoomAmount = 1.1;
  MyText toAnimateText;
  Color colorTo;

  AnimateColorInColorOutText(
      {Key? key, required this.colorTo, required this.toAnimateText})
      : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateColorInColorOutText>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void startAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    startAnimation();
    return InternalAnimatedWidget(
        colorTo: widget.colorTo,
        toAnimateText: widget.toAnimateText,
        animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  MyText toAnimateText;
  Color colorTo;

  InternalAnimatedWidget(
      {Key? key,
      required this.colorTo,
      required this.toAnimateText,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    var fontConfig = toAnimateText.fontConfig;
    return MyText(
        fontConfig: FontConfig(
            fontColor: ColorTween(begin: fontConfig.textColor, end: colorTo)
                .evaluate(animation),
            fontWeight: fontConfig.fontWeight,
            borderWidth: fontConfig.borderWidth,
            fontSize: fontConfig.fontSize,
            borderColor: fontConfig.borderColor),
        text: toAnimateText.text,
        alignmentInsideContainer: toAnimateText.alignmentInsideContainer,
        width: toAnimateText.width,
        maxLines: toAnimateText.maxLines);
  }
}
