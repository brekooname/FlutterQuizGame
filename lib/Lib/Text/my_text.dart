import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final MyTextCreatorService _myTextCreatorService = MyTextCreatorService();

  late FontConfig fontConfig;

  late int maxLines;

  double? width;

  Alignment alignmentInsideContainer;

  String text;

  MyText(
      {Key? key,
      FontConfig? fontConfig,
      double? fontSize,
      Color? textColor,
      required this.text,
      this.alignmentInsideContainer = Alignment.center,
      this.width,
      this.maxLines = 2})
      : super(key: key) {
    this.fontConfig =
        fontConfig ?? FontConfig(fontSize: fontSize, fontColor: textColor);
  }

  @override
  Widget build(BuildContext context) {
    var defaultText = _myTextCreatorService.createText(
        text, getTextStyle(), TextAlign.center);

    Widget result;
    if (fontConfig.borderColor == Colors.transparent) {
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
    return Container(
        width: width, alignment: alignmentInsideContainer, child: result);
  }

  TextStyle getTextStyle() {
    var textStyle = TextStyle(
        decoration: TextDecoration.none,
        fontWeight: fontConfig.fontWeight,
        color: fontConfig.textColor,
        fontSize: fontConfig.fontSize);

    while (hasTextOverflow(text, textStyle,
        maxWidth: width ?? double.infinity, maxLines: maxLines)) {
      fontConfig.fontSize = fontConfig.fontSize / 1.1;
      textStyle = TextStyle(
          decoration: TextDecoration.none,
          fontWeight: fontConfig.fontWeight,
          color: fontConfig.textColor,
          fontSize: fontConfig.fontSize);
    }
    return textStyle;
  }

  bool hasTextOverflow(String text, TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }
}

class OutlinedTextStroke {
  final Color? color;

  final double? width;

  const OutlinedTextStroke({this.color, this.width});
}

class OutlinedText extends StatelessWidget {
  final MyTextCreatorService _myTextCreatorService = MyTextCreatorService();
  final Text? text;

  final List<OutlinedTextStroke>? strokes;

  OutlinedText({Key? key, this.text, this.strokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final list = strokes ?? [];
    double widthSum = 0;
    for (var i = 0; i < list.length; i++) {
      widthSum += list[i].width ?? 0;

      var textControl = _myTextCreatorService.createText(
          text?.data ?? '',
          (text?.style ?? const TextStyle()).copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = widthSum
                ..color = list[i].color ?? Colors.transparent),
          text?.textAlign);

      children.add(textControl);
    }

    return Stack(
      children: [...children.reversed, text ?? const SizedBox.shrink()],
    );
  }
}

class MyTextCreatorService {
  static final MyTextCreatorService singleton = MyTextCreatorService.internal();

  factory MyTextCreatorService() {
    return singleton;
  }

  MyTextCreatorService.internal();

  Text createText(String text, TextStyle textStyle, TextAlign? textAlign) {
    return Text(
      text,
      textScaleFactor: 1,
      overflow: TextOverflow.fade,
      textAlign: textAlign,
      style: GoogleFonts.roboto(textStyle: textStyle),
    );
  }
}
