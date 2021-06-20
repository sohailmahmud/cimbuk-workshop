import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodImages.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import '../utils/FoodColors.dart';

class FoodBookDetail extends StatefulWidget {
  static String tag = '/FoodBookDetail';

  @override
  FoodBookDetailState createState() => FoodBookDetailState();
}

class FoodBookDetailState extends State<FoodBookDetail> {
  var mPeople = 0;
  var mTime = 0;
  var mFood = 0;
  var mPeopleList, mTimeList, mFoodList;
  var now = new DateTime.now();
  var count = 1;
  var formatter = new DateFormat('dd  MMM');
  String formatted;

  @override
  void initState() {
    super.initState();
    mPeopleList = ["1", "2", "3", "4", "5+"];
    mFoodList = ["Veg", "Non Veg"];
    mTimeList = ["07:00", "07:30", "08:00", "08:30", "09:00", "09:15", "09:30", "10:00", "10:30", "11:00"];
    formatted = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_app_background);
    var width = MediaQuery.of(context).size.width;

    final mPeopleInfo = Container(
      height: width * 0.1,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: mPeopleList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                mPeople = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_control),
              decoration: boxDecoration(radius: spacing_middle, bgColor: mPeople == index ? food_colorPrimary : food_colorPrimary_light),
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: text(mPeopleList[index], textColor: mPeople == index ? food_white : food_textColorPrimary, isCentered: true),
            ),
          );
        },
      ),
    );

    final mTimeInfo = GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: mTimeList.length,
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
            decoration: boxDecoration(radius: spacing_middle, bgColor: mTime == index ? food_colorPrimary : food_colorPrimary_light),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: text(mTimeList[index], textColor: mTime == index ? food_white : food_textColorPrimary, isCentered: true),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 2.0),
    );

    final mFoodInfo = Container(
      height: width * 0.1,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: mFoodList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                mFood = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_control),
              decoration: boxDecoration(radius: spacing_middle, bgColor: mFood == index ? food_colorPrimary : food_colorPrimary_light),
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: text(mFoodList[index], textColor: mFood == index ? food_white : food_textColorPrimary, isCentered: true),
            ),
          );
        },
      ),
    );

    return Scaffold(
      backgroundColor: food_app_background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(food_lbl_reserve_table),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(alignment: Alignment.topCenter, child: SvgPicture.asset(food_dinner_table, height: width * 0.4, width: width * 0.4)),
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_how_many_people, fontFamily: fontMedium),
                      SizedBox(height: spacing_control),
                      mPeopleInfo,
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_reservation_date, fontFamily: fontMedium),
                      SizedBox(height: spacing_control),
                      text(formatted, textColor: food_colorPrimary),
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_set_your_time, fontFamily: fontMedium),
                      SizedBox(height: spacing_standard),
                      mTimeInfo,
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_any_food_preference, fontFamily: fontMedium),
                      SizedBox(height: spacing_control),
                      mFoodInfo,
                      SizedBox(height: spacing_large),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
                        decoration: boxDecoration(bgColor: food_colorPrimary, radius: 50, showShadow: true),
                        child: text(food_lbl_book_table, textColor: food_white, isCentered: true),
                      ),
                      SizedBox(height: spacing_standard_new),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
