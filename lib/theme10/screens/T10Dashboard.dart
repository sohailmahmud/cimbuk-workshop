import 'package:cached_network_image/cached_network_image.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme10/models/T10Models.dart';
import 'package:prokit_flutter/theme10/utils/T10Colors.dart';
import 'package:prokit_flutter/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/theme10/utils/T10DataGenerator.dart';
import 'package:prokit_flutter/theme10/utils/T10Extension.dart';
import 'package:prokit_flutter/theme10/utils/T10SliderWidget.dart';
import 'package:prokit_flutter/theme10/utils/T10Strings.dart';
import 'package:prokit_flutter/theme10/utils/T10Widget.dart';

class T10Dashboard extends StatefulWidget {
  static String tag = '/T10Dashboard';

  @override
  T10DashboardState createState() => T10DashboardState();
}

class T10DashboardState extends State<T10Dashboard> {
  var currentIndexPage = 0;
  List<T10Images> mSliderList;
  List<T10Product> mDashboardList;

  @override
  void initState() {
    super.initState();
    mSliderList = getDashboard();
    mDashboardList = getDashboardProducts();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t10_white);
    var width = MediaQuery.of(context).size.width - 50;
    final Size cardSize = Size(width, width / 1.8);
    return Scaffold(
      backgroundColor: t10_white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_dashboard),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    T10CarouselSlider(
                      viewportFraction: 0.9,
                      height: cardSize.height,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      items: mSliderList.map((slider) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: cardSize.height,
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(12.0),
                                child: CachedNetworkImage(
                                  imageUrl: slider.img,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: cardSize.height,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      onPageChanged: (index) {
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DotsIndicator(
                        dotsCount: mSliderList.length,
                        position: currentIndexPage,
                        decorator: DotsDecorator(
                          size: const Size.square(5.0),
                          activeSize: const Size.square(8.0),
                          color: t10_view_color,
                          activeColor: t10_colorPrimary,
                        )),
                    SizedBox(
                      height: spacing_large,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: spacing_standard_new,
                          right: spacing_standard_new),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mDashboardList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(spacing_middle)),
                                child: CachedNetworkImage(
                                  imageUrl: mDashboardList[index].img,
                                  fit: BoxFit.cover,
                                  height: width * 0.5,
                                  width: width,
                                ),
                              ),
                              text(mDashboardList[index].name,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeLargeMedium),
                              Row(
                                children: <Widget>[
                                  text(
                                    mDashboardList[index].price,
                                  ),
                                  SizedBox(
                                    width: spacing_control,
                                  ),
                                  text(mDashboardList[index].subPrice,
                                      textColor: t10_textColorSecondary,
                                      lineThrough: true)
                                ],
                              )
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
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
