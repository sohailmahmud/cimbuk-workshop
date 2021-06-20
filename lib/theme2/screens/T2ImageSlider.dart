import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme2/models/models.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2DataGenerator.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';
import 'package:prokit_flutter/theme2/utils/T2Slider.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2ImageSlider extends StatefulWidget {
  static var tag = "/T2ImageSlider";

  @override
  T2ImageSliderState createState() => T2ImageSliderState();
}

class T2ImageSliderState extends State<T2ImageSlider> {
  var currentIndexPage = 0;
  List<T2Slider> mSliderList;

  @override
  void initState() {
    super.initState();
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t2White);

    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.8);
    return Scaffold(
      body: Column(
        children: <Widget>[TopBar(t2_Image_Slider), SizedBox(height: 16), T2SliderWidget()],
      ),
    );
  }
}
