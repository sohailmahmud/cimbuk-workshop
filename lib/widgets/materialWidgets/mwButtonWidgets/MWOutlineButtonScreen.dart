import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWOutlineButtonScreen extends StatefulWidget {
  static String tag = '/MWOutlineButtonScreen';

  @override
  MWOutlineButtonScreenState createState() => MWOutlineButtonScreenState();
}

class MWOutlineButtonScreenState extends State<MWOutlineButtonScreen> {
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
        appBar: appBar(context, "Outline Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              OutlineButton(
                borderSide: BorderSide(
                  color: appStore.textPrimaryColor, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                onPressed: () {
                  toast('Default Outline button');
                },
                child: Text(
                  'Default Outline button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              OutlineButton.icon(
                  borderSide: BorderSide(
                    color: appStore.textPrimaryColor, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                  onPressed: () {
                    toast('Outline button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconColor,
                  ),
                  label: Text(
                    'Outline button with icon',
                    style: primaryTextStyle(),
                  )),
              Divider(),
              OutlineButton(
                borderSide: BorderSide(
                  color: appStore.textPrimaryColor, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                onPressed: null,
                child: Text(
                  'Disable Outline button',
                  style: secondaryTextStyle(size: 16),
                ),
              ),
              Divider(),
              OutlineButton.icon(
                  borderSide: BorderSide(
                    color: appStore.textPrimaryColor, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                  onPressed: null,
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Outline button icon',
                    style: secondaryTextStyle(size: 16),
                  )),
              Divider(),
              OutlineButton(
                borderSide: BorderSide(
                  color: appStore.textPrimaryColor, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                onPressed: () {
                  toast('Border Outline button');
                },
                shape: Border.all(color: appStore.iconColor),
                child: Text(
                  'Border Outline button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              OutlineButton(
                borderSide: BorderSide(
                  color: appStore.textPrimaryColor, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                onPressed: () {
                  toast('Rounded Outline button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    )),
                child: Text(
                  'Rounded Outline button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              OutlineButton(
                borderSide: BorderSide(
                  color: appStore.textPrimaryColor, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                onPressed: () {
                  toast('Customize Rounded Outline button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    )),
                child: Text(
                  'Customize Rounded Outline button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              OutlineButton(
                borderSide: BorderSide(
                  color: appStore.textPrimaryColor, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
