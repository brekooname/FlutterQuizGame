import 'package:flutter/material.dart';

class InternalAnimatedWidget extends AnimatedWidget {
  const InternalAnimatedWidget(
      {Key? key, required this.toAnimate, required Animation<double> animation})
      : super(key: key, listenable: animation);

  final Widget toAnimate;
  static final _opacityTween = Tween<double>(begin: 1, end: 1);
  static final _sizeTween = Tween<double>(begin: 50, end: 150);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: toAnimate,
        ),
      ),
    );
  }
}

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({Key? key, required this.toAnimate}) : super(key: key);

  final Widget toAnimate;

  @override
  MyAnimatedWidgetState createState() =>
      MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {

  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) =>
      InternalAnimatedWidget(toAnimate: widget.toAnimate, animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
