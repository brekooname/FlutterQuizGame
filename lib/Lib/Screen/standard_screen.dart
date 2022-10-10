import 'package:flutter/material.dart';

import '../../main.dart';
import '../Ads/ad_service.dart';
import '../Audio/my_audio_player.dart';
import '../Image/image_service.dart';
import '../ScreenDimensions/screen_dimensions_service.dart';
import 'Game/game_screen_manager_state.dart';

abstract class StandardScreen<
        TGameScreenManagerState extends GameScreenManagerState>
    extends StatefulWidget {
  final ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  final MyAudioPlayer audioPlayer = MyAudioPlayer();
  final ImageService imageService = ImageService();
  final AdService adService = AdService();

  final TGameScreenManagerState gameScreenManagerState;

  StandardScreen(this.gameScreenManagerState, {Key? key}) : super(key: key);

  Color? get screenBackgroundColor => null;

  Gradient? get screenBackgroundGradient => null;

  ImageRepeat? get backgroundTextureRepeat =>
      MyApp.appId.gameConfig.backgroundTextureRepeat;
}
