import 'package:flutter/material.dart';

class AnimateFadeInFadeOut extends StatefulWidget {
  Widget toAnimateWidget;
  bool fadeInFadeOutOnce;
  bool onlyFadeOut;
  Duration duration;

  AnimateFadeInFadeOut(
      {Key? key,
      this.fadeInFadeOutOnce = false,
      this.onlyFadeOut = false,
      this.duration = const Duration(milliseconds: 500),
      required this.toAnimateWidget})
      : super(key: key) {
    if (onlyFadeOut) {
      fadeInFadeOutOnce = true;
    }
  }

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateFadeInFadeOut>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void startAnimation() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && !widget.onlyFadeOut) {
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
        duration: widget.duration,
        onlyFadeOut: widget.onlyFadeOut,
        toAnimateWidget: widget.toAnimateWidget,
        animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  Widget toAnimateWidget;
  Duration duration;
  bool onlyFadeOut;

  InternalAnimatedWidget(
      {Key? key,
      required this.toAnimateWidget,
      required this.duration,
      required this.onlyFadeOut,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    Duration duration = Duration(
        milliseconds: onlyFadeOut
            ? this.duration.inMilliseconds ~/ 8
            : this.duration.inMilliseconds);
    return AnimatedOpacity(
        duration: duration,
        opacity: Tween<double>(begin: 1, end: onlyFadeOut ? 0 : 0.1)
            .evaluate(animation),
        child: toAnimateWidget);
  }
}
