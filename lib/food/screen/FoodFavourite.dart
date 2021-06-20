import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

class FoodFavourite extends StatefulWidget {
  static String tag = '/FoodFavourite';

  @override
  FoodFavouriteState createState() => FoodFavouriteState();
}

class FoodFavouriteState extends State<FoodFavourite> {
  List<FoodDish> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = addFoodDishData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_app_background);
    return Scaffold(
      backgroundColor: food_app_background,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          TopBar(food_lbl_favourite),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(spacing_standard_new),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75),
                itemCount: mList1.length,
                itemBuilder: (context, index) {
                  return Favourite(mList1[index], index);
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Favourite extends StatelessWidget {
  FoodDish model;

  Favourite(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: boxDecoration(showShadow: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(spacing_middle),
              topLeft: Radius.circular(spacing_middle),
            ),
            child: CachedNetworkImage(
              imageUrl: model.image,
              height: width * 0.3,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(spacing_middle),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(
                  model.name,
                  fontFamily: fontMedium,
                  maxLine: 1,
                ),
                text(model.type,
                    textColor: food_textColorSecondary,
                    fontSize: textSizeSMedium),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(
                      model.price,
                    ),
                    Quantitybtn()
                  ],
                ),
//                Container(
//                    padding: const EdgeInsets.all(2.0),
//                    child: StepperTouch(
//                      initialValue: 0,
//                      direction: Axis.horizontal,
//                      buttonsColor: food_colorPrimary,
//counterColor:food_colorPrimary ,
//                      withSpring: false,
//                      onChanged: (int value) => print('new value $value'),
//                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
