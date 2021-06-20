import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import '../utils/FoodColors.dart';

class FoodOrder extends StatefulWidget {
  static String tag = '/FoodOrder';

  @override
  FoodOrderState createState() => FoodOrderState();
}

class FoodOrderState extends State<FoodOrder> {
  List<FoodDish> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = orderData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);

    return Scaffold(
      backgroundColor: food_white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(food_lbl_orders),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Order(mList2[index], index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Order extends StatelessWidget {
  FoodDish model;

  Order(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          bottom: spacing_standard_new,
          left: spacing_standard_new,
          right: spacing_standard_new),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(model.image),
                ),
                SizedBox(width: spacing_middle),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(model.name, fontFamily: fontMedium),
                      text(model.price),
                      //text("sd",textColor: food_textColorSecondary),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
