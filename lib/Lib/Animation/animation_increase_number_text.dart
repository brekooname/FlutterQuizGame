import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class AnimateIncreaseNumberText extends StatefulWidget {
  final MyAudioPlayer _myAudioPlayer = MyAudioPlayer();
  static const double defaultZoomAmount = 1.1;
  bool finishedPlayingSound = true;
  MyText toAnimateText;
  int startNr;
  int endNr;

  AnimateIncreaseNumberText(
      {Key? key,
      required this.startNr,
      required this.endNr,
      required this.toAnimateText})
      : super(key: key) {
    _myAudioPlayer.audioPlayer.onPlayerCompletion.listen((event) {
      finishedPlayingSound = true;
    });
  }

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateIncreaseNumberText>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void startAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 20), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          widget.startNr < widget.endNr) {
        setState(() {
          if (widget.finishedPlayingSound || kIsWeb) {
            widget.finishedPlayingSound = false;
            widget._myAudioPlayer.playSuccess();
          }
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
    startAnimation();
    return InternalAnimatedWidget(
      toAnimateText: widget.toAnimateText,
      animation: animation,
      textToDisplay: widget.startNr.toString(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
            textColor: fontConfig.textColor,
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
