import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import '../../main.dart';
import '../Popup/in_app_purchase_popup.dart';
import 'button_size.dart';

//ignore: must_be_immutable
class MyButton extends StatefulWidget {
  late final FontConfig fontConfig;
  late final ButtonSkinConfig disabledButtonSkinConfig;
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
    VoidCallback? onClick,
    Size? size,
    double? fontSize,
    double? width,
    FontConfig? fontConfig,
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    ButtonSkinConfig? disabledButtonSkinConfig,
    ButtonSkinConfig? buttonSkinConfig,
    ContentLockedConfig? contentLockedConfig,
    Widget? customContent,
  }) : super(key: key) {
    this.size = _getSize(size, width);
    this.fontConfig = fontConfig ?? FontConfig(fontSize: fontSize);
    this.contentLockedConfig =
        contentLockedConfig ?? ContentLockedConfig(isContentLocked: false);
    this.onClick = this.contentLockedConfig.isContentLocked
        ? _onClickContentLocked
        : onClick ?? () {};
    touchable = !disabled || this.contentLockedConfig.isContentLocked
        ? touchable
        : false;
    this.buttonSkinConfig =
        buttonSkinConfig ?? _createButtonSkinConfig(backgroundColor);
    this.disabledButtonSkinConfig = disabledButtonSkinConfig ??
        _createDisabledButtonSkinConfig(disabledBackgroundColor);
    this.customContent = customContent ?? _createCustomContent();
  }

  _onClickContentLocked() {
    InAppPurchasesPopupService().showPopup(
        executeAfterPurchase: contentLockedConfig.executeAfterPurchase);
  }

  ButtonSkinConfig _createButtonSkinConfig(Color? backgroundColor) {
    return ButtonSkinConfig(
        backgroundColor: backgroundColor ?? Colors.lightBlueAccent.shade200);
  }

  ButtonSkinConfig _createDisabledButtonSkinConfig(
      Color? disabledBackgroundColor) {
    var disabledButtonDefaultColor =
        disabledBackgroundColor ?? Colors.grey.shade400;
    return ButtonSkinConfig(
        backgroundColor: disabledButtonDefaultColor,
        buttonPressedShadowColor: buttonSkinConfig.buttonPressedShadowColor,
        buttonUnpressedShadowColor: buttonSkinConfig.buttonUnpressedShadowColor,
        borderColor: buttonSkinConfig.borderColor == Colors.transparent
            ? Colors.transparent
            : ColorUtil.colorDarken(disabledButtonDefaultColor, 0.2),
        borderWidth: buttonSkinConfig.borderWidth);
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
    if ((text ?? "").isNotEmpty && buttonSkinConfig.image != null) {
      var labelContainerDecoration = BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(FontConfig.standardBorderRadius),
      );
      var labelWithPadding = Padding(
        padding: EdgeInsets.all(FontConfig.standardMinMargin),
        child: _createMyText(),
      );
      var bottomMargin = SizedBox(
        height: size.height / 2.5,
      );
      var labelContainer = Container(
        height: size.height / 4,
        decoration: labelContainerDecoration,
        child: labelWithPadding,
      );
      var labelContainerWithMargin = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [bottomMargin, labelContainer],
      );
      return SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            buttonSkinConfig.image!,
            labelContainerWithMargin,
          ],
        ),
      );
    } else if ((text ?? "").isNotEmpty) {
      return _createMyText();
    } else if (buttonSkinConfig.image != null) {
      return _createImageButtonContent();
    } else {
      return Container();
    }
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
      buttonSkinConfig = widget.disabledButtonSkinConfig;
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
