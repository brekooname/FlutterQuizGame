import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/rate_app_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class RatePopupService {
  //TODO ---VALUE CHANGED--- should be 2
  final int launches_until_prompt = 2;

  late RateAppLocalStorage rateAppLocalStorage;

  late BuildContext context;

  late MyAppContext myAppContext;

  static final RatePopupService singleton = RatePopupService.internal();

  factory RatePopupService(
      {required BuildContext buildContext,
      required MyAppContext myAppContext}) {
    singleton.context = buildContext;
    singleton.myAppContext = myAppContext;
    singleton.rateAppLocalStorage =
        RateAppLocalStorage(myAppContext: myAppContext);
    return singleton;
  }

  RatePopupService.internal();

  void showRateAppPopup() {
    print("count" + rateAppLocalStorage.appLaunchedCount().toString());
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

class RateAppPopup extends StatelessWidget {
  RateAppLocalStorage rateAppLocalStorage;

  RateAppPopup(this.rateAppLocalStorage);

  @override
  Dialog build(BuildContext context) {
    var width = 360.0;
    var height = 450.0;
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.white),
        height: height,
        width: width,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  "assets/main/general/rate_app_background_stars.png",
                  width: width / 2.6,
                ),
                SizedBox(height: 20),
                MyText(
                    text:
                        'If you enjoy using our app please give it a rating.'),
                SizedBox(height: 40),
                MyButton(
                  text: 'Rate now the app',
                  backgroundColor: Colors.lightGreenAccent,
                  onClick: () {
                    rateAppLocalStorage.setAlreadyRated();
                  },
                ),
                SizedBox(height: 20),
                MyButton(
                  text: 'Rate later',
                  backgroundColor: Colors.grey.shade300,
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 10),
              ],
            )),
      ),
    );
  }
}
