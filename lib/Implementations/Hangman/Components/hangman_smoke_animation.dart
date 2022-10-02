import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

class HangmanSmokeAnimation extends StatefulWidget {
  final Image forestTexture;

  const HangmanSmokeAnimation(this.forestTexture, {Key? key}) : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<HangmanSmokeAnimation>
    with TickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 4);

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _duration, vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return InternalAnimatedWidget(
        duration: _duration,
        forestTexture: widget.forestTexture,
        animation: _animation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  final Duration duration;
  final Image forestTexture;
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();

  InternalAnimatedWidget(
      {Key? key,
      required this.duration,
      required this.forestTexture,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Stack(children: [
      AnimatedOpacity(
          duration: duration,
          opacity: 1 - animation.value,
          child: CustomPaint(
            painter: HangmanHouseSmokePainter(
                radius: _screenDimensionsService
                    .dimen(max(0.1, animation.value) * 5),
                y: animation.value * 10,
                opacity: 1 - animation.value),
          )),
      forestTexture
    ]);
  }
}

class HangmanHouseSmokePainter extends CustomPainter {
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();
  final double radius;
  final double y;
  final double opacity;

  HangmanHouseSmokePainter(
      {required this.radius, required this.y, required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    var standardX = _screenDimensionsService.dimen(89);
    var standardY = -(_screenDimensionsService.dimen(y) -
        _screenDimensionsService.dimen(8));
    var paint = Paint()
      ..strokeWidth = _screenDimensionsService.dimen(10)
      ..color = Colors.white.withOpacity(opacity);
    canvas.drawCircle(Offset(standardX, standardY), radius, paint);
    canvas.drawCircle(
        Offset(standardX / 1.01, standardY / 1.1), radius / 1.5, paint);
    canvas.drawCircle(
        Offset(standardX * 1.01, standardY * 1.1), radius / 1.8, paint);
  }

  @override
  bool shouldRepaint(HangmanHouseSmokePainter oldDelegate) {
    return false;
  }
}
