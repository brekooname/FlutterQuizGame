import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'my_popup.dart';

class WatchRewardedAdPopup extends StatelessWidget with MyPopup {
  AdService adService = AdService();
  bool watchVideoForExtraHint;
  VoidCallback onUserEarnedReward;
  RewardedAd? rewardedAd;
  bool isRewardedAdLoaded = false;

  WatchRewardedAdPopup(
      {this.watchVideoForExtraHint = true, required this.onUserEarnedReward});

  @override
  AlertDialog build(BuildContext context) {
    initPopup(context);

    return createDialog(Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        imageService.getMainImage(
            imageName: getImageName(),
            module: "popup",
            maxWidth: defaultBackgroundImageWidth),
        SizedBox(height: screenDimensions.h(2)),
        MyText(
          text: getText(),
          maxLines: 3,
          width: width / 1.2,
        ),
        SizedBox(height: screenDimensions.h(5)),
        MyButton(
            text: label.l_play_again,
            backgroundColor: Colors.lightGreenAccent,
            onClick: () {
              showRewardedAd(context, () {
                onUserEarnedReward.call();
              });
            }),
      ],
    ));
  }

  void showRewardedAd(
      BuildContext buildContext, VoidCallback executeAfterClose) {
    if (rewardedAd != null && isRewardedAdLoaded) {
      rewardedAd!.show(
          onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
        executeAfterClose.call();
        initRewardedAd();
      });
      rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (interstitialAd) {
        initRewardedAd();
      }, onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        initRewardedAd();
      });
    } else {
      initRewardedAd();
    }
  }

  void initRewardedAd() {
    rewardedAd?.dispose();
    isRewardedAdLoaded = false;
    RewardedAd.load(
        adUnitId: adService.rewardedAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            this.rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }

  String getText() {
    return label.l_congratulations_game_finished;
  }

  String getImageName() {
    return "popup_extra_hint_background";
  }
}
