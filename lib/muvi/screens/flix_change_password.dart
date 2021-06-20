import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/muvi/screens/flix_home_screen.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_localizations.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/muvi/utils/flix_widget_extensions.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_size.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String tag = '/ChangePasswordScreen';

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  FocusNode passFocus = FocusNode();
  FocusNode newPassFocus = FocusNode();
  FocusNode newConfirmPassFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String password;
  String newPassword;
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
            "hint_old_password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value.isEmpty ? keyString(context, "error_pwd_requires") : null;
            },
            focusNode: passFocus,
            nextFocus: newPassFocus,
            onSaved: (String value) {
              password = value;
            },
            textInputAction: TextInputAction.next,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "hint_new_password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value.isEmpty ? keyString(context, "error_pwd_requires") : null;
            },
            focusNode: newPassFocus,
            nextFocus: newConfirmPassFocus,
            onSaved: (String value) {
              newPassword = value;
            },
            textInputAction: TextInputAction.next,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "hint_new_confirm_password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value.isEmpty ? keyString(context, "error_pwd_requires") : null;
            },
            focusNode: newConfirmPassFocus,
            onSaved: (String value) {
              newPassword = value;
            },
            textInputAction: TextInputAction.done,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          ).paddingBottom(spacing_standard_new),
        ],
      ),
    );
    var signinButton = SizedBox(
      width: double.infinity,
      child: button(context, keyString(context, "save"), () {
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

    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, keyString(context, "change_password"), darkBackground: false),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                form.paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_large).paddingBottom(spacing_standard_new),
                signinButton.paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
              ],
            ),
          ),
          Center(child: loadingWidgetMaker().visible(isLoading))
        ],
      ),
    );
  }

  onForgotPasswordClicked(context) {}

  doSignIn(context) {
    launchScreen(context, HomeScreen.tag);
  }
}
