import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'my_popup.dart';

class WatchRewardedAdPopup extends StatefulWidget with MyPopup {
  AdService adService = AdService();
  bool watchVideoForExtraHint;
  VoidCallback onUserEarnedReward;
  RewardedAd? rewardedAd;
  bool isRewardedAdLoaded = false;

  WatchRewardedAdPopup(
      {this.watchVideoForExtraHint = true, required this.onUserEarnedReward});

  @override
  State<WatchRewardedAdPopup> createState() => WatchRewardedAdPopupState();
}

class WatchRewardedAdPopupState extends State<WatchRewardedAdPopup>
    with MyPopup {
  @override
  AlertDialog build(BuildContext context) {
    initPopup(context);

    double loadingGifSide = screenDimensions.h(5);
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
          fontSize: FontConfig.getCustomFontSize(1.2),
        ),
        SizedBox(height: screenDimensions.h(5)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyButton(
                  text: label.l_yes,
                  disabled: !widget.isRewardedAdLoaded,
                  backgroundColor: Colors.lightGreenAccent,
                  onClick: () {
                    closePopup(context);
                    showRewardedAd(context, () {
                      widget.onUserEarnedReward.call();
                    });
                  }),
              !widget.isRewardedAdLoaded
                  ? imageService.getMainImage(
                      imageName: "loading",
                      module: "general",
                      imageExtension: "gif",
                      maxHeight: loadingGifSide,
                      maxWidth: loadingGifSide)
                  : Container()
            ]),
        SizedBox(height: screenDimensions.h(5)),
        MyButton(
          text: label.l_no,
          backgroundColor: Colors.grey.shade300,
          onClick: () {
            closePopup(context);
          },
        )
      ],
    ));
  }

  void showRewardedAd(
      BuildContext buildContext, VoidCallback executeAfterClose) {
    if (widget.rewardedAd != null && widget.isRewardedAdLoaded) {
      widget.rewardedAd!.show(
          onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
        executeAfterClose.call();
        initRewardedAd();
      });
      widget.rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
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
    widget.rewardedAd?.dispose();
    setState(() {
      widget.isRewardedAdLoaded = false;
    });
    RewardedAd.load(
        adUnitId: widget.adService.rewardedAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            setState(() {
              widget.rewardedAd = ad;
              widget.isRewardedAdLoaded = true;
            });
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }

  String getText() {
    return label.l_watch_an_ad_for_a_free_hint;
  }

  String getImageName() {
    return "popup_extra_hint_background";
  }
}
