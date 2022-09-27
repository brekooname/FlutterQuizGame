import 'package:flutter/material.dart';

class AnimateRotate extends StatefulWidget {
  static const int _totalRotations = 100;
  final Widget toAnimateWidget;
  final bool rotateOnce;
  final RotationSpeed rotationSpeed;

  const AnimateRotate(
      {Key? key,
      required this.toAnimateWidget,
      this.rotateOnce = false,
      this.rotationSpeed = RotationSpeed.normal})
      : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateRotate>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: _getDurationForSpeed(), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed && !widget.rotateOnce) {
        controller.forward();
      }
    });
    controller.forward();
  }

  Duration _getDurationForSpeed() {
    int seconds = (AnimateRotate._totalRotations * 2.5).ceil();
    if (widget.rotationSpeed == RotationSpeed.slow) {
      seconds = (seconds * 2.5).ceil();
    } else if (widget.rotationSpeed == RotationSpeed.fast) {
      seconds = (seconds / 1.5).ceil();
    }
    return Duration(seconds: seconds);
  }

  @override
  Widget build(BuildContext context) => Center(
        child: RotationTransition(
          turns: Tween(
                  begin: 0.0,
                  end: widget.rotationSpeed == RotationSpeed.stop
                      ? 0.0
                      : AnimateRotate._totalRotations.toDouble())
              .animate(controller),
          child: widget.toAnimateWidget,
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum RotationSpeed { stop, slow, normal, fast }
