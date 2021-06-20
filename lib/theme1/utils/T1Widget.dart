import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme1/utils/T1Extension.dart';
import 'package:snaplist/snaplist_view.dart';

import 'T1Colors.dart';
import 'T1Constant.dart';

//-------------------------------------------Form-------------------------------------------------------------------------
// EditText rounded Style
Padding editTextStyle(var hintText, {isPassword = true}) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: TextFormField(
        style:
            TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
          hintText: hintText,
          filled: true,
          fillColor: t1_edit_text_background,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: t1_edit_text_background, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: t1_edit_text_background, width: 0.0),
          ),
        ),
      ));
}

// EditText
Padding editTextCard(var hintText) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(24, 10, 24, 10),
            hintText: hintText,
          )));
}

// Login/SignUp HeadingElement
Text formHeading(var label) {
  return Text(label,
      style: TextStyle(
          color: t1_textColorPrimary, fontSize: 30, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Text formSubHeadingForm(var label) {
  return Text(label,
      style: TextStyle(
          color: t1_textColorSecondary, fontSize: 20, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

// Other Text
Text formLink(var label) {
  return Text(label,
      style: TextStyle(color: t1_blue, fontSize: 18),
      textAlign: TextAlign.center);
}

//-------------------------------------------Button-------------------------------------------------------------------------

SizedBox buttonStyle(var text) {
  return SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        textColor: t1_white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(40.0)),
        color: t1_colorPrimary,
        onPressed: () => {},
      ));
}

Material shadowButton(var name) {
  return Material(
      elevation: 2,
      shadowColor: Colors.deepOrangeAccent[200],
      borderRadius: new BorderRadius.circular(40.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: MaterialButton(
          child: text(name,
              fontSize: textSizeLargeMedium,
              textColor: t1_white,
              fontFamily: fontMedium),
          textColor: t1_white,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          color: t1_colorPrimary,
          onPressed: () => {},
        ),
      ));
}

//-------------------------------------------Other-------------------------------------------------------------------------
Row rowHeading(var label) {
  return Row(
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(label,
              style: TextStyle(
                  color: t1_textColorPrimary, fontSize: 18, fontFamily: 'Bold'),
              textAlign: TextAlign.left)),
    ],
  );
}

Text Heading(var label) {
  return Text(label,
      style: TextStyle(
          color: t1_textColorPrimary, fontSize: 18, fontFamily: 'Bold'),
      textAlign: TextAlign.left);
}

Row profileText(var label, {var maxline = 1}) {
  return Row(
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: text(label,
              fontSize: textSizeLargeMedium,
              textColor: t1TextColorPrimary,
              maxLine: maxline)),
    ],
  );
}

Text profile(var label) {
  return Text(label,
      style:
          TextStyle(color: t1_colorPrimary, fontSize: 18, fontFamily: 'Medium'),
      textAlign: TextAlign.center);
}

//-------------------------------------------View-------------------------------------------------------------------------
Divider view() {
  return Divider(
    color: t1_view_color,
    height: 0.5,
  );
}
//-----------------------------------------------List------------------------------------------------------------

Text listHeading(var label) {
  return Text(label,
      style: TextStyle(
          color: t1_textColorPrimary, fontSize: 20, fontFamily: 'Bold'),
      textAlign: TextAlign.left);
}

Text listDesignationHeading(var label) {
  return Text(label,
      style: TextStyle(
          color: t1_textColorPrimary, fontSize: 16, fontFamily: 'Medium'),
      textAlign: TextAlign.left);
}

Text listOther(var label) {
  return Text(label,
      style: TextStyle(
        color: t1_textColorSecondary,
        fontSize: 16,
      ),
      textAlign: TextAlign.left);
}

Text headerText(var text) {
  return Text(
    text,
    maxLines: 2,
    style: TextStyle(
        fontFamily: fontBold, fontSize: 22, color: t1_textColorPrimary),
  );
}

Text subHeadingText(var text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: fontBold, fontSize: 17.5, color: t1_textColorSecondary),
  );
}

Widget text(var text,
    {var fontSize = textSizeLargeMedium,
    textColor = t1_textColorSecondary,
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
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
        textColor: t1_white,
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[t1_colorPrimary, t1_colorPrimaryDark]),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.textContent,
                style: TextStyle(fontSize: 18),
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

/**/
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
      {var this.fontSize = textSizeNormal,
      var this.textColor = t1_textColorSecondary,
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
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: t1_colorPrimary,
        maxLines: widget.maxLine,
        style: TextStyle(
            fontSize: widget.fontSize,
            color: t1TextColorPrimary,
            fontFamily: widget.fontFamily),
      );
    } else {
      return TextField(
          controller: widget.mController,
          obscureText: widget.isPassword,
          cursorColor: t1_colorPrimary,
          style: TextStyle(
              fontSize: widget.fontSize,
              color: t1TextColorPrimary,
              fontFamily: widget.fontFamily),
          decoration: new InputDecoration(
            suffixIcon: new GestureDetector(
              onTap: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              child: new Icon(
                  widget.isPassword ? Icons.visibility : Icons.visibility_off),
            ),
          ));
    }
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

Widget checkbox(String title, bool boolValue) {
  return Row(
    children: <Widget>[
      Text(title),
      Checkbox(
        activeColor: t1_colorPrimary,
        value: boolValue,
        onChanged: (bool value) {
          boolValue = value;
        },
      )
    ],
  );
}

class TopBar extends StatefulWidget {
  var titleName;

  TopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
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
              onPressed: () {
                back(context);
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Center(
                child: headerText(widget.titleName),
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

class HorizontalTab extends StatefulWidget {
  final List<String> images;
  var currentIndexPage = 0;

  HorizontalTab(this.images);

  @override
  State<StatefulWidget> createState() {
    return HorizontalTabState();
  }
}

class HorizontalTabState extends State<HorizontalTab> {
  //final VoidCallback loadMore;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 40;
    final Size cardSize = Size(width, width / 1.5);
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          child: SnapList(
            padding: EdgeInsets.only(left: 16),
            sizeProvider: (index, data) => cardSize,
            separatorProvider: (index, data) => Size(12, 12),
            positionUpdate: (int index) {
              widget.currentIndexPage = index;
            },
            builder: (context, index, data) {
              return ClipRRect(
                borderRadius: new BorderRadius.circular(12.0),
                child: Image.network(
                  widget.images[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            count: widget.images.length,
          ),
        ),
        DotsIndicator(
            dotsCount: 3,
            position: widget.currentIndexPage,
            decorator: DotsDecorator(
              color: t1_view_color,
              activeColor: t1_colorPrimary,
            ))
      ],
    );
  }
}

Widget ring(String description) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150.0),
          border: Border.all(
            width: 16.0,
            color: t1_colorPrimary,
          ),
        ),
      ),
      SizedBox(height: 16),
      text(description,
          textColor: t1TextColorPrimary,
          fontSize: textSizeNormal,
          fontFamily: fontSemibold,
          isCentered: true,
          maxLine: 2)
    ],
  );
}

Widget shareIcon(String iconPath) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Image.asset(iconPath, width: 28, height: 28, fit: BoxFit.fill),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = t1_white,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? [BoxShadow(color: shadow_color, blurRadius: 2, spreadRadius: 2)]
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

class ScrollingBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key key, @required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(file, fit: BoxFit.fill),
      ),
    );
  }
}

/*
Widget checkbox(String title, bool boolValue) {
  return Row(
    children: <Widget>[
      Text(title),
      Checkbox(
        activeColor: t1_colorPrimary,
        value: boolValue,
        onChanged: (bool value) {
          boolValue=value;
        },
      )
    ],
  );
}
*/
