import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3BottomNavigationBar.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3BottomNavigation extends StatefulWidget {
  static var tag = "/T3BottomNavigation";

  @override
  T3BottomNavigationState createState() => T3BottomNavigationState();
}

class T3BottomNavigationState extends State<T3BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t3_app_background);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: t3_app_background,
        color: t3_white,
        items: <Widget>[
          SvgPicture.asset(
            t3_ic_home,
            height: 24,
            width: 24,
            fit: BoxFit.none,
          ),
          SvgPicture.asset(
            t3_ic_msg,
            height: 24,
            width: 24,
            fit: BoxFit.none,
          ),
          SvgPicture.asset(
            t3_notification,
            height: 24,
            width: 24,
            fit: BoxFit.none,
          ),
          SvgPicture.asset(
            t3_ic_user,
            height: 24,
            width: 24,
            fit: BoxFit.none,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: SafeArea(
        child: Container(
          color: t3_app_background,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: 180,
                alignment: Alignment.center,
                child: ring(t3_lbl_welcome_to_bottom_n_navigation_bar),
              ),
              Container(
                height: 60,
                child: Row(
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
                        child: text(t3_lbl_bottom_navigation, fontFamily: fontBold, textColor: t3_textColorPrimary, fontSize: 22.0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
