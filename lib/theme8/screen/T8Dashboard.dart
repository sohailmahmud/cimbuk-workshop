import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/theme8/model/T8Models.dart';
import 'package:prokit_flutter/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/theme8/utils/T8DataGenerator.dart';
import 'package:prokit_flutter/theme8/utils/T8Extension.dart';
import 'package:prokit_flutter/theme8/utils/T8Images.dart';
import 'package:prokit_flutter/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/theme8/utils/T8Widget.dart';

class T8Dashboard extends StatefulWidget {
  static String tag = '/T8Dashboard';

  @override
  T8DashboardState createState() => T8DashboardState();
}

class T8DashboardState extends State<T8Dashboard> {
  List<T8QuizModel> mListings;
  var isSelected = 1;

  @override
  void initState() {
    super.initState();
    mListings = t8GetQuizData();
  }

  Widget t8Item(var pos, var icon, var title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.13,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              icon,
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.width * 0.05,
              color: isSelected == pos ? t8_colorPrimary : t8_icon_color,
            ),
            text(
              title,
              textColor: isSelected == pos ? t8_colorPrimary : t8_icon_color,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t8_app_background);
    return Scaffold(
      backgroundColor: t8_app_background,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  text(t8_lbl_hi_antonio,
                      fontFamily: fontBold, fontSize: textSizeXLarge),
                  text(t8_lbl_what_would_you_like_to_learn_n_today_search_below,
                      textColor: t8_textColorSecondary, isLongText: true),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    decoration: boxDecoration(
                        radius: 10, showShadow: true, bgColor: t8_white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: d8EditTextStyle(t8_lbl_search,
                                isPassword: false)),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: boxDecoration(
                              radius: 10,
                              showShadow: false,
                              bgColor: t8_colorPrimary),
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.search,
                            color: t8_white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(t8_lbl_new_quiz,
                            textAllCaps: true,
                            fontFamily: fontMedium,
                            fontSize: textSizeNormal),
                        text(
                          t8_lbl_view_all,
                          textColor: t8_textColorSecondary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.8,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mListings.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return t8Quiz(mListings[index], index);
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: t8_white,
          border: Border.all(
            color: t8_view_color,
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: t8_ShadowColor,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 3.0)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              t8Item(1, t8_ic_homes, "Home"),
              t8Item(2, t8_ic_quiz, "Quiz"),
              t8Item(3, t8_ic_user, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}

class t8Quiz extends StatelessWidget {
  T8QuizModel model;

  t8Quiz(T8QuizModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration:
          boxDecoration(radius: 16, showShadow: true, bgColor: t8_white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: model.quizImage,
                    height: w * 0.4,
                    width: MediaQuery.of(context).size.width * 0.75,
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.quizName,
                    fontSize: textSizeNormal,
                    isLongText: true,
                    fontFamily: fontMedium),
                SizedBox(
                  height: 8,
                ),
                text(model.totalQuiz, textColor: t8_textColorSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
