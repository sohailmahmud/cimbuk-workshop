import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/muvi/screens/flix_change_password.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_localizations.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_images.dart';

class AccountSettingsScreen extends StatefulWidget {
  static String tag = '/AccountSettingsScreen';

  @override
  AccountSettingsScreenState createState() => AccountSettingsScreenState();
}

class AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, keyString(context, "account_settings")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            subType(context, "change_password", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
            }, ic_password),
            subType(context, "video_quality", () {}, ic_video),
            subType(context, "download_settings", () {}, ic_download),
          ],
        ),
      ),
    );
  }
}
