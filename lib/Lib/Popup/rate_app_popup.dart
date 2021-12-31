import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Internet/internet_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/rate_app_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../main.dart';
import 'my_popup.dart';

class RatePopupService {
  //TODO ---VALUE CHANGED--- should be 2
  final int launches_until_prompt = 2;

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
    if (rateAppLocalStorage.isAlreadyRated()) {
      //TODO ---VALUE CHANGED--- should be return
      return;
    }

    if (rateAppLocalStorage.appLaunchedCount() % launches_until_prompt == 0) {
      Future.delayed(
          Duration.zero,
          () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return RateAppPopup(rateAppLocalStorage);
              }));
    }
  }
}

class RateAppPopup extends StatelessWidget with MyPopup {
  RateAppLocalStorage rateAppLocalStorage;
  InternetService internetService = InternetService();

  RateAppPopup(this.rateAppLocalStorage);

  @override
  AlertDialog build(BuildContext context) {
    initPopup();

    return createDialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          imageService.getMainImage(
              imageName: "popup_rate_app_stars_background",
              module: "popup",
              maxWidth: defaultBackgroundImageWidth),
          SizedBox(height: screenDimensions.h(5)),
          MyText(text: label.l_thanks_for_your_support),
          SizedBox(height: screenDimensions.h(5)),
          MyButton(
            text: label.l_rate_now_the_app,
            backgroundColor: Colors.lightGreenAccent,
            onClick: () {
              closePopup(context);
              rateAppLocalStorage.setAlreadyRated();
              internetService.openAppUrl(MyApp.appRatingPackage, true, context);
            },
          ),
          SizedBox(height: screenDimensions.h(5)),
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
