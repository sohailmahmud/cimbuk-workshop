import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/dashboard/model/db5/Db5Model.dart';
import 'package:prokit_flutter/dashboard/utils/Db5BottomNavigationBar.dart';
import 'package:prokit_flutter/dashboard/utils/Db5Widget.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';
import 'package:prokit_flutter/dashboard/utils/DbConstant.dart';
import 'package:prokit_flutter/dashboard/utils/DbDataGenerator.dart';
import 'package:prokit_flutter/dashboard/utils/DbExtension.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';
import 'package:prokit_flutter/dashboard/utils/DbStrings.dart';

class Dashboard5 extends StatefulWidget {
  static String tag = '/Dashboard5';

  @override
  Dashboard5State createState() => Dashboard5State();
}

class Dashboard5State extends State<Dashboard5> {
  List<Db5CategoryData> mListings;
  List<Db6BestDestinationData> mListings1;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    mListings = generateCategories();
    mListings1 = generateBestDestination();
    _selectedIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db5_colorPrimary);
    return Scaffold(
      backgroundColor: db5_white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: dbShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: Db5BottomNavigationBar(
          items: const <Db5BottomNavigationBarItem>[
            Db5BottomNavigationBarItem(
              icon: db5_ic_home,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_compass,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_msg,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_setting,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: db5_icon_color, size: 24),
          selectedIconTheme: IconThemeData(color: db5_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: Db5BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(db5_hi_juila, fontSize: textSizeNormal, textColor: db5_colorPrimary),
                      Icon(
                        Icons.search,
                        color: db5_icon_color,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      text(db5_you_are_in_54_king_ports, textColor: db5_textColorSecondary),
                    ],
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mListings.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return category(mListings[index], index);
                        }),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    height: 4,
                    color: db5_viewColor,
                    thickness: 2,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(
                          db5_best_destination,
                          textColor: db5_colorPrimary,
                          fontSize: textSizeLarge,
                        ),
                        text(db5_see_All, textColor: db5_textColorSecondary, textAllCaps: true),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      primary: false,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                      itemCount: mListings1.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Container(
                        margin: EdgeInsets.only(left: 4, bottom: 4, top: 4),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(16.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Image.asset(
                                mListings1[index].image,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    text(mListings1[index].name, textColor: db5_white),
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                          child: RichText(
                                            text: TextSpan(
                                              style: Theme.of(context).textTheme.body1,
                                              children: [
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                    child: Icon(
                                                      Icons.star_border,
                                                      color: db5_yellow,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(text: mListings1[index].rating, style: TextStyle(fontSize: textSizeMedium, color: db5_white, fontFamily: fontMedium)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        decoration: boxDecoration(radius: 12, bgColor: db5_black_trans)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //    SizedBox(height: 50,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class category extends StatelessWidget {
  Db5CategoryData model;

  category(Db5CategoryData model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Container(
            decoration: boxDecoration(bgColor: db5_light_blue, radius: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                model.image,
                height: 40,
                width: 40,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          text(model.name, textColor: db5_textColorSecondary)
        ],
      ),
    );
  }
}
