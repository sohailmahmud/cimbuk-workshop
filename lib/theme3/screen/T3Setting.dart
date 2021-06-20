import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3Setting extends StatefulWidget {
  static String tag = '/T3Setting';

  @override
  T3SettingState createState() => T3SettingState();
}

class T3SettingState extends State<T3Setting> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t3_app_background);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: t3_app_background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: t3_textColorPrimary,
                    onPressed: () {
                      back(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Center(child: text(t3_lbl_setting, fontFamily: fontBold, textColor: t3_textColorPrimary, fontSize: 22.0)),
                  )
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(t3_lbl_language, textColor: t3_textColorPrimary, fontSize: textSizeMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(backgroundImage: AssetImage(t3_ic_flag), radius: 6),
                        Container(margin: EdgeInsets.only(left: 4, right: 12), child: text(t3_lbl_French, textColor: t3_textColorPrimary, fontSize: textSizeMedium)),
                        text(t3_lbl_change, textColor: t3_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                      ],
                    ),
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(t3_hint_password, textColor: t3_textColorPrimary, fontSize: textSizeMedium),
                    text(t3_lbl_change, textColor: t3_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(t3_lbl_location, textColor: t3_textColorPrimary, fontSize: textSizeMedium),
                    text(t3_lbl_edit, textColor: t3_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 6, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(t3_lbl_receive_notification, textColor: t3_textColorPrimary, fontSize: textSizeMedium),
                    Switch(
                      value: isSwitched1,
                      onChanged: (value) {
                        setState(() {
                          isSwitched1 = value;
                        });
                      },
                      activeTrackColor: Colors.amber,
                      activeColor: t3_view_color,
                    )
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 6, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(t3_lbl_receive_newsletter, textColor: t3_textColorPrimary, fontSize: textSizeMedium),
                    Switch(
                      value: isSwitched2,
                      onChanged: (value) {
                        setState(() {
                          isSwitched2 = value;
                        });
                      },
                      activeTrackColor: Colors.amber,
                      activeColor: t3_view_color,
                    )
                  ],
                ),
              ),
              divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 6, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(t3_lbl_receive_special_news_offer, textColor: t3_textColorPrimary, fontSize: textSizeMedium),
                    Switch(
                      value: isSwitched3,
                      onChanged: (value) {
                        setState(() {
                          isSwitched3 = value;
                        });
                      },
                      activeTrackColor: Colors.amber,
                      activeColor: t3_view_color,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
