import 'package:audioplayers/audioplayers.dart';

import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

class MyAudioPlayer {
  late AssetsService _assetsService;
  late SettingsLocalStorage _settingsLocalStorage;

  static final MyAudioPlayer singleton = MyAudioPlayer.internal();

  factory MyAudioPlayer() {
    singleton._assetsService = AssetsService();
    singleton._settingsLocalStorage =
        SettingsLocalStorage();
    return singleton;
  }

  MyAudioPlayer.internal();

  void playSuccess() async {
    playSound("level_success");
  }

  void playFail() async {
    playSound("level_fail");
  }

  void playSound(String assetName) async {
    if (!_settingsLocalStorage.isSoundOn()) {
      return;
    }
    var assetPath = _assetsService.getMainAssetPath(
        module: "audio", assetName: assetName, assetExtension: "mp3");
    var volume = 0.5;
    if (kIsWeb) {
      AudioPlayer audioPlayer = AudioPlayer();
      await audioPlayer.play(assetPath, isLocal: true, volume: volume);
    } else {
      AudioCache player = AudioCache();
      player.play(assetPath, volume: volume);
    }
  }
}
