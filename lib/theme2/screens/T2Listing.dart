import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme2/models/models.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Constant.dart';
import 'package:prokit_flutter/theme2/utils/T2DataGenerator.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2Listing extends StatefulWidget {
  static var tag = "/T2Listing";

  @override
  T2ListingState createState() => T2ListingState();
}

class T2ListingState extends State<T2Listing> {
  int selectedPos = 1;
  List<T2ListModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getListData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(t2White);

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(t2_Listing),
            Container(
              padding: const EdgeInsets.only(
                  left: 28, right: 28, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPos = 1;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Text("All",
                            style: TextStyle(
                                fontFamily: fontMedium,
                                fontSize: textSizeMedium,
                                color: selectedPos == 1
                                    ? t2_colorPrimary
                                    : t2TextColorPrimary)),
                        Container(
                            width: 5,
                            height: 5,
                            decoration: boxDecoration(
                                bgColor: selectedPos == 1
                                    ? t2_colorPrimary
                                    : Colors.transparent))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPos = 2;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Text("Popular",
                            style: TextStyle(
                                fontFamily: fontMedium,
                                fontSize: textSizeMedium,
                                color: selectedPos == 2
                                    ? t2_colorPrimary
                                    : t2TextColorPrimary)),
                        Container(
                            width: 5,
                            height: 5,
                            decoration: boxDecoration(
                                bgColor: selectedPos == 2
                                    ? t2_colorPrimary
                                    : Colors.transparent))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPos = 3;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Text("New",
                            style: TextStyle(
                                fontFamily: fontMedium,
                                fontSize: textSizeMedium,
                                color: selectedPos == 3
                                    ? t2_colorPrimary
                                    : t2TextColorPrimary)),
                        Container(
                            width: 5,
                            height: 5,
                            decoration: boxDecoration(
                                bgColor: selectedPos == 3
                                    ? t2_colorPrimary
                                    : Colors.transparent))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPos = 4;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Text("Trend",
                            style: TextStyle(
                                fontFamily: fontMedium,
                                fontSize: textSizeMedium,
                                color: selectedPos == 4
                                    ? t2_colorPrimary
                                    : t2TextColorPrimary)),
                        Container(
                            width: 5,
                            height: 5,
                            decoration: boxDecoration(
                                bgColor: selectedPos == 4
                                    ? t2_colorPrimary
                                    : Colors.transparent))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mListings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Container(
                      decoration: boxDecoration(radius: 10, showShadow: true),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: <Widget>[
                            CachedNetworkImage(
                                imageUrl: mListings[index].icon,
                                width: width / 3,
                                height: width / 2.8,
                                fit: BoxFit.fill),
//                           Image.asset(mListings[index].icon, width: width / 3, height: width / 2.8, fit: BoxFit.fill),
                            Container(
                              width: width - (width / 3) - 35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? t2_red
                                              : t2_colorPrimary,
                                          borderRadius: new BorderRadius.only(
                                              bottomRight:
                                                  const Radius.circular(16.0),
                                              topRight:
                                                  const Radius.circular(16.0)),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(8, 2, 8, 2),
                                        child: text(
                                            index % 2 == 0 ? "New" : "Popular",
                                            textColor: t2_white,
                                            fontSize: textSizeSmall),
                                      ),
                                      GestureDetector(
                                          onTap: () {},
                                          child: Icon(Icons.more_vert))
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        text(mListings[index].name,
                                            textColor: t2TextColorPrimary,
                                            fontSize: textSizeNormal,
                                            fontFamily: fontMedium),
                                        SizedBox(height: 4),
                                        text(mListings[index].duration,
                                            fontSize: textSizeMedium),
                                        SizedBox(height: 4),
                                        text(mListings[index].description,
                                            fontSize: textSizeMedium,
                                            maxLine: 1),
                                        SizedBox(height: 4),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.all(0),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
