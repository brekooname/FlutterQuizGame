import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Components/dopewars_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Components/dopewars_location_move_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Components/dopewars_shop_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:numberpicker/numberpicker.dart';

class DopeWarsQuestionScreen
    extends GameScreen<DopeWarsGameContext, DopeWarsScreenManagerState> {
  late DopeWarsResourceTransactionService dopeWarsResourceTransactionService;

  DopeWarsQuestionScreen(
    DopeWarsScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required DopeWarsGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            DopeWarsCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    dopeWarsResourceTransactionService =
        DopeWarsResourceTransactionService(gameContext);
    dopeWarsResourceTransactionService.calculateReputation();
    gameContext.reputationChange = null;
  }

  @override
  State<DopeWarsQuestionScreen> createState() => DopeWarsQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 999;
  }
}

class DopeWarsQuestionScreenState extends State<DopeWarsQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    var margin = SizedBox(
      height: screenDimensions.dimen(5),
    );
    var content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DopeWarsLevelHeader(
              widget.gameContext,
              widget.gameContext.daysPassedChanged,
              widget.gameContext.reputationChange),
          margin,
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createInventory(),
                createCenterControls(),
                createMarket()
              ]),
          margin,
          createBottomRowButtons(),
          const Spacer()
        ]);
    widget.gameContext.reputationChange = null;
    widget.gameContext.daysPassedChanged = false;
    return content;
  }

  Widget createCenterControls() {
    List<Widget> items = [];
    var isMarketResSelected =
        getSelectionInfo() == SelectedResourceInfo.marketSelection;
    var isInventoryResSelected =
        getSelectionInfo() == SelectedResourceInfo.inventorySelection;
    items.add(MyText(
        fontColor: isInventoryResSelected ? Colors.blue.shade900 : Colors.red,
        maxLines: 1,
        text: (isMarketResSelected
                ? "-"
                : isInventoryResSelected
                    ? "+"
                    : "") +
            DopeWarsResourceTransactionService.formatCurrency(
                widget.gameContext.selectedMoneyChange)));
    items.add(createBuySellBtn());
    items.add(SizedBox(
      height: screenDimensions.dimen(3),
    ));
    var maxAmountForSelection =
        getMaxAmountForSelection(widget.gameContext.selectedResource);
    if (maxAmountForSelection > 0) {
      items.add(Container(
        width: screenDimensions.dimen(15),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius * 5),
            color: Colors.green.shade50),
        child: NumberPicker(
            textStyle: TextStyle(
              decoration: TextDecoration.none,
              fontSize: FontConfig.normalFontSize,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.blue.shade700,
                    width: screenDimensions.dimen(1)),
                borderRadius:
                    BorderRadius.circular(FontConfig.standardBorderRadius * 5),
                color: Colors.white.withOpacity(0.1)),
            value: widget.gameContext.selectedAmount,
            minValue: 0,
            maxValue: maxAmountForSelection,
            onChanged: (value) => setState(() => setAmount(value))),
      ));
    }
    return SizedBox(
        width: screenDimensions.dimen(25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items));
  }

  MyButton createBuySellBtn() {
    double buySellBtnSideDimen = screenDimensions.dimen(15);
    var selectedAmount = widget.gameContext.selectedAmount;
    bool noSelection = getSelectionInfo() == SelectedResourceInfo.noSelection;
    bool inventorySelection =
        getSelectionInfo() == SelectedResourceInfo.inventorySelection;
    return MyButton(
        disabled: noSelection || selectedAmount < 1,
        size: Size(buySellBtnSideDimen, buySellBtnSideDimen),
        onClick: () {
          if (inventorySelection) {
            widget.dopeWarsResourceTransactionService.sellResource(
                widget.gameContext.selectedResource!, selectedAmount);
          } else {
            widget.dopeWarsResourceTransactionService.buyResource(
                widget.gameContext.selectedResource!, selectedAmount);
          }
          widget.gameContext.resetSelectedResource();
          setState(() {});
        },
        buttonSkinConfig: ButtonSkinConfig(
          image: imageService.getSpecificImage(
              imageName: noSelection
                  ? "coin"
                  : inventorySelection
                      ? "amount_sell"
                      : "amount_buy",
              imageExtension: "png",
              module: "buttons"),
          borderRadius: FontConfig.standardBorderRadius * 4,
        ));
  }

  FontConfig invMarketLabelFontConfig() {
    return FontConfig(
        fontSize: FontConfig.getCustomFontSize(0.9),
        fontColor: Colors.grey.shade600);
  }

  Widget createInventory() {
    int remainingSlotsToAdd = DopeWarsUserInventory.maxItemsInInventory;
    List<DopeWarsResourceInventory> availableRes =
        widget.gameContext.inventory.availableResources.toList();
    availableRes.sort((a, b) => a.price.compareTo(b.price));
    List<Widget> items = [];
    items.add(MyText(
        maxLines: 1,
        fontConfig: invMarketLabelFontConfig(),
        text: "Inventory"));
    for (DopeWarsResourceInventory res in availableRes) {
      items.add(createInventoryItem(res));
      remainingSlotsToAdd--;
    }
    for (int i = 0; i < remainingSlotsToAdd; i++) {
      items.add(createEmptyBtn());
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createMarket() {
    int remainingSlotsToAdd = DopeWarsUserInventory.maxItemsInInventory;
    List<Widget> items = [];
    items.add(MyText(
      maxLines: 1,
      fontConfig: invMarketLabelFontConfig(),
      text: "Market",
    ));
    for (DopeWarsResourceMarket res
        in widget.gameContext.market.availableResources) {
      items.add(createMarketItem(res));
      remainingSlotsToAdd--;
    }
    for (int i = 0; i < remainingSlotsToAdd; i++) {
      items.add(createEmptyBtn());
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createEmptyBtn() => Opacity(
      opacity: 0.45,
      child: createResBtn(true, null, SelectedResourceInfo.noSelection, null));

  double getPaddingForResBtn() {
    return screenDimensions.dimen(1);
  }

  Size getSizeForResBtn() {
    return Size(screenDimensions.dimen(40), screenDimensions.dimen(17));
  }

  Widget createBottomRowButtons() {
    var btnSize = Size(screenDimensions.w(32), screenDimensions.dimen(17));
    var btnSkin = ButtonSkinConfig(
        borderColor: Colors.green.shade800,
        borderWidth: FontConfig.standardBorderWidth / 2,
        backgroundColor: Colors.green.shade50);
    var travelBtn = MyButton(
      text: widget.gameContext.market.currentLocation.locationLabel,
      size: btnSize,
      buttonSkinConfig: btnSkin,
      onClick: () {
        widget.gameContext.resetSelectedResource();
        MyPopup.showPopup(
            context,
            DopeWarsLocationMovePopup(() {
              setState(() {});
            }, widget.gameContext));
      },
    );
    var shopBtn = MyButton(
      text: "Shop",
      size: btnSize,
      buttonSkinConfig: btnSkin,
      onClick: () {
        widget.gameContext.resetSelectedResource();
        MyPopup.showPopup(
            context,
            DopeWarsShopPopup(() {
              setState(() {});
            }, widget.gameContext));
      },
    );
    var nextDayBtn = MyButton(
      text: "Next Day",
      size: btnSize,
      buttonSkinConfig: btnSkin,
      onClick: () {
        widget.audioPlayer.playClick();
        widget.gameContext.market.setCurrentLocation(
            widget.gameContext.market.currentLocation,
            widget.gameContext.inventory.availableResourcesByType);
        widget.dopeWarsResourceTransactionService.dopeWarsLocationMoveService
            .increaseDaysPassed(context);
        setState(() {});
      },
    );
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          travelBtn,
          const Spacer(),
          shopBtn,
          const Spacer(),
          nextDayBtn,
          const Spacer()
        ]);
  }

  Widget createInventoryItem(DopeWarsResourceInventory res) {
    Widget? content;
    bool isEnabled = isInventoryItemEnabled(res);
    int? actualSellPrice = getActualSellPrice(res, widget.gameContext.market);

    var btnSize = getSizeForResBtn();
    Row firstRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
              text: res.resourceType.resourceLabel,
              width: resLabelWidth(),
              maxLines: 1),
          MyText(
              maxLines: 1,
              fontConfig: smallPriceFontConfig(),
              text:
                  DopeWarsResourceTransactionService.formatCurrency(res.price))
        ]);
    var amountDimen = btnSize.width / 5;
    Row secondRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
              fontConfig: bigPriceFontConfig(),
              text: DopeWarsResourceTransactionService.formatCurrency(
                  actualSellPrice)),
          SizedBox(
            width: screenDimensions.dimen(1),
          ),
          Container(
              width: amountDimen,
              height: amountDimen,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      FontConfig.standardBorderRadius * 5),
                  color: Colors.green.shade300),
              child: MyText(text: res.amount.toString())),
        ]);
    content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [firstRow, secondRow]);
    return createResBtn(
        !isEnabled, res, SelectedResourceInfo.inventorySelection, content);
  }

  double resLabelWidth() => getSizeForResBtn().width / 1.7;

  bool isInventoryItemEnabled(DopeWarsResourceInventory resourceInventory) {
    int? actualSellPrice =
        getActualSellPrice(resourceInventory, widget.gameContext.market);
    return widget.gameContext.inventory.availableResources.isNotEmpty &&
        actualSellPrice != null;
  }

  int? getActualSellPrice(
      DopeWarsResourceInventory resourceInventory, DopeWarsUserMarket market) {
    for (DopeWarsResourceMarket marketElem in market.availableResources) {
      if (resourceInventory.resourceType.index ==
          marketElem.resourceType.index) {
        return marketElem.price;
      }
    }
    return null;
  }

  Widget createMarketItem(DopeWarsResourceMarket res) {
    bool isEnabled = isMarketItemEnabled(res);
    Row firstRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            text: res.resourceType.resourceLabel,
            width: resLabelWidth(),
            maxLines: 1,
          ),
          MyText(
              maxLines: 1,
              fontConfig: smallPriceFontConfig(),
              text: DopeWarsResourceTransactionService.formatCurrency(
                  res.resourceType.standardPrice))
        ]);
    var inventoryIsInMarket = inventoryItemIsInMarket(res);
    Row secondRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
              fontConfig: bigPriceFontConfig(),
              text:
                  DopeWarsResourceTransactionService.formatCurrency(res.price)),
          _getArrowForMarketPrice(res, !isEnabled && !inventoryIsInMarket)
        ]);
    return createResBtn(
        !isEnabled,
        res,
        SelectedResourceInfo.marketSelection,
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [firstRow, secondRow]),
        btnEnabledDisabledColor:
            inventoryIsInMarket ? Colors.orange.shade100 : null);
  }

  FontConfig smallPriceFontConfig() {
    return FontConfig(
        fontSize: FontConfig.getCustomFontSize(0.7), fontColor: Colors.black);
  }

  FontConfig bigPriceFontConfig() {
    return FontConfig(
        fontSize: FontConfig.getCustomFontSize(1.1),
        fontColor: Colors.green.shade900);
  }

  Widget createResBtn(bool isBtnDisabled, DopeWarsResource? res,
      SelectedResourceInfo expectedSelection, Widget? content,
      {Color? btnEnabledDisabledColor}) {
    var btnSize = getSizeForResBtn();
    var borderRadius = FontConfig.standardBorderRadius / 2;
    var margin = FontConfig.standardBorderWidth * 2;
    List<Widget> btnStack = [];
    if (res != null && content != null) {
      btnStack.add(SizedBox(
        width: btnSize.width - margin,
        height: btnSize.height - margin,
        child: Opacity(
            opacity: 0.15,
            child: imageService.getSpecificImage(
                imageName: res.resourceType.resourceImgName,
                imageExtension: "png",
                maxWidth: btnSize.height / 1.5,
                module: "resource_background")),
      ));
      btnStack.add(content);
    }
    var isBtnSelected = res?.resourceType.index ==
            widget.gameContext.selectedResource?.resourceType.index &&
        expectedSelection == getSelectionInfo();
    var backgroundColor = isBtnSelected
        ? Colors.green.shade50
        : btnEnabledDisabledColor ?? Colors.blue.shade100;
    var myButton = MyButton(
        size: btnSize,
        disabledBackgroundColor: btnEnabledDisabledColor,
        buttonAllPadding: getPaddingForResBtn(),
        disabled: isBtnDisabled,
        buttonSkinConfig: ButtonSkinConfig(
            borderColor: ColorUtil.colorDarken(backgroundColor),
            borderRadius: borderRadius,
            borderWidth: FontConfig.standardBorderWidth / 2,
            backgroundColor: backgroundColor),
        onClick: () {
          widget.gameContext.selectedResource = res;
          setAmount(getMaxAmountForSelection(res));
          setState(() {});
        },
        customContent: btnStack.isNotEmpty
            ? Stack(
                children: btnStack,
              )
            : Container());
    return isBtnDisabled ? Opacity(opacity: 0.65, child: myButton) : myButton;
  }

  int getMaxAmountForSelection(DopeWarsResource? res) {
    var selectionInfo = getSelectionInfo();
    if (selectionInfo == SelectedResourceInfo.marketSelection) {
      return getAmountYouAffordAndHaveSpaceForResource(res);
    } else if (selectionInfo == SelectedResourceInfo.inventorySelection) {
      return (res as DopeWarsResourceInventory).amount;
    } else {
      return 0;
    }
  }

  void setAmount(int? amount) {
    int? amountToSet;
    if (amount != null && widget.gameContext.selectedResource != null) {
      DopeWarsResource selectedResource = widget.gameContext.selectedResource!;
      if (amount < 0) {
        amountToSet = 0;
      } else {
        amountToSet = amount;
      }
      var selectionInfo = getSelectionInfo();
      if (selectionInfo == SelectedResourceInfo.marketSelection) {
        int amountYouAffordAndHaveSpaceFor =
            getAmountYouAffordAndHaveSpaceForResource(selectedResource);
        if (amountToSet > amountYouAffordAndHaveSpaceFor) {
          amountToSet = amountYouAffordAndHaveSpaceFor;
        }
        widget.gameContext.selectedMoneyChange =
            amountToSet * selectedResource.price;
      } else if (selectionInfo == SelectedResourceInfo.inventorySelection) {
        var resourceInventory = (selectedResource as DopeWarsResourceInventory);
        if (amountToSet > resourceInventory.amount) {
          amountToSet = resourceInventory.amount;
        }
        int? actualSellPrice =
            getActualSellPrice(resourceInventory, widget.gameContext.market);
        if (actualSellPrice != null) {
          widget.gameContext.selectedMoneyChange =
              amountToSet * actualSellPrice;
        } else {
          widget.gameContext.selectedMoneyChange = 0;
        }
      }
      widget.gameContext.selectedAmount = amountToSet;
    }
  }

  bool inventoryItemIsInMarket(DopeWarsResourceMarket resourceMarket) {
    return widget.gameContext.inventory.availableResources
        .where((element) =>
            element.resourceType.index == resourceMarket.resourceType.index)
        .isNotEmpty;
  }

  bool isMarketItemEnabled(DopeWarsResourceMarket resourceMarket) {
    int amountYouAffordAndHaveSpaceFor =
        getAmountYouAffordAndHaveSpaceForResource(resourceMarket);
    return amountYouAffordAndHaveSpaceFor > 0 && !isMaxInventoryItems();
  }

  bool isMaxInventoryItems() {
    return widget.gameContext.inventory.availableResources.length >=
        DopeWarsUserInventory.maxItemsInInventory;
  }

  int getAmountYouAffordAndHaveSpaceForResource(DopeWarsResource? resource) {
    if (resource != null) {
      int amountYouAffordAndHaveSpaceFor =
          DopeWarsResourceTransactionService.getResourceAmountYouAfford(
              resource.price, widget.gameContext.inventory.budget);
      amountYouAffordAndHaveSpaceFor =
          getAmountYouAffordAndHaveSpaceFor(amountYouAffordAndHaveSpaceFor);
      return amountYouAffordAndHaveSpaceFor;
    }
    return 0;
  }

  SelectedResourceInfo getSelectionInfo() {
    if (widget.gameContext.selectedResource == null) {
      return SelectedResourceInfo.noSelection;
    } else if (widget.gameContext.selectedResource is DopeWarsResourceMarket) {
      return SelectedResourceInfo.marketSelection;
    } else {
      return SelectedResourceInfo.inventorySelection;
    }
  }

  int getAmountYouAffordAndHaveSpaceFor(int amountYouAfford) {
    int amount = amountYouAfford;

    if (amountYouAfford > widget.gameContext.inventory.containerSpaceLeft) {
      amount = widget.gameContext.inventory.containerSpaceLeft;
    }

    return amount;
  }

  Widget _getArrowForMarketPrice(
      DopeWarsResourceMarket resourceMarket, bool disabled) {
    double imgDimen = screenDimensions.dimen(8);
    Widget? img;
    String? imgName;
    if (resourceMarket.price <
        (resourceMarket.resourceType.standardPrice / 1.6)) {
      imgName = "downdownarrow";
    } else if (resourceMarket.price <
        resourceMarket.resourceType.standardPrice) {
      imgName = "downarrow";
    } else if (resourceMarket.price >
        (resourceMarket.resourceType.standardPrice * 1.6)) {
      imgName = "upuparrow";
    } else if (resourceMarket.price >
        resourceMarket.resourceType.standardPrice) {
      imgName = "uparrow";
    }
    if (imgName != null) {
      img = imageService.getSpecificImage(
          maxWidth: imgDimen,
          module: "general",
          imageName: imgName,
          imageExtension: "png");
      if (disabled) {
        img = ColorUtil.imageToGreyScale(img);
      }
    }
    return SizedBox(
      child: img,
      width: imgDimen,
      height: imgDimen,
    );
  }
}

enum SelectedResourceInfo { noSelection, inventorySelection, marketSelection }
