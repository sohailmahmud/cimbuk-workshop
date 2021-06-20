import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme9/models/T9Models.dart';
import 'package:prokit_flutter/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/theme9/utils/T9Constant.dart';
import 'package:prokit_flutter/theme9/utils/T9DataGenerator.dart';
import 'package:prokit_flutter/theme9/utils/T9Strings.dart';
import 'package:prokit_flutter/theme9/utils/T9Widget.dart';

class T9List extends StatefulWidget {
  static String tag = '/T9List';

  @override
  T9ListState createState() => T9ListState();
}

class T9ListState extends State<T9List> {
  List<T9PeopleModel> mList1;
  List<T9BadgeModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = t9GetPending();
    mList2 = t9GetBadges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: t9_layout_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: t9_layout_background,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: new Container(
                color: Colors.white,
                child: new SafeArea(
                  child: Container(
                    color: t9_layout_background,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        text(t9_lbl_achievements,
                            fontSize: textSizeLarge, fontFamily: fontBold),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: new TabBar(
                            labelPadding: EdgeInsets.only(left: 0, right: 0),
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: t9_colorPrimary,
                            labelColor: t9_colorPrimary,
                            isScrollable: true,
                            unselectedLabelColor: t9_textColorSecondary,
                            tabs: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  t9_lbl_badges,
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  t9_lbl_leader_board,
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: fontBold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T9Badges(mList2[index], index);
                    }),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T9LeaderBoard(mList1[index], index);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class T9Badges extends StatelessWidget {
  T9BadgeModel model;

  T9Badges(T9BadgeModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    if (model.isLocked == false) {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: model.color),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(imageUrl: model.img),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.name,
                    fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                SizedBox(
                  width: 4,
                ),
                text(model.comment, textColor: t9_textColorSecondary),
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: t9_met_grey),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.lock,
                  color: t9_white,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(t9_lbl_locked_badge,
                    fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                SizedBox(
                  width: 4,
                ),
                text(t9_lbl_unlock_to_see_details,
                    textColor: t9_textColorSecondary),
              ],
            )
          ],
        ),
      );
    }
  }
}

class T9LeaderBoard extends StatelessWidget {
  T9PeopleModel model;

  T9LeaderBoard(T9PeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(model.img),
                radius: MediaQuery.of(context).size.width * 0.08,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name, fontFamily: fontMedium),
                  SizedBox(
                    width: 4,
                  ),
                  text(model.points, textColor: t9_textColorSecondary),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: t9_layout_background,
                border: Border.all(color: t9_view_color, width: 0.5)),
            child: Center(child: text((i + 1).toString())),
          )
        ],
      ),
    );
  }
}
