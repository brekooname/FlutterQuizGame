import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class InternalAnimatedWidget extends AnimatedWidget {
  MyText toAnimateText;

  InternalAnimatedWidget(
      {Key? key,
      required this.toAnimateText,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Opacity(
        opacity: Tween<double>(begin: 1, end: 0.1).evaluate(animation),
        child: toAnimateText);
  }
}

class AnimateFadeInFadeOutText extends StatefulWidget {
  MyText toAnimateText;
  bool fadeInFadeOutOnce;
  Duration duration;

  AnimateFadeInFadeOutText(
      {Key? key,
      this.fadeInFadeOutOnce = false,
      this.duration = const Duration(milliseconds: 500),
      required this.toAnimateText})
      : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateFadeInFadeOutText>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void startAnimation() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed &&
          !widget.fadeInFadeOutOnce) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    startAnimation();
    return InternalAnimatedWidget(
        toAnimateText: widget.toAnimateText, animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
