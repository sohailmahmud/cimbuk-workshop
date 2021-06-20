import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/theme7/utils/T7Extension.dart';
import 'package:prokit_flutter/theme7/utils/T7Images.dart';
import 'package:prokit_flutter/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/theme7/utils/T7Widget.dart';

class T7HotelBooking extends StatefulWidget {
  static String tag = '/T7HotelBooking';

  @override
  T7HotelBookingState createState() => T7HotelBookingState();
}

class T7HotelBookingState extends State<T7HotelBooking> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.8);
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 1.5,
            child: CachedNetworkImage(
              imageUrl: t7_ic_thailand_beach,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 35, left: 16),
                  child: backIcon(t7white, Icons.keyboard_arrow_left,
                      t7textColorSecondary)),
              text(t7_hotel_booking,
                  textColor: t7white,
                  fontFamily: fontMedium,
                  fontSize: textSizeXLarge),
              SizedBox(
                height: 6,
              ),
              text(
                t7_hotel_booking_info,
                textColor: t7white,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
          SingleChildScrollView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.2),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: t7white),
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height - 80,
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 3),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(t7_destination, textAllCaps: true),
                              t7EditTextStyle(t7_enter_your_destinations),
                            ],
                          ),
                        ),
                        Divider(
                          color: t7view_color,
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 16, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(t7_select_Date, textAllCaps: true),
                              t7EditTextStyle(t7_enter_date),
                            ],
                          ),
                        ),
                        Divider(
                          color: t7view_color,
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 16, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(t7_rooms_and_guest, textAllCaps: true),
                              t7EditTextStyle(t7_enter_rooms_and_guest),
                            ],
                          ),
                        ),
                        divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: T7Button(
                              onPressed: () {},
                              bgColor: t7view_color,
                              textContent: t7_search_hotels,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Container t7EditTextStyle(var hintText) {
  return Container(
    child: TextFormField(
      style: TextStyle(
          fontSize: textSizeMedium,
          fontFamily: fontRegular,
          color: t7textColorSecondary),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 8, 4, 20),
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: t7white, width: 0.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: t7white, width: 0.0),
        ),
      ),
    ),
  );
}
