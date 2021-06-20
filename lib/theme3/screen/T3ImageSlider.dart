import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

import 'T3Dashboard.dart';

class T3ImageSlider extends StatefulWidget {
  static var tag = "/T3ImageSlider";

  @override
  T3ImageSliderState createState() => T3ImageSliderState();
}

class T3ImageSliderState extends State<T3ImageSlider> {
  List<T3DashboardSliderModel> mSliderListings;

  @override
  void initState() {
    super.initState();
    mSliderListings = getDashboardSlider();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t3_app_background);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: t3_app_background,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: t3_textColorPrimary,
                    onPressed: () {
                      back(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Center(
                      child: text(t3_slider_title, fontFamily: fontBold, textColor: t3_textColorPrimary, fontSize: 22.0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 195,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mSliderListings.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T3DashboardSlider(mSliderListings[index], index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
