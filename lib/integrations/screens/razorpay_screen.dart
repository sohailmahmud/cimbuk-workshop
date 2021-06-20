import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayScreen extends StatefulWidget {
  static String tag = '/RazorPayScreen';

  @override
  RazorPayScreenState createState() => RazorPayScreenState();
}

class RazorPayScreenState extends State<RazorPayScreen> {
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 2000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    toast("SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    toast("ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    toast("EXTERNAL_WALLET: " + response.walletName);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);
    return Scaffold(
      appBar: getAppBar(context, 'RazorPay Payment checkout'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 28),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), boxShadow: [BoxShadow(color: shadowColor, blurRadius: 10, spreadRadius: 2)], color: whiteColor),
                    child: Image.asset(
                      "images/integrations/icons/ic_razorpay.png",
                      width: 120,
                      height: 120,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("RazorPay", fontSize: textSizeLarge, fontFamily: fontMedium, textColor: Colors.lightBlue[600]),
                        text("Order#567880", fontSize: textSizeMedium, textColor: Theme.of(context).secondaryHeaderColor),
                        SizedBox(
                          height: 16,
                        ),
                        text("\$2000", fontSize: textSizeXLarge, fontFamily: fontMedium),
                      ],
                    ),
                  )
                ],
              ),
              Divider(height: 0.5),
              text("Name", textColor: primaryColor, fontFamily: fontSemibold, fontSize: textSizeLargeMedium).paddingAll(16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: text("Acme Corp."),
              ),
              text("Email", textColor: primaryColor, fontFamily: fontSemibold, fontSize: textSizeLargeMedium).paddingAll(16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: text("test@razorpay.com"),
              ),
              text("Contact", textColor: primaryColor, fontFamily: fontSemibold, fontSize: textSizeLargeMedium).paddingAll(16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: text("8888888888"),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 80),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: textPrimary('Pay with RazorPay', aFontFamily: fontMedium),
              ).onTap(() {
                openCheckout();
              })
            ],
          )

          /*MaterialButton(
            color: primaryColor,
            onPressed: () => openCheckout(),
            child: textPrimary('Pay with RazorPay'),
          )*/
          ,
        ),
      ),
    );
  }
}
