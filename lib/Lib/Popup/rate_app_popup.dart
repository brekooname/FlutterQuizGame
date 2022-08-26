import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Internet/internet_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/rate_app_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../main.dart';
import '../Font/font_util.dart';
import 'my_popup.dart';

class RatePopupService {
  final int launchesUntilPrompt = 2;

  late RateAppLocalStorage rateAppLocalStorage;

  late BuildContext context;

  static final RatePopupService singleton = RatePopupService.internal();

  factory RatePopupService({required BuildContext buildContext}) {
    singleton.context = buildContext;
    singleton.rateAppLocalStorage = RateAppLocalStorage();
    return singleton;
  }

  RatePopupService.internal();

  void showRateAppPopup() {
    if (MyApp.kIsManualTest) {
      return;
    } else if (rateAppLocalStorage.isAlreadyRated()) {
      return;
    } else if (rateAppLocalStorage.appLaunchedCount() % launchesUntilPrompt ==
        0) {
      MyPopup.showPopup(context, RateAppPopup(rateAppLocalStorage));
    }
  }
}

class RateAppPopup extends StatelessWidget with MyPopup, LabelMixin {
  RateAppLocalStorage rateAppLocalStorage;
  InternetService internetService = InternetService();

  RateAppPopup(this.rateAppLocalStorage, {Key? key}) : super(key: key);

  @override
  AlertDialog build(BuildContext context) {
    initPopup(backgroundImageName: "popup_rate_app_stars_background");

    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          margin,
          MyText(
              text: label.l_thanks_for_your_support,
              fontColor: FontUtil.getFontDefaultColorForContrast()),
          margin,
          MyButton(
            text: label.l_rate_now_the_app,
            backgroundColor: Colors.lightGreenAccent,
            onClick: () {
              closePopup(context);
              rateAppLocalStorage.setAlreadyRated();
              internetService.openAppUrl(MyApp.appRatingPackage, true, context);
            },
          ),
          margin,
          MyButton(
            text: label.l_rate_later,
            backgroundColor: Colors.grey.shade300,
            onClick: () {
              closePopup(context);
            },
          ),
        ],
      ),
      context: context,
    );
  }
}
