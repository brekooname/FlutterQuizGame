import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/settings_local_storage.dart';

class MyAudioPlayer {
  late AssetsService _assetsService;
  late SettingsLocalStorage _settingsLocalStorage;

  static final MyAudioPlayer singleton = MyAudioPlayer.internal();

  factory MyAudioPlayer() {
    singleton._assetsService = AssetsService();
    singleton._settingsLocalStorage = SettingsLocalStorage();
    return singleton;
  }

  MyAudioPlayer.internal();

  Future<void> playSuccess(
      {String? audioPlayerId, bool loop = false, double? playSpeed}) async {
    await _playSound(
        assetName: "level_success",
        loop: loop,
        audioPlayerId: audioPlayerId,
        playSpeed: playSpeed);
  }

  Future<void> playFail() async {
    await _playSound(assetName: "level_fail");
  }

  Future<void> playClick() async {
    await _playSound(assetName: "click");
  }

  Future<void> stop({String? audioPlayerId}) async {
    var assetsAudioPlayer = _getAssetsAudioPlayer(audioPlayerId);
    if (assetsAudioPlayer.isPlaying.value) {
      return await assetsAudioPlayer.stop();
    }
  }

  Future<void> _playSound(
      {String? audioPlayerId,
      required String assetName,
      bool loop = false,
      double? playSpeed}) async {
    if (!_settingsLocalStorage.isSoundOn()) {
      return;
    }
    var volume = 0.5;
    _getAssetsAudioPlayer(audioPlayerId).open(Audio(_mp3path(assetName)),
        loopMode: loop ? LoopMode.playlist : LoopMode.none,
        playSpeed: playSpeed ?? 1,
        volume: volume);
  }

  AssetsAudioPlayer _getAssetsAudioPlayer(String? audioPlayerId) =>
      AssetsAudioPlayer.withId(audioPlayerId ?? _defaultAudioPlayerId());

  String _defaultAudioPlayerId() => "audio";

  String _mp3path(String assetName) {
    var assetPath = _assetsService.getMainAssetPath(
        module: "audio", assetName: assetName, assetExtension: "mp3");
    return assetPath;
  }
}
