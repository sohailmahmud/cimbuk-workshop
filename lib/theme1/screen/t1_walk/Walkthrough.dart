import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/theme1/utils/T1Widget.dart';

class Walkthrough extends StatefulWidget {
  final title;
  final content;
  final imageIcon;
  final imagecolor;

  Walkthrough(
      {this.title,
      this.content,
      this.imageIcon,
      this.imagecolor = Colors.redAccent});

  @override
  WalkthroughState createState() {
    return new WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: height / 15),
          text(widget.title,
              fontSize: textSizeLarge,
              fontFamily: fontSemibold,
              textColor: t1_colorPrimary),
          SizedBox(height: height / 30),
          CachedNetworkImage(
              imageUrl: widget.imageIcon,
              width: height * 0.35,
              height: height * 0.35),
//          Image.asset(widget.imageIcon, width: height * 0.35, height: height * 0.35),
          SizedBox(height: height / 30),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: text(widget.content,
                  maxLine: 2, fontSize: textSizeMedium, isCentered: true))
        ],
      ),
    );
  }
}
