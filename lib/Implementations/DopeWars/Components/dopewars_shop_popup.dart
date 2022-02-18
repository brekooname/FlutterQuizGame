import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class DopeWarsShopPopup extends StatefulWidget with MyPopup {
  final DopeWarsLocalStorage _dopeWarsLocalStorage = DopeWarsLocalStorage();
  final DopeWarsGameContext _dopeWarsGameContext;
  final VoidCallback _refreshStateCallback;
  late DopeWarsResourceTransactionService _dopeWarsResourceTransactionService;

  DopeWarsShopPopup(
      this._refreshStateCallback, this._dopeWarsGameContext) {
    _dopeWarsResourceTransactionService =
        DopeWarsResourceTransactionService(_dopeWarsGameContext);
  }

  @override
  State<DopeWarsShopPopup> createState() =>
      DopeWarsShopPopupState();
}

class DopeWarsShopPopupState extends State<DopeWarsShopPopup>
    with MyPopup {
  @override
  void initState() {
    super.initState();
    initPopup();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      createItems(),
      context: context,
    );
  }

  Widget createItems() {
    List<Widget> items = [];
    var locations = DopeWarsLocation.locations;
    for (DopeWarsLocation l in locations) {
      items.add(createItemRow(l));
      if (l.index != locations.last.index) {
        items.add(Padding(
            padding: EdgeInsets.all(screenDimensions.dimen(2.5)),
            child: Divider(
              height: screenDimensions.dimen(0.1),
              thickness: screenDimensions.dimen(0.1),
              color: Colors.grey,
            )));
      }
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createItemRow(DopeWarsLocation location) {
    bool isDisabled;
    String priceInfo = "";
    String reputationInfo = "";
    var btnColor = Colors.green.shade300;
    Color? disabledColor;
    var budget = widget._dopeWarsGameContext.inventory.budget;
    if (!widget._dopeWarsLocalStorage.isLocationUnlocked(location)) {
      priceInfo = "Unlock " +
          DopeWarsResourceTransactionService.formatCurrency(
              location.unlockPrice);
      reputationInfo = "Reputation +" +
          DopeWarsResourceTransactionService.reputationForLocationUnlock
              .toString();
      isDisabled = location.unlockPrice > budget;
      btnColor = Colors.orange.shade300;
    } else if (!isCurrentLocation) {
      var travelPrice =
          location.getTravelPrice(widget._dopeWarsGameContext.daysPassed);
      priceInfo = "Travel " +
          DopeWarsResourceTransactionService.formatCurrency(travelPrice);
      isDisabled = travelPrice > budget;
      btnColor = Colors.lightGreen.shade300;
    } else if (isCurrentLocation) {
      disabledColor = Colors.white;
    }
    var btnSize = Size(screenDimensions.w(33), screenDimensions.dimen(14));
    List<Widget> items = [];
    List<Widget> locBtnItems = [];
    locBtnItems.add(MyButton(
      disabled: isDisabled,
      disabledBackgroundColor: disabledColor,
      text: location.locationLabel,
      fontSize: FontConfig.getCustomFontSize(0.9),
      size: btnSize,
      buttonSkinConfig: ButtonSkinConfig(
          borderWidth: FontConfig.standardBorderWidth / 2,
          backgroundColor: btnColor),
      onClick: () {
        widget._dopeWarsResourceTransactionService.dopeWarsLocationMoveService
            .passDayAndMoveLocation(context, location);
        widget._refreshStateCallback.call();
        closePopup(context);
      },
    ));
    if (priceInfo.isNotEmpty || reputationInfo.isNotEmpty) {
      var infoFontSize = FontConfig.getCustomFontSize(0.8);
      if (priceInfo.isNotEmpty) {
        locBtnItems.add(MyText(
          textAllPadding: screenDimensions.dimen(0.2),
          maxLines: 1,
          fontConfig: FontConfig(
              fontWeight: isDisabled ? FontWeight.w500 : FontWeight.w800,
              fontSize: infoFontSize,
              fontColor: isDisabled ? Colors.grey : Colors.green.shade900),
          text: priceInfo,
        ));
      }
      if (reputationInfo.isNotEmpty) {
        locBtnItems.add(MyText(
          textAllPadding: screenDimensions.dimen(0.2),
          maxLines: 1,
          text: reputationInfo,
          fontConfig: FontConfig(
              fontSize: infoFontSize,
              fontColor: Colors.deepOrange,
              borderColor: Colors.orange.shade100),
        ));
      }
    }
    items.add(Column(children: locBtnItems));
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }



}
