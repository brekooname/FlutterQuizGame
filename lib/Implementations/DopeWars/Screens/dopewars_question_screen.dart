import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Components/dopewars_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Model/dopewars_resource_market.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_screen_manager.dart';
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
    return 8;
  }
}

class DopeWarsQuestionScreenState extends State<DopeWarsQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [DopeWarsLevelHeader(), createMarket(), const Spacer()]);
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

  Widget createMarketItem(DopeWarsResourceMarket res) {
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
        children: [MyText(text: res.price.toString()), MyText(text: "++")]);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          firstRow,
          secondRow
        ]);
  }


   Res getResourceForMarketPrice(ResourceMarket resourceMarket, boolean disabled) {
    Res res = getDisabledItemBackground();
    if (resourceMarket.getPrice() < (resourceMarket.getResourceType().getStandardPrice() / 1.6f)) {
      res = disabled ? ResourceWarsSpecificResource.disableddowndownarrow : ResourceWarsSpecificResource.downdownarrow;
    } else if (resourceMarket.getPrice() < resourceMarket.getResourceType().getStandardPrice()) {
      res = disabled ? ResourceWarsSpecificResource.disableddownarrow : ResourceWarsSpecificResource.downarrow;
    } else if (resourceMarket.getPrice() > (resourceMarket.getResourceType().getStandardPrice() * 1.6f)) {
      res = disabled ? ResourceWarsSpecificResource.disabledupuparrow : ResourceWarsSpecificResource.upuparrow;
    } else if (resourceMarket.getPrice() > resourceMarket.getResourceType().getStandardPrice()) {
      res = disabled ? ResourceWarsSpecificResource.disableduparrow : ResourceWarsSpecificResource.uparrow;
    }
    return res;
  }
}
