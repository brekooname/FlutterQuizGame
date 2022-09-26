import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../main.dart';
import '../Font/font_util.dart';
import 'my_popup.dart';

class WatchRewardedAdPopup extends StatefulWidget {
  AdService adService = AdService();
  bool watchVideoForExtraHint;
  VoidCallback onUserEarnedReward;
  RewardedAd? rewardedAd;
  bool isRewardedAdLoaded = false;

  WatchRewardedAdPopup(
      {Key? key,
      this.watchVideoForExtraHint = true,
      required this.onUserEarnedReward})
      : super(key: key) {
    initRewardedAd();
  }

  void initRewardedAd() {
    if (MyApp.isExtraContentLocked) {
      if (kIsWeb) {
        isRewardedAdLoaded = true;
        return;
      }
      isRewardedAdLoaded = false;
      RewardedAd.load(
          adUnitId: adService.rewardedAdUnitId,
          request: const AdRequest(),
          rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad) {
              rewardedAd = ad;
              isRewardedAdLoaded = true;
            },
            onAdFailedToLoad: (LoadAdError error) {
              debugPrint('RewardedAd failed to load: $error');
            },
          ));
    }
  }

  @override
  State<WatchRewardedAdPopup> createState() => WatchRewardedAdPopupState();
}

class WatchRewardedAdPopupState extends State<WatchRewardedAdPopup>
    with MyPopup, LabelMixin {
  @override
  void initState() {
    super.initState();
    initPopup(backgroundImageName: "popup_extra_hint_background");
    refreshTimer();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MyText(
            text: getText(),
            maxLines: 3,
            width: width / 1.2,
            fontColor: FontUtil.getFontDefaultColorForContrast(),
            fontSize: FontConfig.getCustomFontSize(1.2),
          ),
          margin,
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyButton(
                    text: label.l_yes,
                    disabled: !widget.isRewardedAdLoaded,
                    backgroundColor: Colors.lightGreenAccent,
                    onClick: () {
                      closePopup();
                      showRewardedAd(() {
                        widget.onUserEarnedReward.call();
                      });
                    }),
                SizedBox(width: screenDimensions.dimen(1)),
                widget.isRewardedAdLoaded
                    ? Container()
                    : const CircularProgressIndicator()
              ]),
          margin,
          MyButton(
            text: label.l_no,
            backgroundColor: Colors.grey.shade300,
            onClick: () {
              closePopup();
            },
          )
        ],
      ),
    );
  }

  void refreshTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.isRewardedAdLoaded) {
        timer.cancel();
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  void showRewardedAd(VoidCallback executeAfterClose) {
    if (kIsWeb) {
      widget.isRewardedAdLoaded = false;
      executeAfterClose.call();
      widget.initRewardedAd();
      refreshTimer();
      return;
    }
    if (widget.rewardedAd != null && widget.isRewardedAdLoaded) {
      widget.rewardedAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
        executeAfterClose.call();
      });
      widget.rewardedAd!.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
      }, onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
      });
      widget.initRewardedAd();
      refreshTimer();
    }
  }

  String getText() {
    return label.l_watch_an_ad_for_a_free_hint;
  }
}
