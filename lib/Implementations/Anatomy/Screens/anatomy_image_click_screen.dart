import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Components/anatomy_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class AnatomyImageClickScreen
    extends GameScreen<AnatomyGameContext, AnatomyScreenManagerState> {
  AnatomyGameQuestionConfig gameQuestionConfig = AnatomyGameQuestionConfig();

  AnatomyImageClickScreen(
    AnatomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AnatomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AnatomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key);

  @override
  State<AnatomyImageClickScreen> createState() =>
      AnatomyImageClickScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AnatomyImageClickScreenState extends State<AnatomyImageClickScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    var mainColumn = Column(
      children: <Widget>[
        AnatomyLevelHeader(
          questionText:
              widget.currentQuestionInfo.question.questionToBeDisplayed,
        ),
        _getQuestionImage()
      ],
    );

    return mainColumn;
  }

  void setStateCallback() {
    setState(() {});
  }

  Widget _getQuestionImage() {
    var maxImgHeight = screenDimensions.h(80);
    var maxImgWidth = screenDimensions.w(80);
    var imgDimen = widget.gameQuestionConfig.categoryImgDimen
        .get<QuestionCategory, Size>(widget.category)!;

    var heightGreaterThanWidth = imgDimen.width <= imgDimen.height;
    Image categoryImage = imageService.getSpecificImage(
      imageName: widget.category.index.toString(),
      imageExtension: "png",
      module: "categories",
      maxWidth: heightGreaterThanWidth ? null : maxImgWidth,
      maxHeight: heightGreaterThanWidth ? maxImgHeight : null,
    );

    List<Widget> stackChildren = [];

    double imgHeight = heightGreaterThanWidth
        ? maxImgHeight
        : screenDimensions.getNewHeightForNewWidth(
            maxImgWidth, imgDimen.width, imgDimen.height);
    double imgWidth = heightGreaterThanWidth
        ? screenDimensions.getNewWidthForNewHeight(
            maxImgHeight, imgDimen.width, imgDimen.height)
        : maxImgWidth;
    var imageContainer = Container(
        height: imgHeight,
        width: imgWidth,
        child: categoryImage);

    stackChildren.add(imageContainer);
    var question = widget.currentQuestionInfo.question;
    var quizAnswerOptionsCoordinates =
        (question.questionService as ImageClickQuestionService)
            .getQuizAnswerOptionsCoordinates(question);
    var pointerDimen = screenDimensions.dimen(3);
    stackChildren.addAll(quizAnswerOptionsCoordinates
        .map((e) => SizedBox(
            width: imgWidth,
            height: imgHeight,
            child: AnimateZoomInZoomOut(
                key: UniqueKey(),
                zoomAmount: AnimateZoomInZoomOut.defaultZoomAmount / 2,
                toAnimateWidget:
                    createAnswerPointer(imgHeight, imgWidth, e, pointerDimen))))
        .toList());
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: stackChildren,
    );
  }

  Widget createAnswerPointer(double imgHeight, double imgWidth,
      ImageClickInfo imageClickInfo, double pointerDimen) {
    var btnSide = screenDimensions.dimen(15);
    var arrowLineWidth = screenDimensions.w(20);
    return Stack(alignment: Alignment.center, clipBehavior: Clip.none,children: [
      Positioned(
        top: imgHeight - ((imageClickInfo.y * 1.08) / 100 * imgHeight),
        left: imageClickInfo.x / 100 * imgWidth,
        child: Row(children: [
          Container(
            width: pointerDimen,
            height: pointerDimen,
            decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius:
                    BorderRadius.circular(FontConfig.standardBorderRadius * 4),
                border: Border.all(
                    color: Colors.red, width: FontConfig.standardBorderWidth)),
          ),
          Opacity(
              opacity: 1,
              child: Container(
                  width: arrowLineWidth,
                  height: screenDimensions.h(1),
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(
                          FontConfig.standardBorderRadius),
                      border: Border.all(
                          color: Colors.red,
                          width: FontConfig.standardBorderWidth)))),
          MyButton(
              text: "?",
              size: Size(btnSide, btnSide),
              buttonSkinConfig: ButtonSkinConfig(
                  borderRadius: FontConfig.standardBorderRadius * 4,
                  backgroundColor: Colors.lightGreenAccent)),
        ]),
      )
    ]);
  }
}
