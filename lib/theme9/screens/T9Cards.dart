import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme9/models/T9Models.dart';
import 'package:prokit_flutter/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/theme9/utils/T9Constant.dart';
import 'package:prokit_flutter/theme9/utils/T9DataGenerator.dart';
import 'package:prokit_flutter/theme9/utils/T9Images.dart';
import 'package:prokit_flutter/theme9/utils/T9Strings.dart';
import 'package:prokit_flutter/theme9/utils/T9Widget.dart';

class T9Cards extends StatefulWidget {
  static String tag = '/T9Cards';

  @override
  _T9CardsState createState() => _T9CardsState();
}

class _T9CardsState extends State<T9Cards> {
  List<T9FeaturedModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = t9GetFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final topView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: text(t9_lbl_favourites,
                fontFamily: fontBold, fontSize: textSizeNormal),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: t9_ic_fab_back,
                  width: 40,
                  height: 40,
                ),
                Icon(
                  Icons.search,
                  color: t9_colorPrimary,
                )
              ],
            )),
      ],
    );

    final cardList = ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mListings1.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(
                showShadow: true, bgColor: t9_white, radius: 10.0),
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),

            // .cornerRadiusWithClipRRect(10.0) .withShadow() .paddingOnly(top: 8,left: 16,right: 16,bottom: 8)
            //     color: t9_white,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    child: CachedNetworkImage(
                        imageUrl: mListings1[index].img,
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(
                                    mListings1[index].name,
                                    fontFamily: fontBold,
                                  ),
                                  SizedBox(height: 4),
                                  text(mListings1[index].type,
                                      textColor: t9_textColorSecondary),
                                ],
                              ),
                            ),
                            Icon(Icons.favorite, color: Colors.red, size: 30),
                          ],
                        ),
                        Divider(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(
                                  "20",
                                  fontFamily: fontBold,
                                ),
                                SizedBox(height: 4),
                                text("Students",
                                    textColor: t9_textColorSecondary),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(
                                    "51",
                                    fontFamily: fontBold,
                                  ),
                                  SizedBox(height: 4),
                                  text("Lectures",
                                      textColor: t9_textColorSecondary),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: text(mListings1[index].price,
                                  textColor: t9_white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });

    return SafeArea(
      child: Scaffold(
          backgroundColor: t9_layout_background,
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: t9_colorPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    topView,
                    cardList,
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
