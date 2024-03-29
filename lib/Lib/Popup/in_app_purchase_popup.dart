import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/in_app_purchases_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import 'my_popup.dart';

class InAppPurchasesPopupService {
  static final InAppPurchasesPopupService singleton =
      InAppPurchasesPopupService.internal();

  factory InAppPurchasesPopupService() {
    return singleton;
  }

  InAppPurchasesPopupService.internal();

  void showPopup(
      {String? inAppPurchaseDescription, VoidCallback? executeAfterPurchase}) {
    MyPopup.showPopup(InAppPurchasePopup(
      executeAfterPurchase: executeAfterPurchase,
    ));
  }
}

class InAppPurchasePopup extends StatefulWidget {
  static final String _kNonConsumableId =
      MyApp.appId.gameConfig.extraContentProductId;
  static final List<String> _kProductIds = <String>[
    _kNonConsumableId,
  ];

  final InAppPurchaseLocalStorage _inAppPurchaseLocalStorage =
      InAppPurchaseLocalStorage();
  late final InAppPurchase _inAppPurchase;
  final VoidCallback? executeAfterPurchase;

  InAppPurchasePopup({this.executeAfterPurchase, Key? key}) : super(key: key) {
    _inAppPurchase = InAppPurchase.instance;
  }

  @override
  _InAppPurchaseState createState() => _InAppPurchaseState();
}

class _InAppPurchaseState extends State<InAppPurchasePopup>
    with MyPopup, LabelMixin {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = [];
  bool _purchasePending = false;
  String? _queryProductError;

  @override
  void initState() {
    initPopup(backgroundImageName: "popup_in_app_purchases_background");

    debugPrint("open in app purchases");
    if (!kIsWeb) {
      final Stream<List<PurchaseDetails>> purchaseUpdated =
          widget._inAppPurchase.purchaseStream;
      _subscription = purchaseUpdated.listen((purchaseDetailsList) {
        if (purchaseDetailsList.isEmpty) {
          _showSnackBar(label.l_nothing_to_restore);
        } else {
          _listenToPurchaseUpdated(purchaseDetailsList);
        }
      }, onDone: () {
        _subscription.cancel();
      }, onError: (error) {
        // handle error here.
      });
    }
    initStoreInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackWidgets = [];
    debugPrint("create in app purchases popup");
    if (_queryProductError == null && _products.isNotEmpty) {
      stackWidgets.add(
        SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProductList(),
          ],
        )),
      );
    } else if (_queryProductError != null) {
      stackWidgets.add(Center(
        child: Text(_queryProductError!),
      ));
    }

    if (_purchasePending || _products.isEmpty) {
      stackWidgets.add(
        const SizedBox(
            child: Center(
          child: CircularProgressIndicator(),
        )),
      );
    }

    return createDialog(
      Stack(
        children: stackWidgets,
      ),
    );
  }

  Future<void> initStoreInfo() async {
    if (kIsWeb) {
      setState(() {
        _products = [
          ProductDetails(
              id: MyApp.appId.gameConfig.extraContentProductId,
              title: "Title",
              description: "Extra Content + Ad free",
              price: "0.99",
              rawPrice: 0.99,
              currencyCode: "EUR")
        ];
      });
      return;
    }

    final bool isAvailable =
        await widget._inAppPurchase.isAvailable().catchError((e) {
      debugPrint('Got error: $e'); // Finally, callback fires.
    });
    if (!isAvailable) {
      setState(() {
        _products = [];
        _purchasePending = false;
      });
      return;
    }

    if (Platform.isIOS) {
      var iosPlatformAddition = widget._inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    ProductDetailsResponse productDetailResponse = await widget._inAppPurchase
        .queryProductDetails(InAppPurchasePopup._kProductIds.toSet());

    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _products = productDetailResponse.productDetails;
        _purchasePending = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _products = productDetailResponse.productDetails;
        _purchasePending = false;
      });
      return;
    }

    setState(() {
      _products = productDetailResponse.productDetails;
      _purchasePending = false;
    });
  }

  void showPendingUI() {
    setState(() {
      _purchasePending = true;
    });
  }

  Column _buildProductList() {
    var btnWidth = screenDimensions.dimen(65);
    var paddingBetween = screenDimensions.dimen(1);
    var iconWidth = screenDimensions.dimen(8);

    List<Column> productList = <Column>[];
    productList.addAll(_products.map(
      (ProductDetails productDetails) {
        return Column(children: [
          MyText(
            fontSize: FontConfig.bigFontSize,
            fontColor: FontConfig.fontDefaultColorForContrast,
            text: label.l_extra_content_ad_free,
          ),
          margin,
          _buildBuyButton(btnWidth, paddingBetween, iconWidth, productDetails),
          margin,
          _buildRestoreButton(btnWidth, iconWidth, paddingBetween),
        ]);
      },
    ));

    return Column(children: productList);
  }

  MyButton _buildBuyButton(double btnWidth, double paddingBetween,
      double iconWidth, ProductDetails productDetails) {
    return MyButton(
      backgroundColor: Colors.greenAccent,
      width: btnWidth,
      customContent: Row(children: [
        SizedBox(width: paddingBetween),
        imageService.getMainImage(
          imageName: "btn_in_app_purchases_background",
          imageExtension: "png",
          module: "buttons",
          maxWidth: iconWidth,
        ),
        SizedBox(width: paddingBetween),
        MyText(
          text: label.l_buy,
          fontSize: FontConfig.getCustomFontSize(1.1),
          width: btnWidth - iconWidth - paddingBetween * 5,
          alignmentInsideContainer: Alignment.center,
        ),
      ]),
      onClick: () {
        if (kIsWeb || MyApp.kIsManualTest) {
          widget._inAppPurchaseLocalStorage.savePurchase(productDetails.id);
          MyApp.extraContentBought(widget.executeAfterPurchase);
          _showSnackBar(label.l_purchased);
          return;
        }

        if (productDetails.id == InAppPurchasePopup._kNonConsumableId) {
          widget._inAppPurchase.buyNonConsumable(
              purchaseParam: getPurchaseParam(productDetails));
        }
      },
    );
  }

  Widget _buildRestoreButton(
      double btnWidth, double iconWidth, double paddingBetween) {
    return MyButton(
        backgroundColor: Colors.lightBlueAccent,
        width: btnWidth,
        customContent: Row(children: [
          SizedBox(width: paddingBetween),
          imageService.getMainImage(
            imageName: "btn_restore_purchase",
            imageExtension: "png",
            module: "buttons",
            maxWidth: iconWidth,
          ),
          MyText(
            text: label.l_restore_purchase,
            maxLines: 2,
            width: btnWidth - iconWidth - paddingBetween * 5,
            alignmentInsideContainer: Alignment.center,
          ),
        ]),
        onClick: () {
          if (kIsWeb) {
            return;
          }
          widget._inAppPurchase.restorePurchases();
        });
  }

  PurchaseParam getPurchaseParam(ProductDetails productDetails) {
    PurchaseParam purchaseParam;
    if (Platform.isAndroid) {
      purchaseParam = GooglePlayPurchaseParam(
        productDetails: productDetails,
        applicationUserName: null,
      );
    } else {
      purchaseParam = PurchaseParam(
        productDetails: productDetails,
        applicationUserName: null,
      );
    }
    return purchaseParam;
  }

  void _deliverProduct(PurchaseDetails purchaseDetails) {
    if (purchaseDetails.productID == InAppPurchasePopup._kNonConsumableId) {
      widget._inAppPurchaseLocalStorage.savePurchase(purchaseDetails.productID);
      _showSnackBar(label.l_purchased);
      MyApp.extraContentBought(widget.executeAfterPurchase);
      setState(() {
        _purchasePending = false;
      });
    }
  }

  void _handleError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
    _showSnackBar("Error");
  }

  void _showSnackBar(String message) {
    closePopup();
    snackBarService.showSnackBar(message, context);
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    // ignore: avoid_function_literals_in_foreach_calls
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          _deliverProduct(purchaseDetails);
        } else if (purchaseDetails.status == PurchaseStatus.restored) {
          _deliverProduct(purchaseDetails);
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await widget._inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    });
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      if (Platform.isIOS) {
        var iosPlatformAddition = widget._inAppPurchase
            .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
        iosPlatformAddition.setDelegate(null);
      }
      _subscription.cancel();
    }
    super.dispose();
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
