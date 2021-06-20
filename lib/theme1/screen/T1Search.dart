import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/theme1/utils/T1Extension.dart';
import 'package:prokit_flutter/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/theme1/utils/T1Widget.dart';

class T1Search extends StatefulWidget {
  static var tag = "/T1Search";

  @override
  T1SearchState createState() => T1SearchState();
}

class T1SearchState extends State<T1Search> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t1White);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          TopBar(t1_lbl_search),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: boxDecoration(radius: 10, showShadow: true),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: t1_white,
                  hintText: t1_lbl_search,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
          Expanded(child: Container(child: ring(t1_lbl_welcome_to_search_bar))),
        ],
      ),
    );
  }
}
