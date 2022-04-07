import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/in_app_purchase_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'button_size.dart';

class MyButton extends StatefulWidget {
  final ButtonSize _buttonSize = ButtonSize();
  final ImageService _imageService = ImageService();

  late FontConfig fontConfig;
  late Color disabledBackgroundColor;
  late ButtonSkinConfig buttonSkinConfig;
  late VoidCallback onClick;
  late Size size;
  late ContentLockedConfig contentLockedConfig;
  Widget? customContent;

  bool pressed = false;
  bool disabled;
  bool visible;

  double buttonAllPadding;

  String? text;
  int textMaxLines;

  MyButton({
    Key? key,
    this.text,
    this.textMaxLines = 2,
    this.buttonAllPadding = 0,
    this.disabled = false,
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
    this.customContent,
  }) : super(key: key) {
    this.size = size == null
        ? width == null
            ? _buttonSize.normalSize
            : Size(width, _buttonSize.normalSize.height)
        : size;
    this.fontConfig = fontConfig ?? FontConfig(fontSize: fontSize);
    this.onClick = onClick ?? () {};
    this.contentLockedConfig =
        contentLockedConfig ?? ContentLockedConfig(isContentLocked: false);
    this.buttonSkinConfig = buttonSkinConfig ??
        ButtonSkinConfig(
            backgroundColor:
                backgroundColor ?? Colors.lightBlueAccent.shade200);

    this.disabledBackgroundColor =
        disabledBackgroundColor ?? Colors.grey.shade400;

    if (customContent == null && text != null) {
      customContent = MyText(
        text: text!,
        fontConfig: this.fontConfig,
        maxLines: textMaxLines,
        width: this.size.width / 1.05,
      );
    } else {
      if (this.buttonSkinConfig.image != null) {
        customContent = createImageButtonContent();
      }
    }
  }

  Widget createImageButtonContent() {
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
    if (widget.pressed && widget.buttonSkinConfig.image != null) {
      buttonContent = ColorUtil.imageDarken(widget.buttonSkinConfig.image!);
    } else {
      buttonContent = widget.customContent ?? Container();
    }

    if (widget.contentLockedConfig.isContentLocked) {
      if (widget.contentLockedConfig.contentLockedMode ==
          ContentLockedMode.contentLockedButtonLock) {
        buttonContent = buildContentLocked(buttonContent);
      }
      widget.onClick = () {
        InAppPurchasesPopupService(buildContext: context).showPopup();
      };
    }

    return Visibility(
      visible: widget.visible,
      child: Padding(
          padding: EdgeInsets.all(widget.buttonAllPadding),
          child: GestureDetector(
              onTapCancel: () {
                if (isTouchEnabled()) {
                  setState(() {
                    widget.pressed = false;
                  });
                }
              },
              onTapUp: (TapUpDetails details) {
                if (isTouchEnabled()) {
                  setState(() {
                    widget.onClick.call();
                    widget.pressed = false;
                  });
                }
              },
              onTapDown: (TapDownDetails details) {
                if (isTouchEnabled()) {
                  setState(() {
                    widget.pressed = true;
                  });
                }
              },
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: widget.size.width,
                  height: widget.size.height,
                  decoration: createButtonDecoration(),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [buttonContent],
                  )))),
    );
  }

  bool isTouchEnabled() =>
      !widget.disabled || widget.contentLockedConfig.isContentLocked;

  Widget buildContentLocked(Widget buttonContent) {
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
          toAnimateWidget: widget._imageService.getMainImage(
              imageName: "btn_locked",
              module: "buttons",
              imageExtension: "png",
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
            BorderRadius.circular(widget.buttonSkinConfig.borderRadius));
  }

  BoxDecoration? createGradientButtonDecoration() {
    ButtonSkinConfig buttonSkinConfig;
    if (widget.disabled) {
      buttonSkinConfig = createDisabledButtonSkinConfig();
    } else {
      buttonSkinConfig = widget.buttonSkinConfig;
    }

    Color borderColor = widget.pressed
        ? ColorUtil.colorDarken(buttonSkinConfig.borderColor)
        : buttonSkinConfig.borderColor;

    return BoxDecoration(
        boxShadow: [createButtonShadow()],
        borderRadius:
            BorderRadius.circular(widget.buttonSkinConfig.borderRadius),
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
        spreadRadius: FontConfig.standardShadowRadius,
        blurRadius: FontConfig.standardShadowRadius);
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
          ? FontConfig.standardShadowOffset
          : FontConfig.standardShadowOffset * 2,
      offset: Offset(
          0,
          widget.pressed
              ? 0
              : FontConfig.standardShadowOffset), // changes position of shadow
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

class ContentLockedConfig {
  bool isContentLocked;
  late ContentLockedMode contentLockedMode;

  ContentLockedConfig(
      {required this.isContentLocked, ContentLockedMode? contentLockedMode}) {
    if (isContentLocked) {
      this.contentLockedMode =
          contentLockedMode ?? ContentLockedMode.contentLockedButtonLock;
    } else {
      this.contentLockedMode = ContentLockedMode.contentUnlocked;
    }
  }
}

enum ContentLockedMode {
  contentLockedButtonLock,
  contentLockedButtonNormal,
  contentUnlocked
}
