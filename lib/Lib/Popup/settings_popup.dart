import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

import 'my_popup.dart';

class SettingsPopup extends StatefulWidget with MyPopup {
  late SettingsLocalStorage _settingsLocalStorage;
  ButtonSize buttonSize = ButtonSize();

  SettingsPopup() {
    _settingsLocalStorage = SettingsLocalStorage();
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
  AlertDialog build(BuildContext context) {
    initPopup(context);

    return createDialog(Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget._settingsLocalStorage.isSoundOn() ? soundOn : soundOff,
            CupertinoSwitch(
              value: widget._settingsLocalStorage.isSoundOn(),
              onChanged: (value) {
                setState(() {
                  widget._settingsLocalStorage.toggleSound();
                  Future.delayed(Duration(milliseconds: 300),
                      () => navigatorService.pop(context));
                });
              },
            ),
          ]),
    ]));
  }
}
