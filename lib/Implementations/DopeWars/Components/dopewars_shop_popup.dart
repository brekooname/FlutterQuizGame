import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_shop_item.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';

import 'dopewars_location_move_popup.dart';

class DopeWarsShopPopup extends StatefulWidget with MyPopup {
  final DopeWarsLocalStorage _dopeWarsLocalStorage = DopeWarsLocalStorage();
  final DopeWarsGameContext _dopeWarsGameContext;
  final VoidCallback _refreshStateCallback;
  late DopeWarsResourceTransactionService _dopeWarsResourceTransactionService;

  DopeWarsShopPopup(this._refreshStateCallback, this._dopeWarsGameContext) {
    _dopeWarsResourceTransactionService =
        DopeWarsResourceTransactionService(_dopeWarsGameContext);
  }

  @override
  State<DopeWarsShopPopup> createState() => DopeWarsShopPopupState();
}

class DopeWarsShopPopupState extends State<DopeWarsShopPopup>
    with MyPopup, LabelMixin {
  @override
  void initState() {
    super.initState();
    initPopup();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      createItems(),
    );
  }

  Widget createItems() {
    List<Widget> allItems = [];
    var shopItems = DopeWarsShopItem.items;
    for (DopeWarsShopItem i in shopItems) {
      allItems.add(createItemRow(i));
      if (i.index != shopItems.last.index) {
        allItems.add(Padding(
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
        children: allItems);
  }

  Widget createItemRow(DopeWarsShopItem item) {
    bool shopItemUnlocked =
        widget._dopeWarsLocalStorage.isShopItemUnlocked(item);
    bool isDisabled = shopItemUnlocked;
    String priceInfo = "";
    String reputationInfo = "";
    var btnColor = Colors.green.shade300;
    Color? disabledColor;
    var budget = widget._dopeWarsGameContext.inventory.budget;
    if (!shopItemUnlocked) {
      priceInfo = formatTextWithOneParam(label.l_unlock_param0,
          DopeWarsResourceTransactionService.formatCurrency(item.price));
      reputationInfo = label.l_reputation + " +" + item.reputation.toString();
      isDisabled = item.price > budget;
      btnColor = Colors.orange.shade300;
    } else {
      disabledColor = Colors.green.shade300;
    }
    var btnSize = Size(screenDimensions.w(33), screenDimensions.dimen(14));
    var itemBtn = MyButton(
      disabled: isDisabled,
      disabledBackgroundColor: disabledColor,
      text: item.itemLabel,
      fontSize: FontConfig.getCustomFontSize(0.9),
      size: btnSize,
      buttonSkinConfig: ButtonSkinConfig(
          borderWidth: FontConfig.standardBorderWidth / 2,
          backgroundColor: btnColor),
      onClick: () {
        widget._dopeWarsResourceTransactionService.unlockShopItem(item);
        widget._refreshStateCallback.call();
        closePopup();
      },
    );
    List<Widget> priceInfoList =
        DopeWarsLocationMovePopup.createPriceAndReputationText(
            priceInfo, reputationInfo, isDisabled, screenDimensions);
    const spacer = Spacer();
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spacer,
          imageService.getSpecificImage(
              imageName: item.itemImgName,
              imageExtension: "png",
              maxWidth: btnSize.height / 1.2,
              module: "resource_background"),
          spacer,
          itemBtn,
          spacer,
          Column(children: priceInfoList),
          spacer,
        ]);
  }
}
