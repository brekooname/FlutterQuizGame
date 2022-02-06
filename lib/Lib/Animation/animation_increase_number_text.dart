import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class AnimateIncreaseNumberText extends StatefulWidget {
  final MyAudioPlayer _myAudioPlayer = MyAudioPlayer();
  static const double defaultZoomAmount = 1.1;
  MyText toAnimateText;
  int startNr;
  int endNr;
  String audioPlayerId;

  AnimateIncreaseNumberText(
      {Key? key,
      required this.startNr,
      required this.endNr,
      required this.audioPlayerId,
      required this.toAnimateText})
      : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateIncreaseNumberText>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    if (widget.startNr < widget.endNr) {
      widget._myAudioPlayer.playSuccess(
          audioPlayerId: widget.audioPlayerId, loop: true, playSpeed: 2);
    }
  }

  void startAnimation() {
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          widget.startNr < widget.endNr) {
        setState(() {
          widget.startNr =
              min(widget.startNr + _getIncrementAmount(), widget.endNr);
        });
      }
    });
    controller.forward();
  }

  int _getIncrementAmount() {
    return ((widget.endNr - widget.startNr) / 10).ceil();
  }

  @override
  Widget build(BuildContext context) {
    controller = AnimationController(
        duration: const Duration(milliseconds: 20), vsync: this);
    if (widget.startNr >= widget.endNr) {
      widget._myAudioPlayer.stop(audioPlayerId: widget.audioPlayerId);
      return widget.toAnimateText;
    }
    startAnimation();
    return InternalAnimatedWidget(
      toAnimateText: widget.toAnimateText,
      animation: animation,
      textToDisplay: widget.startNr.toString(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget._myAudioPlayer.stop(audioPlayerId: widget.audioPlayerId);
    controller.dispose();
  }
}

class InternalAnimatedWidget extends AnimatedWidget {
  MyText toAnimateText;
  String textToDisplay;

  InternalAnimatedWidget(
      {Key? key,
      required this.toAnimateText,
      required this.textToDisplay,
      required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    var fontConfig = toAnimateText.fontConfig;
    return MyText(
        fontConfig: FontConfig(
            fontColor: fontConfig.textColor,
            fontWeight: fontConfig.fontWeight,
            borderWidth: fontConfig.borderWidth,
            fontSize: fontConfig.fontSize,
            borderColor: fontConfig.borderColor),
        text: textToDisplay,
        alignmentInsideContainer: toAnimateText.alignmentInsideContainer,
        width: toAnimateText.width,
        maxLines: toAnimateText.maxLines);
  }
}
