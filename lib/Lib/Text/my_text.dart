import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final MyTextCreatorService _myTextCreatorService = MyTextCreatorService();

  late FontConfig fontConfig;
  late int maxLines;
  double? width;
  Shadow? textShadow;
  Alignment alignmentInsideContainer;
  String text;
  double textAllPadding;

  MyText(
      {Key? key,
      FontConfig? fontConfig,
      double? fontSize,
      Color? fontColor,
      required this.text,
      this.textAllPadding = 0,
      this.alignmentInsideContainer = Alignment.center,
      this.width,
      this.textShadow,
      this.maxLines = 2})
      : super(key: key) {
    text = text.capitalized.trim();
    this.fontConfig =
        fontConfig ?? FontConfig(fontSize: fontSize, fontColor: fontColor);
  }

  @override
  Widget build(BuildContext context) {
    var defaultText = _myTextCreatorService._createText(
        text, _getTextStyle(), TextAlign.center, maxLines);

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
        maxLines: maxLines,
      );
    }
    return Padding(
        padding: EdgeInsets.all(textAllPadding),
        child: Container(
            width: width, alignment: alignmentInsideContainer, child: result));
  }

  TextStyle _getTextStyle() {
    List<Shadow> shadows = [];
    if (textShadow != null) {
      shadows.add(textShadow!);
    }
    var textStyle = TextStyle(
        decoration: TextDecoration.none,
        fontWeight: fontConfig.fontWeight,
        color: fontConfig.textColor,
        fontSize: fontConfig.fontSize,
        shadows: shadows);

    while (_hasTextOverflow(text, textStyle,
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

  bool _hasTextOverflow(String text, TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      textScaleFactor: 1,
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: minWidth,
        maxWidth: maxWidth -
            (fontConfig.borderWidth * text.length) -
            textAllPadding * 2);
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
  final int maxLines;

  final List<OutlinedTextStroke>? strokes;

  OutlinedText({Key? key, this.text, this.strokes, required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final list = strokes ?? [];
    double widthSum = 0;
    for (var i = 0; i < list.length; i++) {
      widthSum += list[i].width ?? 0;

      var textControl = _myTextCreatorService._createText(
          text?.data ?? '',
          (text?.style ?? const TextStyle()).copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = widthSum
                ..color = list[i].color ?? Colors.transparent),
          text?.textAlign,
          maxLines);

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

  Text _createText(
      String text, TextStyle textStyle, TextAlign? textAlign, int maxLines) {
    return Text(
      text,
      softWrap: maxLines != 1,
      textScaleFactor: 1,
      overflow: TextOverflow.visible,
      textAlign: textAlign,
      style: GoogleFonts.roboto(textStyle: textStyle),
    );
  }
}
