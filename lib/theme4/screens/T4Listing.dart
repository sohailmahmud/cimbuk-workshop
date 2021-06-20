import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme4/models/T4Models.dart';
import 'package:prokit_flutter/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/theme4/utils/T4DataGenerator.dart';
import 'package:prokit_flutter/theme4/utils/T4Extension.dart';
import 'package:prokit_flutter/theme4/utils/T4Strings.dart';
import 'package:prokit_flutter/theme4/utils/T4Widgets.dart';

class T4Listing extends StatefulWidget {
  static var tag = "/T4Listing";

  @override
  T4ListingState createState() => T4ListingState();
}

class T4ListingState extends State<T4Listing> {
  int selectedPos = 1;
  List<T4NewsModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getList1Data();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(t4_app_background);

    return Scaffold(
      backgroundColor: t4_app_background,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(t4_lbl_listing),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl: mListings[index].image,
                                    width: width / 3,
                                    height: width / 3.2,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            text(mListings[index].name,
                                                textColor: t4_textColorPrimary,
                                                fontSize: textSizeLargeMedium,
                                                fontFamily: fontBold),
                                            text(mListings[index].info,
                                                fontSize: textSizeMedium,
                                                textColor: t4_textColorPrimary),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            text(mListings[index].otherinfo,
                                                fontSize: textSizeSMedium,
                                                maxLine: 3),
                                            SizedBox(
                                              height: 4,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            divider()
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
