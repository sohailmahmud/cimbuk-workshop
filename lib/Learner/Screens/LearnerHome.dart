import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/Learner/model/LearnerModels.dart';
import 'package:prokit_flutter/Learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/Learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/Learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/Learner/utils/LearnerExtension.dart';
import 'package:prokit_flutter/Learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/Learner/utils/LearnerWidget.dart';

class LearnerHome extends StatefulWidget {
  @override
  _LearnerHomeState createState() => _LearnerHomeState();
}

class _LearnerHomeState extends State<LearnerHome> {
  List<LearnerFeaturedModel> mList1;
  List<LearnerCategoryModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetFavourites();
    mList2 = learnerGetCategories();

    changeStatusColor(learner_layout_background);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(learner_lbl_featured,
                    fontFamily: fontBold, fontSize: textSizeNormal),
                text(
                  learner_lbl_see_all,
                  textColor: learner_colorPrimary,
                  textAllCaps: true,
                  fontFamily: fontMedium,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 265,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mList1.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return LearnerFeatured(mList1[index], index);
              },
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 16),
              child: text(learner_lbl_categories,
                  fontFamily: fontBold, fontSize: textSizeNormal)),
          SizedBox(height: 20),
          GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mList2.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return LearnerCategory(mList2[index], index);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class LearnerFeatured extends StatelessWidget {
  LearnerFeaturedModel model;

  LearnerFeatured(LearnerFeaturedModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: model.img,
              fit: BoxFit.cover,
              height: w * 0.4,
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
                text(model.name,
                    fontFamily: fontMedium, isLongText: true, maxLine: 2),
                text(model.price, textColor: learner_textColorSecondary),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LearnerCategory extends StatelessWidget {
  LearnerCategoryModel model;

  LearnerCategory(LearnerCategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                decoration: boxDecoration(bgColor: learner_white, radius: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    model.img,
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                  margin: EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: text(model.name)),
            ],
          ),
        ),
      ],
    );
  }
}
