import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/theme1/utils/T1Extension.dart';
import 'package:prokit_flutter/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/theme1/utils/T1Widget.dart';

class T1Dashboard extends StatefulWidget {
  static var tag = "/T1Dashboard";

  @override
  State<StatefulWidget> createState() {
    return T1DashboardState();
  }
}

class T1DashboardState extends State<T1Dashboard> {
  var isSelected = 1;
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    changeStatusColor(Colors.white);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: t1_white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 80),
            physics: ScrollPhysics(),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.55,
                    child: PageView(
                      children: <Widget>[
                        Slider(file: t1_slider1),
                        Slider(file: t1_slider2),
                        Slider(file: t1_slider3),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          text(t1_lbl_media,
                              textColor: t1TextColorPrimary,
                              fontSize: textSizeNormal,
                              fontFamily: fontBold),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                mediaButton(t1_lbl_document, t1_file),
                                mediaButton(t1_lbl_video, t1_video),
                                mediaButton(t1_lbl_photos, t1_images)
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          text(t1_lbl_send_file,
                              textColor: t1TextColorPrimary,
                              fontSize: textSizeNormal,
                              fontFamily: fontBold),
                          SizedBox(height: 16),
                          Container(
                            alignment: Alignment.center,
                            child: Stack(
                              children: <Widget>[
                                Image.asset(t1_ic_home_image,
                                    width: width / 2, height: width / 2.7),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: t1_color_primary_light),
                                  width: width / 3.5,
                                  height: width / 3.5,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: width / 30),
                                  padding: EdgeInsets.all(width / 18),
                                  child: text(t1_lbl_send_files,
                                      textColor: t1_colorPrimary,
                                      fontSize: textSizeNormal,
                                      maxLine: 2),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: height * 0.1,
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              color: t1_white,
              padding: EdgeInsets.only(left: 14),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(t1_menu, width: 25, height: 25),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Center(
                      child: headerText(t1_lbl_home),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 60,
                  decoration: BoxDecoration(
                    color: t1_white,
                    boxShadow: [
                      BoxShadow(
                          color: shadow_color,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 3.0))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        tabItem(1, t1_home),
                        tabItem(2, t1_notification),
                        Container(
                          width: 45,
                          height: 45,
                        ),
                        tabItem(3, t1_settings),
                        tabItem(4, t1_user)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  child: FloatingActionButton(
                    backgroundColor: t1_colorPrimary,
                    onPressed: () {},
                    child: Icon(
                      Icons.mic,
                      color: t1_white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tabItem(var pos, var icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: isSelected == pos
            ? BoxDecoration(
                shape: BoxShape.circle, color: t1_colorPrimary_light)
            : BoxDecoration(),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          color: isSelected == pos ? t1_colorPrimary : t1_textColorSecondary,
        ),
      ),
    );
  }

  Widget mediaButton(String buttonText, String icon) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: t1_color_primary_light),
          width: width / 5.5,
          height: width / 5.5,
          padding: EdgeInsets.all(width / 18),
          child: SvgPicture.asset(
            icon,
            color: t1_colorPrimary,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        text(buttonText,
            textColor: t1TextColorPrimary,
            fontSize: textSizeMedium,
            fontFamily: fontMedium)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key key, @required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: CachedNetworkImage(
          imageUrl: file,
          fit: BoxFit.fill,
        ), /*Image.asset(file, fit: BoxFit.fill),*/
      ),
    );
  }
}

/*
Container(
child: Column(children: <Widget>[
SizedBox(height: 50),
Container(
margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
child: Column(
children: <Widget>[
rowHeading("Media"),
SizedBox(height: 16),
Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
new Container(
decoration: new BoxDecoration(
color: t1_colorPrimary_light,
shape: BoxShape.circle,
),
child: Icon(
Icons.insert_drive_file,
color: t1_colorPrimary,
size: 40,
),
padding: EdgeInsets.all(25),
),
new Container(
decoration: new BoxDecoration(
color: t1_colorPrimary_light,
shape: BoxShape.circle,
),
child: Icon(Icons.videocam,
color: t1_colorPrimary, size: 40),
padding: EdgeInsets.all(25),
),
new Container(
decoration: new BoxDecoration(
color: t1_colorPrimary_light,
shape: BoxShape.circle,
),
child:
Icon(Icons.image, color: t1_colorPrimary, size: 40),
padding: EdgeInsets.all(25),
),
],
),
//              SizedBox(height: 30),
//              rowHeading("Send Media"),
//              Container(
//                margin: new EdgeInsets.symmetric(horizontal: 16.0),
//                alignment: FractionalOffset.center,
//                child: Stack(
//                  children: <Widget>[
//                    Image.asset(
//                      'img/theme1_ic_home_image.png',
//                      height: 300,
//                      width: 300,
//                    ),
//                  ],
//                ),
//              ),
],
))
]))*/
