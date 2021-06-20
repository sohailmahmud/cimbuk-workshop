import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/main/utils/flutter_fluid_slider/flutter_fluid_slider.dart';

class FluidSliderScreen extends StatefulWidget {
  static String tag = '/FluidSlider';

  @override
  FluidSliderScreenState createState() => FluidSliderScreenState();
}

class FluidSliderScreenState extends State<FluidSliderScreen> {
  var _value = 10.0;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);

    return Scaffold(
      appBar: getAppBar(context, "Slider"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FluidSlider(
                value: _value,
                labelsTextStyle: primaryTextStyle(),
                valueTextStyle: primaryTextStyle(color: textPrimaryColor),
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
                min: 0.0,
                max: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
