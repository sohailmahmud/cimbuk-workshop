import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme9/models/T9Models.dart';
import 'package:prokit_flutter/theme9/utils/T9BottomNavigationBar.dart';
import 'package:prokit_flutter/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/theme9/utils/T9Constant.dart';
import 'package:prokit_flutter/theme9/utils/T9DataGenerator.dart';
import 'package:prokit_flutter/theme9/utils/T9Extension.dart';
import 'package:prokit_flutter/theme9/utils/T9Images.dart';
import 'package:prokit_flutter/theme9/utils/T9Strings.dart';
import 'package:prokit_flutter/theme9/utils/T9Widget.dart';

class T9Dashboard extends StatefulWidget {
  static String tag = '/T9Dashboard';

  @override
  T9DashboardState createState() => T9DashboardState();
}

class T9DashboardState extends State<T9Dashboard> {
  List<T9FeaturedModel> mList1;
  List<T9CategoryModel> mList2;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    mList1 = t9GetFavourites();
    mList2 = t9GetCategories();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t9_layout_background);

    return Scaffold(
      backgroundColor: t9_layout_background,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: t9_ShadowColor,
              offset: Offset.fromDirection(3, 1),
              spreadRadius: 1,
              blurRadius: 5)
        ]),
        child: T9BottomNavigationBar(
          items: const <T9BottomNavigationBarItem>[
            T9BottomNavigationBarItem(
              icon: t9_ic_home_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_search_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_chart_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_message_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_more_navigation,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme:
              IconThemeData(color: t9_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: t9_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T9BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(t9_lbl_featured,
                      fontFamily: fontBold, fontSize: textSizeNormal),
                  text(
                    t9_lbl_see_all,
                    textColor: t9_colorPrimary,
                    textAllCaps: true,
                    fontFamily: fontMedium,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.62,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList1.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return T9Featured(mList1[index], index);
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: text(t9_lbl_categories,
                    fontFamily: fontBold, fontSize: textSizeNormal)),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList2.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return T9Category(mList2[index], index);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class T9Featured extends StatelessWidget {
  T9FeaturedModel model;

  T9Featured(T9FeaturedModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: model.img,
              fit: BoxFit.cover,
              height: w * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(model.name,
                    fontFamily: fontMedium, isLongText: true, maxLine: 2),
                text(model.price, textColor: t9_textColorSecondary),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class T9Category extends StatelessWidget {
  T9CategoryModel model;

  T9Category(T9CategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                decoration: boxDecoration(bgColor: t9_white, radius: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CachedNetworkImage(
                    imageUrl: model.img,
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                  margin: EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: text(model.name)),
            ],
          ),
        ),
      ],
    );
  }
}
