import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/grocery/utils/GroceryExtension.dart';
import 'package:prokit_flutter/grocery/utils/GroceryWidget.dart';

class GroceryTermCondition extends StatefulWidget {
  static String tag = '/GroceryTermCondition';

  @override
  _GroceryTermConditionState createState() => _GroceryTermConditionState();
}

class _GroceryTermConditionState extends State<GroceryTermCondition> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_colorPrimary);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: title1(grocery_lbl_Terms_and_Condition, grocery_colorPrimary, grocery_color_white, context),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text("Product Terms", textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold)
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              text(grocery_lbl_Long_text, textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontRegular, isLongText: true)
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(
                height: spacing_large,
              ),
              text("1. Use of the site", textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold)
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              text(grocery_lbl_Long_text, textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontRegular, isLongText: true)
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(
                height: spacing_standard_new,
              ),
              text("THESE TERMS AND CONDITIONS DO NOT AFFECT YOUR STATUTORY RIGHTS", textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold, isLongText: true)
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(
                height: spacing_standard_new,
              ),
              text("2. Amendments", textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold)
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              text("we may revise the terms and conditions from time to time without notice to you. Lorem ipsum dolor sit.",
                      textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold, isLongText: true)
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
            ],
          ),
        ),
      ),
    );
  }
}
