import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FlutterSlider.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import 'FoodBookDetail.dart';
import 'FoodRestaurantsDescription.dart';

class FoodViewRestaurants extends StatefulWidget {
  static String tag = '/FoodViewRestaurants';

  @override
  FoodViewRestaurantsState createState() => FoodViewRestaurantsState();
}

class FoodViewRestaurantsState extends State<FoodViewRestaurants> {
  List<ViewRestaurants> mList;
  List<images> mList1;
  List<Filter> mList2;
  var mPeopleList, mCuisine, mFilterList;
  var mTime = 0;

  @override
  void initState() {
    mList = addViewRestaurantsData();
    mList1 = addViewImagesData();
    mPeopleList = ["1", "2", "3", "4", "5"];
    mFilterList = [
      "Pure Veg Places",
      "Express Delivery",
      "Great Offer",
    ];
    mCuisine = [
      "South Indian",
      "American",
      "BBQ",
      "Bakery",
      "Biryani",
      "Burger",
      "Cafe",
      "Charcoal Chicken",
      "Chiness",
      "Fast Food",
      "Juice",
      "Gujarati",
      "Salad",
    ];
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_app_background);

    double _lowerValue = 100;
    double _upperValue = 1000;

    Widget mFilter() {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(spacing_large),
                        topRight: Radius.circular(spacing_large)),
                    color: food_white),
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(spacing_standard_new),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: spacing_large),
                      text(food_lbl_by_price, fontFamily: fontMedium),
                      FlutterSlider(
                        values: [30, 420],
                        rangeSlider: true,
                        max: 500,
                        min: 0,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          _lowerValue = lowerValue;
                          _upperValue = upperValue;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_cuisine, fontFamily: fontMedium),
                      SizedBox(height: spacing_standard_new),
                      Tags(
                        itemCount: mCuisine.length,
                        spacing: spacing_standard_new,
                        alignment: WrapAlignment.start,
                        itemBuilder: (int index) {
                          return Tooltip(
                            textStyle: TextStyle(fontSize: 16),
                            decoration: boxDecoration(
                              showShadow: false,
                                radius: spacing_middle,
                                bgColor: food_colorPrimary),
                            padding: EdgeInsets.all(spacing_standard),
                            message: mCuisine[index],
                            child: ItemTags(
                              title: mCuisine[index],
                              activeColor: food_colorPrimary_light,
                              color: food_colorPrimary,
                              textColor: food_white,
                              textActiveColor: food_textColorPrimary,
                              padding: EdgeInsets.all(spacing_standard),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(spacing_middle)),
                              highlightColor: food_colorAccent,
                              index: index,
                              onPressed: (item) {
                                setState(() {});
                              }, // equired
                            ),
                          );
                        },
                      ),
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_rating, fontFamily: fontMedium),
                      SizedBox(height: spacing_standard_new),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mPeopleList.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                mTime = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: boxDecoration(
                                radius: spacing_middle,
                                bgColor: mTime == index
                                    ? food_colorPrimary
                                    : food_view_color,
                              ),
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: text(
                                mPeopleList[index],
                                textColor: mTime == index
                                    ? food_white
                                    : food_textColorPrimary,
                                isCentered: true,
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 2.0),
                      ),
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_more_filter, fontFamily: fontMedium),
                      SizedBox(height: spacing_standard_new),
                      Tags(
                        itemCount: mFilterList.length,
                        spacing: spacing_middle,
                        alignment: WrapAlignment.start,
                        itemBuilder: (int index) {
                          return Tooltip(
                            textStyle: TextStyle(fontSize: 16),
                            decoration: boxDecoration(
                                radius: spacing_middle,
                                bgColor: food_colorPrimary,
                                showShadow: false),
                            padding: EdgeInsets.all(spacing_standard),
                            message: mFilterList[index],
                            child: ItemTags(
                              title: mFilterList[index],
                              color: food_colorPrimary,
                              textColor: food_white,
                              activeColor: food_colorPrimary_light,
                              textActiveColor: food_textColorPrimary,
                              padding: EdgeInsets.all(spacing_standard),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(spacing_middle)),
                              highlightColor: food_colorAccent,
                              index: index, // required
                            ),
                          );
                        },
                      ),
                      SizedBox(height: spacing_large),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                back(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: spacing_standard,
                                    bottom: spacing_standard),
                                decoration: boxDecoration(
                                    color: food_textColorPrimary, radius: 50),
                                child: text(food_lbl_cancel, isCentered: true),
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_standard_new),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                back(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: spacing_standard,
                                    bottom: spacing_standard),
                                decoration: boxDecoration(
                                    bgColor: food_colorPrimary, radius: 50),
                                child: text(food_lbl_filter,
                                    textColor: food_white, isCentered: true),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: food_app_background,
      body: (SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: food_white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      back(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      mFilter();
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      padding: EdgeInsets.all(spacing_standard_new),
                      margin: EdgeInsets.only(bottom: spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(food_lbl_lunch_in_delhi_ncr,
                              fontFamily: fontBold, fontSize: textSizeNormal),
                          SizedBox(height: spacing_standard),
                          mAddress(context),
                          SizedBox(height: spacing_standard_new),
                          search(context),
                        ],
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RestaurantsInfo(
                            mList[index], mList1[index], index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class RestaurantsInfo extends StatelessWidget {
  ViewRestaurants model;
  images model1;

  RestaurantsInfo(ViewRestaurants model, images model1, int pos) {
    this.model = model;
    this.model1 = model1;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        launchScreen(context, FoodRestaurantsDescription.tag);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: spacing_standard_new),
        decoration: boxDecoration(radius: 0, showShadow: true),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
                imageUrl: model1.image, width: width,height: 250, fit: BoxFit.fill),
            Container(
              padding: EdgeInsets.fromLTRB(spacing_standard_new,
                  spacing_standard_new, spacing_standard_new, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name,
                      fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                  SizedBox(height: spacing_standard),
                  Row(children: <Widget>[
                    mRating(model.rating),
                    SizedBox(width: spacing_standard),
                    text(model.review, textColor: food_textColorSecondary),
                  ]),
                  SizedBox(height: spacing_standard),
                  Row(
                    children: <Widget>[
                      text(model.rs, textColor: food_textColorSecondary),
                      SizedBox(width: spacing_standard),
                      mDot(),
                      SizedBox(width: spacing_standard),
                      text(model.sector, textColor: food_textColorSecondary),
                      SizedBox(width: spacing_standard),
                      mDot(),
                      SizedBox(width: spacing_standard),
                      text(model.kms, textColor: food_textColorSecondary),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: spacing_standard_new),
                      height: 0.5,
                      color: food_view_color,
                      width: width),
                ],
              ),
            ),
            mViewAll(context, food_lbl_book_a_table, tags: FoodBookDetail.tag),
          ],
        ),
      ),
    );
  }
}
