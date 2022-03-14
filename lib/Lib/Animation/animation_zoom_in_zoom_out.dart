import 'package:flutter/material.dart';

class AnimateZoomInZoomOut extends StatefulWidget {
  static const double defaultZoomAmount = 0.05;
  Widget toAnimateWidget;
  double zoomAmount;
  bool zoomInZoomOutOnce;
  Duration duration;

  AnimateZoomInZoomOut(
      {Key? key,
      this.zoomAmount = defaultZoomAmount,
      this.zoomInZoomOutOnce = false,
      this.duration = const Duration(seconds: 1),
      required this.toAnimateWidget})
      : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateZoomInZoomOut>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed &&
          !widget.zoomInZoomOutOnce) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => InternalAnimatedWidget(
      zoomAmount: widget.zoomAmount,
      toAnimateWidget: widget.toAnimateWidget,
      duration: widget.duration,
      animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  Widget toAnimateWidget;
  double zoomAmount;
  Duration duration;

  InternalAnimatedWidget(
      {Key? key,
      required this.zoomAmount,
      required this.duration,
      required this.toAnimateWidget,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return AnimatedScale(
      scale: Tween<double>(begin: 1 - zoomAmount, end: 1).evaluate(animation),
      duration: duration,
      child: toAnimateWidget,
    );
  }
}
