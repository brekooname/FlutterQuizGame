import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Number/number_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';

class PersTestAgePopup extends StatefulWidget with MyPopup {
  VoidCallback goToGameOverScreenCallback;
  PersTestLocalStorage persTestLocalStorage = PersTestLocalStorage();
  TextEditingController ageController = TextEditingController();

  PersTestAgePopup(this.goToGameOverScreenCallback, {Key? key})
      : super(key: key);

  @override
  State<PersTestAgePopup> createState() => PersTestAgePopupState();
}

class PersTestAgePopupState extends State<PersTestAgePopup> with MyPopup {
  @override
  void initState() {
    initPopup();
    super.initState();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              margin,
              TextField(
                controller: widget.ageController,
                decoration: InputDecoration(labelText: label.l_your_age),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              margin,
              MyButton(
                text: "OK",
                backgroundColor: Colors.green.shade200,
                onClick: () {
                  var text = widget.ageController.text;
                  if (NumberService.isNumeric(text)) {
                    widget.persTestLocalStorage.setUserAge(text.parseToInt);
                  } else {
                    widget.persTestLocalStorage.clearAge();
                  }
                  widget.goToGameOverScreenCallback.call();
                  closePopup(context);
                },
              ),
            ]),
        context: context, onCloseBtnClick: () {
      widget.persTestLocalStorage.clearAge();
      widget.goToGameOverScreenCallback.call();
      closePopup(context);
    });
  }
}
