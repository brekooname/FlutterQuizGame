import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Components/anatomy_component_creator_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/AllContent/anatomy_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/anatomy_game_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/floating_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/settings_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/game_title.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class AnatomyMainMenuScreen extends StandardScreen<AnatomyScreenManagerState> {
  final AnatomyComponentCreatorService _anatomyComponentCreatorService =
      AnatomyComponentCreatorService();
  final AnatomyQuestionCollectorService _anatomyQuestionCollectorService =
      AnatomyQuestionCollectorService();
  final AnatomyLocalStorage _anatomyLocalStorage = AnatomyLocalStorage();
  final AnatomyGameConfig _anatomyGameConfig = AnatomyGameConfig();

  AnatomyMainMenuScreen(AnatomyScreenManagerState gameScreenManagerState,
      {Key? key})
      : super(gameScreenManagerState, key: key);

  @override
  State<AnatomyMainMenuScreen> createState() => AnatomyMainMenuScreenState();
}

class AnatomyMainMenuScreenState extends State<AnatomyMainMenuScreen>
    with ScreenState, LabelMixin {
  ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build main menu");
    var gameTitle = GameTitle(
      textWidth: screenDimensions.dimen(50),
      textShadow: Shadow(
        offset: Offset(
            FontConfig.standardShadowOffset, FontConfig.standardShadowOffset),
        blurRadius: FontConfig.standardShadowRadius * 2,
        color: Colors.black.withOpacity(0.2),
      ),
      text: MyApp.appTitle,
      fontConfig: FontConfig(
          fontColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.w600,
          fontSize: FontConfig.getCustomFontSize(1.5),
          borderColor: Colors.green.shade900),
    );

    AnatomyGameQuestionConfig questionConfig = AnatomyGameQuestionConfig();
    var categories = questionConfig.categories;
    var difficulties = questionConfig.difficulties;

    ScrollablePositionedList listView = ScrollablePositionedList.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: categories.length,
      itemScrollController: itemScrollController,
      itemBuilder: (BuildContext context, int index) {
        var btnMargin = SizedBox(
          height: screenDimensions.dimen(3),
        );
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            btnMargin,
            _createCategoryItem(categories.elementAt(index), difficulties),
            btnMargin
          ],
        );
      },
    );

    Future.delayed(
        Duration.zero,
        () => itemScrollController.jumpTo(
              index:
                  widget._anatomyLocalStorage.getLastPressedMainMenuCategory(),
            ));

    var mainColumn = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenDimensions.dimen(5)),
            gameTitle,
            SizedBox(height: screenDimensions.dimen(5)),
            Expanded(child: listView)
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
                widget._anatomyLocalStorage.clearAll();
              },
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }

  Widget _createCategoryItem(
      QuestionCategory category, List<QuestionDifficulty> difficulties) {
    Size btnSize = Size(screenDimensions.dimen(40), screenDimensions.dimen(60));
    Image catImg = imageService.getSpecificImage(
        imageName: category.index.toString() + "s",
        imageExtension: "png",
        module: "categories",
        maxHeight: btnSize.height,
        maxWidth: screenDimensions.dimen(55));

    int totalWonQuestions =
        widget._anatomyLocalStorage.getWonQuestionsForCat(category).length;
    int totalQuestionsLevel = difficulties
        .map((diff) =>
            widget._anatomyQuestionCollectorService
                .totalNrOfQuestionsForCategoryDifficulty
                .get<CategoryDifficulty, int>(
                    CategoryDifficulty(category, diff)) ??
            0)
        .reduce((a, b) => a + b);
    var customContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            text: category.categoryLabel!,
            fontConfig: FontConfig(
                fontSize: FontConfig.getCustomFontSize(1.2),
                fontColor: Colors.white,
                borderWidth: FontConfig.standardBorderWidth * 1.3,
                borderColor: Colors.black),
          ),
          SizedBox(
            height: screenDimensions.dimen(5),
          ),
          widget._anatomyComponentCreatorService.createScoreMyText(
              totalWonQuestions, totalQuestionsLevel, btnSize.width),
        ]);

    var allQuestionsAnswered = totalWonQuestions == totalQuestionsLevel;
    MyButton lvlBtn = MyButton(
      textMaxLines: 4,
      width: btnSize.width,
      customContent: customContent,
      size: btnSize,
      buttonSkinConfig: ButtonSkinConfig(
          borderColor: allQuestionsAnswered ? Colors.green : Colors.white,
          backgroundColor: allQuestionsAnswered
              ? Colors.green.shade200
              : Colors.blue.shade300),
      onClick: () {
        widget._anatomyLocalStorage
            .setLastPressedMainMenuCategory(category.index);
        widget.gameScreenManagerState.showLevelsScreen(category);
      },
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [catImg, lvlBtn],
    );
  }
}
