import 'package:flutter/material.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/smartDeck/Screens/SDLoginScreen.dart';
import 'package:prokit_flutter/smartDeck/Screens/SDVerificationScreen.dart';

class SDForgotPwdScreen extends StatefulWidget {
  @override
  _SDForgotPwdScreenState createState() => _SDForgotPwdScreenState();
}

class _SDForgotPwdScreenState extends State<SDForgotPwdScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: 100,
            left: 25,
            right: 25,
          ),
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Password reset',
                style: boldTextStyle(size: 25),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Enter email address to send reset code',
                style: secondaryTextStyle(
                    size: 16, textColor: sdTextSecondaryColor.withOpacity(0.7)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
                decoration: boxDecorations(
                  radius: 5,
                  showShadow: true,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email Address",
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 85,
              ),
              SDButton(
                textContent: "SEND",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SDLoginScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
