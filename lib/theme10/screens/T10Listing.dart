import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme10/models/T10Models.dart';
import 'package:prokit_flutter/theme10/utils/T10Colors.dart';
import 'package:prokit_flutter/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/theme10/utils/T10DataGenerator.dart';
import 'package:prokit_flutter/theme10/utils/T10Extension.dart';
import 'package:prokit_flutter/theme10/utils/T10Strings.dart';
import 'package:prokit_flutter/theme10/utils/T10Widget.dart';

class T10Listing extends StatefulWidget {
  static String tag = '/T10Listing';

  @override
  T10ListingState createState() => T10ListingState();
}

class T10ListingState extends State<T10Listing> {
  List<T10Product> mList;

  @override
  void initState() {
    super.initState();
    mList = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t10_white);
    return Scaffold(
      backgroundColor: t10_white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_products),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductList(mList[index], index);
                }),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  T10Product model;

  ProductList(T10Product model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(
            left: spacing_standard_new,
            right: spacing_standard_new,
            bottom: spacing_standard_new),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(spacing_middle)),
                    child: CachedNetworkImage(
                      imageUrl: model.img,
                      fit: BoxFit.cover,
                      height: width * 0.2,
                    ),
                  ),
                ),
                SizedBox(
                  width: spacing_standard_new,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          text(model.name, fontFamily: fontMedium),
                        ],
                      ),
                      text(model.category, textColor: t10_textColorSecondary),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              text(
                                model.price,
                              ),
                              SizedBox(
                                width: spacing_control,
                              ),
                              text(model.subPrice,
                                  textColor: t10_textColorSecondary,
                                  lineThrough: true)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.remove_circle,
                                color: t10_textColorSecondary,
                                size: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              text("2",
                                  fontFamily: fontMedium,
                                  fontSize: textSizeLargeMedium),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.add_circle,
                                color: t10_textColorSecondary,
                                size: 20,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: spacing_standard_new,
            ),
            Divider(
              color: t10_view_color,
              height: 0.5,
            )
          ],
        ));
  }
}
