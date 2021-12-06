import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';

class MyButton extends StatefulWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  late FontConfig fontConfig;

  late Color disabledBackgroundColor;

  late ButtonSkinConfig buttonSkinConfig;

  late VoidCallback onClick;

  bool pressed = false;
  late Size size;
  bool disabled;

  String? text;

  List<Widget>? customContent;

  MyButton({
    Key? key,
    this.text,
    this.disabled = false,
    Color? disabledBackgroundColor,
    VoidCallback? onClick,
    Size? size,
    FontConfig? fontConfig,
    Color? backgroundColor,
    ButtonSkinConfig? buttonSkinConfig,
    this.customContent,
  }) : super(key: key) {
    this.size = size??Size(screenDimensions.w(50), screenDimensions.h(12));
    this.fontConfig = fontConfig ?? FontConfig();

    this.buttonSkinConfig = buttonSkinConfig ??
        ButtonSkinConfig(
            backgroundColor:
                backgroundColor ?? Colors.lightBlueAccent.shade200);

    this.onClick = onClick ?? () {};

    this.disabledBackgroundColor =
        disabledBackgroundColor ?? Colors.grey.shade400;

    if (this.customContent == null && this.text != null) {
      this.customContent = [MyText(text: this.text!)];
    } else if (this.buttonSkinConfig.icon != null) {
      this.customContent = [
        disabled
            ? ColorUtil.imageToGreyScale(this.buttonSkinConfig.icon!)
            : this.buttonSkinConfig.icon!
      ];
    }
  }

  @override
  State<MyButton> createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buttonContent;
    if (widget.pressed && widget.buttonSkinConfig.icon != null) {
      buttonContent = [ColorUtil.imageDarken(widget.buttonSkinConfig.icon!)];
    } else {
      buttonContent = widget.customContent ?? [Container()];
    }

    return GestureDetector(
        onTapCancel: () {
          if (!widget.disabled) {
            setState(() {
              widget.pressed = false;
            });
          }
        },
        onTapUp: (TapUpDetails details) {
          if (!widget.disabled) {
            setState(() {
              widget.onClick.call();
              widget.pressed = false;
            });
          }
        },
        onTapDown: (TapDownDetails details) {
          if (!widget.disabled) {
            setState(() {
              widget.pressed = true;
            });
          }
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: widget.size.width,
            height: widget.size.height,
            decoration: createButtonDecoration(),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttonContent,
            )));
  }

  BoxDecoration? createButtonDecoration() {
    if (widget.buttonSkinConfig.backgroundGradient != null) {
      return createGradientButtonDecoration();
    } else {
      return createIconButtonDecoration();
    }
  }

  BoxDecoration? createIconButtonDecoration() {
    return BoxDecoration(
        boxShadow: [createIconButtonShadow()],
        borderRadius:
            BorderRadius.circular(FontConfig.getStandardBorderRadius()));
  }

  BoxDecoration? createGradientButtonDecoration() {
    ButtonSkinConfig buttonSkinConfig;
    if (widget.disabled) {
      buttonSkinConfig = createDisabledButtonSkinConfig();
    } else {
      buttonSkinConfig = widget.buttonSkinConfig;
    }

    Color borderColor = widget.pressed
        ? ColorUtil.colorDarken(
            buttonSkinConfig.borderColor ?? Colors.transparent)
        : buttonSkinConfig.borderColor ?? Colors.transparent;

    return BoxDecoration(
        boxShadow: [createButtonShadow()],
        borderRadius:
            BorderRadius.circular(FontConfig.getStandardBorderRadius()),
        gradient: widget.pressed
            ? buttonSkinConfig.backgroundGradient == null
                ? null
                : createPressedBackgroundGradient(
                    buttonSkinConfig.backgroundGradient!)
            : buttonSkinConfig.backgroundGradient,
        border: Border.all(
            color: borderColor, width: buttonSkinConfig.borderWidth));
  }

  BoxShadow createIconButtonShadow() {
    return BoxShadow(
      color: widget.pressed
          ? Colors.grey.withOpacity(0.5)
          : Colors.grey.withOpacity(0.3),
      spreadRadius: 0.2,
      blurRadius: FontConfig.getStandardShadowOffset(),
      offset: Offset(
          0,
          widget.pressed
              ? 0
              : FontConfig
                  .getStandardShadowOffset()), // changes position of shadow
    );
  }

  BoxShadow createButtonShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.9),
      spreadRadius: widget.disabled
          ? 0
          : widget.pressed
              ? 1
              : 3,
      blurRadius: widget.pressed
          ? FontConfig.getStandardShadowOffset()
          : FontConfig.getStandardShadowOffset() * 2,
      offset: Offset(
          0,
          widget.pressed
              ? 0
              : FontConfig
                  .getStandardShadowOffset()), // changes position of shadow
    );
  }

  RadialGradient createPressedBackgroundGradient(Gradient backgroundGradient) {
    var darken = ColorUtil.colorDarken(backgroundGradient.colors.first, 0.05);
    return RadialGradient(
        colors: [darken, darken],
        stops: backgroundGradient.stops,
        transform: backgroundGradient.transform);
  }

  ButtonSkinConfig createDisabledButtonSkinConfig() {
    Color borderColor =
        widget.buttonSkinConfig.borderColor == Colors.transparent
            ? Colors.transparent
            : ColorUtil.colorDarken(widget.disabledBackgroundColor, 0.2);
    return ButtonSkinConfig(
        backgroundColor: widget.disabledBackgroundColor,
        borderColor: borderColor,
        borderWidth: widget.buttonSkinConfig.borderWidth);
  }
}
