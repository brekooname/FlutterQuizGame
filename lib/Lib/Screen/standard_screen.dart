import 'package:flutter/material.dart';

import '../Ads/ad_service.dart';
import '../Audio/my_audio_player.dart';
import '../Image/image_service.dart';
import '../ScreenDimensions/screen_dimensions_service.dart';
import 'Game/game_screen_manager_state.dart';

abstract class StandardScreen<
        TGameScreenManagerState extends GameScreenManagerState>
    extends StatefulWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  MyAudioPlayer audioPlayer = MyAudioPlayer();
  ImageService imageService = ImageService();
  AdService adService = AdService();

  TGameScreenManagerState gameScreenManagerState;

  StandardScreen(this.gameScreenManagerState, {Key? key}) : super(key: key);

  Color? get screenBackgroundColor => null;
}
