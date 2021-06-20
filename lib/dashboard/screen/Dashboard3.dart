import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/model/db3/Db3Model.dart';
import 'package:prokit_flutter/dashboard/utils/Db3Widget.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';
import 'package:prokit_flutter/dashboard/utils/DbConstant.dart';
import 'package:prokit_flutter/dashboard/utils/DbDataGenerator.dart';
import 'package:prokit_flutter/dashboard/utils/DbExtension.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';
import 'package:prokit_flutter/dashboard/utils/DbStrings.dart';

class Dashboard3 extends StatefulWidget {
  static String tag = '/Dashboard3';

  @override
  Dashboard3State createState() => Dashboard3State();
}

class Dashboard3State extends State<Dashboard3> {
  List<Db3FurnitureModel> mList1;
  List<Db3FurnitureModel> mList2;
  List<Db3FurnitureModel> mList3;

  @override
  void initState() {
    super.initState();
    mList1 = db3FurnitureItems();
    mList2 = db3FurnitureItems();
    mList3 = db3SellerItems();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    double expandHeight = MediaQuery.of(context).size.height * 0.33;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandHeight,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: innerBoxIsScrolled ? db3_white : db3_white,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                height: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
//                          IconButton(
//                            icon: Icon(Icons.menu, color: db3_textColorPrimary,),
//                            onPressed: () {
//                              finish(context);
//                            },
//                          ),
                          text(db3_lbl_home, textColor: db3_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontBold),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: db3_textColorPrimary,
                            ),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: db3_textColorPrimary,
                            ),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                height: expandHeight,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: PageView(
                        children: <Widget>[
                          Db3Slider(
                            img: db3_ic_sofa,
                            heading: "Make yourself \nat home",
                            subheading: "We love clean design and natural \nfurniture solutions",
                          ),
                          Db3Slider(
                            img: db3_ic_sofa2,
                            heading: "Make yourself \nat home",
                            subheading: "We love clean design and natural \nfurniture solutions",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              db3Label(db3_lbl_new_arrivals),
              SizedBox(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Db3Product(mList1[index], index);
                    }),
              ),
              db3Label(db3_lbl_top_trends),
              SizedBox(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Db3Product(mList2[index], index);
                    }),
              ),
              db3Label(db3_lbl_top_sellers),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList3.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Db3Seller(mList3[index], index);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Db3Slider extends StatelessWidget {
  final String img, heading, subheading;

  Db3Slider({Key key, @required this.img, @required this.heading, @required this.subheading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(width: MediaQuery.of(context).size.width, child: Image.asset(img, fit: BoxFit.cover)),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(heading, textColor: db3_white, fontSize: textSizeLarge, fontFamily: fontBold, maxLine: 2),
                SizedBox(
                  height: 4,
                ),
                text(subheading, textColor: db3_white, fontFamily: fontMedium, isLongText: true),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Db3Product extends StatelessWidget {
  Db3FurnitureModel model;

  Db3Product(Db3FurnitureModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: Image.asset(
              model.img,
              fit: BoxFit.cover,
              height: 160,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(model.name, fontFamily: fontMedium),
                text(model.price, textColor: db3_textColorSecondary),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Db3Seller extends StatelessWidget {
  Db3FurnitureModel model;

  Db3Seller(Db3FurnitureModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: Image.asset(
              model.img,
              fit: BoxFit.fill,
              height: 80,
              width: 80,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text(model.name, fontFamily: fontMedium),
              SizedBox(
                height: 6,
              ),
              text(model.price, textColor: db1_textColorSecondary, fontSize: textSizeSMedium),
              Divider(
                height: 0.5,
                color: db3_textColorSecondary,
              )
            ],
          )
        ],
      ),
    );
  }
}
