import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWRaisedButtonScreen extends StatefulWidget {
  static String tag = '/MWRaisedButtonScreen';

  @override
  MWRaisedButtonScreenState createState() => MWRaisedButtonScreenState();
}

class MWRaisedButtonScreenState extends State<MWRaisedButtonScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Raised Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              RaisedButton(
                onPressed: () {
                  toast('Default Raised button');
                },
                child: Text(
                  'Default Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              RaisedButton.icon(
                  onPressed: () {
                    toast('Raised button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: black,
                  ),
                  label: Text(
                    'Raised button with icon',
                    style: primaryTextStyle(color: black),
                  )),
              Divider(),
              RaisedButton(
                onPressed: null,
                child: Text(
                  'Disable Raised button',
                  style: secondaryTextStyle(size: 16),
                ),
              ),
              Divider(),
              RaisedButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Raised button icon',
                    style: secondaryTextStyle(size: 16),
                  )),
              Divider(),
              RaisedButton(
                onPressed: () {
                  toast('Border Raised button');
                },
                shape: Border.all(color: black),
                child: Text(
                  'Border Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              RaisedButton(
                onPressed: () {
                  toast('Rounded Raised button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    )),
                child: Text(
                  'Rounded Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              RaisedButton(
                onPressed: () {
                  toast('Customize Rounded Raised button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    )),
                child: Text(
                  'Customize Rounded Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              RaisedButton(
                onPressed: () {
                  toast('Customize Text Style of label');
                },
                child: Text(
                  'Customize Text Style of label',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    )),
              ),
              Divider(),
              RaisedButton(
                onPressed: () {
                  toast('Color Fill Raised button');
                },
                color: getColorFromHex('#8998FF'),
                child: Text(
                  "Color Fill Raised button",
                  style: primaryTextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              RaisedButton(
                onPressed: () {
                  toast('Rounded color fill Raised button');
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: getColorFromHex('#f2866c'),
                child: Text(
                  'Rounded color fill Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
