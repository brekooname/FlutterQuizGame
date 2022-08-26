import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/reset_content_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

import '../../main.dart';
import 'in_app_purchase_popup.dart';
import 'my_popup.dart';

class SettingsPopup extends StatefulWidget {
  late SettingsLocalStorage _settingsLocalStorage;
  final MyAudioPlayer _myAudioPlayer = MyAudioPlayer();
  VoidCallback? resetContent;

  SettingsPopup({Key? key, VoidCallback? resetContent}) : super(key: key) {
    _settingsLocalStorage = SettingsLocalStorage();
    this.resetContent = resetContent;
  }

  @override
  State<SettingsPopup> createState() => SettingsPopupState();
}

class SettingsPopupState extends State<SettingsPopup> with MyPopup, LabelMixin {
  late Image soundOn;
  late Image soundOff;
  late Image musicOn;
  late Image musicOff;

  @override
  void initState() {
    initPopup();
    var sideDimen = screenDimensions.dimen(20);
    soundOn = imageService.getMainImage(
        imageName: MyApp.appId.gameConfig.isLightScreenContrast
            ? "btn_sound_on_light_contrast"
            : "btn_sound_on_dark_contrast",
        imageExtension: "png",
        module: "buttons",
        maxWidth: sideDimen,
        maxHeight: sideDimen);
    soundOff = imageService.getMainImage(
        imageName: MyApp.appId.gameConfig.isLightScreenContrast
            ? "btn_sound_off_light_contrast"
            : "btn_sound_off_dark_contrast",
        imageExtension: "png",
        module: "buttons",
        maxWidth: sideDimen,
        maxHeight: sideDimen);
    musicOn = imageService.getMainImage(
        imageName: "btn_music_on",
        imageExtension: "png",
        module: "buttons",
        maxWidth: sideDimen,
        maxHeight: sideDimen);
    musicOff = imageService.getMainImage(
        imageName: "btn_music_off",
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
    precacheImage(musicOn.image, context);
    precacheImage(musicOff.image, context);
  }

  @override
  AlertDialog build(BuildContext context) {
    List<Widget> settingsChildren = [];
    settingsChildren.addAll([
      _createMusicSoundOnOffButton(
          context, soundOn, soundOff, widget._settingsLocalStorage.isSoundOn(),
          () {
        widget._settingsLocalStorage.toggleSound();
      }),
      MyApp.appId.gameConfig.hasBackgroundMusic ? margin : Container(),
      MyApp.appId.gameConfig.hasBackgroundMusic
          ? _createMusicSoundOnOffButton(context, musicOn, musicOff,
              widget._settingsLocalStorage.isMusicOn(), () {
              widget._settingsLocalStorage.toggleMusic();
              if (widget._settingsLocalStorage.isMusicOn()) {
                widget._myAudioPlayer.playBackgroundMusic();
              } else {
                widget._myAudioPlayer.stopBackgroundMusic();
              }
            })
          : Container(),
      margin,
      Divider(
        height: screenDimensions.dimen(0.5),
        thickness: screenDimensions.dimen(0.5),
        color: Colors.grey,
      )
    ]);
    List<Widget> settingsButtons = [];
    if (MyApp.isExtraContentLocked) {
      settingsButtons.addAll([
        _removeAdsButton(context),
        margin,
      ]);
    }
    settingsButtons.addAll([
      _deleteProgressButton(context),
    ]);
    settingsChildren.addAll([
      margin,
      ScreenDimensionsService.isPortrait()
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: settingsButtons,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: settingsButtons,
            )
    ]);
    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: settingsChildren,
      ),
      context: context,
    );
  }

  Row _createMusicSoundOnOffButton(
      BuildContext context,
      Image controlOn,
      Image controlOff,
      bool isControlOn,
      VoidCallback toggleControlOnOffSwitchPress) {
    var switchDimen = screenDimensions.dimen(17);
    var soundImgDimen = screenDimensions.dimen(15);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: soundImgDimen,
              width: soundImgDimen,
              child: FittedBox(child: isControlOn ? controlOn : controlOff)),
          SizedBox(
              height: switchDimen,
              width: switchDimen,
              child: FittedBox(
                  child: CupertinoSwitch(
                value: isControlOn,
                onChanged: (value) {
                  setState(() {
                    toggleControlOnOffSwitchPress.call();
                    Future.delayed(const Duration(milliseconds: 300),
                        () => closePopup(context));
                  });
                },
              ))),
        ]);
  }

  MyButton _deleteProgressButton(BuildContext context) {
    return MyButton(
      text: label.l_delete_progress,
      backgroundColor: Colors.red.shade200,
      onClick: () {
        closePopup(context);
        assert(widget.resetContent != null);
        MyPopup.showPopup(context, ResetContentPopup(widget.resetContent!));
      },
    );
  }

  MyButton _removeAdsButton(BuildContext context) {
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
