import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Components/dopewars_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_inventory.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_user_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class DopeWarsQuestionScreen
    extends GameScreen<DopeWarsGameContext, DopeWarsScreenManagerState> {
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
            key: key);

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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DopeWarsLevelHeader(),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [createInventory(), createMarket()]),
          const Spacer()
        ]);
  }

  Widget createInventory() {
    int remainingSlotsToAdd = DopeWarsUserInventory.maxItemsInInventory;
    List<DopeWarsResourceInventory> availableRes =
        widget.gameContext.inventory.availableResources.toList();
    availableRes.sort((a, b) => a.price.compareTo(b.price));
    List<Widget> items = [];
    for (DopeWarsResourceInventory res in availableRes) {
      items.add(createInventoryItem(res));
      remainingSlotsToAdd--;
    }
    for (int i = 0; i < remainingSlotsToAdd; i++) {
      items.add(MyText(text: "Empty"));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createMarket() {
    List<Widget> items = [];
    for (DopeWarsResourceMarket res
        in widget.gameContext.market.availableResources) {
      items.add(createMarketItem(res));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createInventoryItem(DopeWarsResourceInventory res) {
    bool isEnabled = isInventoryItemEnabled(res);
    int? actualSellPrice = getActualSellPrice(res, widget.gameContext.market);

    Row firstRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(text: res.resourceType.resourceLabel),
          MyText(text: actualSellPrice?.toString() ?? "")
        ]);
    Row secondRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(text: res.price.toString()),
          MyText(text: res.amount.toString()),
        ]);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [firstRow, secondRow]);
  }

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
          MyText(text: res.resourceType.resourceLabel),
          MyText(text: res.resourceType.standardPrice.toString())
        ]);
    Row secondRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(text: res.price.toString()),
          _getArrowForMarketPrice(
              res, !isEnabled && !inventoryItemIsInMarket(res))
        ]);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [firstRow, secondRow]);
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

  int getAmountYouAffordAndHaveSpaceFor(int amountYouAfford) {
    int amount = amountYouAfford;

    if (amountYouAfford > widget.gameContext.inventory.containerSpaceLeft) {
      amount = widget.gameContext.inventory.containerSpaceLeft;
    }

    return amount;
  }

  Widget _getArrowForMarketPrice(
      DopeWarsResourceMarket resourceMarket, bool disabled) {
    double imgDimen = screenDimensions.dimen(10);
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
