import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';

class ProgressBar extends StatefulWidget {
  int currentStep;
  double widthPerStep;
  double height;
  double width;
  bool animateStepIncrease;
  Color fillBarColor;

  ProgressBar(
      {Key? key,
      required this.widthPerStep,
      required this.currentStep,
      required this.width,
      required this.height,
      this.animateStepIncrease = false,
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
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    startAnimation();
    return InternalAnimatedWidget(
      widthPerStep: widget.widthPerStep,
      currentStep: widget.currentStep,
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
  int currentStep;
  double widthPerStep;
  double height;
  double width;
  bool animateStepIncrease;
  Color fillBarColor;

  InternalAnimatedWidget(
      {Key? key,
      required this.widthPerStep,
      required this.currentStep,
      required this.width,
      required this.height,
      required this.animateStepIncrease,
      required this.fillBarColor,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    double widthPerStep = this.widthPerStep / 1.0225;
    double endWidth = currentStep * widthPerStep;
    double startWidth = max(endWidth - widthPerStep, 0);

    print("w " + width.toString() + " ww " + endWidth.toString());

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
          color: Colors.grey.shade200.withOpacity(0.5),
          border: Border.all(
              color: Colors.grey.shade400.withOpacity(0.5),
              width: FontConfig.standardBorderWidth)),
      child: Row(
        children: [filledBar, const Spacer()],
      ),
    );

    return emptyBar;
  }
}
