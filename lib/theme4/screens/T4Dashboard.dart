import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/theme4/models/T4Models.dart';
import 'package:prokit_flutter/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/theme4/utils/T4DataGenerator.dart';
import 'package:prokit_flutter/theme4/utils/T4Extension.dart';
import 'package:prokit_flutter/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/theme4/utils/T4Widgets.dart';
import 'package:prokit_flutter/theme4/utils/widgets/T4BottomNavigationBar.dart';

class T4Dashboard extends StatefulWidget {
  static var tag = "/T4Dashboard";

  @override
  T4DashboardState createState() => T4DashboardState();
}

class T4DashboardState extends State<T4Dashboard> {
  int selectedPos = 1;
  List<T4NewsModel> mCategories;
  List<T4NewsModel> mHorizontalListings;
  List<T4NewsModel> mListings;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getDashboardData();
    mCategories = getCategoryData();
    mHorizontalListings = getList2Data();

    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(t4_app_background);

    return Scaffold(
      backgroundColor: t4_app_background,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopBar("Dashboard"),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: width,
                      height: width * 0.1,
                      margin: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mCategories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              margin: index == mCategories.length - 1 ? EdgeInsets.only(left: 16, right: 16) : EdgeInsets.only(left: 16),
                              alignment: Alignment.center,
                              decoration: boxDecoration(radius: 4, bgColor: mCategories[index].color),
                              child: text(mCategories[index].category, textColor: t4_white, fontFamily: fontMedium),
                            );
                          }),
                    ),
                    Container(
                      width: width,
                      height: width * 0.67,
                      margin: EdgeInsets.only(top: 22),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mHorizontalListings.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: index == mHorizontalListings.length - 1 ? EdgeInsets.only(left: 16, right: 16) : EdgeInsets.only(left: 16),
                              alignment: Alignment.topLeft,
                              width: width * 0.8,
                              child: Column(
                                children: <Widget>[
                                  ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl: mHorizontalListings[index].image,
                                      height: width * 0.5,
                                      width: width * 0.8,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              text(mHorizontalListings[index].name, textColor: t4_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                                              text(mHorizontalListings[index].info, fontSize: textSizeMedium, textColor: t4_textColorPrimary),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              t4_heart,
                                              width: 24,
                                              height: 24,
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            SvgPicture.asset(
                                              t4_share,
                                              width: 24,
                                              height: 24,
                                              color: t4_textColorPrimary,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        primary: false,
                        padding: EdgeInsets.only(bottom: 30),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        shrinkWrap: true,
                        staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                        itemCount: mListings.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) => Container(
                          margin: EdgeInsets.only(left: 4, bottom: 4, right: 4, top: 4),
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: mListings[index].image,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              text(mListings[index].name, textColor: t4_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                              text(mListings[index].info, fontSize: textSizeMedium, textColor: t4_textColorPrimary),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: t4_shadow_color, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: T4BottomNavigationBar(
          items: const <T4BottomNavigationBarItem>[
            T4BottomNavigationBarItem(
              icon: t4_home,
            ),
            T4BottomNavigationBarItem(
              icon: t4_playbutton,
            ),
            T4BottomNavigationBarItem(
              icon: t4_heart,
            ),
            T4BottomNavigationBarItem(
              icon: t4_user,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: t4_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: t4_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T4BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
