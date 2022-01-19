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
      _geoQuizCampaignLevelService.level_0: ExperienceLevel(3000, 10),
      _geoQuizCampaignLevelService.level_1: ExperienceLevel(13000, 20),
      _geoQuizCampaignLevelService.level_2: ExperienceLevel(53000, 30),
      _geoQuizCampaignLevelService.level_3: ExperienceLevel(153000, 100),
    };
  }

  int getExperienceNeededForNextLevel() {
    return getMostRecentUnlockedCampaignLevel()
        .value
        .experienceNeededForNextLevel;
  }

  int getExperienceNeededForNextLevelToDisplay() {
    int expToSubtract = 0;
    var mostRecentUnlockedCampaignLevel = getMostRecentUnlockedCampaignLevel();
    for (MapEntry<CampaignLevel, ExperienceLevel> e
        in _campaignLevelExperienceMap.entries) {
      if (e.key == mostRecentUnlockedCampaignLevel.key) {
        return e.value.experienceNeededForNextLevel - expToSubtract;
      } else {
        expToSubtract = e.value.experienceNeededForNextLevel;
      }
    }
    return mostRecentUnlockedCampaignLevel.value.experienceNeededForNextLevel;
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
