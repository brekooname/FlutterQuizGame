import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/in_app_purchases_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'package:flutter_app_quiz_game/main.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import 'my_popup.dart';

class InAppPurchasesPopupService {
  late BuildContext context;

  static final InAppPurchasesPopupService singleton =
      InAppPurchasesPopupService.internal();

  factory InAppPurchasesPopupService({required BuildContext buildContext}) {
    singleton.context = buildContext;
    return singleton;
  }

  InAppPurchasesPopupService.internal();

  void showPopup({String? inAppPurchaseDescription}) {
    Future.delayed(
        Duration.zero,
        () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return InAppPurchasePopup();
            }));
  }
}

class InAppPurchasePopup extends StatefulWidget {
  static String _kNonConsumableId =
      MyApp.appId.gameConfig.extraContentProductId;
  static List<String> _kProductIds = <String>[
    _kNonConsumableId,
  ];

  InAppPurchaseLocalStorage _inAppPurchaseLocalStorage =
      InAppPurchaseLocalStorage();
  late InAppPurchase _inAppPurchase;

  InAppPurchasePopup() {
    _inAppPurchase = InAppPurchase.instance;
  }

  @override
  _InAppPurchaseState createState() => _InAppPurchaseState();
}

class _InAppPurchaseState extends State<InAppPurchasePopup> with MyPopup {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = [];
  bool _purchasePending = false;
  String? _queryProductError;

  @override
  void initState() {
    if (!kIsWeb) {
      final Stream<List<PurchaseDetails>> purchaseUpdated =
          widget._inAppPurchase.purchaseStream;
      _subscription = purchaseUpdated.listen((purchaseDetailsList) {
        if (purchaseDetailsList.isEmpty) {
          showSnackBar(label.l_nothing_to_restore);
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
    initPopup(
        context: context,
        backgroundImageName: "popup_in_app_purchases_background");

    List<Widget> stack = [];
    var popupHeight = screenDimensions.h(45);
    if (_queryProductError == null && _products.isNotEmpty) {
      stack.add(
        SizedBox(
            height: popupHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProductList(),
              ],
            )),
      );
    } else if (_queryProductError != null) {
      stack.add(Center(
        child: Text(_queryProductError!),
      ));
    }

    if (_purchasePending || _products.isEmpty) {
      stack.add(
        SizedBox(
          height: popupHeight,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child:
                    const ModalBarrier(dismissible: false, color: Colors.grey),
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      );
    }

    return createDialog(Container(
        child: Stack(
      children: stack,
    )));
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
      print('Got error: $e'); // Finally, callback fires.
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

  Container _buildProductList() {
    var btnWidth = screenDimensions.w(65);
    var paddingBetween = screenDimensions.w(1);
    var iconWidth = screenDimensions.w(8);

    List<Column> productList = <Column>[];
    productList.addAll(_products.map(
      (ProductDetails productDetails) {
        return Column(children: [
          MyText(
            fontSize: FontConfig.bigFontSize,
            text: label.l_extra_content_ad_free,
          ),
          SizedBox(height: screenDimensions.h(5)),
          MyButton(
            backgroundColor: Colors.greenAccent,
            width: btnWidth,
            customContent: Row(children: [
              SizedBox(width: paddingBetween),
              imageService.getMainImage(
                imageName: "btn_in_app_purchases_background",
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
              if (kIsWeb) {
                widget._inAppPurchaseLocalStorage
                    .savePurchase(productDetails.id);
                MyApp.extraContentBought(context);
                showSnackBar(label.l_purchased);
                return;
              }

              if (productDetails.id == InAppPurchasePopup._kNonConsumableId) {
                widget._inAppPurchase.buyNonConsumable(
                    purchaseParam: getPurchaseParam(productDetails));
              }
            },
          ),
          SizedBox(height: screenDimensions.h(3)),
          _buildRestoreButton(btnWidth, iconWidth, paddingBetween),
        ]);
      },
    ));

    return Container(child: Column(children: productList));
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
      onClick: () => widget._inAppPurchase.restorePurchases(),
    );
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

  void deliverProduct(PurchaseDetails purchaseDetails) {
    if (purchaseDetails.productID == InAppPurchasePopup._kNonConsumableId) {
      widget._inAppPurchaseLocalStorage
          .savePurchase(purchaseDetails.productID);
      showSnackBar(label.l_purchased);
      MyApp.extraContentBought(context);
      setState(() {
        _purchasePending = false;
      });
    }
  }

  void handleError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
    showSnackBar("Error");
  }

  void showSnackBar(String message) {
    closePopup(context);
    var snackBar = SnackBar(
      content: Container(
        height: screenDimensions.h(5),
        child: Center(
            child: MyText(
          text: message,
          width: screenDimensions.w(99),
          maxLines: 1,
        )),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          deliverProduct(purchaseDetails);
        } else if (purchaseDetails.status == PurchaseStatus.restored) {
          deliverProduct(purchaseDetails);
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
