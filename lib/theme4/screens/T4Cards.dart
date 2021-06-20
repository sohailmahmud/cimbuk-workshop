import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/theme4/models/T4Models.dart';
import 'package:prokit_flutter/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/theme4/utils/T4DataGenerator.dart';
import 'package:prokit_flutter/theme4/utils/T4Extension.dart';
import 'package:prokit_flutter/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/theme4/utils/T4Strings.dart';
import 'package:prokit_flutter/theme4/utils/T4Widgets.dart';

class T4Cards extends StatefulWidget {
  static var tag = "/T4Cards";

  @override
  T4CardsState createState() => T4CardsState();
}

class T4CardsState extends State<T4Cards> {
  int selectedPos = 1;
  List<T4NewsModel> mCardss;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mCardss = getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(t4_app_background);

    return Scaffold(
      backgroundColor: t4_app_background,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(t4_lbl_cards),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mCardss.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Stack(
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: mCardss[index].image,
                                  width: width - 32,
                                  height: width * 0.5,
                                  fit: BoxFit.cover,
                                ),
                                /*Image.asset(
                                  mCardss[index].image,
                                  width: width - 32,
                                  height: width * 0.5,
                                  fit: BoxFit.cover,
                                ),*/
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: t4_colorPrimary,
                                    size: 30,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: t4_white),
                                )
                              ],
                              alignment: Alignment.center,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(mCardss[index].name,
                                        textColor: t4_textColorPrimary,
                                        fontSize: textSizeLargeMedium,
                                        fontFamily: fontBold),
                                    text(mCardss[index].info,
                                        fontSize: textSizeMedium,
                                        textColor: t4_textColorPrimary),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    t4_heart,
                                    width: 22,
                                    height: 22,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SvgPicture.asset(
                                    t4_share,
                                    width: 22,
                                    height: 22,
                                    color: t4_textColorPrimary,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
