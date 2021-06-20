import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme8/utils/T8Colors.dart';

import 'T8Constant.dart';
import 'T8Extension.dart';

Widget text(String text,
    {var fontSize = textSizeMedium,
    textColor = t8_textColorPrimary,
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

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color bgColor = t8_white, var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [BoxShadow(color: t8_ShadowColor, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

TextFormField d8EditTextStyle(var hintText, {isPassword = true}) {
  return TextFormField(
    style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
    obscureText: isPassword,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
      hintText: hintText,
      border: InputBorder.none,
      hintStyle: TextStyle(color: t8_textColorSecondary),
    ),
  );
}

Divider d8Divider() {
  return Divider(
    height: 1,
    color: t8_view_color,
    thickness: 1,
  );
}

class T8Button extends StatefulWidget {
  var textContent;

  //   var icon;
  VoidCallback onPressed;

  T8Button({
    @required this.textContent,
    @required this.onPressed,
    //   @required this.icon,
  });

  @override
  T8ButtonState createState() => T8ButtonState();
}

class T8ButtonState extends State<T8Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          decoration: boxDecoration(bgColor: t8_colorPrimary, radius: 16),
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: text(widget.textContent, textColor: t8_white, fontFamily: fontMedium, textAllCaps: false),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: t8_colorPrimaryDark),
                  width: 35,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: t8_white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class t8TopBar extends StatefulWidget {
  var titleName;

  t8TopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return t8TopBarState();
  }
}

class t8TopBarState extends State<t8TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: t8_colorPrimary,
              onPressed: () {
                back(context);
              },
            ),
            Center(
              child: Text(
                widget.titleName,
                maxLines: 2,
                style: TextStyle(fontFamily: fontBold, fontSize: 22, color: t8_textColorPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

Container t8HeaderText(var text) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Text(
      text,
      maxLines: 2,
      style: TextStyle(fontFamily: fontBold, fontSize: 22, color: t8_textColorPrimary),
    ),
  );
}
