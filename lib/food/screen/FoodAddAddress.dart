import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import '../utils/FoodColors.dart';

class FoodAddAddress extends StatefulWidget {
  static String tag = '/FoodAddAddress';

  @override
  FoodAddAddressState createState() => FoodAddAddressState();
}

class FoodAddAddressState extends State<FoodAddAddress> {
  String _selectedLocation = 'Home';

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);
    return Scaffold(
      backgroundColor: food_white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(food_lbl_add_address),
            Expanded(
              child: SingleChildScrollView(
                  child: Container(
                margin: EdgeInsets.all(spacing_standard_new),
                child: Column(
                  children: <Widget>[
                    editTextStyle(food_hint_full_name),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: editTextStyle(food_hint_pin_code),
                        ),
                        SizedBox(
                          width: spacing_standard_new,
                        ),
                        Expanded(
                          child: editTextStyle(food_hint_city),
                        )
                      ],
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: editTextStyle(food_hint_state),
                        ),
                        SizedBox(
                          width: spacing_standard_new,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: food_view_color,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(40))),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              value: _selectedLocation,
                              items: <String>['Home', 'Work'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value, fontFamily: fontRegular, fontSize: textSizeMedium, textColor: food_textColorSecondary),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    editTextStyle(food_hint_address),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    editTextStyle(food_hint_mobile_no),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
                      decoration: boxDecoration(bgColor: food_colorPrimary, radius: 50, showShadow: true),
                      child: text(food_lbl_add_address, textColor: food_white, isCentered: true),
                    )
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
