import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';
import 'package:prokit_flutter/food/utils/dotted_border.dart';

import '../utils/FoodColors.dart';
import 'FoodAddressConfirmation.dart';
import 'FoodCoupon.dart';
import 'FoodPayment.dart';

class FoodBookCart extends StatefulWidget {
  static String tag = '/BookCart';

  @override
  FoodBookCartState createState() => FoodBookCartState();
}

class FoodBookCartState extends State<FoodBookCart> {
  List<FoodDish> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = orderData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: food_white,
      bottomNavigationBar: Container(
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: food_app_background,
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                  SizedBox(
                    width: spacing_standard,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          text(food_lbl_Sweet_home, fontFamily: fontMedium),
                          GestureDetector(
                            onTap: () {
                              launchScreen(
                                  context, FoodAddressConfirmation.tag);
                            },
                            child: text(food_lbl_change,
                                textColor: food_colorPrimary),
                          ),
                        ],
                      ),
                      text(food_lbl_address_dashboard),
                      text(food_lbl_delivery_time_36_min,fontSize: 14.0,
                          textColor: food_textColorSecondary),
                    ],
                  ))
                ],
              ),
            ),
            mBottom(
                context,
                food_color_blue_gradient1,
                food_color_blue_gradient2,
                food_lbl_make_payment,
                FoodPayment.tag)
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () {
              back(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: food_textColorPrimary,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    left: spacing_standard_new,
                    right: spacing_standard_new,
                    top: spacing_control),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(food_lbl_your_cart,
                        fontFamily: fontBold, fontSize: textSizeLarge),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mList2.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Cart(mList2[index], index);
                        }),
                    Container(
                      height: 0.5,
                      color: food_view_color,
                      width: width,
                      margin: EdgeInsets.only(bottom: spacing_standard_new),
                    ),
                    text(food_lbl_restaurants_bill,
                        fontFamily: fontBold, textAllCaps: true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(
                          food_lbl_sub_total,
                        ),
                        text(
                          food_lbl_1799,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing_control,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(
                          food_lbl_coupon_discount,
                        ),
                        text(food_lbl_70, textColor: food_colorAccent),
                      ],
                    ),
                    SizedBox(
                      height: spacing_control,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(
                          food_lbl_gst,
                        ),
                        text(
                          food_lbl_70,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing_middle,
                    ),
                    DottedBorder(
                      color: food_colorAccent,
                      strokeWidth: 1,
                      padding: EdgeInsets.all(spacing_control_half),
                      radius: Radius.circular(spacing_standard_new),
                      child: ClipRRect(
                        child: Container(
                            width: width,
                            padding: EdgeInsets.all(spacing_control),
                            color: food_color_light_primary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: text(
                                      food_lbl_you_have_saved_30_on_the_bill,
                                      isCentered: true),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        launchScreen(context, FoodCoupon.tag);
                                      },
                                      child: text(food_lbl_edit,
                                          textColor: food_colorAccent,
                                          isCentered: true),
                                    ))
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Cart extends StatelessWidget {
  FoodDish model;

  Cart(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: spacing_standard_new),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                    model.image,
                  ),
                ),
                SizedBox(
                  width: spacing_middle,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(model.name, fontFamily: fontMedium),
                      text(model.price),
                      //text("sd",textColor: food_textColorSecondary),
                    ],
                  ),
                )
              ],
            ),
          ),
          Quantitybtn()
        ],
      ),
    );
  }
}
