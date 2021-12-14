import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/reset_content_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

import 'my_popup.dart';

class SettingsPopup extends StatefulWidget with MyPopup {
  late SettingsLocalStorage _settingsLocalStorage;
  ButtonSize buttonSize = ButtonSize();
  VoidCallback? resetContent;

  SettingsPopup({VoidCallback? resetContent}) {
    _settingsLocalStorage = SettingsLocalStorage();
    this.resetContent = resetContent;
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

    var vertMargin = screenDimensions.h(2);
    return createDialog(Column(
      children: [
        MyButton(
          text: "Delete progress",
          backgroundColor: Colors.red.shade200,
          onClick: () {
            closePopup(context);
            assert(widget.resetContent != null);
            Future.delayed(
                Duration.zero,
                    () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ResetContentPopup(widget.resetContent!);
                    }));
          },
        ),
        SizedBox(height: vertMargin * 2),
        Container(
          width: width,
          height: screenDimensions.h(0.2),
          color: Colors.grey,
        ),
        SizedBox(height: vertMargin * 2),
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
                    Future.delayed(
                        Duration(milliseconds: 300), () => closePopup(context));
                  });
                },
              ),
            ]),
      ],
    ));
  }
}
