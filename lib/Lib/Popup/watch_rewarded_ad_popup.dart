import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'my_popup.dart';

class WatchRewardedAdPopup extends StatefulWidget {
  AdService adService = AdService();
  bool watchVideoForExtraHint;
  VoidCallback onUserEarnedReward;
  RewardedAd? rewardedAd;
  bool isRewardedAdLoaded = false;

  WatchRewardedAdPopup(
      {this.watchVideoForExtraHint = true, required this.onUserEarnedReward}) {
    initRewardedAd();
  }

  void initRewardedAd() {
    if (kIsWeb) {
      isRewardedAdLoaded = true;
      return;
    }
    rewardedAd?.dispose();
    isRewardedAdLoaded = false;
    RewardedAd.load(
        adUnitId: adService.rewardedAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            rewardedAd = ad;
            isRewardedAdLoaded = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }

  @override
  State<WatchRewardedAdPopup> createState() => WatchRewardedAdPopupState();
}

class WatchRewardedAdPopupState extends State<WatchRewardedAdPopup>
    with MyPopup {
  @override
  AlertDialog build(BuildContext context) {
    initPopup(context: context);

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!widget.isRewardedAdLoaded) {
        setState(() {});
      } else {
        timer.cancel();
      }
    });

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
              SizedBox(width: screenDimensions.w(1)),
              widget.isRewardedAdLoaded
                  ? Container()
                  : CircularProgressIndicator()
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
    if (kIsWeb) {
      executeAfterClose.call();
      return;
    }
    if (widget.rewardedAd != null && widget.isRewardedAdLoaded) {
      widget.rewardedAd!.show(
          onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
        executeAfterClose.call();
      });
      widget.rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (interstitialAd) {},
          onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {});
    }
  }

  @override
  void dispose() {
    widget.rewardedAd?.dispose();
    super.dispose();
  }

  String getText() {
    return label.l_watch_an_ad_for_a_free_hint;
  }

  String getImageName() {
    return "popup_extra_hint_background";
  }
}
