import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/FlutterSlider.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3Tab extends StatefulWidget {
  static String tag = '/T3Tab';

  @override
  T3TabState createState() => T3TabState();
}

class T3TabState extends State<T3Tab> {
  double _lowerValue = 50;
  double _upperValue = 180;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t3_white);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              height: (MediaQuery.of(context).size.height) / 1.5,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(75.0),
                      child: AppBar(
                        backgroundColor: t3_white,
                        flexibleSpace: new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.close),
                              color: t3_textColorPrimary,
                              onPressed: () {
                                back(context);
                              },
                            ),
                            new TabBar(
                              labelColor: t3_colorPrimary,
                              indicatorColor: t3_colorPrimary,
                              unselectedLabelColor: t3_textColorPrimary,
                              tabs: [
                                Tab(
                                  text: "Chef",
                                ),
                                Tab(
                                  text: "Price",
                                ),
                                Tab(
                                  text: "Dietary",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(
                      children: <Widget>[
                        Center(
                          child: ChefCheckboxWidget(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50, left: 16, right: 16),
                          child: FlutterSlider(
                            values: [30, 420],
                            rangeSlider: true,
                            max: 500,
                            min: 0,
                            onDragging: (handlerIndex, lowerValue, upperValue) {
                              _lowerValue = lowerValue;
                              _upperValue = upperValue;
                              setState(() {});
                            },
                          ),
                        ),
                        Center(
                          child: CheckboxWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {
  var a = "";
  Map<String, bool> values = {
    'Vegetrain': false,
    'Vegan': false,
    'Non-Vegetrain': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: t3_app_background, blurRadius: 2, spreadRadius: 1)],
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0), bottomLeft: Radius.circular(50.0)),
      ),
      child: Column(children: <Widget>[
        Expanded(
          child: ListView(
            children: values.keys.map((String key) {
              return new CheckboxListTile(
                title: new Text(key),
                value: values[key],
                activeColor: t3_colorPrimary,
                checkColor: Colors.white,
                onChanged: (bool value) {
                  setState(() {
                    values[key] = value;
                  });
                },
              );
            }).toList(),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: AppButton(
              textContent: t3_lbl_done,
              onPressed: () {},
            ))
      ]),
    );
  }
}

class ChefCheckboxWidget extends StatefulWidget {
  @override
  ChefCheckboxWidgetState createState() => new ChefCheckboxWidgetState();
}

class ChefCheckboxWidgetState extends State {
  var a = "";
  Map<String, bool> values = {
    'John Smith': false,
    'Lee': false,
    'Alexender Cinah': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: t3_app_background, blurRadius: 2, spreadRadius: 1)],
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0), bottomLeft: Radius.circular(50.0)),
      ),
      child: Column(children: <Widget>[
        Expanded(
          child: ListView(
            children: values.keys.map((String key) {
              return new CheckboxListTile(
                title: new Text(key),
                value: values[key],
                activeColor: t3_colorPrimary,
                checkColor: Colors.white,
                onChanged: (bool value) {
                  setState(() {
                    values[key] = value;
                  });
                },
              );
            }).toList(),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: AppButton(
              textContent: t3_lbl_done,
              onPressed: () {},
            ))
      ]),
    );
  }
}
