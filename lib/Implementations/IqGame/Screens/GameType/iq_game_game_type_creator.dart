import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../../../Game/Question/Model/question_info.dart';
import '../../Questions/iq_game_context.dart';

abstract class IqGameGameTypeCreator {
  IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();
  ImageService imageService = ImageService();
  ScreenDimensionsService screenDimensionsService = ScreenDimensionsService();

  Widget createGameContainer(QuestionInfo currentQuestionInfo,
      IqGameContext gameContext, VoidCallback goToNextScreen);

  Widget createGameOverContainer(
      BuildContext context, IqGameContext gameContext);
}
