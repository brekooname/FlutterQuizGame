import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_location_move_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/int_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class DopeWarsLevelHeader extends StatelessWidget {
  static const currency = "\$";
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  DopeWarsGameContext gameContext;

  DopeWarsLevelHeader(this.gameContext);

  @override
  Widget build(BuildContext context) {
    var margin = SizedBox(
      height: _screenDimensions.dimen(0.5),
    );
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createRow1(),
          margin,
          createRow2(),
          margin,
          createRow3(),
        ]);
  }

  Row createRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        MyText(
          fontConfig: labelFontConfig(),
          text: "Reputation: " + gameContext.reputation.toString() + "%",
        ),
        const Spacer(),
      ],
    );
  }

  Row createRow3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyText(
          fontConfig: labelFontConfig(),
          text: "Budget: " +
              DopeWarsResourceTransactionService.formatCurrency(
                  gameContext.inventory.budget),
        ),
        const Spacer(),
        MyText(
          fontConfig: labelFontConfig(),
          text: "Inventory: " +
              gameContext.inventory.containerSpaceLeft.toString() +
              "/" +
              DopeWarsUserInventory.startingMaxContainer.toString(),
        )
      ],
    );
  }

  Row createRow1() {
    var myBackButton = MyBackButton();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        myBackButton,
        const Spacer(),
        MyText(
          fontConfig: labelFontConfig(),
          text: "Remaining Days: " +
              (DopeWarsLocationMoveService.totalDays - gameContext.daysPassed)
                  .toString(),
        ),
        const Spacer(),
        SizedBox(
          width: myBackButton.buttonSize.width,
        ),
      ],
    );
  }

  FontConfig labelFontConfig() {
    return FontConfig(
        fontSize: FontConfig.getCustomFontSize(0.9),
        fontColor: Colors.green.shade800);
  }
}
