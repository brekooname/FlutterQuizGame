import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Font/font_config.dart';

class MyText extends StatelessWidget {
  late FontConfig fontConfig;

  late bool singleLineLabel;

  double? width;

  late String text;

  MyText(
      {FontConfig? fontConfig,
      required String text,
      this.width,
      this.singleLineLabel = false}) {
    this.fontConfig = fontConfig == null ? FontConfig() : fontConfig;
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    var defaultText = Text(
      this.text,
      textAlign: TextAlign.center,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: fontConfig.fontWeight,
          color: fontConfig.textColor,
          fontSize: fontConfig.fontSize.roundToDouble()),
    );

    Widget result;
    if (this.fontConfig.borderColor == null) {
      result = defaultText;
    } else {
      result = OutlinedText(
        text: defaultText,
        strokes: [
          OutlinedTextStroke(
              color: fontConfig.borderColor, width: fontConfig.borderWidth),
        ],
      );
    }
    return Container(width: width, alignment: Alignment.center, child: result);
  }
}

class OutlinedTextStroke {
  final Color? color;

  final int? width;

  const OutlinedTextStroke({this.color, this.width});
}

class OutlinedText extends StatelessWidget {
  final Text? text;

  final List<OutlinedTextStroke>? strokes;

  const OutlinedText({Key? key, this.text, this.strokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final list = strokes ?? [];
    double widthSum = 0;
    for (var i = 0; i < list.length; i++) {
      widthSum += list[i].width ?? 0;
      children.add(Text(text?.data ?? '',
          softWrap: true,
          textAlign: text?.textAlign,
          style: (text?.style ?? TextStyle()).copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = widthSum
                ..color = list[i].color ?? Colors.transparent)));
    }

    return Stack(
      children: [...children.reversed, text ?? SizedBox.shrink()],
    );
  }
}
