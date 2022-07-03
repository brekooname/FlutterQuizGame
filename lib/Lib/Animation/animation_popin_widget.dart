import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class AnimatePopInWidget extends StatefulWidget {
  Widget mainContent;
  bool animateOnlyOnce;

  AnimatePopInWidget({
    Key? key,
    required this.mainContent,
    this.animateOnlyOnce = true,
  }) : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimatePopInWidget>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && !widget.animateOnlyOnce) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed &&
          !widget.animateOnlyOnce) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: widget.mainContent,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
