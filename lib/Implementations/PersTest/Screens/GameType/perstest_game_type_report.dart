import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_attr_description_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report_bigfive.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report_personalitydisc.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report_selfesteem.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../main.dart';

abstract class PersTestGameTypeReport with LabelMixin {
  ImageService imageService = ImageService();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  PersTestLocalStorage persTestLocalStorage = PersTestLocalStorage();
  CampaignLevel campaignLevel;
  late QuestionCategory category;
  late QuestionDifficulty difficulty;

  PersTestGameTypeReport(this.campaignLevel) {
    difficulty = campaignLevel.difficulty;
    category = campaignLevel.categories.first;
  }

  int getMaxGraphValue();

  List<PersAttribute> getPersAttributes();

  void storeResultsToStorage(PersTestGameContext gameContext);

  bool isPositiveResponseValue();

  String getInfoText();

  Widget createResultsReportContent(BuildContext context) {
    var margin = SizedBox(height: screenDimensions.dimen(1));
    Widget? extraReportContent = createExtraReportContent();
    var emptyContainer = Container();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [MyBackButton(), const Spacer()]),
        const Spacer(),
        extraReportContent ?? emptyContainer,
        extraReportContent == null ? emptyContainer : margin,
        createAttributesGraph(context),
        const Spacer(),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageService.getMainImage(
                  maxWidth: screenDimensions.dimen(8),
                  imageName: "info",
                  module: "general",
                  imageExtension: "png"),
              SizedBox(
                width: screenDimensions.dimen(1),
              ),
              MyText(
                width: screenDimensions.w(90),
                maxLines: 1,
                text: getInfoText(),
              )
            ]),
        const Spacer(),
      ],
    );
  }

  Widget? createExtraReportContent() {
    return null;
  }

  static PersTestGameTypeReport createGameTypeReport(
      CampaignLevel campaignLevel) {
    var questionConfig = PersTestGameQuestionConfig();
    var category = campaignLevel.categories.first;
    if (category == questionConfig.cat0) {
      return PersTestGameTypeReportBigFive(campaignLevel);
    } else if (category == questionConfig.cat1) {
      return PersTestGameTypeReportSelfEsteem(campaignLevel);
    } else if (category == questionConfig.cat2) {
      return PersTestGameTypeReportPersonalityDisc(campaignLevel);
    }
    throw UnimplementedError("no report configured for category");
  }

  int r(PersTestGameContext gameContext, int qNr) {
    var q = gameContext.gameUser.getAllQuestions([]).firstWhere(
        (element) => element.question.index == qNr);
    if (q.pressedAnswers.isNotEmpty) {
      var val = q.pressedAnswers.first.parseToInt;
      if (isPositiveResponseValue()) {
        return val + 1;
      } else {
        if (val == 0) {
          return 0;
        } else if (val > 1) {
          return val + 1;
        } else {
          return val - 1;
        }
      }
    } else {
      return 0;
    }
  }

  Widget createAttributesGraph(BuildContext context) {
    List<PersAttribute> attrVals = getPersAttributes();
    List<Widget> attrs = [];
    var attrBarWidth = screenDimensions.w(47);
    var btnSize = Size(screenDimensions.w(47), screenDimensions.dimen(10));
    var padding = screenDimensions.dimen(0.5);
    for (PersAttribute attr in attrVals) {
      double percent = getAttrPercentValue(attr);
      attrs.add(Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              createAttrLabel(context, attr, btnSize),
              Stack(alignment: Alignment.center, children: [
                ProgressBar(
                    fillBarColor: attr.color,
                    startNr: 0,
                    endNr: percent.toInt(),
                    totalNr: 100,
                    width: attrBarWidth,
                    height: btnSize.height),
                MyText(
                  text: percent.toInt().toString() + "%",
                  fontConfig: FontConfig(
                    fontColor: Colors.white,
                    borderColor: Colors.black,
                  ),
                ),
              ])
            ]),
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: attrs,
    );
  }

  Widget createAttrLabel(
      BuildContext context, PersAttribute attr, Size btnSize) {
    var fontConfig = FontConfig(fontSize: FontConfig.getCustomFontSize(0.9));
    return attr.isButton
        ? MyButton(
            onClick: () {
              MyPopup.showPopup(PersTestDescriptionPopup(attr.description));
            },
            contentLockedConfig: ContentLockedConfig(
                isContentLocked: MyApp.isExtraContentLocked),
            textMaxLines: 1,
            text: attr.label,
            size: btnSize,
            fontConfig: fontConfig,
            buttonSkinConfig: ButtonSkinConfig(
                backgroundColor: Colors.lightBlueAccent.shade200,
                borderRadius: FontConfig.standardBorderRadius / 2),
          )
        : Padding(
            padding: EdgeInsets.all(screenDimensions.dimen(2)),
            child: MyText(
              text: attr.label,
              fontConfig: fontConfig,
            ));
  }

  double getAttrPercentValue(PersAttribute r) =>
      r.val / getMaxGraphValue() * 100;

  int getAttrIntValue(
      String key, List<PersTestGameTypeAttrStorage> storageAttrs) {
    return storageAttrs
        .where((e) => e.attrKey == key)
        .first
        .attrValue
        .parseToInt;
  }
}

class PersAttribute {
  Color color;
  String label;
  String description;
  bool isButton = true;
  int val;

  PersAttribute(this.color, this.label, this.description, this.val);
}
