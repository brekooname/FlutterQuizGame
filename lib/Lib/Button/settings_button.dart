import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'button_size.dart';
import 'my_button.dart';

class SettingsButton extends StatelessWidget {
  ImageService _imageService = ImageService();
  ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  late Size _button_size;
  MyAppContext myAppContext;

  SettingsButton({required BuildContext context, required this.myAppContext}) {
    var side = _screenDimensions.w(12);
    _button_size = Size(side, side);
  }

  @override
  Widget build(BuildContext context) {
    var btn = FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        foregroundColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {},
        child: MyButton(
            onClick: () {
              Future.delayed(
                  Duration.zero,
                  () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsPopup(myAppContext);
                      }));
            },
            size: _button_size,
            buttonSkinConfig: ButtonSkinConfig(
              icon: (_imageService.getMainImage(
                  imageName: "btn_settings",
                  module: "buttons",
                  maxWidth: _button_size.width)),
            ),
            fontConfig: FontConfig()));

    return btn;
  }
}

class SettingsPopup extends StatefulWidget with MyPopup {
  late SettingsLocalStorage _settingsLocalStorage;
  ButtonSize buttonSize = ButtonSize();

  SettingsPopup(MyAppContext myAppContext) {
    _settingsLocalStorage = SettingsLocalStorage(myAppContext: myAppContext);
  }

  @override
  State<SettingsPopup> createState() => SettingsPopupState();
}

class SettingsPopupState extends State<SettingsPopup> with MyPopup {
  late Image soundOn;
  late Image soundOff;

  @override
  void initState() {
    var sideDimen = screenDimensions.w(20);
    soundOn = imageService.getMainImage(
        imageName: "btn_sound_on", module: "buttons", maxWidth: sideDimen);
    soundOff = imageService.getMainImage(
        imageName: "btn_sound_off", module: "buttons", maxWidth: sideDimen);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(soundOn.image, context);
    precacheImage(soundOff.image, context);
  }

  @override
  Dialog build(BuildContext context) {
    initPopup(context);

    Size size = Size(screenDimensions.w(60), screenDimensions.h(40));

    return Dialog(
      child: Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(FontConfig.getStandardBorderRadius()),
              color: Colors.white),
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: screenDimensions.h(7), top: screenDimensions.h(7)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget._settingsLocalStorage.isSoundOn()
                          ? soundOn
                          : soundOff,
                      CupertinoSwitch(
                        value: widget._settingsLocalStorage.isSoundOn(),
                        onChanged: (value) {
                          setState(() {
                            widget._settingsLocalStorage.toggleSound();
                          });
                        },
                      ),
                    ])),
            MyButton(
              text: label.l_go_back,
              backgroundColor: Colors.grey.shade300,
              onClick: () {
                var nav = Navigator.of(context);
                nav.pop();
              },
            ),
          ])),
    );
  }
}
