import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Constant.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2SignIn extends StatefulWidget {
  static var tag = "/T2SignIn";

  @override
  T2SignInState createState() => T2SignInState();
}

class T2SignInState extends State<T2SignIn> {
  bool passwordVisible = false;
  bool isRemember = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t2White);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: t2_white,
        child: Column(
          children: <Widget>[
            /*back icon*/
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            /*heading*/
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[headerText(t2_lbl_sign_in_header), SizedBox(width: 4), Padding(padding: const EdgeInsets.only(bottom: 2), child: subHeadingText(t1_lbl_sign_up))],
              ),
            ),
            /*content*/
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(t2_hint_email, fontSize: textSizeMedium),
                  EditText(isPassword: false),
                  SizedBox(height: 25),
                  text(t2_hint_password, fontSize: textSizeMedium),
                  EditText(isSecure: true),
                  SizedBox(height: 18),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        focusColor: t2_colorPrimary,
                        activeColor: t2_colorPrimary,
                        value: isRemember,
                        onChanged: (bool value) {
                          setState(() {
                            isRemember = value;
                          });
                        },
                      ),
                      Text(t2_lbl_remember, style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium, color: t2_textColorSecondary))
                    ],
                  ),
                  SizedBox(height: 18),
                  AppButton(
                    textContent: t2_lbl_sign_in,
                    onPressed: () {
                      changeStatusColor(t2White);
                    },
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    child: Center(child: text(t2_lbl_forgot_password, textColor: t2_colorPrimary, fontFamily: fontMedium, fontSize: textSizeMedium)),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
