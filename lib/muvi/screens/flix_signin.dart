import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/muvi/screens/flix_home_screen.dart';
import 'package:prokit_flutter/muvi/screens/flix_signup.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_localizations.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/muvi/utils/flix_widget_extensions.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_size.dart';

class SignInScreen extends StatefulWidget {
  static String tag = '/SignInScreen';

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  FocusNode passFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool _autoValidate = false;
  bool passwordVisible = false;
  bool isLoading = false;

  showLoading(bool show) {
    setState(() {
      isLoading = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    var form = Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          formField(
            context,
            "hint_email",
            maxLine: 1,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return value.validateEMail(context);
            },
            onSaved: (String value) {
              email = value;
            },
            textInputAction: TextInputAction.next,
            focusNode: emailFocus,
            nextFocus: passFocus,
            suffixIcon: Icons.mail_outline,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "hint_password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value.isEmpty ? keyString(context, "error_pwd_requires") : null;
            },
            focusNode: passFocus,
            onSaved: (String value) {
              password = value;
            },
            textInputAction: TextInputAction.done,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          )
        ],
      ),
    );
    var signinButton = SizedBox(
      width: double.infinity,
      child: button(context, keyString(context, "get_started"), () {
        /*  final form = _formKey.currentState;
        if (form.validate()) {
          form.save();
          doSignIn(context);
        } else {
          setState(() => _autoValidate = true);
        }*/
        doSignIn(context);
      }),
    );
    var loginWithGoogle =
        iconButton(context, keyString(context, "signin_with_google"), ic_google, () {}, backgroundColor: Colors.white).paddingOnly(left: spacing_standard_new, right: spacing_standard_new);

    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, keyString(context, "login"), darkBackground: false),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(alignment: Alignment.center, child: flixTitle(context).paddingAll(spacing_large)),
                text(context, keyString(context, "login_desc"), fontSize: ts_normal, textColor: muvi_textColorPrimary, maxLine: 2, isCentered: true)
                    .paddingOnly(top: spacing_control, left: spacing_large, right: spacing_large),
                form.paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_large),
                text(context, keyString(context, "forgot_pswd"), fontSize: ts_medium, textColor: muvi_colorPrimary).paddingAll(spacing_standard_new).onTap(() {
                  onForgotPasswordClicked(context);
                }),
                signinButton.paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                Align(alignment: Alignment.center, child: text(context, keyString(context, "signin_with"), fontSize: ts_medium).paddingAll(spacing_standard_new)),
                loginWithGoogle..paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(spacing_standard_new),
            height: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(context, keyString(context, "not_have_account"), fontSize: ts_medium, textColor: muvi_textColorPrimary).paddingAll(spacing_control),
                  text(context, keyString(context, "register"), fontSize: ts_medium, fontFamily: font_medium, textColor: muvi_colorPrimary).paddingAll(spacing_control).onTap(() {
                    launchScreen(context, SignUpScreen.tag);
                  })
                ],
              ),
            ),
          ),
          Center(child: loadingWidgetMaker().visible(isLoading))
        ],
      ),
    );
  }

  onForgotPasswordClicked(context) {}

  doSignIn(context) {
    finish(context);
    launchScreen(context, HomeScreen.tag);
  }
}
