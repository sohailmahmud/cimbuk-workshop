import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme2/screens/T2Dashboard.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';

class T2SideMenu extends StatefulWidget {
  static var tag = "/T2SideMenu";

  @override
  T2SideMenuState createState() => T2SideMenuState();
}

class T2SideMenuState extends State<T2SideMenu> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t2White);

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SafeArea(
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
      ),
      drawer: T2Drawer(),
    );
  }
}
