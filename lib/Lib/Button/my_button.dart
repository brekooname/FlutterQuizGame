import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/in_app_purchases_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'button_size.dart';

class MyButton extends StatefulWidget {
  ButtonSize _buttonSize = ButtonSize();
  ImageService _imageService = ImageService();

  late FontConfig fontConfig;
  late Color disabledBackgroundColor;
  late ButtonSkinConfig buttonSkinConfig;
  late VoidCallback onClick;
  late Size size;
  Widget? customContent;

  bool pressed = false;
  bool disabled;
  bool contentLocked;

  String? text;

  MyButton({
    Key? key,
    this.text,
    this.disabled = false,
    this.contentLocked = false,
    Color? disabledBackgroundColor,
    VoidCallback? onClick,
    Size? size,
    FontConfig? fontConfig,
    Color? backgroundColor,
    ButtonSkinConfig? buttonSkinConfig,
    this.customContent,
  }) : super(key: key) {
    this.size = size ?? _buttonSize.normalSize;
    this.fontConfig = fontConfig ?? FontConfig();
    this.onClick = onClick ?? () {};
    this.buttonSkinConfig = buttonSkinConfig ??
        ButtonSkinConfig(
            backgroundColor:
                backgroundColor ?? Colors.lightBlueAccent.shade200);

    this.disabledBackgroundColor =
        disabledBackgroundColor ?? Colors.grey.shade400;

    if (this.customContent == null && this.text != null) {
      this.customContent = MyText(
        text: this.text!,
        maxLines: 2,
        width: this.size.width / 1.1,
      );
    } else if (this.buttonSkinConfig.image != null) {
      this.customContent = createImageButtonContent();
    }
  }

  Widget createImageButtonContent() {
    return disabled
        ? ColorUtil.imageToGreyScale(this.buttonSkinConfig.image!)
        : this.buttonSkinConfig.image!;
  }

  @override
  State<MyButton> createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    Widget buttonContent;
    if (widget.pressed && widget.buttonSkinConfig.image != null) {
      buttonContent = ColorUtil.imageDarken(widget.buttonSkinConfig.image!);
    } else {
      buttonContent = widget.customContent ?? Container();
    }

    if (widget.contentLocked) {
      buttonContent = buildContentLocked(buttonContent);
      widget.onClick = () {
        InAppPurchasesPopupService(buildContext: context).showPopup("abc");
      };
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
              children: [buttonContent],
            )));
  }

  Widget buildContentLocked(Widget buttonContent) {
    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(FontConfig.getStandardBorderRadius()),
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
          toAnimateWidget: widget._imageService.getMainImage(
              imageName: "btn_locked",
              module: "buttons",
              maxHeight: lockedImageSide))
    ]);
    return stack;
  }

  BoxDecoration? createButtonDecoration() {
    if (widget.buttonSkinConfig.backgroundGradient != null) {
      return createGradientButtonDecoration();
    } else {
      return createImageButtonDecoration();
    }
  }

  BoxDecoration? createImageButtonDecoration() {
    return BoxDecoration(
        boxShadow: [createImageButtonShadow()],
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

  BoxShadow createImageButtonShadow() {
    return BoxShadow(
        color: widget.pressed
            ? Colors.grey.withOpacity(0.6)
            : Colors.grey.withOpacity(0.2),
        spreadRadius: FontConfig.getStandardShadowRadius(),
        blurRadius: FontConfig.getStandardShadowRadius());
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
