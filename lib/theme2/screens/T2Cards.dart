import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:prokit_flutter/theme2/models/models.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Constant.dart';
import 'package:prokit_flutter/theme2/utils/T2DataGenerator.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2Cards extends StatefulWidget {
  static var tag = "/T2Cards";

  @override
  T2CardsState createState() => T2CardsState();
}

class T2CardsState extends State<T2Cards> {
  List<T2Favourite> mFavouriteList;

  @override
  void initState() {
    super.initState();
    mFavouriteList = getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(t2_Cards),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mFavouriteList.length,
              itemBuilder: (context, index) {
                return Slidable(
                  key: ValueKey(index),
                  actionPane: SlidableDrawerActionPane(),
                  actions: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          IconSlideAction(
                            caption: '',
                            color: Colors.transparent,
                            icon: Icons.edit,
                            closeOnTap: true,
                            foregroundColor: Colors.transparent,
                            onTap: () {},
                          ),
                          RotatedBox(
                            quarterTurns: -1,
                            child: text("Edit",
                                textColor: t2_white,
                                isCentered: true,
                                latterSpacing: 5.0,
                                fontFamily: fontSemibold),
                          )
                        ],
                        alignment: Alignment.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: t2_green,
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      alignment: Alignment.center,
                    )
                  ],
                  secondaryActions: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          IconSlideAction(
                            caption: '',
                            color: Colors.transparent,
                            icon: Icons.edit,
                            closeOnTap: true,
                            foregroundColor: Colors.transparent,
                            onTap: () {},
                          ),
                          RotatedBox(
                            quarterTurns: -1,
                            child: text("Remove",
                                textColor: t2_white,
                                isCentered: true,
                                latterSpacing: 5.0,
                                fontFamily: fontSemibold),
                          )
                        ],
                        alignment: Alignment.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: t2_red,
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      alignment: Alignment.center,
                    ),
                  ],
                  dismissal: SlidableDismissal(
                    child: SlidableDrawerDismissal(),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: IntrinsicHeight(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              color: t2_colorPrimary,
                              width: 10,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        CachedNetworkImage(
                                          imageUrl: mFavouriteList[index].image,
                                          width: width / 5,
                                          height: width / 4.2,
                                        ),
                                        /*   Image.asset(
                                          mFavouriteList[index].image,
                                          width: width / 5,
                                          height: width / 4.2,
                                        ),*/
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                text(mFavouriteList[index].name,
                                                    textColor:
                                                        t2TextColorPrimary,
                                                    fontFamily: fontBold,
                                                    fontSize: textSizeMedium,
                                                    maxLine: 2),
                                                text(
                                                    mFavouriteList[index]
                                                        .duration,
                                                    fontSize: textSizeMedium),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    text(t2_samplelong_text,
                                        fontSize: textSizeMedium, maxLine: 2),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
