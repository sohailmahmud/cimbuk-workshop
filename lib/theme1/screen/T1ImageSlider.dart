import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/theme1/utils/T1Extension.dart';
import 'package:prokit_flutter/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/theme1/utils/T1Widget.dart';

class T1ImageSlider extends StatefulWidget {
  static var tag = "/T1ImageSlider";

  @override
  T1ImageSliderState createState() => T1ImageSliderState();
}

class T1ImageSliderState extends State<T1ImageSlider> {
  var currentIndexPage = 0;

  // List<T1Slider> mSliderList;
  @override
  void initState() {
    super.initState();
    // mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t1White);
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(t1_Image_Slider),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.55,
            child: PageView(
              children: <Widget>[
                Slider(file: t1_slider1),
                Slider(file: t1_slider2),
                Slider(file: t1_slider3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key key, @required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: CachedNetworkImage(
            imageUrl: file,
            fit: BoxFit.fill,
          )),
    );
  }
}
