import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/social/utils/SocialColors.dart';
import 'package:prokit_flutter/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/social/utils/SocialExtension.dart';
import 'package:prokit_flutter/social/utils/SocialImages.dart';
import 'package:prokit_flutter/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/social/utils/SocialWidget.dart';

import 'SocialSignIn.dart';

class SocialWalkThrough extends StatefulWidget {
  static String tag = '/SocialWalkThrough';

  @override
  SocialWalkThroughState createState() => SocialWalkThroughState();
}

class SocialWalkThroughState extends State<SocialWalkThrough> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(social_lbl_welcome_to_inmood,
                      fontFamily: fontBold, fontSize: textSizeLarge),
                  SizedBox(height: spacing_xxLarge),
                  CachedNetworkImage(
                      imageUrl: social_walk, height: width * 0.5),
                  SizedBox(height: spacing_xxLarge),
                  Container(
                    margin: EdgeInsets.only(
                        left: spacing_standard_new,
                        right: spacing_standard_new),
                    child: text(social_welcome_info,
                        isLongText: true,
                        textColor: social_textColorSecondary,
                        isCentered: true),
                  ),
                  SizedBox(height: spacing_xxLarge),
                  Container(
                    margin: EdgeInsets.only(
                        left: spacing_standard_new,
                        right: spacing_standard_new),
                    child: SocialAppButton(
                      onPressed: () {
                        launchScreen(context, SocialSignIn.tag);
                      },
                      textContent: social_lbl_agree_continue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
