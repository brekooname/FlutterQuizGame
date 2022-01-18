import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

class MyAudioPlayer {
  late AssetsService _assetsService;
  late SettingsLocalStorage _settingsLocalStorage;
  late AudioCache _audioCache;
  late AudioPlayer audioPlayer;

  static final MyAudioPlayer singleton = MyAudioPlayer.internal();

  factory MyAudioPlayer() {
    singleton._assetsService = AssetsService();
    singleton._settingsLocalStorage = SettingsLocalStorage();
    singleton.audioPlayer = AudioPlayer();
    singleton._audioCache =
        AudioCache(prefix: "", fixedPlayer: singleton.audioPlayer);
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
    var volume = 0.5;
    if (!_settingsLocalStorage.isSoundOn()) {
      volume = 0;
    }
    var assetPath = _assetsService.getMainAssetPath(
        module: "audio", assetName: assetName, assetExtension: "mp3");
    if (kIsWeb) {
      audioPlayer.play(assetPath, isLocal: true, volume: volume);
    } else {
      _audioCache.play(assetPath, volume: volume);
    }
  }
}
