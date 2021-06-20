import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme10/utils/T10Colors.dart';
import 'package:prokit_flutter/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/theme10/utils/T10Extension.dart';
import 'package:prokit_flutter/theme10/utils/T10Strings.dart';
import 'package:prokit_flutter/theme10/utils/T10Widget.dart';

class T10SignUp extends StatefulWidget {
  static String tag = '/T10SignUp';

  @override
  T10SignUpState createState() => T10SignUpState();
}

class T10SignUpState extends State<T10SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t10_white);
    return Scaffold(
      backgroundColor: t10_white,
      body: SafeArea(
        child: Container(
          color: t10_white,
          margin: EdgeInsets.only(left: spacing_large, right: spacing_large),
          child: Column(
            children: <Widget>[
              text(theme10_lbl_register, fontFamily: fontBold, fontSize: textSizeXLarge),
              SizedBox(
                height: spacing_large,
              ),
              EditText(
                text: theme10_first_name,
                isPassword: false,
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              EditText(
                text: theme10_last_name,
                isPassword: false,
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              EditText(
                text: theme10_email,
                isPassword: false,
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              EditText(
                text: theme10_password,
                isSecure: true,
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              EditText(
                text: theme10_confirm_password,
                isSecure: true,
              ),
              SizedBox(
                height: spacing_xlarge,
              ),
              AppButton(
                onPressed: () {},
                textContent: theme10_lbl_register,
              ),
              SizedBox(
                height: spacing_large,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(theme10_lbl_already_have_account, textColor: t10_textColorSecondary, fontFamily: fontMedium),
                  SizedBox(
                    width: spacing_control,
                  ),
                  text(theme10_lbl_sign_in, fontFamily: fontMedium),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
