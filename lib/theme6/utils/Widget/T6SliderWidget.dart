import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme6/models/T6Models.dart';
import 'package:prokit_flutter/theme6/utils/T6SliderWidget.dart';

import '../T6Colors.dart';
import '../T6Constant.dart';
import '../T6Widget.dart';

// ignore: must_be_immutable
class T6SliderWidget extends StatelessWidget {
  List<T6Slider> mSliderList;

  T6SliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.47);

    return T6CarouselSlider(
      viewportFraction: 0.9,
      height: 280,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration:
                  boxDecoration(radius: 16, showShadow: true, bgColor: t6white),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: slider.Image,
                        height: 180,
                        width: width,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(slider.name,
                                textColor: t6textColorPrimary,
                                fontSize: textSizeLargeMedium,
                                fontFamily: fontMedium),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Icon(
                                        Icons.access_time,
                                        color: t6icon_color,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                      text: slider.duration,
                                      style: TextStyle(
                                          fontSize: textSizeSMedium,
                                          color: t6textColorSecondary)),
                                ],
                              ),
                            )
                          ],
                        ),
                        text(slider.info),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
