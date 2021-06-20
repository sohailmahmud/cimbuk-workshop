import 'dart:convert';

import 'package:clustering_google_maps/clustering_google_maps.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html/parser.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';

import 'colors.dart';

String regularFonts() {
  return GoogleFonts.poppins().fontFamily;
}

TextStyle boldFonts({color = blackColor, size = 16.0}) {
  return GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: size is int ? double.parse(size.toString()).toDouble() : size, textStyle: TextStyle(color: color));
}

hideKeyboard(context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void toastSimple(String msg, {error = false}) {
  Fluttertoast.showToast(msg: msg);
}

/*
void toast(String msg, {error = false, gravity = ToastGravity.BOTTOM, length = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(msg: msg, timeInSecForIos: 3, backgroundColor: error ? Colors.redAccent : primaryColor, textColor: whiteColor, gravity: gravity, toastLength: length);
}
*/

String parseHtmlString(String htmlString) {
  return parse(parse(htmlString).body.text).documentElement.text;
}

Widget getAppBar(context, String title, {color = primaryColor, textColor: whiteColor, List<Widget> actions}) {
  return AppBar(
    actions: actions,
    leading: IconButton(icon: Icon(Icons.arrow_back, color: textColor), onPressed: () => Navigator.of(context).pop()),
    title: text(title, textColor: textColor, fontFamily: fontSemibold, fontSize: textSizeLargeMedium),
    backgroundColor: color,
  );
}

Future<List<LatLngAndGeohash>> getListOfLatLngAndGeoHash(BuildContext context) async {
  try {
    final fakeList = await loadDataFromJson(context);
    List<LatLngAndGeohash> myPoints = List();
    for (int i = 0; i < fakeList.length; i++) {
      final fakePoint = fakeList[i];
      final p = LatLngAndGeohash(
        LatLng(fakePoint["LATITUDE"], fakePoint["LONGITUDE"]),
      );
      myPoints.add(p);
    }
    return myPoints;
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<List<dynamic>> loadDataFromJson(BuildContext context) async {
  final fakeData = await DefaultAssetBundle.of(context).loadString('assets/map_point.json');
  return json.decode(fakeData.toString());
}

Color hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return Color(val);
}

String intToHex(int i) {
  var s = i.toRadixString(16);
  if (s.length == 8) {
    return '#' + s.substring(2).toUpperCase();
  } else {
    return '#' + s.toUpperCase();
  }
}

changeStatusColor(Color color, {bool isWhite = false}) async {
  /*try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }*/
}

Widget networkImage(String image, {String aPlaceholder = "images/integrations/img/placeholder.png", double aWidth, double aHeight, var fit = BoxFit.fill}) {
  return image != null && image.isNotEmpty
      ? FadeInImage(
          placeholder: AssetImage(aPlaceholder),
          image: NetworkImage(image),
          width: aWidth != null ? aWidth : null,
          height: aHeight != null ? aHeight : null,
          fit: fit,
        )
      : Image.asset(
          aPlaceholder,
          width: aWidth,
          height: aHeight,
          fit: BoxFit.fill,
        );
}

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}
