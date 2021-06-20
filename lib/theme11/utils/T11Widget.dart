import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme11/utils/T11Colors.dart';

import 'T11Constant.dart';

Widget text(var text,
    {var fontSize = textSizeLargeMedium, textColor = t11_PrimaryColor, var fontFamily = fontRegular, var isCentered = false, var maxLine = 1, var latterSpacing = 0.5, overflow: Overflow}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: textColor, height: 1.5, letterSpacing: latterSpacing));
}

//-------------------------------------------Button-------------------------------------------------------------------------

SizedBox buttonStyle(var text) {
  return SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        textColor: t11_WhiteColor,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
        color: t11_PrimaryColor,
        onPressed: () => {},
      ));
}
