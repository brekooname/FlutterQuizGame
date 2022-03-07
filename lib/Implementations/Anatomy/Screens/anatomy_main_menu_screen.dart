import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class AnatomyMainMenuScreen extends StandardScreen {
  AnatomyMainMenuScreen(GameScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<AnatomyMainMenuScreen> createState() => AnatomyMainMenuScreenState();
}

class AnatomyMainMenuScreenState extends State<AnatomyMainMenuScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var gameTitle = GameTitle(
      text: MyApp.appTitle,
      backgroundImageWidth: screenDimensions.dimen(70),
      fontConfig: FontConfig(
          fontColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          fontSize: FontConfig.bigFontSize,
          borderColor: Colors.green),
    );

    var

    var mainColumn = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenDimensions.dimen(11)),
            gameTitle,
            SizedBox(height: screenDimensions.dimen(14)),
          ],
        ));
    return Scaffold(
        body: mainColumn,
        backgroundColor: Colors.transparent,
        floatingActionButton: Row(children: [
          FloatingButton(
            context: context,
            iconName: "btn_settings",
            myPopupToDisplay: SettingsPopup(
              resetContent: () {
                // widget.anatomyLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget _createCategoryItem(QuestionCategory cat) {
    Size btnSize = Size(screenDimensions.dimen(40), screenDimensions.dimen(60));

    Image catImg = imageService.getSpecificImage(
        imageName: cat.index.toString(),
        imageExtension: "png",
        module: "categories",
        maxHeight: btnSize.height);

    MyButton lvlBtn = MyButton(
      text: cat.categoryLabel,
      size: btnSize,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [catImg, lvlBtn],
    );
  }
}
