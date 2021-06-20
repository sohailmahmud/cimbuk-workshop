import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/main/model/AppMoel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class ProkitScreenListing extends StatefulWidget {
  static String tag = "/ProkitScreenListing";

  @override
  ProkitScreenListingState createState() => ProkitScreenListingState();
}

class ProkitScreenListingState extends State<ProkitScreenListing> {
  var width;
  var height;
  var selectedTab = 0;
  List<ProTheme> list = List<ProTheme>();
  List<Color> colors = [appCat1, appCat2, appCat3];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // changeStatusColor(appWhite);
    ProTheme arguments = ModalRoute.of(context).settings.arguments;
    list = arguments.sub_kits;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(
        context,
        arguments.title_name ?? arguments.name,
        actions: [
          Tooltip(
            message: 'Dark Mode',
            child: Switch(
              value: appStore.isDarkModeOn,
              activeColor: appColorPrimary,
              onChanged: (s) {
                appStore.setDarkMode(s);
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: arguments.show_cover ? Image.asset(app_bg_cover_image, height: height / 4) : null,
            ),
            ThemeList(list, context)
          ],
        ),
      ),
    );
  }
}
