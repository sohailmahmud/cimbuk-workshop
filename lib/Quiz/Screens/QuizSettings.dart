import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/Quiz/Screens/QuizChangePassword.dart';
import 'package:prokit_flutter/Quiz/Screens/QuizContactUs.dart';
import 'package:prokit_flutter/Quiz/Screens/QuizEditProfile.dart';
import 'package:prokit_flutter/Quiz/Screens/QuizHelpCenter.dart';
import 'package:prokit_flutter/Quiz/Screens/QuizUpdateEmail.dart';
import 'package:prokit_flutter/Quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/Quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/Quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/Quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/dashboard/utils/DbExtension.dart';

class QuizSettings extends StatefulWidget {
  static String tag = '/QuizSetting';

  @override
  _QuizSettingsState createState() => _QuizSettingsState();
}

class _QuizSettingsState extends State<QuizSettings> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);
    return Scaffold(
      backgroundColor: quiz_app_background,
      appBar: AppBar(
        title: text(quiz_lbl_setting, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        leading: Icon(
          Icons.arrow_back,
          color: quiz_colorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        backgroundColor: quiz_app_background,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 8),
                    Container(
                      decoration: boxDecoration(bgColor: quiz_white, radius: 8, showShadow: true),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          quizSettingOptionPattern1(Icons.person, quiz_lbl_edit_profile, quiz_username).onTap(() {
                            setState(() {
                              launchScreen(context, QuizEditProfile.tag);
                            });
                          }),
                          quizSettingOptionPattern1(Icons.email, quiz_lbl_email, quiz_email).onTap(() {
                            setState(() {
                              launchScreen(context, QuizUpdateEmail.tag);
                            });
                          }),
                          quizSettingOptionPattern1(Icons.vpn_key, quiz_lbl_password, quiz_sub_info_password).onTap(() {
                            setState(() {
                              launchScreen(context, QuizChangePassword.tag);
                            });
                          }),
                        ],
                      ),
                    ),
                    Container(
                      decoration: boxDecoration(bgColor: quiz_white, radius: 8, showShadow: true),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          quizSettingOptionPattern2(Icons.star, quiz_lbl_scoreboard),
                          quizSettingOptionPattern2(Icons.add_box, quiz_lbl_new_course),
                          quizSettingOptionPattern2(Icons.notifications, quiz_lbl_study_reminder),
                        ],
                      ),
                    ),
                    Container(
                      decoration: boxDecoration(bgColor: quiz_white, radius: 8, showShadow: true),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          quizSettingOptionPattern3(Icons.help, quiz_lbl_help).onTap(() {
                            setState(() {
                              launchScreen(context, QuizHelpCenter.tag);
                            });
                          }),
                          quizSettingOptionPattern3(Icons.security, quiz_lbl_privacy),
                          quizSettingOptionPattern3(Icons.chat_bubble, quiz_lbl_contact_us).onTap(() {
                            setState(() {
                              launchScreen(context, QuizContactUs.tag);
                            });
                          }),
                        ],
                      ),
                    ),
                    text(quiz_lbl_logout, textColor: quiz_colorPrimary, fontSize: textSizeLargeMedium, textAllCaps: true, fontFamily: fontBold).paddingAll(16).onTap(() {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget quizSettingOptionPattern1(var settingIcon, var heading, var info) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: quiz_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(
                settingIcon,
                color: quiz_white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[text(heading), text(info, textColor: quiz_textColorSecondary, fontSize: textSizeSMedium)],
            ),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: quiz_icon_color,
        )
      ],
    ),
  );
}

Widget quizSettingOptionPattern2(var icon, var heading) {
  bool isSwitched1 = false;

  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: quiz_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(
                icon,
                color: quiz_white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            text(heading),
          ],
        ),
        Switch(
          value: isSwitched1,
          onChanged: (value) {
            // setState(() {
            isSwitched1 = value;
            //  });
          },
          activeTrackColor: quiz_colorPrimary,
          activeColor: quiz_view_color,
        )
      ],
    ),
  );
}

Widget quizSettingOptionPattern3(var icon, var heading) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: quiz_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(
                icon,
                color: quiz_white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            text(heading),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: quiz_icon_color,
        )
      ],
    ),
  );
}
