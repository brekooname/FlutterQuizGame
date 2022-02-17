import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_location.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_resource_type.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_resource_transaction_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class DopeWarsLocationMovePopup extends StatefulWidget with MyPopup {
  VoidCallback refreshStateCallback;

  DopeWarsLocationMovePopup(this.refreshStateCallback, {Key? key})
      : super(key: key);

  @override
  State<DopeWarsLocationMovePopup> createState() =>
      DopeWarsLocationMovePopupState();
}

class DopeWarsLocationMovePopupState extends State<DopeWarsLocationMovePopup>
    with MyPopup {
  @override
  void initState() {
    super.initState();
    initPopup();
  }

  @override
  AlertDialog build(BuildContext context) {
    return createDialog(
      createLocations(),
      context: context,
    );
  }

  Widget createLocations() {
    List<Widget> items = [];
    for (DopeWarsLocation l in DopeWarsLocation.locations) {
      items.add(createLocationRow(l));
      items.add(SizedBox(
        height: screenDimensions.dimen(3),
      ));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createLocationRow(DopeWarsLocation location) {
    var btnSize = Size(screenDimensions.w(32), screenDimensions.dimen(17));
    List<Widget> items = [];
    items.add(Column(children: [
      MyButton(
        text: location.locationLabel,
        size: btnSize,
        buttonSkinConfig: ButtonSkinConfig(
            borderColor: Colors.green.shade800,
            borderWidth: FontConfig.standardBorderWidth / 2,
            backgroundColor: Colors.green.shade50),
        onClick: () {
          setState(() {});
        },
      ),
      MyText(
        maxLines: 1,
        fontSize: FontConfig.getCustomFontSize(0.8),
        text: "Unlock " +
            DopeWarsResourceTransactionService.formatCurrency(
                location.unlockPrice),
      )
    ]));
    items.add(createResColumn(location.cheapResources, "downarrow"));
    items.add(createResColumn(location.expensiveResources, "uparrow"));
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createResColumn(List<DopeWarsResourceType> res, String arrowImgName) {
    List<Widget> items = [];
    for (DopeWarsResourceType t in res) {
      items.add(createResRow(t, arrowImgName));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items);
  }

  Widget createResRow(DopeWarsResourceType res, String arrowImgName) {
    List<Widget> items = [];
    var allContainerWidth = screenDimensions.dimen(27);
    var imgDimen = screenDimensions.dimen(5);
    items.add(MyText(
      width: allContainerWidth - imgDimen * 1.1,
      text: res.resourceLabel,
      fontSize: FontConfig.getCustomFontSize(0.8),
      maxLines: 1,
    ));
    items.add(imageService.getSpecificImage(
        maxWidth: imgDimen,
        module: "general",
        imageName: arrowImgName,
        imageExtension: "png"));
    return SizedBox(
        width: allContainerWidth,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items));
  }
}
