import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

class MyAudioPlayer {
  late AssetsService _assetsService;
  late SettingsLocalStorage _settingsLocalStorage;

  late AssetsAudioPlayer _assetsAudioPlayer;

  static final MyAudioPlayer singleton = MyAudioPlayer.internal();

  factory MyAudioPlayer() {
    singleton._assetsService = AssetsService();
    singleton._settingsLocalStorage = SettingsLocalStorage();
    singleton._assetsAudioPlayer = AssetsAudioPlayer.withId('audio');
    return singleton;
  }

  MyAudioPlayer.internal();

  Future<void> playSuccess({bool loop = false, double? playSpeed}) async {
    await playSound("level_success", loop, playSpeed);
  }

  Future<void> playFail() async {
    await playSound("level_fail", false, null);
  }

  Future<void> playSound(String assetName, bool loop, double? playSpeed) async {
    var volume = 0.5;
    if (!_settingsLocalStorage.isSoundOn()) {
      volume = 0;
    }
    _assetsAudioPlayer.open(
        Audio(_mp3path(singleton._assetsService, assetName)),
        loopMode: loop ? LoopMode.playlist : LoopMode.none,
        playSpeed: playSpeed ?? 1,
        volume: volume);
  }

  void stop() async {
    if (_assetsAudioPlayer.isPlaying.value) {
      await _assetsAudioPlayer.stop();
    }
  }

  static String _mp3path(AssetsService assetsService, String assetName) {
    var assetPath = assetsService.getMainAssetPath(
        module: "audio", assetName: assetName, assetExtension: "mp3");
    return assetPath;
  }
}
