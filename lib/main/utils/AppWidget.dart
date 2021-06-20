import 'dart:developer' as developer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/AppMoel.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/screens/ProkitScreenListing.dart';
import 'package:prokit_flutter/muvi/utils/flix_constants.dart';

import '../../main.dart';
import 'AppColors.dart';
import 'AppConstant.dart';
import 'AppImages.dart';
import 'AppStrings.dart';

Text headerText(var text) {
  return Text(
    text,
    maxLines: 2,
    style: TextStyle(fontFamily: fontBold, fontSize: 22, color: appStore.textPrimaryColor),
  );
}

Text subHeadingText(var text) {
  return Text(
    text,
    style: TextStyle(fontFamily: fontBold, fontSize: 17.5, color: appTextColorSecondary),
  );
}

Widget text(var text, {var fontSize = textSizeLargeMedium, textColor = appTextColorSecondary, var fontFamily = fontRegular, var isCentered = false, var maxLine = 1, var latterSpacing = 0.5}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: textColor, height: 1.5, letterSpacing: latterSpacing));
}

changeStatusColor(Color color) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }
}

showToast(BuildContext aContext, String caption) {
  Scaffold.of(aContext).showSnackBar(SnackBar(content: text(caption, textColor: appWhite, isCentered: true)));
}

launchScreen(context, String tag, {Object arguments}) {
  if (arguments == null) {
    Navigator.pushNamed(context, tag);
  } else {
    Navigator.pushNamed(context, tag, arguments: arguments);
  }
}

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color bgColor = appWhite, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? [BoxShadow(color: shadowColorGlobal, blurRadius: 5, spreadRadius: 1)] : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

class ThemeList extends StatefulWidget {
  List<ProTheme> list;
  BuildContext mContext;

  ThemeList(this.list, this.mContext);

  @override
  ThemeListState createState() => ThemeListState();
}

class ThemeListState extends State<ThemeList> {
  List<Color> colors = [appCat1, appCat2, appCat3];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return AnimationLimiter(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.list.length,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: height * 0.5,
              child: GestureDetector(
                onTap: () {
                  if (widget.list[index].sub_kits == null || widget.list[index].sub_kits.isEmpty) {
                    if (widget.list[index].tag.isNotEmpty) {
                      developer.log('Tag', name: widget.list[index].tag);
                      launchScreen(context, widget.list[index].tag);
                    } else {
                      showToast(widget.mContext, appComingSoon);
                    }
                  } else {
                    launchScreen(context, ProkitScreenListing.tag, arguments: widget.list[index]);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width / 6,
                        height: 80,
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.all(width / 25),
                        child: Image.asset(icons[index], color: appWhite),
                        decoration: boxDecoration(bgColor: colors[index % colors.length], radius: 4),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            Container(
                              width: width,
                              height: 80,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              margin: EdgeInsets.only(right: width / 28),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      text('${widget.list[index].name}', textColor: appStore.textPrimaryColor, fontFamily: fontMedium, fontSize: textSizeMedium, maxLine: 2),
                                      text(widget.list[index].title_name.validate(), textColor: appStore.textSecondaryColor, fontFamily: fontRegular, fontSize: textSizeSmall)
                                          .visible(widget.list[index].title_name.validate().isNotEmpty),
                                    ],
                                  ).expand(),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    decoration: widget.list[index].type.isNotEmpty ? boxDecoration(bgColor: appDarkRed, radius: 4) : BoxDecoration(),
                                    child: text(widget.list[index].type, fontSize: textSizeSmall, textColor: whiteColor),
                                  )
                                ],
                              ),
                              decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 4, showShadow: true),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.keyboard_arrow_right, color: appWhite),
                              decoration: BoxDecoration(color: colors[index % colors.length], shape: BoxShape.circle),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget commonCacheImageWidget(String url, double height, double width, {BoxFit fit}) {
  return CachedNetworkImage(
    imageUrl: '$mBaseUrl$url',
    height: height,
    width: width,
    fit: fit,
  );
}

Widget settingItem(context, String text, Function onTap, {Widget detail, Widget leading}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              leading ?? SizedBox(),
              leading != null ? 10.width : SizedBox(),
              Text(text, style: primaryTextStyle(size: 18)),
            ],
          ),
          detail ?? Icon(Icons.arrow_forward_ios, size: 16, color: textSecondaryColor),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

Widget appBar(BuildContext context, String title, {List<Widget> actions, bool showBack = true}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: appStore.appBarColor,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.arrow_back),
          )
        : null,
    title: Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: appStore.appBarColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: boldTextStyle(color: appStore.textPrimaryColor, size: 20),
              maxLines: 1,
            ),
          ),
        ],
      ),
    ),
    actions: actions,
  );
}

class ExampleItemWidget extends StatelessWidget {
  final ListModel tabBarType;
  Function onTap;
  bool showTrailing;

  ExampleItemWidget(this.tabBarType, {@required this.onTap, this.showTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appStore.appBarColor,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 2.0,
      shadowColor: Colors.black,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(tabBarType.name, style: boldTextStyle()),
        trailing: showTrailing ? Icon(Icons.arrow_forward_ios, size: 15, color: appStore.textPrimaryColor) : null,
      ),
    );
  }
}

String convertDate(date) {
  try {
    return date != null ? DateFormat(dateFormat).format(DateTime.parse(date)) : '';
  } catch (e) {
    print(e);
    return '';
  }
}

class CustomTheme extends StatelessWidget {
  Widget child;

  CustomTheme({this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkModeOn
          ? ThemeData.dark().copyWith(
              accentColor: appColorPrimary,
              backgroundColor: appStore.scaffoldBackground,
            )
          : ThemeData.light(),
      child: child,
    );
  }
}

Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg');
