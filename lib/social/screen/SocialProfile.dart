import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/social/utils/SocialColors.dart';
import 'package:prokit_flutter/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/social/utils/SocialExtension.dart';
import 'package:prokit_flutter/social/utils/SocialImages.dart';
import 'package:prokit_flutter/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/social/utils/SocialWidget.dart';

import 'SocialProfileInfo.dart';

class SocialProfile extends StatefulWidget {
  static String tag = '/SocialProfile';

  @override
  SocialProfileState createState() => SocialProfileState();
}

class SocialProfileState extends State<SocialProfile> {
  Widget mOption(var value, var icon, {var tag}) {
    return GestureDetector(
      onTap: () {
        launchScreen(context, tag);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.fromLTRB(spacing_standard, 16, spacing_standard, 16),
        decoration: boxDecoration(showShadow: false, color: social_view_color),
        child: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    icon,
                    color: social_textColorPrimary,
                    size: 18,
                  ),
                ),
              ),
              TextSpan(
                  text: value,
                  style: TextStyle(
                    color: social_textColorPrimary,
                    fontSize: textSizeMedium,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget mProfile() {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
          child: CachedNetworkImage(
            imageUrl: social_ic_user1,
            height: width * 0.25,
            width: width * 0.25,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: width * 0.075,
          padding: EdgeInsets.all(
            width * 0.01,
          ),
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(spacing_middle)),
              color: social_colorPrimary),
          child: Icon(
            Icons.camera,
            color: social_white,
            size: 16,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      floatingActionButton: Container(
        width: width * 0.2,
        height: width * 0.2,
        alignment: Alignment.bottomRight,
        child: Image.asset(
          social_fab_edit,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, social_lbl_account),
            Expanded(
              child: SingleChildScrollView(
                  child: Container(
                margin: EdgeInsets.all(spacing_standard_new),
                child: Column(
                  children: <Widget>[
                    mProfile(),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    mOption(social_name, Icons.person_outline,
                        tag: SocialProfileInfo.tag),
                    text(
                        social_info_this_is_not_your_username_or_pin_this_name_be_visible_to_your_whatsapp_contacts,
                        textColor: social_textColorSecondary,
                        isLongText: true),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    mOption(social_setting_lbl_, Icons.help_outline),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    mOption(social_phone, Icons.call),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    mOption(social_email, Icons.alternate_email),
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
