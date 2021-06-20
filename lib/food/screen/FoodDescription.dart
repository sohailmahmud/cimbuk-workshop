import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodImages.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import 'FoodBookCart.dart';

class FoodDescription extends StatefulWidget {
  static String tag = '/FoodDescription';

  @override
  FoodDescriptionState createState() => FoodDescriptionState();
}

class FoodDescriptionState extends State<FoodDescription> {
  List<FoodDish> mList1;
  List<FoodDish> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = addFoodDishData();
    mList2 = orderData();
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = MediaQuery.of(context).size.height * 0.33;
    var width = MediaQuery.of(context).size.width;

    Widget mHeading(var value) {
      return Container(
          margin: EdgeInsets.fromLTRB(spacing_standard_new,
              spacing_standard_new, spacing_standard_new, 0),
          child: text(value, fontFamily: fontMedium, textAllCaps: true));
    }

    var mView = Container(
        height: 0.5,
        width: width,
        color: food_view_color,
        margin: EdgeInsets.only(
            top: spacing_standard_new, bottom: spacing_standard_new));

    Widget mVegOption(var value, var iconColor) {
      return Row(
        children: <Widget>[
          Image.asset(food_c_type, color: iconColor, width: 18, height: 18),
          SizedBox(width: spacing_standard),
          text(value),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: food_app_background,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: expandHeight,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                titleSpacing: 0,
                backgroundColor:
                    innerBoxIsScrolled ? food_white : food_colorPrimary,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                title: Container(
                  height: 60,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[],
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: food_white),
                          onPressed: () {
                            finish(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    height: expandHeight,
                    child: CachedNetworkImage(
                        imageUrl: food_ic_popular3,
                        height: expandHeight,
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
                      padding: EdgeInsets.all(spacing_standard_new),
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(food_lbl_burger,
                              fontFamily: fontMedium, fontSize: textSizeNormal),
                          mTotalRating(food_lbl_order_rating),
                          SizedBox(height: spacing_standard),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: gradientBoxDecoration(
                                    gradientColor1: food_color_blue_gradient1,
                                    gradientColor2: food_color_blue_gradient2),
                                padding: EdgeInsets.fromLTRB(
                                    spacing_standard, 0, spacing_standard, 0),
                                margin: EdgeInsets.only(right: spacing_middle),
                                child: text(food_lbl_offer,
                                    textColor: food_white,
                                    fontSize: textSizeSmall),
                              ),
                              text(food_lbl_save_14_on_each_night,
                                  textColor: food_textColorSecondary)
                            ],
                          ),
                          mView,
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: mVegOption(
                                      food_lbl_veg_only, food_view_color),
                                  flex: 1),
                              Expanded(
                                  child: mVegOption(
                                      food_lbl_non_veg_only, food_color_red),
                                  flex: 2),
                            ],
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: spacing_standard_new),
                        padding: EdgeInsets.all(spacing_standard_new),
                        decoration: boxDecoration(showShadow: true, radius: 0),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(food_ic_comass,
                                color: food_colorPrimary,
                                width: width * 0.08,
                                height: width * 0.08),
                            SizedBox(width: spacing_middle),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(
                                      food_lbl_delivery_by_yumfood_with_online_tracking,
                                      fontFamily: fontMedium),
                                  text(food_lbl_est_food_delivery_time)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: spacing_standard_new),
                    Container(
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_what_people_love_here),
                          SizedBox(height: spacing_standard_new),
                          Container(
                            margin: EdgeInsets.only(
                                left: spacing_standard_new,
                                right: spacing_standard_new),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16,
                                      childAspectRatio: 0.72,
                                      mainAxisSpacing: 16),
                              itemCount: mList1.length,
                              padding:
                                  EdgeInsets.only(bottom: spacing_standard_new),
                              itemBuilder: (context, index) {
                                return ItemGrid(mList1[index], index);
                              },
                            ),
                          ),
                          SizedBox(height: spacing_standard_new),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_standard_new),
                    Container(
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_what_people_love_here),
                          SizedBox(height: spacing_standard_new),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: mList2.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ItemList(mList2[index], index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  //height: width * 0.38,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: spacing_middle),
                          padding: EdgeInsets.fromLTRB(
                              spacing_standard,
                              spacing_control_half,
                              spacing_standard,
                              spacing_control_half),
                          decoration: gradientBoxDecoration(
                              gradientColor1: food_color_blue_gradient1,
                              gradientColor2: food_color_blue_gradient2,
                              radius: 40),
                          child:
                              text(food_lbl_view_menu, textColor: food_white),
                        ),
                      ),
                      mBottom(
                          context,
                          food_color_green_gradient1,
                          food_color_green_gradient2,
                          food_lbl_order_now,
                          FoodBookCart.tag),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  FoodDish model;

  ItemList(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          right: spacing_standard_new,
          left: spacing_standard_new,
          bottom: spacing_standard_new),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
            child: CachedNetworkImage(
                imageUrl: model.image,
                width: width * 0.2,
                height: width * 0.2,
                fit: BoxFit.fill),
          ),
          SizedBox(width: spacing_middle),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Padding(
                              padding: EdgeInsets.only(right: spacing_control),
                              child: Image.asset(food_c_type,
                                  color: food_colorAccent,
                                  width: 16,
                                  height: 16))),
                      TextSpan(
                          text: model.name,
                          style: TextStyle(
                              fontSize: textSizeMedium,
                              color: food_textColorPrimary)),
                    ],
                  ),
                ),
                text(model.price),
              ],
            ),
          ),
          Quantitybtn()
        ],
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  FoodDish model;

  ItemGrid(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: boxDecoration(showShadow: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(spacing_middle),
                topLeft: Radius.circular(spacing_middle)),
            child: CachedNetworkImage(
                imageUrl: model.image,
                width: width,
                height: width * 0.3,
                fit: BoxFit.fill),
          ),
          Padding(
            padding: EdgeInsets.all(spacing_middle),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.name, fontFamily: fontMedium, maxLine: 1),
                text(model.type,
                    textColor: food_textColorSecondary,
                    fontSize: textSizeSMedium),
                SizedBox(height: spacing_control),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.price),
                    Quantitybtn(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0))
        ],
      ),
      padding: EdgeInsets.all(spacing_large),
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.width * 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text("Snakes"),
                text("10/-", fontFamily: fontMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text("Pizza & Pasta"),
                text("40/-", fontFamily: fontMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text("Burger/-"),
                text("20/-", fontFamily: fontMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text("Fast Food"),
                text("12/-", fontFamily: fontMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text("Italian"),
                text("60/-", fontFamily: fontMedium),
              ],
            )
          ],
        ),
      ));
}
