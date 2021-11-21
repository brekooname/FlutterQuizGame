import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Components/Text/my_text.dart';

import '../../Components/Button/button_skin_config.dart';
import '../../Components/Font/font_config.dart';

class MyButton extends StatefulWidget {
  late Color disabledBackgroundColor;

  bool pressed = false;
  VoidCallback onClick;
  FontConfig fontConfig;
  ButtonSkinConfig buttonSkinConfig;
  double width;
  double height;
  bool disabled;

  String? text;

  List<Widget>? customContent;

  MyButton({
    Key? key,
    this.text,
    required this.width,
    required this.height,
    this.disabled = false,
    Color? disabledBackgroundColor,
    required this.onClick,
    required this.fontConfig,
    required this.buttonSkinConfig,
    this.customContent,
  }) : super(key: key) {
    this.disabledBackgroundColor = disabledBackgroundColor == null
        ? Colors.grey.shade400
        : disabledBackgroundColor;
    if (this.customContent == null && this.text != null) {
      this.customContent = [MyText(text: this.text!)];
    } else if (buttonSkinConfig.icon != null) {
      this.customContent = [
        disabled
            ? ColorUtil.imageToGreyScale(buttonSkinConfig.icon!)
            : buttonSkinConfig.icon!
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
      buttonContent = [
        ColorUtil.imageDarken(widget.buttonSkinConfig.icon!)
      ];
    } else {
      buttonContent = widget.customContent!;
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
            width: widget.width,
            height: widget.height,
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
        borderRadius: BorderRadius.circular(25));
  }

  BoxDecoration? createGradientButtonDecoration() {
    var buttonSkinConfig;
    if (widget.disabled) {
      buttonSkinConfig = createDisabledButtonSkinConfig();
    } else {
      buttonSkinConfig = widget.buttonSkinConfig;
    }
    return BoxDecoration(
        boxShadow: [createButtonShadow()],
        borderRadius: BorderRadius.circular(25),
        gradient: widget.pressed
            ? createPressedBackgroundGradient()
            : buttonSkinConfig.backgroundGradient,
        border: Border.all(
            color: widget.pressed
                ? ColorUtil.colorDarken(buttonSkinConfig.borderColor)
                : buttonSkinConfig.borderColor,
            width: buttonSkinConfig.borderWidth));
  }

  BoxShadow createIconButtonShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 0.2,
      blurRadius: 2,
      offset: Offset(0, widget.pressed ? 0 : 3), // changes position of shadow
    );
  }

  BoxShadow createButtonShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.9),
      spreadRadius: widget.disabled
          ? 0
          : widget.pressed
              ? 2
              : 5,
      blurRadius: widget.pressed ? 4 : 7,
      offset: Offset(0, widget.pressed ? 0 : 3), // changes position of shadow
    );
  }

  RadialGradient createPressedBackgroundGradient() {
    var darken = ColorUtil.colorDarken(
        widget.buttonSkinConfig.backgroundGradient!.colors.first, 0.05);
    return RadialGradient(
        colors: [darken, darken],
        stops: widget.buttonSkinConfig.backgroundGradient!.stops,
        transform: widget.buttonSkinConfig.backgroundGradient!.transform);
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
