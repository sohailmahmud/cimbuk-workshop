import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/home_page.dart';
import 'package:prokit_flutter/main/model/AppMoel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'ProkitScreenListing.dart';
import 'SettingScreen.dart';

class ProkitLauncher extends StatefulWidget {
  static String tag = '/ProkitLauncher';

  @override
  ProkitLauncherState createState() => ProkitLauncherState();
}

class ProkitLauncherState extends State<ProkitLauncher> with TickerProviderStateMixin {
  var width;
  var height;
  var selectedTab = 0;
  bool isNew;

  PageController _controller = PageController(initialPage: 0, keepPage: false);

  Future<String> _loadContentAsset() async {
    return await rootBundle.loadString('assets/app_content.json');
  }

  Future<AppTheme> loadContent() async {
    String jsonString = await _loadContentAsset();
    final jsonResponse = json.decode(jsonString);
    return new AppTheme.fromJson(jsonResponse);
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.black);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    Widget tabItem(String name, int pos, {var isRight = false}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _controller.jumpToPage(pos);
            selectedTab = pos;
          });
        },
        child: Container(
          child: text(name, textColor: selectedTab == pos ? appColorPrimaryDark : appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
          alignment: Alignment.center,
          width: width / 2,
          height: 50,
          decoration: selectedTab == pos
              ? BoxDecoration(color: appStore.appColorPrimaryLightColor, borderRadius: isRight ? BorderRadius.only(topLeft: Radius.circular(16)) : BorderRadius.only(topRight: Radius.circular(16)))
              : BoxDecoration(),
        ),
      );
    }

    Widget category(Color color, String img, String name, BuildContext context, var id, {bool isNew = false, String type = 'New'}) {
      return FutureBuilder<AppTheme>(
        future: loadContent(),
        builder: (context, snapshot) => GestureDetector(
          onTap: () {
            if (id == 0) {
              launchScreen(context, ProkitScreenListing.tag, arguments: snapshot.data.widgets);
            }
            if (id == 1) {
              launchScreen(context, ProkitScreenListing.tag, arguments: snapshot.data.fullapp);
            }
            if (id == 2) {
              launchScreen(context, ProkitScreenListing.tag, arguments: snapshot.data.dashboard);
            }
            if (id == 3) {
              launchScreen(context, IntegrationHomePage.tag);
            }
          },
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.topRight,
            children: [
              Container(
                width: width / 3.7,
                height: width / 4,
                margin: EdgeInsets.only(right: 16),
                decoration: boxDecoration(radius: 4, bgColor: color, showShadow: true),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(img, width: width / 12, height: width / 12, color: appWhite),
                    text('$name', textColor: appWhite, fontSize: textSizeMedium, fontFamily: fontMedium, maxLine: 2, isCentered: true),
                  ],
                ),
              ),
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 8, top: 8),
                  padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: boxDecoration(bgColor: appDarkRed, radius: 4),
                  child: FittedBox(child: text(type, fontSize: 8.0, textColor: appWhite)),
                ).visible(isNew.validate()),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: FutureBuilder<AppTheme>(
        future: loadContent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 230.0,
                    floating: false,
                    backgroundColor: appStore.scaffoldBackground,
                    forceElevated: innerBoxIsScrolled,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.settings, color: appStore.backgroundColor),
                        onPressed: () {
                          SettingScreen().launch(context);
                        },
                      )
                    ],
                    title: innerBoxIsScrolled ? text(appLblDashboardHeading, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeLarge) : null,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 16),
                            text(appLblDashboardHeading, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeXXLarge).paddingOnly(top: 16, left: 16, right: 16),
                            SizedBox(height: 16),
                            SingleChildScrollView(
                              padding: EdgeInsets.all(16),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  category(appCat4, app_ic_phone, snapshot.data.widgets.name, context, 0, isNew: true, type: snapshot.data.widgets.type),
                                  category(appCat1, app_ic_phone, appLblFullApps, context, 1, type: snapshot.data.fullapp.type),
                                  category(appCat2, app_dashboard, appLblDashboard, context, 2, type: snapshot.data.dashboard.type),
                                  category(appCat3, app_ic_phone, appLblIntegrations, context, 3, isNew: true),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                margin: EdgeInsets.only(top: 24),
                width: width,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        tabItem(appLblThemeList, 0),
                        tabItem(appLblScreenList, 1, isRight: true),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: double.maxFinite,
                        color: appStore.scaffoldBackground,
                        child: PageView(
                          pageSnapping: false,
                          onPageChanged: (value) {
                            selectedTab = value;
                            setState(() {});
                          },
                          controller: _controller,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            ThemeList(snapshot.data.themes, context),
                            ThemeList(snapshot.data.screenList, context),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: text("${snapshot.error.toString()}", textColor: appTextColorPrimary));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
