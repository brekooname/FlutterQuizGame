import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/game_local_storage.dart';

mixin GameScreen<TGameContext extends GameContext> {
  TGameContext? _gameContext;
  CampaignLevel? _campaignLevel;
  QuestionDifficulty? _difficulty;
  QuestionCategory? _category;
  GameLocalStorage gameLocalStorage = GameLocalStorage();

  void initScreen(
    CampaignLevelService campaignLevelService,
    TGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    this._difficulty = difficulty;
    this._category = category;
    this._gameContext = gameContext;
    this._campaignLevel =
        campaignLevelService.campaignLevel(difficulty, category);
  }

  TGameContext get gameContext {
    assert(_gameContext != null);
    return _gameContext!;
  }

  QuestionDifficulty get difficulty {
    assert(_difficulty != null);
    return _difficulty!;
  }

  QuestionCategory get category {
    assert(_category != null);
    return _category!;
  }

  CampaignLevel get campaignLevel {
    assert(_campaignLevel != null);
    return _campaignLevel!;
  }
}
