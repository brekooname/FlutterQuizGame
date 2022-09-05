import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final MyTextService _myTextCreatorService = MyTextService();

  late FontConfig fontConfig;
  late int maxLines;
  double? width;
  Shadow? textShadow;
  Alignment alignmentInsideContainer;
  String text;
  double textAllPadding;
  bool firstCharUppercase;

  MyText({
    Key? key,
    FontConfig? fontConfig,
    double? fontSize,
    Color? fontColor,
    int? maxLines,
    required this.text,
    this.textAllPadding = 0,
    this.alignmentInsideContainer = Alignment.center,
    this.width,
    this.textShadow,
    this.firstCharUppercase = true,
  }) : super(key: key) {
    this.maxLines = maxLines ?? 2;
    text = firstCharUppercase ? text.capitalized.trim() : text.trim();
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
        color: fontConfig.fontColor,
        fontSize: fontConfig.fontSize,
        shadows: shadows);

    while (_hasTextOverflow(text, textStyle,
        maxWidth: width ?? double.infinity, maxLines: maxLines)) {
      fontConfig.fontSize = fontConfig.fontSize / 1.1;
      textStyle = TextStyle(
          decoration: TextDecoration.none,
          fontWeight: fontConfig.fontWeight,
          color: fontConfig.fontColor,
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
            ((fontConfig.borderWidth / 4) *
                (text.length - text.split(" ").length)));
    return textPainter.didExceedMaxLines;
  }
}

class OutlinedTextStroke {
  final Color? color;

  final double? width;

  const OutlinedTextStroke({this.color, this.width});
}

class OutlinedText extends StatelessWidget {
  final MyTextService _myTextCreatorService = MyTextService();
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

class MyTextService {
  static final MyTextService singleton = MyTextService.internal();

  factory MyTextService() {
    return singleton;
  }

  MyTextService.internal();

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

  List<Widget> createMyTextWithOneParam(String labelText, String param,
      FontConfig staticTextFontConfig, FontConfig paramFontConfig,
      {double? labelWidth, int? staticTextMaxLines, int? paramTextMaxLines}) {
    List<String> labelSplit = labelText.split("{0}");
    return [
      MyText(
        width: labelWidth,
        alignmentInsideContainer: Alignment.center,
        text: labelSplit[0],
        fontConfig: staticTextFontConfig,
        maxLines: staticTextMaxLines,
      ),
      MyText(
        width: labelWidth,
        alignmentInsideContainer: Alignment.center,
        text: param,
        fontConfig: paramFontConfig,
        maxLines: paramTextMaxLines,
      ),
      labelSplit[1].isEmpty
          ? Container()
          : MyText(
              width: labelWidth,
              alignmentInsideContainer: Alignment.center,
              text: labelSplit[1],
              fontConfig: staticTextFontConfig,
            ),
    ];
  }
}
