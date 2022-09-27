import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';

class ProgressBar extends StatefulWidget {
  final int startNr;
  final int endNr;
  final int totalNr;
  final double height;
  final double width;
  final bool animateStepIncrease;
  final Color fillBarColor;

  const ProgressBar(
      {Key? key,
      required this.startNr,
      required this.endNr,
      required this.totalNr,
      required this.width,
      required this.height,
      this.animateStepIncrease = true,
      this.fillBarColor = Colors.lightGreenAccent})
      : super(key: key);

  @override
  ProgressBarState createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void startAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    startAnimation();
    return InternalAnimatedWidget(
      startNr: widget.startNr,
      endNr: widget.endNr,
      totalNr: widget.totalNr,
      height: widget.height,
      width: widget.width,
      fillBarColor: widget.fillBarColor,
      animateStepIncrease: widget.animateStepIncrease,
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  final int startNr;
  final int endNr;
  final int totalNr;
  final double height;
  final double width;
  final bool animateStepIncrease;
  final Color fillBarColor;

  const InternalAnimatedWidget(
      {Key? key,
      required this.startNr,
      required this.endNr,
      required this.totalNr,
      required this.width,
      required this.height,
      required this.animateStepIncrease,
      required this.fillBarColor,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    double percentStart = startNr / totalNr;
    double percentEnd = endNr / totalNr;
    var startWidth = min(percentStart * width, width);
    var endWidth = min(percentEnd * width, width);
    var filledBar = Container(
      width: animateStepIncrease
          ? Tween<double>(begin: startWidth, end: endWidth).evaluate(animation)
          : endWidth,
      height: height,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(FontConfig.standardBorderRadius / 2),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ColorUtil.colorDarken(fillBarColor, -0.2),
              ColorUtil.colorDarken(fillBarColor, 0.2),
            ],
          ),
          border: Border.all(
              color: ColorUtil.colorDarken(fillBarColor, 0.3),
              width: FontConfig.standardBorderWidth)),
    );
    var emptyBar = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(FontConfig.standardBorderRadius / 2),
        color: ColorUtil.colorDarken(
            HSLColor.fromColor(fillBarColor).withSaturation(0.3).toColor(),
            -0.05),
      ),
      child: Row(
        children: [filledBar, const Spacer()],
      ),
    );

    return emptyBar;
  }
}
