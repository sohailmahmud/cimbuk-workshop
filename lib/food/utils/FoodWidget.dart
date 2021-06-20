import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/food/screen/FoodAddAddress.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';

import 'FoodColors.dart';
import 'FoodConstant.dart';
import 'FoodString.dart';

Widget text(String text,
    {var fontSize = textSizeMedium,
    textColor = food_textColorPrimary,
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    var isLongText = false}) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: textColor, height: 1.5, letterSpacing: latterSpacing),
  );
}

BoxDecoration boxDecoration({double radius = spacing_middle, Color color = Colors.transparent, Color bgColor = food_white, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? [BoxShadow(color: food_ShadowColor, blurRadius: 6, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget mHeading(var value) {
  return Container(
    margin: EdgeInsets.all(spacing_standard_new),
    child: text(value, fontFamily: fontMedium, textAllCaps: true),
  );
}

BoxDecoration gradientBoxDecoration({double radius = spacing_middle, Color color = Colors.transparent, Color gradientColor2 = food_white, Color gradientColor1 = food_white, var showShadow = false}) {
  return BoxDecoration(
    gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [gradientColor1, gradientColor2]),
    boxShadow: showShadow ? [BoxShadow(color: food_ShadowColor, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget search(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: boxDecoration(radius: 50, bgColor: food_white, color: food_colorPrimary),
    padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
    child: RichText(
      text: TextSpan(
        children: [
          WidgetSpan(child: Padding(padding: const EdgeInsets.only(right: 4), child: Icon(Icons.search, color: food_textColorSecondary, size: 18))),
          TextSpan(text: food_hint_search_restaurants, style: TextStyle(fontSize: textSizeMedium, color: food_textColorSecondary)),
        ],
      ),
    ),
  );
}

Widget mAddress(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
    decoration: boxDecoration(radius: 50, bgColor: food_colorPrimary_light),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        text(food_lbl_address_dashboard),
        GestureDetector(
          onTap: () {
            mChangeAddress(context);
          },
          child: text(food_lbl_change, textColor: food_colorPrimary, fontFamily: fontMedium),
        ),
      ],
    ),
  );
}

Widget mChangeAddress(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_large), topRight: Radius.circular(spacing_large)), color: food_white),
            height: MediaQuery.of(context).size.width * 1.0,
            padding: EdgeInsets.all(spacing_large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(food_lbl_search_location, fontFamily: fontMedium),
                    IconButton(
                      onPressed: () {
                        back(context);
                      },
                      icon: Icon(Icons.close, color: food_textColorSecondary),
                    )
                  ],
                ),
                SizedBox(height: spacing_standard),
                Container(
                  decoration: boxDecoration(radius: 10, showShadow: true),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: food_white,
                      hintText: food_hint_search_restaurants,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(height: spacing_standard_new),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Icon(Icons.my_location, color: food_colorPrimary, size: 18)),
                      ),
                      TextSpan(text: food_lbl_use_current_location, style: TextStyle(fontSize: textSizeMedium, color: food_colorPrimary)),
                    ],
                  ),
                ),
                Container(height: 0.5, color: food_view_color, width: MediaQuery.of(context).size.width, margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new)),
                GestureDetector(
                  onTap: () {
                    launchScreen(context, FoodAddAddress.tag);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Icon(Icons.add, color: food_colorPrimary, size: 18)),
                        ),
                        TextSpan(text: food_lbl_add_address, style: TextStyle(fontSize: textSizeMedium, color: food_colorPrimary)),
                      ],
                    ),
                  ),
                ),
                Container(height: 0.5, color: food_view_color, width: MediaQuery.of(context).size.width, margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new)),
                text(food_lbl_recent_location, fontFamily: fontMedium),
                text(food_lbl_location, textColor: food_textColorSecondary)
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget mViewAll(BuildContext context, var value, {var tags}) {
  return GestureDetector(
    onTap: () {
      if (tags != null) launchScreen(context, tags);
    },
    child: Container(
      margin: EdgeInsets.all(spacing_standard_new),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(padding: const EdgeInsets.only(right: spacing_standard), child: Icon(Icons.arrow_forward, color: food_colorPrimary, size: 18)),
            ),
            TextSpan(text: value, style: TextStyle(fontSize: textSizeMedium, color: food_colorPrimary)),
          ],
        ),
      ),
    ),
  );
}

Widget mRating(var value) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(text: value, style: TextStyle(fontSize: textSizeSMedium, color: food_color_green)),
        WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.radio_button_checked, color: food_color_green, size: 16),
          ),
        ),
      ],
    ),
  );
}

Padding editTextStyle(var hintText) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: TextFormField(
      style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        hintText: hintText,
        filled: true,
        fillColor: food_white,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: const BorderSide(color: food_view_color, width: 1.0)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: const BorderSide(color: food_view_color, width: 1.0)),
      ),
    ),
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
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Center(child: text(widget.titleName, fontFamily: fontBold, fontSize: textSizeLargeMedium, isCentered: true)),
            )
          ],
        ),
      ),
    );
  }
}

class Quantitybtn extends StatefulWidget {
  @override
  QuantitybtnState createState() => QuantitybtnState();
}

class QuantitybtnState extends State<Quantitybtn> {
  bool visibility = false;
  var count = 1;

  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: visibility,
      child: Container(
        height: width * 0.08,
        alignment: Alignment.center,
        width: width * 0.23,
        decoration: boxDecoration(color: food_textColorPrimary, radius: spacing_control),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: width * 0.08,
              height: width * 0.08,
              decoration: BoxDecoration(color: food_textColorPrimary, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(spacing_control), topLeft: Radius.circular(spacing_control))),
              child: IconButton(
                icon: Icon(Icons.remove, color: food_white, size: 10),
                onPressed: () {
                  setState(() {
                    if (count == 1 || count < 1) {
                      count = 1;
                    } else {
                      count = count - 1;
                    }
                  });
                },
              ),
            ),
            text("$count"),
            Container(
              width: width * 0.08,
              height: width * 0.08,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: food_textColorPrimary, borderRadius: BorderRadius.only(bottomRight: Radius.circular(spacing_control), topRight: Radius.circular(spacing_control))),
              child: IconButton(
                icon: Icon(Icons.add, color: food_white, size: 10),
                onPressed: () {
                  setState(() {
                    count = count + 1;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      replacement: GestureDetector(
        onTap: () {
          _changed();
        },
        child: Container(
          width: width * 0.22,
          height: width * 0.08,
          decoration: boxDecoration(color: food_textColorPrimary, radius: spacing_control),
          alignment: Alignment.center,
          child: text(food_lbl_add, isCentered: true),
        ),
      ),
    );
  }
}

Widget mTotalRating(var value) {
  return Row(
    children: <Widget>[
      Icon(Icons.radio_button_checked, color: food_colorAccent, size: 16),
      Icon(Icons.radio_button_checked, color: food_colorAccent, size: 16),
      Icon(Icons.radio_button_checked, color: food_colorAccent, size: 16),
      Icon(Icons.radio_button_unchecked, color: food_colorAccent, size: 16),
      Icon(Icons.radio_button_unchecked, color: food_colorAccent, size: 16),
      SizedBox(width: spacing_control),
      text(value, textColor: food_textColorSecondary, fontSize: 14.0)
    ],
  );
}

Widget mBottom(BuildContext context, var gColor1, var gColor2, var value, var tags) {
  var width = MediaQuery.of(context).size.width;

  return Container(
    height: 100,
    decoration: boxDecoration(showShadow: true, radius: 0, bgColor: food_white),
    padding: EdgeInsets.all(spacing_standard_new),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            text(food_lbl_1799, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
            text(food_lbl_view_bill_details, textColor: food_colorPrimary),
          ],
        ),
        GestureDetector(
          onTap: () {
            launchScreen(context, tags);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(spacing_large, spacing_middle, spacing_large, spacing_middle),
            decoration: gradientBoxDecoration(radius: 50, showShadow: true, gradientColor1: gColor1, gradientColor2: gColor2),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(text: value, style: TextStyle(fontFamily: fontMedium, fontSize: textSizeMedium, color: food_white)),
                  WidgetSpan(
                    child: Padding(padding: const EdgeInsets.only(left: spacing_standard), child: Icon(Icons.arrow_forward, color: food_white, size: 18)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget mDot() {
  return Container(decoration: BoxDecoration(shape: BoxShape.circle, color: food_view_color), width: 8, height: 8);
}
