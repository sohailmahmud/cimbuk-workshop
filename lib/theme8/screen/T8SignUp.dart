import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/theme8/utils/T8Extension.dart';
import 'package:prokit_flutter/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/theme8/utils/T8Widget.dart';

class T8SignUp extends StatefulWidget {
  static String tag = '/T8SignUp';

  @override
  T8SignUpState createState() => T8SignUpState();
}

class T8SignUpState extends State<T8SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t8_app_background);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: t8_app_background,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                text(t8_title_new_account, fontSize: textSizeNormal, fontFamily: fontBold),
                text(t8_info_sign_up, textColor: t8_textColorSecondary, isLongText: true),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: t8_white, color: t8_white, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      d8EditTextStyle(t8_hint_your_email, isPassword: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                text(t8_lbl_already_have_an_account),
                text(t8_lbl_sign_in, textColor: t8_colorPrimary, textAllCaps: true),
                SizedBox(
                  height: 80,
                ),
                Container(margin: EdgeInsets.all(24.0), child: T8Button(textContent: t8_lbl_create_account, onPressed: () {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
