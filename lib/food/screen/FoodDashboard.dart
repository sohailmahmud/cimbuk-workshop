import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodImages.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import 'FoodAddAddress.dart';
import 'FoodBookCart.dart';
import 'FoodDescription.dart';
import 'FoodFavourite.dart';
import 'FoodOrder.dart';
import 'FoodProfile.dart';
import 'FoodSignIn.dart';
import 'FoodViewRestaurants.dart';

class FoodDashboard extends StatefulWidget {
  static String tag = '/FoodDashboard';

  @override
  FoodDashboardState createState() => FoodDashboardState();
}

class FoodDashboardState extends State<FoodDashboard> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<DashboardCollections> mCollectionList;
  List<Restaurants> mBakeryList;
  List<Restaurants> mDeliveryList;
  List<Restaurants> mDineOutList;
  List<DashboardCollections> mExperienceList;
  List<Restaurants> mCafeList;

  @override
  void initState() {
    super.initState();
    mCollectionList = addCollectionData();
    mBakeryList = addBakeryData();
    mDeliveryList = addDeliveryRestaurantsData();
    mDineOutList = addDineOutRestaurantsData();
    mExperienceList = addCuisineData();
    mCafeList = addCafeData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);
    var width = MediaQuery.of(context).size.width;

    Widget mTopGradient(var gradientColor1, var gradientColor2, var icon,
        var heading, var subHeading, var tags) {
      var width = MediaQuery.of(context).size.width;
      return GestureDetector(
        onTap: () {
          launchScreen(context, tags);
        },
        child: Container(
          decoration: gradientBoxDecoration(
              showShadow: true,
              gradientColor1: gradientColor1,
              gradientColor2: gradientColor2),
          padding: EdgeInsets.all(spacing_middle),
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(icon,
                  color: food_white, width: width * 0.06, height: width * 0.06),
              text(heading, fontFamily: fontMedium, textColor: food_white),
              text(subHeading, textColor: food_white, fontSize: textSizeSmall),
            ],
          )),
        ),
      );
    }

    Widget mIntro(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(
            left: spacing_standard_new,
            right: spacing_standard_new,
            bottom: spacing_standard_new),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                child: Image.asset(food_lbl_cake_ice_cream_and_bakery,
                    height: width * 0.3, fit: BoxFit.fill)),
            Column(children: <Widget>[
              text(food_lbl_instagold, textColor: food_white)
            ])
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: food_app_background,
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: food_white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  text(food_app_name,
                      fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      launchScreen(context, FoodBookCart.tag);
                    },
                  ),
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
                        child: Column(
                          children: <Widget>[
                            mAddress(context),
                            SizedBox(height: spacing_standard_new),
                            search(context),
                            SizedBox(height: spacing_standard_new),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: mTopGradient(
                                    food_color_blue_gradient1,
                                    food_color_blue_gradient2,
                                    food_cloche,
                                    food_lbl_food_order,
                                    food_lbl_find_near_by_restaurants,
                                    FoodViewRestaurants.tag,
                                  ),
                                  flex: 1,
                                ),
                                SizedBox(width: spacing_middle),
                                Expanded(
                                  child: mTopGradient(
                                    food_color_orange_gradient1,
                                    food_color_orange_gradient2,
                                    food_ic_table,
                                    food_lbl_book_a_table,
                                    food_lbl_may_take_upto_3_mins,
                                    FoodViewRestaurants.tag,
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                          ],
                        )),
                    SizedBox(height: spacing_standard_new),
                    Container(
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_get_inspired_by_collections),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mCollectionList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Collection(
                                    mCollectionList[index], index);
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
                          mHeading(food_lbl_cake_ice_cream_and_bakery),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mBakeryList.length,
                              padding:
                                  EdgeInsets.only(bottom: spacing_standard),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mBakeryList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants,
                              tags: FoodViewRestaurants.tag),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_standard_new),
                    Container(
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_delivery_restaurants),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  EdgeInsets.only(bottom: spacing_standard),
                              itemCount: mDeliveryList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mDeliveryList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants,
                              tags: FoodViewRestaurants.tag),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_standard_new),
                    Container(
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_dine_out_restaurants),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mDineOutList.length,
                              padding:
                                  EdgeInsets.only(bottom: spacing_standard),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mDineOutList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants,
                              tags: FoodViewRestaurants.tag),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_standard_new),
                    Container(
                      decoration: boxDecoration(showShadow: true, radius: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_experience_your_favourite_cuisine),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mExperienceList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Collection(
                                    mExperienceList[index], index);
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
                          mHeading(food_lbl_cafe),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  EdgeInsets.only(bottom: spacing_standard),
                              itemCount: mCafeList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mCafeList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants,
                              tags: FoodViewRestaurants.tag),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_standard_new),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      drawer: FoodSideMenu(),
    );
  }
}

class Item extends StatelessWidget {
  Restaurants model;

  Item(Restaurants model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        launchScreen(context, FoodDescription.tag);
      },
      child: Container(
        width: width * 0.4,
        margin: EdgeInsets.only(left: spacing_standard_new),
        decoration: boxDecoration(showShadow: true),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(spacing_middle),
                  topLeft: Radius.circular(spacing_middle)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl: model.image,
                      height: width * 0.3,
                      width: width * 0.4,
                      fit: BoxFit.cover),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(spacing_standard),
                    child: Icon(Icons.favorite_border,
                        color: food_white, size: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(spacing_middle),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name,
                      fontFamily: fontMedium, maxLine: 2, isCentered: false),
                  Row(
                    children: <Widget>[
                      mRating(model.rating.toString()),
                      text(model.review,
                          textColor: food_textColorSecondary,
                          fontSize: textSizeSMedium),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Collection extends StatelessWidget {
  DashboardCollections model;

  Collection(DashboardCollections model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        launchScreen(context, FoodViewRestaurants.tag);
      },
      child: Container(
        margin: EdgeInsets.only(left: spacing_standard_new),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
              child: CachedNetworkImage(
                  imageUrl: model.image,
                  width: width * 0.5,
                  height: 250,
                  fit: BoxFit.fill),
            ),
            Container(
              padding: EdgeInsets.all(spacing_middle),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name,
                      fontSize: textSizeLargeMedium,
                      fontFamily: fontAntina,
                      textColor: food_white),
                  SizedBox(height: spacing_control),
                  text(model.info,
                      fontSize: textSizeSMedium, textColor: food_white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodSideMenu extends StatefulWidget {
  @override
  FoodSideMenuState createState() => FoodSideMenuState();
}

class FoodSideMenuState extends State<FoodSideMenu> {
  Widget mOption(
      var gradientColor1, var gradientColor2, var icon, var value, var tags) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => tags));
//         launchScreen(context, tags);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: spacing_standard_new),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [gradientColor1, gradientColor2]),
              ),
              child: Padding(
                padding: EdgeInsets.all(spacing_middle),
                child: Icon(icon, size: 18, color: food_white),
              ),
            ),
            SizedBox(width: spacing_standard_new),
            text(value)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var mView = Container(
        width: MediaQuery.of(context).size.width,
        height: 0.5,
        color: food_view_color);

    return SafeArea(
      child: SizedBox(
        width: width * 0.85,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(spacing_standard_new),
                  width: width,
                  decoration: gradientBoxDecoration(
                      gradientColor1: food_colorPrimary,
                      gradientColor2: food_colorPrimary,
                      radius: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(food_ic_user1),
                          radius: 40),
                      text(food_username,
                          textColor: food_white, fontFamily: fontMedium),
                      text(food_user_email, textColor: food_white)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      spacing_standard_new,
                      spacing_standard_new,
                      spacing_large,
                      spacing_standard_new),
                  child: Column(
                    children: <Widget>[
                      mOption(
                          food_color_blue_gradient1,
                          food_color_blue_gradient2,
                          Icons.favorite_border,
                          food_lbl_favourite,
                          FoodFavourite()),
                      mOption(
                          food_color_orange_gradient1,
                          food_color_orange_gradient2,
                          Icons.add,
                          food_lbl_add_address,
                          FoodAddAddress()),
                      mOption(
                          food_color_yellow_gradient1,
                          food_color_yellow_gradient2,
                          Icons.insert_drive_file,
                          food_lbl_orders,
                          FoodOrder()),
                      mOption(
                          food_color_blue_gradient1,
                          food_color_blue_gradient2,
                          Icons.person_outline,
                          food_lbl_profile,
                          FoodProfile()),
                      mOption(
                          food_color_orange_gradient1,
                          food_color_orange_gradient2,
                          Icons.settings_power,
                          food_lbl_logout,
                          FoodSignIn()),
                    ],
                  ),
                ),
                mView,
                Container(
                  width: width,
                  padding: EdgeInsets.fromLTRB(
                      spacing_large,
                      spacing_standard_new,
                      spacing_large,
                      spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(food_lbl_quick_searches),
                      text(food_lbl_cafe, textColor: food_textColorSecondary),
                      text(food_hint_search_restaurants,
                          textColor: food_textColorSecondary),
                      text(food_lbl_bars, textColor: food_textColorSecondary),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
