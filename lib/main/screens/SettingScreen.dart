import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class SettingScreen extends StatefulWidget {
  static String tag = '/SettingScreen';

  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: boldTextStyle(size: 22)),
        backgroundColor: appStore.appBarColor,
        leading: BackButton(
          color: appStore.textPrimaryColor,
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            settingItem(
              context,
              "Documentation",
              () async {
                launch(DocumentationUrl, forceWebView: true, enableJavaScript: true);
              },
              leading: Image.asset('images/app/ic_documentation.png', height: 24, width: 24, color: primaryColor),
            ),
            Divider(height: 0),
            settingItem(
              context,
              "Change Logs",
              () async {
                launch(ChangeLogsUrl, forceWebView: true, enableJavaScript: true);
              },
              leading: Image.asset('images/app/ic_change_log.png', height: 24, width: 24, color: primaryColor),
            ),
            Divider(height: 0),
            settingItem(
              context,
              "Share App",
              () async {
                await Share.share('Download $mainAppName from Play Store\n\n\n$PlayStoreUrl');
              },
              leading: Image.asset('images/app/ic_share.png', height: 24, width: 24, color: primaryColor),
            ),
            Divider(height: 0),
            settingItem(
              context,
              "Rate us",
              () {
                launch(PlayStoreUrl, forceWebView: true);
              },
              leading: Image.asset('images/app/ic_rate_app.png', height: 24, width: 24, color: primaryColor),
            ),
            Divider(height: 0),
            settingItem(
              context,
              "Dark Mode",
              () {
                appStore.setDarkMode(!appStore.isDarkModeOn);
                setState(() {});
              },
              leading: Image.asset('images/app/ic_theme.png', height: 24, width: 24, color: primaryColor),
              detail: Switch(
                value: appStore.isDarkModeOn,
                onChanged: (s) {
                  appStore.setDarkMode(s);
                  setState(() {});
                },
              ).withHeight(24),
            ),
            Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
