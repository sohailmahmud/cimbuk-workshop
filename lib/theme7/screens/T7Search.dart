import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme7/models/T7Models.dart';
import 'package:prokit_flutter/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/theme7/utils/T7DataGenerator.dart';
import 'package:prokit_flutter/theme7/utils/T7Extension.dart';
import 'package:prokit_flutter/theme7/utils/T7Images.dart';
import 'package:prokit_flutter/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/theme7/utils/T7Widget.dart';

class T7Search extends StatefulWidget {
  static String tag = '/T7Search';

  @override
  T7SearchState createState() => T7SearchState();
}

class T7SearchState extends State<T7Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: DefaultTabController(
            child: new Scaffold(
              appBar: new PreferredSize(
                preferredSize: Size.fromHeight(130),
                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: new SafeArea(
                    child: Column(
                      children: <Widget>[
                        new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 25, top: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(26, 8, 8, 26),
                                      hintText: t7_search_nearby_destination,
                                      filled: true,
                                      prefixIcon: Icon(Icons.search),
                                      fillColor: t7view_color,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: t7view_color, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: t7view_color, width: 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.close)
                              ],
                            ),
                          ),
                        ),
                        new TabBar(
                          unselectedLabelColor: t7textColorSecondary,
                          indicatorColor: t7textColorPrimary,
                          labelColor: t7textColorPrimary,
                          tabs: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: text(
                                t7_place,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                              child: text(
                                t7_hotels,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                              child: text(
                                t7_food,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                              child: text(
                                t7_events,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Search(),
                  Search(),
                  Search(),
                  Search(),
                ],
              ),
            ),
            length: 4,
          ),
        ),
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  List<T7RecentSearchDataModel> mListings;
  List<T7RecentSearchDataModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings = generatePopularDestination();
    mListings1 = generateRecentSearch();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t7white);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.body1,
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SvgPicture.asset(
                        t7_ic_send,
                        color: t7icon_color,
                      ),
                    ),
                  ),
                  TextSpan(text: t7_search_nearby_destination, style: TextStyle(fontSize: textSizeMedium, color: t7black)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[text(t7_recent_search), text(t7_clear_all, textColor: t7textColorSecondary)],
            ),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mListings1.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.body1,
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.access_time,
                                color: t7textColorSecondary,
                                size: 16,
                              ),
                            ),
                          ),
                          TextSpan(text: mListings1[index].name, style: TextStyle(fontSize: textSizeMedium, color: t7textColorSecondary)),
                        ],
                      ),
                    ),
                  ));
                }),
            SizedBox(
              height: 20,
            ),
            text(t7_popular_destination),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mListings.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(child: text(mListings[index].name, textColor: t7textColorSecondary)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
