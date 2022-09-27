import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/in_app_purchase_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import '../../main.dart';
import 'button_size.dart';

//ignore: must_be_immutable
class MyButton extends StatefulWidget {
  late final FontConfig fontConfig;
  late final Color disabledBackgroundColor;
  late final ButtonSkinConfig buttonSkinConfig;
  late final VoidCallback onClick;
  late final Size size;
  late final ContentLockedConfig contentLockedConfig;
  late final Widget customContent;

  bool pressed = false;
  bool touchable;

  final bool disabled;
  final bool visible;

  final double buttonAllPadding;

  final String? text;
  final int textMaxLines;
  final bool textFirstCharUppercase;

  MyButton({
    Key? key,
    this.text,
    this.textMaxLines = 2,
    this.textFirstCharUppercase = true,
    this.buttonAllPadding = 0,
    this.disabled = false,
    this.touchable = true,
    this.visible = true,
    Color? disabledBackgroundColor,
    VoidCallback? onClick,
    Size? size,
    double? fontSize,
    double? width,
    FontConfig? fontConfig,
    Color? backgroundColor,
    ButtonSkinConfig? buttonSkinConfig,
    ContentLockedConfig? contentLockedConfig,
    Widget? customContent,
  }) : super(key: key) {
    this.size = _getSize(size, width);
    this.fontConfig = fontConfig ?? FontConfig(fontSize: fontSize);
    this.onClick = onClick ?? () {};
    this.contentLockedConfig =
        contentLockedConfig ?? ContentLockedConfig(isContentLocked: false);
    touchable = !disabled || this.contentLockedConfig.isContentLocked
        ? touchable
        : false;
    this.buttonSkinConfig = buttonSkinConfig ??
        ButtonSkinConfig(
            backgroundColor:
                backgroundColor ?? Colors.lightBlueAccent.shade200);
    this.disabledBackgroundColor =
        disabledBackgroundColor ?? Colors.grey.shade400;
    this.customContent = customContent ?? _createCustomContent();
  }

  Size _getSize(Size? size, double? btnWidth) {
    Size res;
    if (size == null) {
      var buttonSize = ButtonSize();
      if (btnWidth == null) {
        res = buttonSize.normalSize;
      } else {
        res = Size(btnWidth, buttonSize.normalSize.height);
      }
    } else {
      res = size;
    }
    return res;
  }

  Widget _createCustomContent() {
    if (text != null && buttonSkinConfig.image != null) {
      var labelContainerDecoration = BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(FontConfig.standardBorderRadius));
      var labelWithPadding = Padding(
          padding: EdgeInsets.all(FontConfig.standardMinMargin),
          child: _createMyText());
      var labelContainer = Container(
          decoration: labelContainerDecoration, child: labelWithPadding);
      return SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buttonSkinConfig.image!,
                  SizedBox(
                    height: FontConfig.standardMinMargin,
                  ),
                  labelContainer,
                ])
          ],
        ),
      );
    } else if (text != null) {
      return _createMyText();
    } else if (buttonSkinConfig.image != null) {
      return _createImageButtonContent();
    }
    throw AssertionError("No content set for button!!!");
  }

  MyText _createMyText() {
    return MyText(
      firstCharUppercase: textFirstCharUppercase,
      text: text!,
      fontConfig: fontConfig,
      maxLines: textMaxLines,
      width: size.width / 1.05,
    );
  }

  Widget _createImageButtonContent() {
    return disabled
        ? ColorUtil.imageToGreyScale(buttonSkinConfig.image!)
        : buttonSkinConfig.image!;
  }

  @override
  State<MyButton> createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    Widget buttonContent;
    if (widget.pressed) {
      buttonContent = ColorUtil.imageDarken(widget.customContent);
    } else {
      buttonContent = widget.customContent;
    }

    if (widget.contentLockedConfig.isContentLocked) {
      buttonContent = _buildContentLocked(buttonContent);
      widget.onClick = () {
        InAppPurchasesPopupService().showPopup(
            executeAfterPurchase:
                widget.contentLockedConfig.executeAfterPurchase);
      };
    }

    return Visibility(
      visible: widget.visible,
      child: Padding(
          padding: EdgeInsets.all(widget.buttonAllPadding),
          child: GestureDetector(
              onTapCancel: () {
                if (widget.touchable) {
                  setState(() {
                    widget.pressed = false;
                  });
                }
              },
              onTapUp: (TapUpDetails details) {
                if (widget.touchable) {
                  setState(() {
                    widget.onClick.call();
                    widget.pressed = false;
                  });
                }
              },
              onTapDown: (TapDownDetails details) {
                if (widget.touchable) {
                  setState(() {
                    widget.pressed = true;
                  });
                }
              },
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: widget.size.width,
                  height: widget.size.height,
                  decoration: _createButtonDecoration(widget.buttonSkinConfig),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [buttonContent],
                  )))),
    );
  }

  Widget _buildContentLocked(Widget buttonContent) {
    if (widget.contentLockedConfig.lockedIcon == null) {
      return buttonContent;
    }

    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(widget.buttonSkinConfig.borderRadius),
      color: Colors.grey.shade400.withOpacity(0.5),
    );

    var lockedImageSide = widget.size.height / 1.7;
    var margin = widget.buttonSkinConfig.borderWidth * 4;
    var stack = Stack(alignment: Alignment.center, children: [
      buttonContent,
      Container(
        width: widget.size.width - margin,
        height: widget.size.height - margin,
        decoration: decoration,
      ),
      AnimateZoomInZoomOut(
          toAnimateWidgetSize: Size(lockedImageSide, lockedImageSide),
          toAnimateWidget: widget.contentLockedConfig.lockedIcon!)
    ]);
    return stack;
  }

  BoxDecoration? _createButtonDecoration(ButtonSkinConfig buttonSkinConfig) {
    if (widget.buttonSkinConfig.backgroundGradient != null) {
      return _createGradientButtonDecoration();
    } else {
      return _createImageButtonDecoration(buttonSkinConfig);
    }
  }

  BoxDecoration? _createImageButtonDecoration(
      ButtonSkinConfig buttonSkinConfig) {
    return BoxDecoration(
        boxShadow: _createImageButtonShadow(buttonSkinConfig),
        borderRadius:
            BorderRadius.circular(widget.buttonSkinConfig.borderRadius));
  }

  BoxDecoration? _createGradientButtonDecoration() {
    ButtonSkinConfig buttonSkinConfig;
    if (widget.disabled) {
      buttonSkinConfig = _createDisabledButtonSkinConfig();
    } else {
      buttonSkinConfig = widget.buttonSkinConfig;
    }

    Color borderColor = widget.pressed
        ? ColorUtil.colorDarken(buttonSkinConfig.borderColor)
        : buttonSkinConfig.borderColor;

    return BoxDecoration(
        boxShadow: _createButtonShadow(buttonSkinConfig),
        borderRadius:
            BorderRadius.circular(widget.buttonSkinConfig.borderRadius),
        gradient: widget.pressed
            ? buttonSkinConfig.backgroundGradient == null
                ? null
                : _createPressedBackgroundGradient(
                    buttonSkinConfig.backgroundGradient!)
            : buttonSkinConfig.backgroundGradient,
        border: Border.all(
            color: borderColor, width: buttonSkinConfig.borderWidth));
  }

  List<BoxShadow> _createImageButtonShadow(ButtonSkinConfig buttonSkinConfig) {
    var buttonShadow = _getButtonShadow();
    var boxShadowColor = widget.pressed
        ? buttonSkinConfig.buttonPressedShadowColor ??
            buttonShadow.withOpacity(0.6)
        : buttonSkinConfig.buttonUnpressedShadowColor ??
            buttonShadow.withOpacity(0.2);
    var boxShadow = BoxShadow(
        color: boxShadowColor,
        spreadRadius: FontConfig.standardShadowRadius,
        blurRadius: FontConfig.standardShadowRadius);
    return [boxShadow];
  }

  Color _getButtonShadow() {
    return MyApp.appId.gameConfig.isLightScreenContrast
        ? Colors.grey
        : Colors.black;
  }

  List<BoxShadow> _createButtonShadow(ButtonSkinConfig buttonSkinConfig) {
    var buttonShadow = _getButtonShadow();
    var boxShadow = BoxShadow(
      color: widget.pressed
          ? buttonSkinConfig.buttonPressedShadowColor ??
              buttonShadow.withOpacity(0.9)
          : buttonSkinConfig.buttonUnpressedShadowColor ??
              buttonShadow.withOpacity(0.9),
      spreadRadius: widget.disabled
          ? 0
          : widget.pressed
              ? 1
              : 3,
      blurRadius: widget.pressed
          ? FontConfig.standardShadowOffset
          : FontConfig.standardShadowOffset * 2,
      offset: Offset(
          0,
          widget.pressed
              ? 0
              : FontConfig.standardShadowOffset), // changes position of shadow
    );

    return [boxShadow];
  }

  RadialGradient _createPressedBackgroundGradient(Gradient backgroundGradient) {
    var darken = ColorUtil.colorDarken(backgroundGradient.colors.first, 0.05);
    return RadialGradient(
        colors: [darken, darken],
        stops: backgroundGradient.stops,
        transform: backgroundGradient.transform);
  }

  ButtonSkinConfig _createDisabledButtonSkinConfig() {
    Color borderColor =
        widget.buttonSkinConfig.borderColor == Colors.transparent
            ? Colors.transparent
            : ColorUtil.colorDarken(widget.disabledBackgroundColor, 0.2);
    return ButtonSkinConfig(
        backgroundColor: widget.disabledBackgroundColor,
        buttonPressedShadowColor:
            widget.buttonSkinConfig.buttonPressedShadowColor,
        buttonUnpressedShadowColor:
            widget.buttonSkinConfig.buttonUnpressedShadowColor,
        borderColor: borderColor,
        borderWidth: widget.buttonSkinConfig.borderWidth);
  }
}

class ContentLockedConfig {
  bool isContentLocked;
  VoidCallback? executeAfterPurchase;
  Image? lockedIcon;

  ContentLockedConfig(
      {required this.isContentLocked,
      this.lockedIcon,
      this.executeAfterPurchase});
}
