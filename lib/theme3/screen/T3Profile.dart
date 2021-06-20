import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/theme3/screen/T3Dashboard.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3Profile extends StatefulWidget {
  static var tag = "/T3Profile";

  @override
  T3ProfileState createState() => T3ProfileState();
}

class T3ProfileState extends State<T3Profile> {
  List<Theme3Dish> mListings;
  List<Theme3Follower> mFollower;

  @override
  void initState() {
    super.initState();
    mListings = getDashboardList();
    mFollower = getFollowers();
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.34 + 60,
                floating: false,
                pinned: true,
                titleSpacing: 0,
                backgroundColor:
                    innerBoxIsScrolled ? t3_colorPrimary : t3_white,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                title: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[headerText(t3_lbl_profile)],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: t3_white,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              t3_colorPrimary,
                              t3_colorPrimaryDark
                            ]),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0)),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: (h * 0.12)),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              t3_ic_profile),
                                      radius: h * 0.08),
                                  SizedBox(height: 8),
                                  text(t3_user_name,
                                      textColor: t3_textColorPrimary,
                                      fontSize: textSizeNormal,
                                      fontFamily: fontSemibold),
                                  text(t3_user_email,
                                      fontSize: textSizeMedium,
                                      textColor: t3_textColorPrimary),
                                  SizedBox(height: 8)
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: t3_colorPrimary,
                    indicatorColor: t3_colorPrimary,
                    unselectedLabelColor: t3_textColorPrimary,
                    tabs: [
                      Tab(text: t3_lbl_videos),
                      Tab(text: t3_lbl_my_followers),
                      Tab(text: t3_lbl_tag),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 20, right: 16),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T3DashboardList(mListings[index], index);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 20, right: 16),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mFollower.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T3Followers(mFollower[index], index);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 20, right: 16),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T3DashboardList(mListings[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: t3_gray),
          child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class T3Followers extends StatelessWidget {
  Theme3Follower model;

  T3Followers(Theme3Follower model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: boxDecoration(radius: 10, showShadow: true),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: model.userImg,
                      width: width / 5.7,
                      height: width / 5.7,
                    ),
                    /*Image.asset(model.userImg, width: width / 5.7, height: width / 5.7)*/
                    borderRadius: BorderRadius.circular(8),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(model.name,
                            textColor: t3_textColorPrimary,
                            fontFamily: fontMedium,
                            fontSize: textSizeMedium),
                        text(model.location, fontSize: textSizeMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: t3_colorPrimary),
              width: 25,
              height: 25,
              child: Icon(Icons.chevron_right, color: t3_white),
            ),
          ],
        ),
      ),
    );
  }
}
