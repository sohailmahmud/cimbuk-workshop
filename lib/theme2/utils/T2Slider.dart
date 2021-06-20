import 'package:cached_network_image/cached_network_image.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme2/models/models.dart';

import 'T2Colors.dart';
import 'T2Constant.dart';
import 'T2DataGenerator.dart';
import 'T2SliderWidget.dart';
import 'T2Widgets.dart';

class T2SliderWidget extends StatefulWidget {
  static String tag = '/T2Slider';

  @override
  T2SliderWidgetState createState() => T2SliderWidgetState();
}

class T2SliderWidgetState extends State<T2SliderWidget> {
  var currentIndexPage = 0;
  List<T2Slider> mSliderList;

  @override
  void initState() {
    super.initState();
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.8);
    return Column(
      children: <Widget>[
        T2CarouselSlider(
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
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          imageUrl: slider.image,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          height: cardSize.height,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            text(slider.title,
                                textColor: t2_white,
                                fontSize: textSizeNormal,
                                fontFamily: fontSemibold),
                            SizedBox(height: 16),
                            text(slider.subTitle,
                                textColor: t2_white,
                                fontSize: textSizeMedium,
                                maxLine: 2,
                                isCentered: true),
                          ],
                        ),
                      )
                    ],
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
              color: t2_view_color,
              activeColor: t2_colorPrimary,
            ))
      ],
    );
  }
}
