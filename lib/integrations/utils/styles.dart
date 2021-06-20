import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';

import 'colors.dart';

var primaryButtonTextStyle = TextStyle(color: whiteColor);

getLightTheme() {
  return ThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.light,
      accentColor: secondaryColor,
      dividerColor: viewLineColor,
      secondaryHeaderColor: inactiveColor,
      textTheme:
          TextTheme(button: TextStyle(color: textPrimaryColor, fontSize: 20)),
      scaffoldBackgroundColor: whiteColor,
      textSelectionColor: Color(0xFFDADADA));
}

getDarkTheme() {
  return ThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      accentColor: secondaryColor,
      dividerColor: Colors.black54,
      secondaryHeaderColor: whiteColor,
      textTheme: TextTheme(button: TextStyle(color: whiteColor, fontSize: 20)),
      scaffoldBackgroundColor: darkColor,
      textSelectionColor: textSecondaryColor);
}

/*
primaryTextStyle({size = 16, color = whiteColor, aFontFamily = fontRegular}) {
  return TextStyle(color: color, fontSize: double.parse(size.toString()).toDouble(), fontFamily: aFontFamily);
}
*/
Widget textPrimary(text,
    {size = 16, color = whiteColor, aFontFamily = fontRegular}) {
  return Text(text, style: primaryTextStyle(size: size, color: color));
}

secondaryTextStyle(
    {size = 16, color = textSecondaryColor, aFontFamily = fontRegular}) {
  return TextStyle(
      color: color,
      fontSize: double.parse(size.toString()).toDouble(),
      fontFamily: aFontFamily);
}

Widget textSecondary(text,
    {size = 16, color = textSecondaryColor, aFontFamily = fontRegular}) {
  return Text(text,
      style: secondaryTextStyle(
          size: size, color: color, aFontFamily: aFontFamily));
}

Widget text(
  var text, {
  var fontSize = textSizeMedium,
  textColor = "",
  var fontFamily = fontRegular,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.2,
  var isLongText = false,
  var isJustify = false,
}) {
  return Text(
    text,
    textAlign: isCentered
        ? TextAlign.center
        : isJustify ? TextAlign.justify : TextAlign.start,
    maxLines: isLongText ? 20 : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: double.parse(fontSize.toString()).toDouble(),
        height: 1.5,
        color: textColor.toString().isNotEmpty ? textColor : null,
        letterSpacing: latterSpacing),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = appWhite,
    var showShadow = false}) {
  return BoxDecoration(
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      color: bgColor,
      boxShadow: showShadow
          ? [BoxShadow(color: shadowColor, blurRadius: 5, spreadRadius: 1)]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}
