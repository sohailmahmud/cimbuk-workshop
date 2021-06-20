import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';

import 'DbConstant.dart';
import 'DbStrings.dart';

Widget text(String text,
    {var fontSize = textSizeMedium,
    textColor = db3_textColorPrimary,
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    var isLongText = false}) {
  return Text(textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: textColor, height: 1.5, letterSpacing: latterSpacing));
}

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color bgColor = db3_white, var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [BoxShadow(color: dbShadowColor, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Widget db3Label(var text) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: textSizeNormal, color: db2_textColorPrimary, fontFamily: fontBold)),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: db2_lbl_view_all, style: TextStyle(fontSize: textSizeSMedium, color: db2_textColorSecondary)),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: db2_textColorSecondary,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
