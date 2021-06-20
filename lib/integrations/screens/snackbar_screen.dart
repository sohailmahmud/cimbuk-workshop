import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';

class SnackBarScreen extends StatefulWidget {
  static String tag = '/SnackBarScreen';

  @override
  SnackBarScreenState createState() => SnackBarScreenState();
}

class SnackBarScreenState extends State<SnackBarScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);

    return Scaffold(
      appBar: getAppBar(context, "Snackbar"),
      key: scaffoldKey,
      body: GridView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: text('This is simple Snackbar'),
              ));
            },
            child: simpleCard('Simple Snackbar'),
          ),
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: text('This is Snackbar with Action'),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        toastSimple('Undo pressed');
                      }),
                ),
              );
            },
            child: simpleCard('Snackbar with Action'),
          ),
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: text('This is custom Snackbar', fontSize: 20),
                backgroundColor: primaryColor,
              ));
            },
            child: simpleCard('Custom Snackbar'),
          ),
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: text('This is infinite Snackbar with some info'),
                duration: Duration(days: 365),
                action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      scaffoldKey.currentState.hideCurrentSnackBar();
                    }),
              ));
            },
            child: simpleCard('Infinite Snackbar'),
          ),
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: text('This is Floating Snackbar'),
                behavior: SnackBarBehavior.floating,
              ));
            },
            child: simpleCard('Floating Snackbar'),
          ),
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: text('This is Rounded Snackbar'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                behavior: SnackBarBehavior.floating,
              ));
            },
            child: simpleCard('Rounded Snackbar'),
          ),
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: text('This is Bordered Snackbar', textColor: primaryColor),
                shape: Border.all(color: primaryColor),
                backgroundColor: whiteColor,
                behavior: SnackBarBehavior.floating,
              ));
            },
            child: simpleCard('Bordered Snackbar'),
          ),
        ],
      ),
    );
  }

  Widget simpleCard(String content) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), boxShadow: [BoxShadow(color: shadowColor, blurRadius: 10, spreadRadius: 2)], color: secondaryColor),
      child: text(content, textColor: whiteColor, fontFamily: fontMedium, maxLine: 3, isCentered: true),
    );
  }
}
