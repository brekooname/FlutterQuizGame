import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_price_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_total_days_service.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_increase_number_text.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class DopeWarsLevelHeader extends StatelessWidget with LabelMixin {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final DopeWarsTotalDaysService _dopeWarsTotalDaysService =
      DopeWarsTotalDaysService();
  final ImageService _imageService = ImageService();

  DopeWarsGameContext gameContext;
  bool? daysPassedChanged;
  int? reputationChange;

  DopeWarsLevelHeader(
      this.gameContext, this.daysPassedChanged, this.reputationChange);

  @override
  Widget build(BuildContext context) {
    var margin = SizedBox(
      height: _screenDimensions.dimen(0.5),
    );
    var rowHeight = _screenDimensions.dimen(8);
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: FontConfig.standardShadowRadius,
                  blurRadius: FontConfig.standardShadowRadius)
            ],
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius / 2),
            color: Colors.blue.shade50),
        child: Stack(children: [
          MyBackButton(),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                margin,
                margin,
                SizedBox(
                  height: rowHeight,
                  child: createRow1(),
                ),
                margin,
                SizedBox(
                  height: rowHeight,
                  child: createRow2(rowHeight),
                ),
                margin,
                SizedBox(
                  height: rowHeight,
                  child: createRow3(),
                ),
                margin,
                margin,
              ])
        ]));
  }

  Row createRow2(double rowHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        createLabelValueRow(label.l_reputation,
            gameContext.reputation.toString(), Colors.deepOrange,
            borderColor: Colors.orange.shade100,
            animateIncreaseText: reputationChange != null,
            audioPlayerId: "ReputationAudioId",
            animationStartNr:
                gameContext.reputation - (reputationChange?.toInt() ?? 0),
            animationEndNr: gameContext.reputation),
        _imageService.getSpecificImage(
            maxWidth: rowHeight,
            module: "general",
            imageName: "flame",
            imageExtension: "png"),
        const Spacer(),
      ],
    );
  }

  Row createRow3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        createLabelValueRow(
            label.l_budget,
            DopeWarsResourceTransactionService.formatCurrency(
                gameContext.inventory.budget),
            gameContext.inventory.budget <
                    DopeWarsPriceService.startingBudget / 6
                ? Colors.red
                : gameContext.inventory.budget <
                        DopeWarsPriceService.startingBudget / 3
                    ? Colors.orange
                    : Colors.green.shade800),
        const Spacer(),
        createLabelValueRow(
            label.l_inventory,
            (DopeWarsUserInventory.startingMaxContainer -
                        gameContext.inventory.containerSpaceLeft)
                    .toString() +
                "/" +
                DopeWarsUserInventory.startingMaxContainer.toString(),
            gameContext.inventory.containerSpaceLeft == 0
                ? Colors.red
                : Colors.blue),
        const Spacer(),
      ],
    );
  }

  Row createRow1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        createLabelValueRow(
            _dopeWarsTotalDaysService.getTotalDaysLabelText(),
            _dopeWarsTotalDaysService.getTotalDaysValueText(gameContext),
            Colors.white,
            borderColor: Colors.black,
            animateValue: daysPassedChanged),
        const Spacer(),
      ],
    );
  }

  Widget createLabelValueRow(
      String labelText, String valueText, Color valueTextColor,
      {Color? borderColor,
      bool? animateValue,
      bool? animateIncreaseText,
      String? audioPlayerId,
      int? animationStartNr,
      int? animationEndNr}) {
    var valueMyText = MyText(
        text: valueText,
        fontConfig: FontConfig(
            fontColor: valueTextColor,
            borderColor: borderColor ?? Colors.transparent,
            borderWidth: FontConfig.standardBorderWidth * 1.5,
            fontSize: FontConfig.getCustomFontSize(1.2),
            fontWeight: FontWeight.w800));
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MyText(
            fontConfig: FontConfig(
                fontSize: FontConfig.getCustomFontSize(1.0),
                fontColor: Colors.black),
            text: labelText,
          ),
          SizedBox(
            width: _screenDimensions.dimen(2),
          ),
          animateValue ?? false
              ? AnimateZoomInZoomOutText(
                  zoomAmount: 1.4,
                  executeAnimationOnlyOnce: true,
                  toAnimateText: valueMyText)
              : animateIncreaseText ?? false
                  ? AnimateIncreaseNumberText(
                      audioPlayerId: audioPlayerId!,
                      audioPlayLoop: false,
                      startNr: animationStartNr!,
                      endNr: animationEndNr!,
                      toAnimateText: valueMyText)
                  : valueMyText,
        ]);
  }
}
