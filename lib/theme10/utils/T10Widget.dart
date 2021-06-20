import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/Quiz/utils/QuizExtension.dart';

import 'T10Colors.dart';
import 'T10Constant.dart';
import 'T10Images.dart';

Widget text(String text,
    {var fontSize = textSizeMedium,
    textColor = t10_textColorPrimary,
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var lineThrough = false,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    var isLongText = false}) {
  return Text(textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      style: TextStyle(
          fontFamily: fontFamily, fontSize: fontSize, decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none, color: textColor, height: 1.5, letterSpacing: latterSpacing));
}

BoxDecoration boxDecoration({double radius = 10, Color color = Colors.transparent, Color bgColor = t10_white, var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [BoxShadow(color: t10_ShadowColor, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

class EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  TextEditingController mController;

  VoidCallback onPressed;

  EditText(
      {var this.fontSize = textSizeMedium,
      var this.textColor = t10_textColorSecondary,
      var this.fontFamily = fontRegular,
      var this.isPassword = true,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextFormField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: t10_colorPrimary,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
          hintText: widget.text,
          labelText: widget.text,
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: t10_view_color, width: 0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: t10_view_color, width: 0.0),
          ),
        ),
        maxLines: widget.maxLine,
        style: TextStyle(fontSize: widget.fontSize, color: t10_textColorPrimary, fontFamily: widget.fontFamily),
      );
    } else {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: t10_colorPrimary,
        decoration: InputDecoration(
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: new Icon(widget.isPassword ? Icons.visibility : Icons.visibility_off),
          ),
          contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
          hintText: widget.text,
          labelText: widget.text,
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: t10_view_color, width: 0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: t10_view_color, width: 0.0),
          ),
        ),
        style: TextStyle(fontSize: widget.fontSize, color: t10_textColorPrimary, fontFamily: widget.fontFamily),
      );
    }
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class AppButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  AppButton({@required this.textContent, @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return AppButtonState();
  }
}

class AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: widget.onPressed,
        textColor: t10_white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[t10_gradient1, t10_gradient2]),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Text(
                widget.textContent,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class T10TopBar extends StatefulWidget {
  var titleName;

  T10TopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return T10TopBarState();
  }
}

class T10TopBarState extends State<T10TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        margin: EdgeInsets.only(right: spacing_standard_new),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: t10_textColorSecondary,
              onPressed: () {
                back(context);
              },
            ),
            Center(
              child: text(
                widget.titleName,
                fontFamily: fontBold,
                fontSize: textSizeLargeMedium,
              ),
            ),
            SvgPicture.asset(
              t10_ic_search,
              color: t10_textColorSecondary,
            ),
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
