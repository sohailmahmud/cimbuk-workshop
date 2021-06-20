import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodImages.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import 'FoodDeliveryInfo.dart';

class FoodPayment extends StatefulWidget {
  static String tag = '/FoodPayment';

  @override
  FoodPaymentState createState() => FoodPaymentState();
}

class FoodPaymentState extends State<FoodPayment> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_app_background);
    var width = MediaQuery.of(context).size.width;

    Widget mPaymentOption(var icon, var heading, var value, var valueColor) {
      return Container(
        decoration: boxDecoration(showShadow: true),
        padding: EdgeInsets.all(spacing_control),
        child: Column(
          children: <Widget>[
            SizedBox(height: spacing_standard),
            SvgPicture.asset(icon, width: width * 0.1, height: width * 0.1),
            SizedBox(height: spacing_standard),
            text(heading),
            text(value, textColor: valueColor, fontFamily: fontMedium),
          ],
        ),
      );
    }

    Widget mNetbankingOption(var icon, var value) {
      return Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(food_ic_fab_back, width: width * 0.17),
              Container(
                child: CachedNetworkImage(
                    imageUrl: icon, width: width * 0.08, fit: BoxFit.contain),
              )
            ],
          ),
          SizedBox(height: spacing_control),
          text(value)
        ],
      );
    }

    return Scaffold(
      backgroundColor: food_app_background,
      bottomNavigationBar: mBottom(context, food_color_blue_gradient1,
          food_color_blue_gradient2, food_delivery_info, FoodDeliveryInfo.tag),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width,
              alignment: Alignment.topLeft,
              color: food_white,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  back(context);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(spacing_middle),
                      decoration: boxDecoration(radius: 0, showShadow: true),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(food_lbl_payment,
                              fontFamily: fontBold, fontSize: textSizeLarge),
                          SizedBox(height: spacing_standard),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: mPaymentOption(
                                      food_google_wallet,
                                      food_lbl_google_wallet,
                                      food_lbl_1799,
                                      food_color_red)),
                              SizedBox(width: spacing_standard_new),
                              Expanded(
                                  flex: 1,
                                  child: mPaymentOption(
                                      food_whatsapp,
                                      food_lbl_whatsapp_payment,
                                      food_lbl_connect,
                                      food_textColorPrimary)),
                            ],
                          ),
                          SizedBox(height: spacing_standard),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.all(spacing_standard_new),
                      decoration: boxDecoration(radius: 0, showShadow: true),
                      margin: EdgeInsets.only(
                          top: spacing_standard_new,
                          bottom: spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(food_lbl_credit_cards,
                              fontFamily: fontMedium, textAllCaps: true),
                          SizedBox(height: spacing_standard_new),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            right: spacing_middle),
                                        child: CachedNetworkImage(
                                            imageUrl: food_ic_hdfc,
                                            height: width * 0.05,
                                            width: width * 0.05))),
                                TextSpan(
                                    text: food_lbl__42xx_4523_xxxx_55xx,
                                    style: TextStyle(
                                        fontSize: textSizeMedium,
                                        color: food_textColorPrimary)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(spacing_standard_new),
                      decoration: boxDecoration(radius: 0, showShadow: true),
                      margin: EdgeInsets.only(bottom: spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(food_lbl_netbanking,
                                  fontFamily: fontMedium, textAllCaps: true),
                              mViewAll(context, food_lbl_view_all_banks),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              mNetbankingOption(food_ic_hdfc, food_lbl_hdfc),
                              mNetbankingOption(food_ic_rbs, food_lbl_rbs),
                              mNetbankingOption(food_ic_citi, food_lbl_citi),
                              mNetbankingOption(
                                  food_ic_america, food_lbl_america),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
