import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class AnimateZoomInZoomOutText extends StatefulWidget {
  static const double defaultZoomAmount = 1.1;
  MyText toAnimateText;
  double zoomAmount;
  bool executeAnimationOnlyOnce;
  Duration duration;
  Color? colorTo;

  AnimateZoomInZoomOutText(
      {Key? key,
      this.zoomAmount = defaultZoomAmount,
      this.executeAnimationOnlyOnce = false,
      this.colorTo,
      this.duration = const Duration(milliseconds: 500),
      required this.toAnimateText})
      : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateZoomInZoomOutText>
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
          !widget.executeAnimationOnlyOnce) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    startAnimation();
    return InternalAnimatedWidget(
        zoomAmount: widget.zoomAmount,
        toAnimateText: widget.toAnimateText,
        colorTo: widget.colorTo,
        animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  MyText toAnimateText;
  double zoomAmount;
  Color? colorTo;

  InternalAnimatedWidget(
      {Key? key,
      required this.zoomAmount,
      required this.toAnimateText,
      this.colorTo,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    var fontConfig = toAnimateText.fontConfig;
    return MyText(
        fontConfig: FontConfig(
            textColor: colorTo == null
                ? fontConfig.textColor
                : ColorTween(begin: fontConfig.textColor, end: colorTo)
                    .evaluate(animation),
            fontWeight: fontConfig.fontWeight,
            borderWidth: fontConfig.borderWidth,
            fontSize: Tween<double>(
                    begin: fontConfig.fontSize,
                    end: fontConfig.fontSize / zoomAmount)
                .evaluate(animation),
            borderColor: fontConfig.borderColor),
        text: toAnimateText.text,
        alignmentInsideContainer: toAnimateText.alignmentInsideContainer,
        width: toAnimateText.width,
        maxLines: toAnimateText.maxLines);
  }
}
