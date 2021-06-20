import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/theme5/screens/T5SetFingerPrint.dart';
import 'package:prokit_flutter/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/theme5/utils/T5Extension.dart';
import 'package:prokit_flutter/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/theme5/utils/T5Widget.dart';

class T5SetPassword extends StatefulWidget {
  static String tag = '/T5SetPassword';

  @override
  T5SetPasswordState createState() => T5SetPasswordState();
}

class T5SetPasswordState extends State<T5SetPassword> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            height: height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                    imageUrl: t5_ragistration,
                    width: width / 2.5,
                    height: width / 2.5),
                SizedBox(height: 30),
                text(t5_lbl_set_pawd,
                    textColor: t5TextColorPrimary,
                    fontFamily: fontBold,
                    fontSize: 22.0),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.all(24),
                  decoration: boxDecoration(
                      bgColor: t5White, showShadow: true, radius: 4),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 10),
                      EditText(hint: t5_hint_password, isSecure: true),
                      SizedBox(
                        height: 16,
                      ),
                      EditText(hint: t5_hint_confirm_password, isSecure: true),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          launchScreen(context, T5SetFingerPrint.tag);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: width / 8,
                          child: text(t5_continue,
                              textColor: t5White, isCentered: true),
                          decoration: boxDecoration(
                              bgColor: t5ColorPrimary, radius: 24),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        TopBar()
      ],
    ));
  }
}
