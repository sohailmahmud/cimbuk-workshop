import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme5/model/T5Models.dart';
import 'package:prokit_flutter/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/theme5/utils/T5Widget.dart';
import 'package:prokit_flutter/theme5/utils/widgets/T5SliderWidget.dart';

import '../T5Colors.dart';
import '../T5Constant.dart';

class T5SliderWidget extends StatelessWidget {
  List<T5Slider> mSliderList;

  T5SliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.8);
    return T5CarouselSlider(
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
                  CachedNetworkImage(
                    imageUrl: slider.image,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: cardSize.height,
                  ),
                  Padding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(
                            t5_avl_balance,
                            textColor: t5White,
                            fontSize: textSizeMedium,
                          ),
                          text(slider.balance,
                              textColor: t5White,
                              fontSize: textSizeLarge,
                              fontFamily: fontBold)
                        ],
                      ),
                      padding: EdgeInsets.all(14)),
                  Container(
                    padding: EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(
                                t5_account_number,
                                textColor: t5White,
                                fontSize: textSizeMedium,
                              ),
                              text(slider.accountNo,
                                  textColor: t5White, fontSize: textSizeNormal)
                            ],
                          ),
                        ),
                        text("VISA",
                            textColor: t5White,
                            fontSize: textSizeLarge,
                            fontFamily: fontBold)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
