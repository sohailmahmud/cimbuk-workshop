import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/grocery/utils/GroceryExtension.dart';
import 'package:prokit_flutter/grocery/utils/GroceryWidget.dart';

import 'GroceryWriteReview.dart';

class GroceryReviews extends StatefulWidget {
  static String tag = '/GroceryReviews';

  @override
  GroceryReviewsState createState() => GroceryReviewsState();
}

class GroceryReviewsState extends State<GroceryReviews> {
  List<ReviewModel> mList;

  @override
  void initState() {
    super.initState();
    mList = reviewsItem();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_colorPrimary);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.25),
        child: TopBar(Icons.arrow_back, grocery_title_review, Icons.edit, () {
          callNext(GroceryWriteReview(), context);
        }),
      ),
      body: SafeArea(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Review(mList[index], index);
            }),
      ),
    );
  }
}

class Review extends StatelessWidget {
  ReviewModel model;

  Review(ReviewModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(showShadow: true),
      padding: EdgeInsets.all(spacing_middle),
      margin: EdgeInsets.only(
          left: spacing_standard_new,
          right: spacing_standard_new,
          top: spacing_standard_new),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(model.img),
          ),
          SizedBox(
            width: spacing_standard_new,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.name, fontFamily: fontMedium),
                    text(model.duration, fontSize: textSizeSmall)
                  ],
                ),
                SizedBox(
                  height: spacing_control,
                ),
                RatingBar(
                  initialRating: 5,
                  minRating: 1,
                  itemSize: 20,
                  direction: Axis.horizontal,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: grocery_color_yellow,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  height: spacing_control,
                ),
                text(model.description,
                    textColor: grocery_textColorSecondary, isLongText: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}
