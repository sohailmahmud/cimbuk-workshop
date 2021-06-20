import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/dashboard/model/db4/Db4Model.dart';
import 'package:prokit_flutter/dashboard/utils/Db4BubbleBotoomBar.dart';
import 'package:prokit_flutter/dashboard/utils/Db4SliderWidget.dart';
import 'package:prokit_flutter/dashboard/utils/Db4Widget.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';
import 'package:prokit_flutter/dashboard/utils/DbConstant.dart';
import 'package:prokit_flutter/dashboard/utils/DbDataGenerator.dart';
import 'package:prokit_flutter/dashboard/utils/DbExtension.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';
import 'package:prokit_flutter/dashboard/utils/DbStrings.dart';

class Dashboard4 extends StatefulWidget {
  static String tag = '/Dashboard4';

  @override
  Dashboard4State createState() => Dashboard4State();
}

class Dashboard4State extends State<Dashboard4> {
  bool passwordVisible = false;
  bool isRemember = false;
  var currentIndexPage = 0;
  List<Db4Category> mFavouriteList;
  List<Db4Slider> mSliderList;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    mFavouriteList = db5GetCategoryItems();
    mSliderList = db4GetSliders();
  }

  void changeSldier(int index) {
    setState(() {
      currentIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db4_colorPrimary);
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: db4_colorPrimary,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 70,
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(db_profile),
                        radius: 25,
                      ),
                      SizedBox(width: 16),
                      text(db4_username, textColor: db4_white, fontSize: textSizeNormal, fontFamily: fontMedium)
                    ],
                  ),
                  SvgPicture.asset(
                    db4_options,
                    width: 25,
                    height: 25,
                    color: db4_white,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                padding: EdgeInsets.only(top: 28),
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(color: db4_LayoutBackgroundWhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    Db4SliderWidget(mSliderList),
                    SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Db4GridListing(mFavouriteList, false),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Db4BottomBar(),
    );
  }
}

class Db4BottomBar extends StatefulWidget {
  static String tag = '/T5BottomBar';

  @override
  Db4BottomBarState createState() => Db4BottomBarState();
}

class Db4BottomBarState extends State<Db4BottomBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      elevation: 8,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      hasNotch: false,
      hasInk: true,
      inkColor: db4_ColorPrimaryLight,
      items: <BubbleBottomBarItem>[
        tab(db4_ic_home, db4_home),
        tab(db4_list_check, db4_lbl_listing),
        tab(db4_ic_notification, db4_notification),
        tab(db4_user, db4_lbl_profile),
      ],
    );
  }
}

class Db4SliderWidget extends StatelessWidget {
  List<Db4Slider> mSliderList;

  Db4SliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.8);
    return Db4CarouselSlider(
      viewportFraction: 0.9,
      height: cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: cardSize.height,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    slider.image,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: cardSize.height,
                  ),
                  Padding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(
                            db4_avl_balance,
                            textColor: db4_white,
                            fontSize: textSizeMedium,
                          ),
                          text(slider.balance, textColor: db4_white, fontSize: textSizeLarge, fontFamily: fontBold)
                        ],
                      ),
                      padding: EdgeInsets.all(14)),
                  Container(
                    padding: EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(
                                db4_account_number,
                                textColor: db4_white,
                                fontSize: textSizeMedium,
                              ),
                              text(slider.accountNo, textColor: db4_white, fontSize: textSizeNormal)
                            ],
                          ),
                        ),
                        text("VISA", textColor: db4_white, fontSize: textSizeLarge, fontFamily: fontBold)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class Db4GridListing extends StatelessWidget {
  List<Db4Category> mFavouriteList;
  var isScrollable = false;

  Db4GridListing(this.mFavouriteList, this.isScrollable);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: isScrollable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        itemCount: mFavouriteList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: boxDecoration(radius: 10, showShadow: true, bgColor: db4_white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: width / 7.5,
                    width: width / 7.5,
                    margin: EdgeInsets.only(bottom: 4, top: 8),
                    padding: EdgeInsets.all(width / 30),
                    decoration: boxDecoration(bgColor: mFavouriteList[index].color, radius: 10),
                    child: SvgPicture.asset(
                      mFavouriteList[index].icon,
                      color: db4_white,
                    ),
                  ),
                  text(mFavouriteList[index].name, fontSize: textSizeMedium)
                ],
              ),
            ),
          );
        });
  }
}
