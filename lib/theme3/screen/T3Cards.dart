import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/theme3/screen/T3Listing.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3Cards extends StatefulWidget {
  static var tag = "/T3Cards";

  @override
  T3CardsState createState() => T3CardsState();
}

class T3CardsState extends State<T3Cards> {
  List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t3_app_background);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: t3_app_background,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: t3_textColorPrimary,
                    onPressed: () {
                      back(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Center(
                      child: text("Cards", fontFamily: fontBold, textColor: t3_textColorPrimary, fontSize: 22.0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T3List(mListings[index], index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
