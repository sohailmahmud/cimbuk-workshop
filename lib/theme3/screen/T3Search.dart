import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3Search extends StatefulWidget {
  static var tag = "/T3Search";

  @override
  T3SearchState createState() => T3SearchState();
}

class T3SearchState extends State<T3Search> {
  List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getSearchData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t3_app_background);
    return Scaffold(
      body: Container(
        color: t3_app_background,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: t3_black,
                    onPressed: () {
                      back(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: t3_black,
                    onPressed: () {
                      back(context);
                    },
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: text(t3_lbl_search_product,
                      fontFamily: fontBold,
                      textColor: t3_textColorPrimary,
                      fontSize: 22.0)),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                      filled: true,
                      fillColor: t3_white,
                      hintText: t3_lbl_search,
                      contentPadding:
                          EdgeInsets.only(left: 26.0, bottom: 8.0, right: 50.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: t3_white, width: 0.5),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: t3_view_color, width: 0.5),
                        borderRadius: BorderRadius.circular(26),
                      ),
                    )),
                    GestureDetector(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SvgPicture.asset(
                            t3_ic_search,
                            color: t3_colorPrimary,
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
//                    childAspectRatio: MediaQuery.of(context).size.width /
//                        (MediaQuery.of(context).size.height / 1.7),
                  ),
                  itemCount: mListings.length,
                  itemBuilder: (context, index) {
                    return T3SearchList(mListings[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class T3SearchList extends StatelessWidget {
  Theme3Dish model;

  T3SearchList(Theme3Dish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                model.dishImage) /*AssetImage(model.dishImage)*/,
            //  backgroundImage: AssetImage(t3_dish3),
            radius: 50,
          ),
          SizedBox(
            height: 6,
          ),
          text(
            // "dfsd",
            model.dishName,
            textColor: t3_textColorPrimary,
            fontFamily: fontSemibold,
            fontSize: textSizeMedium,
          ),
          text(
//            "bjhhjb",
              model.description,
              fontSize: textSizeSMedium),
        ],
      ),
    );
  }
}
