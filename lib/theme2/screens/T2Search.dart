import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';
import 'package:prokit_flutter/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2Search extends StatefulWidget {
  static var tag = "/T2Search";

  @override
  T2SearchState createState() => T2SearchState();
}

class T2SearchState extends State<T2Search> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t2White);

    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(t2_lbl_search),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              alignment: Alignment.centerRight,
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: t2_white,
                  hintText: t2_lbl_search,
                  contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: t2_view_color, width: 0.5),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: t2_view_color, width: 0.5),
                    borderRadius: BorderRadius.circular(26),
                  ),
                )),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SvgPicture.asset(t2_search, color: t2_colorPrimary),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(alignment: Alignment.center, height: MediaQuery.of(context).size.height - 200, child: ring(t2_lbl_welcome_to_search_bar)),
          )
        ],
      ),
    );
  }
}
