import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/muvi/models/flix_response.dart';
import 'package:prokit_flutter/muvi/screens/flix_movie_detail_screen_2.dart';
import 'package:prokit_flutter/muvi/screens/flix_series_detail_screen.dart';
import 'package:prokit_flutter/muvi/screens/flix_view_all_movies_screen.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_localizations.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/muvi/utils/flix_data_generator.dart';
import 'package:prokit_flutter/muvi/utils/flix_slider_widget.dart';
import 'package:prokit_flutter/muvi/utils/flix_widget_extensions.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_size.dart';

class HomeCategoryFragment extends StatefulWidget {
  static String tag = '/SubHomeFragment';
  var type;

  HomeCategoryFragment({this.type});

  @override
  HomeCategoryFragmentState createState() => HomeCategoryFragmentState();
}

class HomeCategoryFragmentState extends State<HomeCategoryFragment> {
  var mSliderList = List<HomeSlider>();
  var mMovieList = List<Movie>();
  var mCinemaMovieList = List<Movie>();
  var mcontinueList = List<Movie>();
  var mTrendingMuviList = List<Movie>();
  var mMadeForYouList = List<Movie>();
  bool isLoading = false;

  showLoading(bool show) {
    setState(() {
      isLoading = show;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    setState(() {
      mSliderList.addAll(getSliders());
      mMovieList.addAll(getMovie());
      mCinemaMovieList.addAll(getHorizontalMovie());
      mcontinueList.addAll(getContinueMovies());
      mTrendingMuviList.addAll(getTrendingOnMovie());
      mMadeForYouList.addAll(getMadeForYouMovie());
    });
  }

  @override
  Widget build(BuildContext context) {
    var slider = mSliderList.isNotEmpty ? HomeSliderWidget(mSliderList) : Container();
    var madeForYouSlider = mMadeForYouList.isNotEmpty ? VerticalSliderWidget(mMadeForYouList) : Container();
    var popularMovieList = mMovieList.isNotEmpty
        ? ItemHorizontalList(
            mMovieList,
            isHorizontal: false,
          )
        : Container();
    var trendingMovieList = mTrendingMuviList.isNotEmpty
        ? ItemHorizontalList(
            mTrendingMuviList,
            isHorizontal: false,
          )
        : Container();
    var newCinemaList = mCinemaMovieList.isNotEmpty
        ? ItemHorizontalList(
            mCinemaMovieList,
            isHorizontal: true,
          )
        : Container();
    var continueWatchingList = mcontinueList.isNotEmpty
        ? ItemProgressHorizontalList(
            mcontinueList,
          )
        : Container();
    return Scaffold(
      backgroundColor: muvi_appBackground,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                headingText(context, keyString(context, "trending_week")).paddingAll(spacing_standard_new),
                slider,
                headingText(context, keyString(context, "continue_watching")).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: 12, bottom: spacing_standard_new),
                continueWatchingList,
                headingWidViewAll(context, keyString(context, "popular_movies"), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: keyString(context, "popular_movies"))));
                }).paddingAll(spacing_standard_new),
                popularMovieList,
                headingWidViewAll(context, keyString(context, "new_cinema"), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: keyString(context, "new_cinema"))));
                }).paddingAll(spacing_standard_new),
                newCinemaList,
                headingText(context, "Made For You").onTap(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: keyString(context, "new_cinema"))));
                }).paddingAll(spacing_standard_new),
                madeForYouSlider,
                headingWidViewAll(context, keyString(context, "trending_muvi"), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: keyString(context, "new_cinema"))));
                }).paddingAll(spacing_standard_new),
                trendingMovieList.paddingBottom(spacing_standard_new)
              ],
            ),
          ),
          Center(child: loadingWidgetMaker().visible(isLoading))
        ],
      ),
    );
  }
}

class HomeSliderWidget extends StatelessWidget {
  List<HomeSlider> mSliderList;

  HomeSliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 36;
    final Size cardSize = Size(width, width / 1.8);
    return SliderWidget(
      viewportFraction: 0.92,
      height: cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: cardSize.height,
              margin: EdgeInsets.symmetric(horizontal: spacing_control),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(spacing_standard),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    networkImage(slider.slideImage, aWidth: cardSize.width, aHeight: cardSize.height, fit: BoxFit.cover),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            hdWidget(context).paddingRight(spacing_standard).visible(slider.isHD),
                            itemSubTitle(context, "2018"),
                            itemSubTitle(context, "17+").paddingLeft(spacing_standard)
                          ],
                        ).paddingTop(spacing_control_half)
                      ],
                    ).paddingOnly(left: spacing_standard, bottom: spacing_standard_new)
                  ],
                ),
              ).paddingBottom(spacing_control),
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SeriesDetailScreen()));
            });
          },
        );
      }).toList(),
    );
  }
}

class VerticalSliderWidget extends StatelessWidget {
  List<Movie> mSliderList;

  VerticalSliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width * 0.7;
    final Size cardSize = Size(width, width * (16 / 11.5));
    return SliderWidget(
      viewportFraction: 0.65,
      height: cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: cardSize.width,
              margin: EdgeInsets.symmetric(horizontal: spacing_control),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(spacing_control),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    networkImage(slider.slideImage, aWidth: double.infinity, aHeight: double.infinity, fit: BoxFit.cover),
                  ],
                ),
              ).paddingBottom(spacing_control),
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail2Screen(title: "Action")));
            });
          },
        );
      }).toList(),
    );
  }
}
