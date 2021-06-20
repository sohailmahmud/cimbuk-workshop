import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Constant.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2SignUp extends StatefulWidget {
  static var tag = "/T2SignUp";

  @override
  T2SignUpState createState() => T2SignUpState();
}

class T2SignUpState extends State<T2SignUp> {
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
                children: <Widget>[
                  headerText(t2_lbl_sign_up_header),
                  SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: subHeadingText(t2_lbl_sign_in),
                  )
                ],
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
                  SizedBox(
                    height: 25,
                  ),
                  text(t2_hint_password, fontSize: textSizeMedium),
                  EditText(isSecure: true),
                  SizedBox(
                    height: 25,
                  ),
                  text(t2_hint_re_password, fontSize: textSizeMedium),
                  EditText(isSecure: true),
                  SizedBox(
                    height: 50,
                  ),
                  AppButton(
                      textContent: t1_lbl_sign_up,
                      onPressed: () {
                        //callNext(T2Dashboard(), context);
                        changeStatusColor(t2White);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
