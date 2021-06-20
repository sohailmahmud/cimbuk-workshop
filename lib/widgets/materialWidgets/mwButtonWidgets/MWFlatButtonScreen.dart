import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWFlatButtonScreen extends StatefulWidget {
  static String tag = '/MWFlatButtonScreen';

  @override
  MWFlatButtonScreenState createState() => MWFlatButtonScreenState();
}

class MWFlatButtonScreenState extends State<MWFlatButtonScreen> {
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
        appBar: appBar(context, "Flat Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              FlatButton(
                onPressed: () {
                  toast('Default Flat button');
                },
                child: Text(
                  'Default Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              FlatButton.icon(
                  onPressed: () {
                    toast('Flat button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconColor,
                  ),
                  label: Text(
                    'Flat button with icon',
                    style: primaryTextStyle(),
                  )),
              Divider(),
              FlatButton(
                onPressed: null,
                child: Text(
                  'Disable Flat button',
                  style: secondaryTextStyle(size: 16),
                ),
              ),
              Divider(),
              FlatButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Flat button icon',
                    style: secondaryTextStyle(size: 16),
                  )),
              Divider(),
              FlatButton(
                onPressed: () {
                  toast('Border Flat button');
                },
                shape: Border.all(color: appStore.iconColor),
                child: Text(
                  'Border Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () {
                  toast('Rounded Flat button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    )),
                child: Text(
                  'Rounded Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () {
                  toast('Customize Rounded Flat button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    )),
                child: Text(
                  'Customize Rounded Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () {
                  toast('Customize Text Style of label');
                },
                child: Text(
                  'Customize Text Style of label',
                  style: TextStyle(
                    color: appStore.textPrimaryColor,
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
              FlatButton(
                onPressed: () {
                  toast('Color Fill Flat button');
                },
                color: getColorFromHex('#8998FF'),
                child: Text(
                  "Color Fill Flat button",
                  style: primaryTextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () {
                  toast('Rounded color fill flat button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: getColorFromHex('#f2866c'),
                child: Text(
                  'Rounded color fill flat button',
                  style: primaryTextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    getColorFromHex('#8998FF'),
                    getColorFromHex('#75D7D3'),
                  ]),
                ),
                child: FlatButton(
                  onPressed: () {
                    toast('Gradient Flat button');
                  },
                  splashColor: Colors.transparent,
                  child: Text(
                    'Gradient Flat button',
                    style: primaryTextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
