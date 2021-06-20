import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodImages.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

class FoodProfile extends StatefulWidget {
  static String tag = '/FoodProfile';

  @override
  FoodProfileState createState() => FoodProfileState();
}

class FoodProfileState extends State<FoodProfile> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_app_background);
    String _selectedLocation = 'Female';
    return Scaffold(
      backgroundColor: food_white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(food_lbl_profile),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(food_ic_user1),
                          radius: 50,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: food_white,
                          ),
                          width: 30,
                          height: 30,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(spacing_standard),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: editTextStyle(food_hint_first_name),
                              ),
                              SizedBox(
                                width: spacing_standard_new,
                              ),
                              Expanded(
                                child: editTextStyle(food_hint_last_name),
                              )
                            ],
                          ),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: spacing_standard_new,
                                right: spacing_standard_new),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: food_view_color,
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              value: _selectedLocation,
                              items: <String>['Female', 'Male']
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value,
                                      fontFamily: fontRegular,
                                      fontSize: textSizeMedium,
                                      textColor: food_textColorSecondary),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                            )),
                          ),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          editTextStyle(food_hint_mobile_no),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          editTextStyle(food_hint_email),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                top: spacing_middle, bottom: spacing_middle),
                            decoration: boxDecoration(
                                bgColor: food_colorPrimary,
                                radius: 50,
                                showShadow: true),
                            child: text(food_lbl_save_profile,
                                textColor: food_white, isCentered: true),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
