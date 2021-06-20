import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme10/models/T10Models.dart';
import 'package:prokit_flutter/theme10/utils/T10Colors.dart';
import 'package:prokit_flutter/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/theme10/utils/T10DataGenerator.dart';
import 'package:prokit_flutter/theme10/utils/T10Extension.dart';
import 'package:prokit_flutter/theme10/utils/T10Images.dart';
import 'package:prokit_flutter/theme10/utils/T10Strings.dart';
import 'package:prokit_flutter/theme10/utils/T10Widget.dart';

class T10Profile extends StatefulWidget {
  static String tag = '/T10Profile';

  @override
  T10ProfileState createState() => T10ProfileState();
}

class T10ProfileState extends State<T10Profile> {
  List<T10Images> mList;

  @override
  void initState() {
    super.initState();
    mList = getProfile();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t10_white);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: t10_white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_profile),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(spacing_middle),
                                bottomRight:
                                    Radius.circular(spacing_standard_new)),
                            child: CachedNetworkImage(
                              imageUrl: t10_profile,
                              fit: BoxFit.cover,
                              height: width * 0.35,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: spacing_standard_new,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(theme10_user_name,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeLargeMedium),
                              text(theme10_lbl_designer,
                                  textColor: t10_textColorSecondary),
                              SizedBox(
                                height: spacing_control,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: spacing_control),
                                        child: Icon(
                                          Icons.location_on,
                                          color: t10_textColorSecondary,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: theme10_lbl_address,
                                        style: TextStyle(
                                            fontSize: textSizeMedium,
                                            color: t10_textColorSecondary)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: spacing_standard,
                              ),
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text(theme10_lbl_150,
                                          fontFamily: fontMedium),
                                      text(theme10_lbl_design,
                                          textColor: t10_textColorSecondary),
                                    ],
                                  ),
                                  Container(
                                    height: width * 0.1,
                                    width: 0.5,
                                    color: t10_view_color,
                                    margin: EdgeInsets.only(
                                        left: spacing_standard_new,
                                        right: spacing_standard_new),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text(theme10_lbl_2K,
                                          fontFamily: fontMedium),
                                      text(theme10_lbl_followers,
                                          textColor: t10_textColorSecondary),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(theme10_about,
                              fontFamily: fontMedium,
                              fontSize: textSizeLargeMedium),
                          text(theme10_samplelong_text,
                              textColor: t10_textColorSecondary,
                              isLongText: true),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(theme10_photos,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeLargeMedium),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: theme10_view_all,
                                        style: TextStyle(
                                            fontSize: textSizeMedium,
                                            fontFamily: fontMedium,
                                            color: t10_textColorSecondary)),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: t10_textColorPrimary,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: mList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(spacing_middle)),
                                child: CachedNetworkImage(
                                  imageUrl: mList[index].img,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
