import 'package:flutter/material.dart';

class AnimateFadeInFadeOut extends StatefulWidget {
  final Widget toAnimateWidget;
  final bool onlyFadeOut;
  final Duration duration;
  late final bool _fadeInFadeOutOnceAnimation;

  AnimateFadeInFadeOut(
      {Key? key,
      bool fadeInFadeOutOnce = false,
      this.onlyFadeOut = false,
      this.duration = const Duration(milliseconds: 500),
      required this.toAnimateWidget})
      : super(key: key) {
    if (onlyFadeOut) {
      _fadeInFadeOutOnceAnimation = true;
    } else {
      _fadeInFadeOutOnceAnimation = fadeInFadeOutOnce;
    }
  }

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateFadeInFadeOut>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && !widget.onlyFadeOut) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed &&
          !widget._fadeInFadeOutOnceAnimation) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InternalAnimatedWidget(
        duration: widget.duration,
        onlyFadeOut: widget.onlyFadeOut,
        toAnimateWidget: widget.toAnimateWidget,
        animation: _animation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  final Widget toAnimateWidget;
  final Duration duration;
  final bool onlyFadeOut;

  const InternalAnimatedWidget(
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
