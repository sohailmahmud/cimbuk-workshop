import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3SignIn extends StatefulWidget {
  static var tag = "/T3SignIn";

  @override
  T3SignInState createState() => T3SignInState();
}

class T3SignInState extends State<T3SignIn> {
  bool passwordVisible = false;
  bool isRemember = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height) / 3.5,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      t3_ic_background,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            t3_lbl_welcome,
                            style: TextStyle(fontSize: 40, fontFamily: fontBold, color: t3_white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            t3_lbl_back,
                            style: TextStyle(fontSize: 34, fontFamily: fontBold, color: t3_white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 45),
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  child: Image.asset(
                    t3_ic_icon,
                    height: 70,
                    width: 70,
                  )),
              editTextStyle(t3_hint_Email, isPassword: false),
              SizedBox(height: 16),
              editTextStyle(t3_hint_password, isPassword: true),
              SizedBox(height: 14),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      focusColor: t3_colorPrimary,
                      activeColor: t3_colorPrimary,
                      value: isRemember,
                      onChanged: (bool value) {
                        setState(() {
                          isRemember = value;
                        });
                      },
                    ),
                    text(t3_lbl_remember)
                  ],
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: AppButton(textContent: t3_lbl_sign_in, onPressed: () {}),
              ),
              SizedBox(
                height: 20,
              ),
              text(t3_lbl_forgot_password),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(t3_lbl_don_t_have_account, textColor: t3_textColorPrimary),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: GestureDetector(
                        child: Text(t3_lbl_sign_up,
                            style: TextStyle(
                              fontSize: textSizeLargeMedium,
                              decoration: TextDecoration.underline,
                              color: t3_colorPrimary,
                            )),
                        onTap: () {}),
                  )
                ],
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          t3_ic_sign2,
                          height: 50,
                          width: 70,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25, left: 10),
                            child: Image.asset(
                              t3_ic_sign4,
                              height: 50,
                              width: 70,
                            )),
                      ],
                    ),
                    Container(
                        child: Image.asset(
                      t3_ic_sign1,
                      height: 80,
                      width: 80,
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
