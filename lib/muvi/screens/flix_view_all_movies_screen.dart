import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/muvi/models/flix_response.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/muvi/utils/flix_data_generator.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_colors.dart';

class ViewAllMovieScreen extends StatefulWidget {
  static String tag = '/ViewAllMovieScreen';
  var title = "";

  ViewAllMovieScreen({this.title});

  @override
  ViewAllMovieScreenState createState() => ViewAllMovieScreenState();
}

class ViewAllMovieScreenState extends State<ViewAllMovieScreen> {
  var movieList = List<Movie>();

  @override
  void initState() {
    super.initState();
    movieList.addAll(getMadeForYouMovie());
  }

  @override
  Widget build(BuildContext context) {
    var allMovieList = AllMovieGridList(movieList);
    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, widget.title),
      body: allMovieList,
    );
  }
}
