import 'package:flutter/material.dart';

class AnimateZoomInZoomOut extends StatefulWidget {
  static const double defaultZoomAmount = 5;
  final Widget toAnimateWidget;
  final Size toAnimateWidgetSize;
  final double zoomAmount;
  final bool zoomInZoomOutOnce;
  final Duration duration;

  const AnimateZoomInZoomOut(
      {Key? key,
      this.zoomAmount = defaultZoomAmount,
      this.zoomInZoomOutOnce = false,
      this.duration = const Duration(seconds: 1),
      required this.toAnimateWidgetSize,
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
      toAnimateWidgetSize: widget.toAnimateWidgetSize,
      animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  final Widget toAnimateWidget;
  final Size toAnimateWidgetSize;
  final double zoomAmount;

  const InternalAnimatedWidget(
      {Key? key,
      required this.zoomAmount,
      required this.toAnimateWidgetSize,
      required this.toAnimateWidget,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Center(
      child: SizedBox(
        height: Tween<double>(
                begin: toAnimateWidgetSize.height,
                end: toAnimateWidgetSize.height -
                    (toAnimateWidgetSize.height / zoomAmount))
            .evaluate(animation),
        width: Tween<double>(
                begin: toAnimateWidgetSize.width,
                end: toAnimateWidgetSize.width -
                    (toAnimateWidgetSize.width / zoomAmount))
            .evaluate(animation),
        child: toAnimateWidget,
      ),
    );
  }
}
