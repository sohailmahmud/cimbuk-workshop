import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3BottomSheet extends StatefulWidget {
  static var tag = "/T3BottomSheet";

  @override
  T3BottomSheetState createState() => T3BottomSheetState();
}

class T3BottomSheetState extends State<T3BottomSheet> {
  GlobalKey<ScaffoldState> _scaffoldKey = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    Future.delayed(const Duration(milliseconds: 1000), () {
      showModalBottomSheet(
          backgroundColor: t3_white,
          context: context,
          builder: (BuildContext context) {
            return Stack(alignment: Alignment.topRight, children: <Widget>[
              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(t3_lbl_review, textColor: t3_colorPrimary, fontFamily: fontBold),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: RatingBar(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]);
          });
    });

    return Scaffold(
      body: Container(
        color: t3_app_background,
        child: Stack(children: <Widget>[
          Container(
            height: 90,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
            ),
          ),
          TopBar(t3_lbl_bottom_sheet),
        ]),
      ),
    );
  }
}
