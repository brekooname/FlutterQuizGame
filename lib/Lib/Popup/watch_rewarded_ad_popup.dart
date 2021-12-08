import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/rate_app_local_storage.dart';
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
  Dialog build(BuildContext context) {
    initPopup(context);

    Size popupSize = defaultSize;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(FontConfig.getStandardBorderRadius()),
            color: Colors.white),
        height: popupSize.height,
        width: popupSize.width,
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.w(2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                imageService.getMainImage(
                    imageName: getImageName(),
                    module: "popup",
                    maxWidth: popupSize.width / 2.6),
                SizedBox(height: screenDimensions.h(2)),
                MyText(
                  text: getText(),
                  maxLines: 3,
                  width: popupSize.width / 1.2,
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
                SizedBox(height: screenDimensions.h(4)),
                MyButton(
                  text: label.l_go_back,
                  backgroundColor: Colors.grey.shade300,
                  onClick: () {
                    var nav = Navigator.of(context);
                    nav.pop();
                  },
                ),
                SizedBox(height: screenDimensions.h(2)),
              ],
            )),
      ),
    );
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
