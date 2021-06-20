import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodImages.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import 'FoodBookDetail.dart';
import 'FoodDescription.dart';
import 'FoodGallery.dart';
import 'FoodReview.dart';

class FoodRestaurantsDescription extends StatefulWidget {
  static String tag = '/FoodRestaurantsDescription';

  @override
  FoodRestaurantsDescriptionState createState() =>
      FoodRestaurantsDescriptionState();
}

class FoodRestaurantsDescriptionState
    extends State<FoodRestaurantsDescription> {
  List<ReviewModel> mReviewList;
  List<FoodDish> mList2;
  var mPeopleList, mCuisine;

  @override
  void initState() {
    super.initState();
    mReviewList = addReviewData();
    mList2 = orderData();
    mPeopleList = ["1", "2", "3", "4", "5"];
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

    changeStatusColor(Colors.transparent);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = MediaQuery.of(context).size.height * 0.33;
    var width = MediaQuery.of(context).size.width;

    var mView = Container(
      height: 0.5,
      color: food_view_color,
      width: width,
      margin: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
    );

    Widget mOption(var icon, var value) {
      return Container(
        child: Column(
          children: <Widget>[
            Icon(icon, color: food_colorPrimary, size: 20),
            text(value, fontSize: textSizeMedium)
          ],
        ),
      );
    }

    var mTime = 0;
    Widget mLabel(var icon, var value) {
      return RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(
                  padding: EdgeInsets.only(right: spacing_standard_new),
                  child: Icon(icon, color: food_textColorSecondary, size: 18)),
            ),
            TextSpan(
                text: value,
                style: TextStyle(
                    fontSize: textSizeMedium, color: food_textColorPrimary)),
          ],
        ),
      );
    }

    Widget mGallery(var icon, var value) {
      return RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(
                  padding: EdgeInsets.only(right: spacing_standard),
                  child: Icon(icon, color: food_textColorPrimary, size: 18)),
            ),
            TextSpan(
                text: value,
                style: TextStyle(
                    fontSize: textSizeMedium, color: food_textColorPrimary)),
          ],
        ),
      );
    }

    Widget mReviewOption(var heading, var rating) {
      return Container(
        margin: EdgeInsets.only(bottom: spacing_standard),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            text(heading, textColor: food_textColorSecondary),
            Container(height: 0.5, width: width * 0.45, color: food_view_color),
            text(rating, textColor: food_textColorSecondary),
          ],
        ),
      );
    }

    Widget mReview() {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(food_lbl_rate_your_Experience, fontFamily: fontMedium),
                  Tags(
                    itemCount: mCuisine.length,
                    spacing: spacing_standard_new,
                    alignment: WrapAlignment.start,
                    itemBuilder: (int index) {
                      return Tooltip(
                        textStyle: TextStyle(fontSize: 16),
                        decoration: boxDecoration(
                            radius: spacing_middle, bgColor: food_colorPrimary),
                        padding: EdgeInsets.all(spacing_standard),
                        message: mCuisine[index],
                        child: ItemTags(
                          title: mCuisine[index],
                          activeColor: food_colorPrimary_light,
                          color: food_colorPrimary,
                          textColor: food_white,
                          textActiveColor: food_textColorPrimary,
                          padding: EdgeInsets.all(spacing_standard),
                          borderRadius:
                              BorderRadius.all(Radius.circular(spacing_middle)),
                          highlightColor: food_colorAccent,
                          index: index, // required
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  text(food_lbl_what_did_you_like, fontFamily: fontMedium),
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
                            child: text(mPeopleList[index],
                                textColor: mTime == index
                                    ? food_white
                                    : food_textColorPrimary,
                                isCentered: true),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 2.0)),
                  SizedBox(height: spacing_standard_new),
                  text(food_lbl_anything_else_you_want_to_add,
                      fontFamily: fontMedium),
                  editTextStyle(food_hint_description),
                  SizedBox(height: spacing_standard_new),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: spacing_middle, bottom: spacing_middle),
                    decoration: boxDecoration(
                        bgColor: food_colorPrimary,
                        radius: 50,
                        showShadow: true),
                    child: text(food_lbl_submit,
                        textColor: food_white, isCentered: true),
                  )
                ],
              ),
            )),
          );
        },
      );
    }

    return Scaffold(
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
              backgroundColor: innerBoxIsScrolled ? food_white : food_white,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                height: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.favorite_border,
                                color: food_textColorPrimary),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.search,
                                color: food_textColorPrimary),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: expandHeight,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      CachedNetworkImage(
                          imageUrl: food_ic_popular4,
                          width: width,
                          fit: BoxFit.cover),
                      GestureDetector(
                        onTap: () {
                          launchScreen(context, FoodGallery.tag);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: spacing_standard_new,
                              bottom: spacing_standard_new),
                          height: width * 0.11,
                          width: width * 0.3,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(spacing_standard),
                          decoration:
                              boxDecoration(showShadow: false, radius: 40),
                          child: mGallery(Icons.image, food_lbl_photo),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(spacing_standard_new),
                  decoration: boxDecoration(radius: 0, showShadow: true),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(food_lbl_italian, textColor: food_color_red),
                      text(food_lbl_gravity_spacebar,
                          fontFamily: fontMedium, fontSize: textSizeNormal),
                      Row(
                        children: <Widget>[
                          text(food_lbl_gurugram_sector_19,
                              textColor: food_textColorSecondary),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: food_textColorSecondary),
                            width: spacing_control,
                            margin: EdgeInsets.only(
                                right: spacing_control_half,
                                left: spacing_control),
                            height: spacing_control,
                          ),
                          text(food_lbl_3_4_km_away,
                              textColor: food_textColorSecondary),
                        ],
                      ),
                      SizedBox(height: spacing_standard),
                      mTotalRating(food_lbl__96_rating),
                      mView,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          mOption(Icons.call, food_lbl_call),
                          mOption(Icons.star_border, food_lbl_reviews),
                          mOption(Icons.add_box, food_lbl_add_photo),
                          mOption(Icons.directions, food_lbl_direction),
                        ],
                      ),
                      SizedBox(height: spacing_standard_new),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                launchScreen(context, FoodDescription.tag);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: spacing_standard,
                                    bottom: spacing_standard),
                                decoration: boxDecoration(
                                    bgColor: food_colorPrimary, radius: 50),
                                child: text(food_lbl_order_online,
                                    textColor: food_white, isCentered: true),
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_standard_new),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                launchScreen(context, FoodBookDetail.tag);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: spacing_standard,
                                    bottom: spacing_standard),
                                decoration: boxDecoration(
                                    color: food_textColorPrimary, radius: 50),
                                child:
                                    text(food_lbl_book_table, isCentered: true),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: spacing_standard_new),
                  decoration: boxDecoration(radius: 0, showShadow: true),
                  padding: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(food_lbl_plan_your_visit,
                          fontFamily: fontMedium, textAllCaps: true),
                      SizedBox(height: spacing_standard_new),
                      mLabel(Icons.hourglass_empty,
                          food_lbl_peak_wait_up_to_30_min_from_4_00_to_10_00_pm),
                      mView,
                      mLabel(Icons.schedule,
                          food_lbl_people_typically_spend_1_2_hours),
                      mView,
                      mLabel(Icons.schedule, food_lbl_you_visited_5_month_ago),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: spacing_standard_new, bottom: spacing_standard_new),
                  decoration: boxDecoration(radius: 0, showShadow: true),
                  padding: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(food_lbl_user_review,
                          fontFamily: fontMedium, textAllCaps: true),
                      SizedBox(height: spacing_standard_new),
                      Row(
                        children: <Widget>[
                          text(food_lbl__5_0,
                              fontFamily: fontMedium, fontSize: textSizeNormal),
                          SizedBox(width: spacing_standard_new),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              mTotalRating(food_lbl_very_good),
                              text(food_lbl__1_700_reviews_on_google,
                                  textColor: food_textColorSecondary),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: spacing_standard_new),
                      mReviewOption(food_lbl_cleanliness, food_lbl__5_0),
                      mReviewOption(food_lbl_comfort, food_lbl__5_0),
                      mReviewOption(food_lbl_location, food_lbl__5_0),
                      mReviewOption(food_lbl_Facilities, food_lbl__5_0),
                      mReviewOption(food_lbl_staff, food_lbl__5_0),
                      mReviewOption(food_lbl_Value, food_lbl__5_0),
                      SizedBox(height: spacing_standard_new),
                      GestureDetector(
                        onTap: () {
                          mReview();
                        },
                        child: Container(
                          width: width,
                          decoration: boxDecoration(
                              showShadow: true, bgColor: food_colorPrimary),
                          child: text(food_lbl_write_a_review,
                              isCentered: true, textColor: Colors.white),
                          padding: EdgeInsets.all(spacing_standard),
                        ),
                      ),
                      SizedBox(height: spacing_standard_new),
                      text(food_lbl_what_guest_are_saying,
                          fontFamily: fontMedium, textAllCaps: true),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mReviewList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Review(mReviewList[index], index);
                        },
                      ),
                      mViewAll(context, food_lbl_View_All_User_reviews,
                          tags: FoodReview.tag),
                    ],
                  ),
                ),
                Container(
                  decoration: boxDecoration(radius: 0, showShadow: true),
                  padding: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(food_lbl_additional_detail,
                          fontFamily: fontMedium, textAllCaps: true),
                      SizedBox(height: spacing_standard_new),
                      mLabel(Icons.call, food_user_contact),
                      mView,
                      mLabel(Icons.location_on,
                          food_lbl_peak_wait_up_to_30_min_from_4_00_to_10_00_pm),
                      mView,
                      mLabel(Icons.schedule, food_lbl_open_hours),
                      mView,
                      mLabel(Icons.person_outline,
                          food_lbl__100_for_two_people_approx),
                      SizedBox(height: spacing_standard_new),
                      Container(
                        decoration:
                            boxDecoration(bgColor: food_color_light_orange),
                        padding: EdgeInsets.all(spacing_standard),
                        child: Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: spacing_standard),
                                      child: Icon(Icons.shopping_basket,
                                          color: food_color_Orange, size: 18),
                                    ),
                                  ),
                                  TextSpan(
                                      text: food_lbl_15_off,
                                      style: TextStyle(
                                          fontSize: textSizeMedium,
                                          color: food_color_Orange,
                                          fontFamily: fontMedium)),
                                ],
                              ),
                            ),
                            SizedBox(width: spacing_standard),
                            text(food_lbl_on_total_bill_till_may_2020)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: spacing_standard_new, bottom: spacing_standard_new),
                  decoration: boxDecoration(showShadow: true, radius: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mHeading(food_lbl_what_people_love_here),
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
        ),
      ),
    );
  }
}

class Review extends StatelessWidget {
  ReviewModel model;

  Review(ReviewModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: spacing_standard_new),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: spacing_standard),
            child: CircleAvatar(
                radius: 20,
                backgroundImage: CachedNetworkImageProvider(model.image)),
          ),
          SizedBox(
            width: spacing_middle,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text(model.review, isLongText: true),
              Row(
                children: <Widget>[
                  mRating(model.rate),
                  text(model.duration,
                      textColor: food_textColorSecondary,
                      fontSize: textSizeSMedium),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
