import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import 'geoquiz_campaign_level_service.dart';

class GeoQuizCampaignLevelExperienceMap {
  GeoQuizLocalStorage geoQuizLocalStorage = GeoQuizLocalStorage();
  final GeoQuizCampaignLevelService _geoQuizCampaignLevelService =
      GeoQuizCampaignLevelService();
  late Map<CampaignLevel, ExperienceLevel> _campaignLevelExperienceMap;

  GeoQuizCampaignLevelExperienceMap() {
    _campaignLevelExperienceMap = {
      _geoQuizCampaignLevelService.level_0: ExperienceLevel(6000, 10),
      _geoQuizCampaignLevelService.level_1: ExperienceLevel(31000, 30),
      _geoQuizCampaignLevelService.level_2: ExperienceLevel(91000, 100),
      _geoQuizCampaignLevelService.level_3: ExperienceLevel(291000, 200),
    };
  }

  ExperienceLevel getExperienceLevel(CampaignLevel campaignLevel) {
    return _campaignLevelExperienceMap
        .get<CampaignLevel, ExperienceLevel>(campaignLevel)!;
  }

  int getExperienceNeededForNextLevel() {
    return getMostRecentUnlockedCampaignLevel()
        .value
        .experienceNeededForNextLevel;
  }

  int getExperienceNeededForNextLevelToDisplay() {
    MapEntry<CampaignLevel, ExperienceLevel> mostRecentUnlockedCampaignLevel =
        getMostRecentUnlockedCampaignLevel();
    MapEntry<CampaignLevel, ExperienceLevel>? previousUnlockedCampaignLevel =
        getPreviousUnlockedCampaignLevel();
    if (previousUnlockedCampaignLevel != null) {
      return mostRecentUnlockedCampaignLevel
              .value.experienceNeededForNextLevel -
          previousUnlockedCampaignLevel.value.experienceNeededForNextLevel;
    } else {
      return mostRecentUnlockedCampaignLevel.value.experienceNeededForNextLevel;
    }
  }

  MapEntry<CampaignLevel, ExperienceLevel>? getPreviousUnlockedCampaignLevel() {
    var mostRecentUnlockedCampaignLevel = getMostRecentUnlockedCampaignLevel();
    MapEntry<CampaignLevel, ExperienceLevel>? previousUnlockedCampaignLevel;
    for (MapEntry<CampaignLevel, ExperienceLevel> e
        in _campaignLevelExperienceMap.entries) {
      if (e.key == mostRecentUnlockedCampaignLevel.key) {
        break;
      }
      previousUnlockedCampaignLevel = e;
    }
    return previousUnlockedCampaignLevel;
  }

  MapEntry<CampaignLevel, ExperienceLevel>
      getMostRecentUnlockedCampaignLevel() {
    int exp = geoQuizLocalStorage.getExperience();
    for (MapEntry<CampaignLevel, ExperienceLevel> e
        in _campaignLevelExperienceMap.entries) {
      if (exp < e.value.experienceNeededForNextLevel) {
        return e;
      }
    }
    return _campaignLevelExperienceMap.entries.last;
  }
}

class ExperienceLevel {
  int experienceNeededForNextLevel;
  int increaseExperiencePerCorrectAnswerAmount;

  ExperienceLevel(this.experienceNeededForNextLevel,
      this.increaseExperiencePerCorrectAnswerAmount);
}
