import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/model/db6/Db6Model.dart';
import 'package:prokit_flutter/dashboard/utils/Db6BottomNavigationBar.dart';
import 'package:prokit_flutter/dashboard/utils/Db6Widget.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';
import 'package:prokit_flutter/dashboard/utils/DbConstant.dart';
import 'package:prokit_flutter/dashboard/utils/DbDataGenerator.dart';
import 'package:prokit_flutter/dashboard/utils/DbExtension.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';
import 'package:prokit_flutter/dashboard/utils/DbStrings.dart';

class Dashboard6 extends StatefulWidget {
  static String tag = '/Dashboard6';

  @override
  Dashboard6State createState() => Dashboard6State();
}

class Dashboard6State extends State<Dashboard6> {
  List<DB6Service> mList1;
  List<DB6Laundry> mList2;
  List<DB6Offer> mList3;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    mList1 = getTopLaundryService();
    mList2 = getLaundry();
    mList3 = getOffer();
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
    double expandHeight = 200;
    double height = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    changeStatusColor(db6_colorPrimary);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: dbShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: Db6BottomNavigationBar(
          items: const <Db6BottomNavigationBarItem>[
            Db6BottomNavigationBarItem(
              icon: db6_ic_home,
              title: Text(
                db6_lbl_home,
                style: TextStyle(color: db6_textColorSecondary),
              ),
            ),
            Db6BottomNavigationBarItem(
              icon: db6_ic_pin,
              title: Text(
                db6_lbl_nearby,
                style: TextStyle(color: db6_textColorSecondary),
              ),
            ),
            Db6BottomNavigationBarItem(
              icon: db6_ic_basket,
              title: Text(
                db6_lbl_booking,
                style: TextStyle(color: db6_textColorSecondary),
              ),
            ),
            Db6BottomNavigationBarItem(
              icon: db6_ic_sale,
              title: Text(
                db6_lbl_Offers,
                style: TextStyle(color: db6_textColorSecondary),
              ),
            ),
            Db6BottomNavigationBarItem(
              icon: db6_ic_user,
              title: Text(
                db6_lbl_profile,
                style: TextStyle(color: db6_textColorSecondary),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: db6_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: db6_colorPrimary, size: 24),
          selectedLabelStyle: TextStyle(color: db6_colorPrimary),
          onTap: _onItemTapped,
          type: Db6BottomNavigationBarType.fixed,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandHeight,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: innerBoxIsScrolled ? db6_colorPrimary : db6_colorPrimary,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: text(db6_username, textColor: db6_white, fontSize: textSizeLarge, fontFamily: fontBold),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 60),
                  color: db6_colorPrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: text(
                          db6_your_location,
                          textColor: db6_white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.location_on,
                                        color: db6_white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: db6_san_francisco, style: TextStyle(fontSize: textSizeLargeMedium, color: db6_white)),
                                ],
                              ),
                            ),
                            text(db6_change, textColor: db6_white, fontSize: textSizeLargeMedium),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          decoration: boxDecoration(radius: 16, showShadow: false),
                          child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                fillColor: db6_white,
                                hintText: db6_hint_search,
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                              )),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16, 0, 16),
                  child: text(db6_lbl_top_services, fontFamily: fontBold, fontSize: textSizeNormal),
                ),
                SizedBox(
                  height: w * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mList1.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return D6TopService(mList1[index], index);
                      }),
                ),
                db6Label(db6_lbl_nearby_laundry),
                SizedBox(
                  height: w * 0.5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mList2.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return D6Popular(mList2[index], index);
                      }),
                ),
                db6Label(db6_lbl_pkg_offers),
                SizedBox(
                  height: w * 0.4,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mList3.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return D6Special(mList3[index], index);
                      }),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class D6TopService extends StatelessWidget {
  DB6Service model;

  D6TopService(DB6Service model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: db6_white, boxShadow: [BoxShadow(color: dbShadowColor, blurRadius: 10, spreadRadius: 2)]),
            width: width * 0.2,
            height: width * 0.2,
            padding: EdgeInsets.all(width * 0.05),
            child: Image.asset(
              model.img,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          text(model.name, textColor: db1_textColorSecondary)
        ],
      ),
    );
  }
}

class D6Popular extends StatelessWidget {
  DB6Laundry model;

  D6Popular(DB6Laundry model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: EdgeInsets.only(left: 16),
        decoration: boxDecoration(radius: 10, showShadow: true, bgColor: db6_white, color: db6_white),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Image.asset(
                    model.img,
                    fit: BoxFit.fill,
                    height: width * 0.2,
                    width: width * 0.2,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 0.5,
                    color: db6_viewColor,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(model.name),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.body1,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Icon(
                                  Icons.star_border,
                                  color: db6_yellow,
                                  size: 16,
                                ),
                              ),
                            ),
                            TextSpan(text: model.rating, style: TextStyle(fontSize: textSizeSMedium, color: db6_textColorSecondary)),
                          ],
                        ),
                      )
                    ],
                  ),
                  text(model.location, textColor: db6_textColorSecondary),
                ],
              ),
            ),
          ],
        ));
  }
}

class D6Special extends StatelessWidget {
  DB6Offer model;

  D6Special(DB6Offer model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(left: 16),
      decoration: boxDecoration(radius: 10, showShadow: true, bgColor: db6_white, color: db6_white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              model.img,
              height: width * 0.17,
              width: width * 0.2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text(model.title),
                text(model.subTitle, textColor: db6_colorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                      child: text(db6_lbl_view_offers, textColor: db6_white, fontFamily: fontMedium, textAllCaps: true),
                      decoration: boxDecoration(bgColor: db6_colorPrimary, radius: 6)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
