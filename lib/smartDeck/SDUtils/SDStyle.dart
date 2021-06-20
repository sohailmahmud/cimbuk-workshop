import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';

TextStyle primaryTextStyle(
    {int size = 16, Color textColor = sdTextPrimaryColor}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: textColor,
  );
}

TextStyle secondaryTextStyle(
    {int size = 14, Color textColor = sdTextSecondaryColor}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: textColor,
  );
}

TextStyle boldTextStyle(
    {int size = 18,
    Color textColor = sdTextPrimaryColor,
    FontWeight textWeight = FontWeight.bold,
    double letterSpacing,
    double wordSpacing}) {
  return TextStyle(
      fontSize: size.toDouble(),
      color: textColor,
      fontWeight: textWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing);
}

BoxDecoration boxDecorations(
    {double radius = 8,
    Color color = Colors.transparent,
    Color bgColor = Colors.white,
    var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow
          ? [BoxShadow(color: sdShadowColor, blurRadius: 10, spreadRadius: 2)]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

BoxDecoration boxDecoration(
    {double radius = 80.0,
    Color backGroundColor = sdPrimaryColor,
    double blurRadius = 8.0,
    double spreadRadius = 8.0,
    Color radiusColor = Colors.black12,
    Gradient gradient}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: radiusColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
      ],
      color: backGroundColor,
      gradient: gradient);
}

class SDButton extends StatefulWidget {
  static String tag = '/T4Button';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 40.0;

  SDButton(
      {@required this.textContent,
      @required this.onPressed,
      this.isStroked = false,
      this.height = 45.0});

  @override
  SDButtonState createState() => SDButtonState();
}

class SDButtonState extends State<SDButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        child: Text(
          widget.textContent,
          textAlign: TextAlign.center,
          style: boldTextStyle(
              size: 16, textColor: Colors.white, letterSpacing: 2),
        ),
        decoration: widget.isStroked
            ? boxDecorations(bgColor: Colors.transparent, color: sdPrimaryColor)
            : boxDecorations(bgColor: sdPrimaryColor, radius: 6),
      ),
    );
  }
}

changeStatusColor(Color color) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }
}
