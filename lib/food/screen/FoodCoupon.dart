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

class FoodCoupon extends StatefulWidget {
  static String tag = '/FoodCoupon';

  @override
  FoodCouponState createState() => FoodCouponState();
}

class FoodCouponState extends State<FoodCoupon> {
  List<Coupons> mList;

  @override
  void initState() {
    super.initState();
    mList = addCouponsData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_app_background);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: food_app_background,
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
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(food_lbl_apply_coupons, fontFamily: fontBold, fontSize: textSizeLarge),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  Container(
                    decoration: boxDecoration(color: food_colorPrimary, showShadow: true, radius: 50),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14.0),
                              isDense: true,
                              hintText: food_lbl_enter_apply_code,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: gradientBoxDecoration(radius: 50, gradientColor1: food_color_blue_gradient1, gradientColor2: food_color_blue_gradient2),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: food_white,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 0.6,
                        color: food_view_color,
                        width: width * 0.1,
                        margin: EdgeInsets.only(right: spacing_standard),
                      ),
                      text(food_lbl_or_use_your_mobile_email, fontSize: textSizeSMedium, textColor: food_textColorSecondary, textAllCaps: true),
                      Container(
                        height: 0.6,
                        color: food_view_color,
                        width: width * 0.1,
                        margin: EdgeInsets.only(left: spacing_standard),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Coupon(mList[index], index);
                      }),
                ],
              ),
            )),
          )
        ],
      )),
    );
  }
}

class Coupon extends StatelessWidget {
  Coupons model;

  Coupon(Coupons model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DottedBorder(
            color: food_colorAccent,
            strokeWidth: 1,
            padding: EdgeInsets.all(spacing_control_half),
            radius: Radius.circular(20),
            child: ClipRRect(
              //borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
              child: Container(
                width: width * 0.3,
                color: food_color_light_primary,
                child: text(model.offer, textColor: food_colorAccent, isCentered: true),
              ),
            ),
          ),
          SizedBox(
            height: spacing_control,
          ),
          text(model.couponsName, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
          text(model.info, textColor: food_textColorSecondary, isLongText: true),
          Container(
            height: 0.5,
            color: food_view_color,
            width: width,
            margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
          )
        ],
      ),
    );
  }
}
