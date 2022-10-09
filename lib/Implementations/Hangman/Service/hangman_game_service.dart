import '../../../Game/Game/campaign_level.dart';
import '../Constants/hangman_campaign_level_service.dart';
import 'hangman_gamecontext_service.dart';
import 'hangman_local_storage.dart';
import 'package:collection/collection.dart';

class HangmanGameService {
  final HangmanLocalStorage _hangmanLocalStorage = HangmanLocalStorage();
  final HangmanCampaignLevelService _campaignLevelService =
      HangmanCampaignLevelService();

  static final HangmanGameService singleton = HangmanGameService.internal();

  factory HangmanGameService() {
    return singleton;
  }

  HangmanGameService.internal();

  bool isLevelFinished(int wordsFoundInOneGame) {
    return wordsFoundInOneGame >
        (HangmanGameContextService.numberOfQuestionsPerGame / 2).floor();
  }

  bool isGameLevelLocked(CampaignLevel campaignLevel) {
    int campaignLevelIndex =
        _campaignLevelService.getCampaignLevelIndex(campaignLevel);
    if (campaignLevelIndex == 0) {
      return false;
    }
    CampaignLevel prevCampaignLevel =
        _campaignLevelService.allLevels[campaignLevelIndex - 1];
    int wordsFoundInOneGame =
        _hangmanLocalStorage.getFoundWordsInOneGameForCatDiff(
            prevCampaignLevel.categories.first, prevCampaignLevel.difficulty);
    return !isLevelFinished(wordsFoundInOneGame);
  }

  int getFirstGameLevelLocked() {
    var allLevels = _campaignLevelService.allLevels;
    CampaignLevel? campaignLevel =
        allLevels.where((element) => isGameLevelLocked(element)).firstOrNull;
    if (campaignLevel == null) {
      return allLevels.length - 1;
    } else {
      return allLevels.indexOf(campaignLevel);
    }
  }
}
