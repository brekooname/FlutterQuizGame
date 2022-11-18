import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Internet/internet_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/rate_app_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../main.dart';
import 'my_popup.dart';

class RatePopupService {
  final int launchesUntilPrompt = MyApp.kIsManualTest ? 15 : 2;

  final RateAppLocalStorage _rateAppLocalStorage = RateAppLocalStorage();

  static final RatePopupService singleton = RatePopupService.internal();

  factory RatePopupService() {
    return singleton;
  }

  RatePopupService.internal();

  void showRateAppPopup() {
    if (_rateAppLocalStorage.isAlreadyRated()) {
      return;
    } else if (_rateAppLocalStorage.appLaunchedCount() % launchesUntilPrompt ==
        0) {
      MyPopup.showPopup(RateAppPopup());
    }
  }
}

class RateAppPopup extends StatefulWidget {
  final RateAppLocalStorage _rateAppLocalStorage = RateAppLocalStorage();
  final InternetService _internetService = InternetService();

  RateAppPopup({Key? key}) : super(key: key);

  @override
  State<RateAppPopup> createState() => RateAppPopupState();
}

class RateAppPopupState extends State<RateAppPopup> with MyPopup, LabelMixin {
  @override
  void initState() {
    super.initState();
    initPopup(backgroundImageName: "popup_rate_app_stars_background");
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          margin,
          MyText(
              text: label.l_thanks_for_your_support,
              fontColor: FontConfig.fontDefaultColorForContrast),
          margin,
          MyButton(
            text: label.l_rate_now_the_app,
            backgroundColor: Colors.lightGreenAccent,
            onClick: () {
              closePopup();
              widget._rateAppLocalStorage.setAlreadyRated();
              widget._internetService
                  .openAppUrl(MyApp.appRatingPackage, true, context);
            },
          ),
          margin,
          MyButton(
            text: label.l_rate_later,
            backgroundColor: Colors.grey.shade300,
            onClick: () {
              closePopup();
            },
          ),
        ],
      ),
    );
  }
}
