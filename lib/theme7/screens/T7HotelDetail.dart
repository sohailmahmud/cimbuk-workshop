import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme7/utils/T7Extension.dart';
import 'package:prokit_flutter/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/theme7/utils/T7Images.dart';
import 'package:prokit_flutter/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/theme7/utils/T7Widget.dart';

class T7HotelDetail extends StatefulWidget {
  static String tag = '/T7HotelDetail';

  @override
  T7HotelDetailState createState() => T7HotelDetailState();
}

class T7HotelDetailState extends State<T7HotelDetail> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 1.5,
            child: CachedNetworkImage(
              imageUrl: t7_ic_hotel_room,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 35, left: 16),
                  child: backIcon(t7white, Icons.keyboard_arrow_left,
                      t7textColorSecondary)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      starText("4", t7white),
                      starText("24+", t7white),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.2),
            child: Container(
              height: MediaQuery.of(context).size.height - 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: t7white),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 3),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(t7_per_night, fontFamily: fontMedium),
                        text("\$120")
                      ],
                    ),
                    divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(t7_4_5_5_good, fontFamily: fontMedium),
                        text(t7_1298_reviews, textColor: t7textColorSecondary)
                      ],
                    ),
                    divider(),
                    text(t7_hotel_information, fontFamily: fontMedium),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        richText(t7_breakfast, t7_ic_breakfast),
                        richText(t7_parking, t7_ic_parking),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        richText(t7_security, t7_ic_security),
                        richText(t7_dining, t7_ic_dining),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        richText(t7_free_wifi, t7_ic_wifi),
                        richText(t7_pets, t7_ic_pet),
                      ],
                    ),
                    divider(),
                    text(t7_description,
                        textColor: t7textColorSecondary, isLongText: true),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: T7Button(
                        bgColor: t7colorPrimary,
                        textContent: t7_select_rorm,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget richText(var text, var icon) {
  return Expanded(
    child: RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
                icon,
                color: t7colorPrimary,
                width: 16,
                height: 16,
              ),
            ),
          ),
          TextSpan(
              text: text,
              style: TextStyle(
                  fontSize: textSizeSMedium, color: t7textColorPrimary)),
        ],
      ),
    ),
  );
}
