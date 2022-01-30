import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/reset_content_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

import '../../main.dart';
import 'in_app_purchase_popup.dart';
import 'my_popup.dart';

class SettingsPopup extends StatefulWidget with MyPopup {
  late SettingsLocalStorage _settingsLocalStorage;
  VoidCallback? resetContent;

  SettingsPopup({Key? key, VoidCallback? resetContent}) : super(key: key) {
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
    initPopup();
    var sideDimen = screenDimensions.dimen(20);
    soundOn = imageService.getMainImage(
        imageName: "btn_sound_on",
        imageExtension: "png",
        module: "buttons",
        maxWidth: sideDimen,
        maxHeight: sideDimen);
    soundOff = imageService.getMainImage(
        imageName: "btn_sound_off",
        imageExtension: "png",
        module: "buttons",
        maxWidth: sideDimen,
        maxHeight: sideDimen);
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
    List<Widget> settingsChildren = [];
    settingsChildren.addAll([
      soundOnOffButton(context),
      rowVerticalMargin,
      Divider(
        height: screenDimensions.dimen(0.5),
        thickness: screenDimensions.dimen(0.5),
        color: Colors.grey,
      )
    ]);
    if (MyApp.isExtraContentLocked) {
      settingsChildren.addAll([
        rowVerticalMargin,
        removeAdsButton(context),
      ]);
    }
    settingsChildren.addAll([
      rowVerticalMargin,
      deleteProgressButton(context),
    ]);
    return createDialog(
      Column(
        children: settingsChildren,
      ),
      context: context,
    );
  }

  Row soundOnOffButton(BuildContext context) {
    var switchDimen = screenDimensions.dimen(17);
    var soundImgDimen = screenDimensions.dimen(15);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: soundImgDimen,
              width: soundImgDimen,
              child: FittedBox(
                  child: widget._settingsLocalStorage.isSoundOn()
                      ? soundOn
                      : soundOff)),
          SizedBox(
              height: switchDimen,
              width: switchDimen,
              child: FittedBox(
                  child: CupertinoSwitch(
                value: widget._settingsLocalStorage.isSoundOn(),
                onChanged: (value) {
                  setState(() {
                    widget._settingsLocalStorage.toggleSound();
                    Future.delayed(const Duration(milliseconds: 300),
                        () => closePopup(context));
                  });
                },
              ))),
        ]);
  }

  MyButton deleteProgressButton(BuildContext context) {
    return MyButton(
      text: label.l_delete_progress,
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
    );
  }

  MyButton removeAdsButton(BuildContext context) {
    return MyButton(
      text: label.l_remove_ads,
      backgroundColor: Colors.green.shade200,
      onClick: () {
        closePopup(context);
        InAppPurchasesPopupService(buildContext: context).showPopup();
      },
    );
  }
}
