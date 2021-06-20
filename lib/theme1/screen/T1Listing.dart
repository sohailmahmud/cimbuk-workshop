import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/theme1/model/T1_model.dart';
import 'package:prokit_flutter/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/theme1/utils/T1DataGenerator.dart';
import 'package:prokit_flutter/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/theme1/utils/T1Widget.dart';

class T1Listing extends StatefulWidget {
  static var tag = "/T1Listing";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return T1ListingState();
  }
}

class T1ListingState extends State<T1Listing> {
  List<T1Model> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getListings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(t1_Listing),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T1ListItem(mListings[index], index);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class T1ListItem extends StatelessWidget {
  T1Model model;
  int pos;

  T1ListItem(T1Model model, int pos) {
    this.model = model;
    this.pos = pos;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: boxDecoration(radius: 10, showShadow: true),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: model.img,
                            width: width / 5.5,
                            height: width / 6,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    text(model.name,
                                        textColor: t1TextColorPrimary,
                                        fontFamily: fontBold,
                                        fontSize: textSizeNormal,
                                        maxLine: 2),
                                    text(model.duration,
                                        fontSize: textSizeMedium),
                                  ],
                                ),
                                text(model.designation,
                                    fontSize: textSizeLargeMedium,
                                    textColor: t1TextColorPrimary,
                                    fontFamily: fontMedium),
                              ],
                            ),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    text(t1_samplelong_text,
                        fontSize: textSizeMedium,
                        maxLine: 2,
                        textColor: t1TextColorPrimary),
                  ],
                ),
              ),
              Container(
                width: 4,
                height: 35,
                margin: EdgeInsets.only(top: 16),
                color: pos % 2 == 0 ? t1TextColorPrimary : t1_colorPrimary,
              )
            ],
          ),
        ));
  }
}
