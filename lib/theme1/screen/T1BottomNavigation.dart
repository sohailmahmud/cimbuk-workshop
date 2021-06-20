import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/theme1/utils/T1Widget.dart';

class T1BottomNavigation extends StatefulWidget {
  static var tag = "/T1BottomNavigation";

  @override
  T1BottomNavigationState createState() => T1BottomNavigationState();
}

class T1BottomNavigationState extends State<T1BottomNavigation> {
  var isSelected = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget tabItem(var pos, var icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: isSelected == pos ? BoxDecoration(shape: BoxShape.circle, color: t1_colorPrimary_light) : BoxDecoration(),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          color: isSelected == pos ? t1_colorPrimary : t1_textColorSecondary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 180,
            alignment: Alignment.center,
            child: ring(t1_lbl_welcome_to_bottom_n_navigation_baar),
          ),
          TopBar(t1_bottom_navigation),
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 60,
            decoration: BoxDecoration(
              color: t1_white,
              boxShadow: [BoxShadow(color: shadow_color, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3.0))],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  tabItem(1, t1_home),
                  tabItem(2, t1_notification),
                  Container(width: 45, height: 45),
                  tabItem(3, t1_settings),
                  tabItem(4, t1_user),
                ],
              ),
            ),
          ),
          Container(
            child: FloatingActionButton(
              backgroundColor: t1_colorPrimary,
              onPressed: () {
                //
              },
              child: Icon(
                Icons.mic,
                color: t1_white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
