import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme2/utils/T2BubbleBotoomBar.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2BottomNavigation extends StatefulWidget {
  static var tag = "/T2BottomNavigation";

  @override
  T2BottomNavigationState createState() => T2BottomNavigationState();
}

class T2BottomNavigationState extends State<T2BottomNavigation> {
  var currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t2White);

    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        onTap: changePage,
        //new
        hasNotch: false,
        //new
        hasInk: true,
        //new, gives a cute ink effect
        inkColor: t2_colorPrimaryLight,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          tab(Icons.home, t2_lbl_home),
          tab(Icons.favorite_border, t2_lbl_favourite),
          tab(Icons.notifications_none, t2_lbl_notification),
          tab(Icons.person_outline, t2_lbl_profile),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 180,
            alignment: Alignment.center,
            child: ring(t2_lbl_welcome_to_bottom_n_navigation_baar),
          ),
          TopBar(t2_bottom_navigation)
        ],
      ),
    );
  }
}
