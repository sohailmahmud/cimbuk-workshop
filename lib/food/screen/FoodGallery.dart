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

import '../utils/FoodColors.dart';

class FoodGallery extends StatefulWidget {
  static String tag = '/FoodGallery';

  @override
  FoodGalleryState createState() => FoodGalleryState();
}

class FoodGalleryState extends State<FoodGallery> {
  List<images> mAmbienceList;
  List<images> mFoodList;
  List<images> mViewImagesList;
  List<images> mUserPhotosList;

  @override
  void initState() {
    super.initState();
    mAmbienceList = addAmbiencePhotosData();
    mFoodList = addFoodPhotosData();
    mViewImagesList = addViewImagesData();
    mUserPhotosList = addUserPhotosData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_app_background);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: new Container(
                color: Colors.white,
                child: new SafeArea(
                  child: Container(
                      color: food_app_background,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: food_icon_color,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            child: new TabBar(
                              labelPadding: EdgeInsets.only(left: 16, right: 0),
                              indicatorWeight: 3.3,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: food_colorAccent,
                              labelColor: food_textColorPrimary,
                              isScrollable: true,
                              unselectedLabelColor: food_textColorSecondary,
                              tabs: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    food_lbl_all_photo,
                                    style: TextStyle(
                                        fontSize: 16.0, fontFamily: fontBold),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    food_lbl_ambience,
                                    style: TextStyle(
                                        fontSize: 16.0, fontFamily: fontBold),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    food_lbl_food,
                                    style: TextStyle(
                                        fontSize: 16.0, fontFamily: fontBold),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    food_lbl_user_photos,
                                    style: TextStyle(
                                        fontSize: 16.0, fontFamily: fontBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    color: food_app_background,
                    margin: EdgeInsets.only(
                        left: spacing_middle, right: spacing_middle),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(food_lbl_ambience, fontFamily: fontMedium),
                          SizedBox(
                            height: spacing_standard,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: mAmbienceList.length,
                            itemBuilder: (context, index) {
                              return Media(mAmbienceList[index], index);
                            },
                          ),
                          SizedBox(
                            height: spacing_large,
                          ),
                          text(food_lbl_food, fontFamily: fontMedium),
                          SizedBox(
                            height: spacing_standard,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: mFoodList.length,
                            itemBuilder: (context, index) {
                              return Media(mFoodList[index], index);
                            },
                          ),
                          SizedBox(
                            height: spacing_large,
                          ),
                          text(food_lbl_user_photos, fontFamily: fontMedium),
                          SizedBox(
                            height: spacing_standard,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: mUserPhotosList.length,
                            itemBuilder: (context, index) {
                              return Media(mUserPhotosList[index], index);
                            },
                          ),
                          SizedBox(
                            height: spacing_large,
                          ),
                        ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: spacing_middle, right: spacing_middle),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: mAmbienceList.length,
                    itemBuilder: (context, index) {
                      return Media(mAmbienceList[index], index);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: spacing_middle, right: spacing_middle),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: mFoodList.length,
                    itemBuilder: (context, index) {
                      return Media(mFoodList[index], index);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: spacing_middle, right: spacing_middle),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: mUserPhotosList.length,
                    itemBuilder: (context, index) {
                      return Media(mUserPhotosList[index], index);
                    },
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

class Media extends StatelessWidget {
  images model;

  Media(images model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          imageUrl: model.image,
          fit: BoxFit.fill,
          height: width * 0.15,
          width: width * 0.25,
        ),
      ),
    );
  }
}
