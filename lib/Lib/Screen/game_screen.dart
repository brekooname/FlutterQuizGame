import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

mixin GameScreen {
  CampaignLevel? _campaignLevel;
  QuestionDifficulty? _difficulty;
  QuestionCategory? _category;

  void initScreen(CampaignLevelService campaignLevelService,
      QuestionDifficulty difficulty, QuestionCategory category) {
    this._difficulty = difficulty;
    this._category = category;
    this._campaignLevel =
        campaignLevelService.campaignLevel(difficulty, category);
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
