import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDStyle.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:prokit_flutter/smartDeck/Screens/SDSettingScreen.dart';

import 'SDEditProfileScreen.dart';

class sdPRofileScreen extends StatefulWidget {
  @override
  _sdPRofileScreenState createState() => _sdPRofileScreenState();
}

class _sdPRofileScreenState extends State<sdPRofileScreen> {
  List<charts.Series<Task, String>> _taskPieData;

  _generateData() {
    var taskData = [
      Task(task: 'Completed', value: 82.0, color: Colors.blue),
      Task(task: 'On going', value: 22.0, color: Colors.deepOrangeAccent),
    ];

    _taskPieData.add(
      charts.Series(
        data: taskData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.value,
        colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.color),
        id: 'Montlhy',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _taskPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(sdPrimaryColor);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 320,
              width: size.width,
              padding: EdgeInsets.only(top: 25, right: 10),
              color: sdPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SDSettingScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage(
                          'Loading',
                        ),
                        image: Image.network(
                          'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
                          height: 35,
                          width: 10,
                        ).image,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Mark Paul',
                      style: boldTextStyle(textColor: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Senior High School - 12th Grade',
                      style: secondaryTextStyle(
                        size: 12,
                        textColor: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SDEditProfileScreen(),
                        ),
                      );
                    },
                    child: FittedBox(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                        decoration: boxDecorations(
                          radius: 4,
                        ),
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: boldTextStyle(
                                size: 12, textColor: sdPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 320.00 - 50,
                      ),
                      padding: EdgeInsets.all(20),
                      decoration: boxDecoration(
                        radius: 8,
                        backGroundColor: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Highest Score',
                            style: boldTextStyle(
                                textColor: Colors.black, size: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '98',
                            style: boldTextStyle(
                              textColor: Colors.green.withOpacity(0.8),
                              size: 26,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Chemist',
                            style: secondaryTextStyle(
                                textColor: Colors.grey.withOpacity(0.7),
                                size: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 320.00 - 50,
                      ),
                      padding: EdgeInsets.all(20),
                      decoration: boxDecoration(
                          radius: 8,
                          backGroundColor: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Lowest Score',
                            style: boldTextStyle(
                                textColor: Colors.black, size: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '67',
                            style: boldTextStyle(
                              textColor:
                                  sdSecondaryColorYellow.withOpacity(0.7),
                              size: 26,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Maths',
                            style: secondaryTextStyle(
                                textColor: Colors.grey.withOpacity(0.7),
                                size: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: 320.00 + 100, bottom: 25, left: 16, right: 16),
                padding: EdgeInsets.only(
                  top: 5,
                  left: 15,
                  right: 15,
                ),
                decoration: boxDecorations(
                  showShadow: true,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Completion Rate',
                              style: boldTextStyle(size: 16)),
                        ),
                        Container(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: 'Monthly',
                              items: <String>[
                                'Daily',
                                'Weekly',
                                'Monthly',
                                'Yearly'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: boldTextStyle(size: 16),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: charts.PieChart(
                              _taskPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 1),
                              behaviors: [
                                charts.DatumLegend(
                                  position: charts.BehaviorPosition.end,
                                  outsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                  horizontalFirst: false,
                                  showMeasures: true,
                                  cellPadding:
                                      new EdgeInsets.only(right: 4.0, top: 25),
                                  legendDefaultMeasure:
                                      charts.LegendDefaultMeasure.lastValue,
                                  measureFormatter: (num value) {
                                    return value == null ? '-' : '$value%';
                                  },
                                  entryTextStyle: charts.TextStyleSpec(
                                    color: charts.MaterialPalette.black,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                              defaultRenderer: charts.ArcRendererConfig(
                                arcWidth: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  String task;
  double value;
  Color color;

  Task({this.task, this.value, this.color});
}
