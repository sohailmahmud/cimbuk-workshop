import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/theme7/utils/T7Widget.dart';

class T7BottomSheet extends StatefulWidget {
  static String tag = '/T7BottomSheet';

  @override
  T7BottomSheetState createState() => T7BottomSheetState();
}

class T7BottomSheetState extends State<T7BottomSheet> {
  GlobalKey<ScaffoldState> _scaffoldKey = null;

  @override
  Widget build(BuildContext context) {
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    Future.delayed(const Duration(milliseconds: 1000), () {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 10,
                  decoration: boxDecoration(color: t7view_color, radius: 16, bgColor: t7view_color),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: t7white),
                    height: MediaQuery.of(context).size.width * 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(t7_beggar_fee_information, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                          SizedBox(
                            height: 8,
                          ),
                          text(t7_sample_long_text, isLongText: true, textColor: t7textColorSecondary),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(t7_airline),
                              text(t7_emirates_airlines, textColor: t7textColorSecondary),
                            ],
                          ),
                          divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(t7_carry_on_bag),
                              text(t7_fee_free_up_to_15_kg, textColor: t7textColorSecondary),
                            ],
                          ),
                          divider(),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: T7Button(
                                textContent: t7_got_it,
                                onPressed: () {},
                                bgColor: t7view_color,
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          });
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[],
      ),
    );
  }
}
