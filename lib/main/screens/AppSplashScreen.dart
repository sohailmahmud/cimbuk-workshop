import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/screens/ProkitLauncher.dart';

class AppSplashScreen extends StatefulWidget {
  static String tag = '/ProkitSplashScreen';

  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  void navigationPage() async {
    await Future.delayed(Duration(seconds: 3));
    ProkitLauncher().launch(context, isNewTask: true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorFromHex('#FFFDF1'),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('images/app/app_icon.png',
            height: 200, fit: BoxFit.fitHeight),
      ),
    );
  }
}
