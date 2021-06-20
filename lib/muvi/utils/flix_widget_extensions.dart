import 'package:flutter/material.dart';

import 'flix_app_localizations.dart';

void launchScreenWithNewTask(context, String tag) {
  Navigator.pushNamedAndRemoveUntil(context, tag, (r) => false);
}

finish(context) {
  Navigator.pop(context);
}

void launchScreen(context, String tag, {Object arguments}) {
  if (arguments == null) {
    Navigator.pushNamed(context, tag);
  } else {
    Navigator.pushNamed(context, tag, arguments: arguments);
  }
}

extension WidgetExtension on Widget {
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  SizedBox withWidth(double width) {
    return SizedBox(width: width, child: this);
  }

  SizedBox withHeight(double height) {
    return SizedBox(height: height, child: this);
  }

  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  }

  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal), child: this);
  }

  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  Padding paddingOnly({double top = 0.0, double left = 0.0, double bottom = 0.0, double right = 0.0}) {
    return Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);
  }

  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  Widget visible(bool visible) {
    return visible ? this : SizedBox();
  }

  Visibility withVisibility(
    bool visible, {
    Widget replacement,
    bool maintainAnimation = false,
    bool maintainState = false,
    bool maintainSize = false,
    bool maintainSemantics = false,
    bool maintainInteractivity = false,
  }) {
    return Visibility(
      visible: visible,
      maintainAnimation: maintainAnimation,
      maintainInteractivity: maintainInteractivity,
      maintainSemantics: maintainSemantics,
      maintainSize: maintainSize,
      maintainState: maintainState,
      key: key,
      child: this,
      replacement: replacement ?? Container(),
    );
  }

  Widget opacity({@required double opacity, durationInSecond = 3}) {
    return AnimatedOpacity(opacity: opacity, duration: Duration(seconds: durationInSecond), child: this);
  }

  Widget rotate({@required double angle, bool transformHitTests = true, Offset origin}) {
    return Transform.rotate(origin: origin, angle: angle, transformHitTests: transformHitTests, child: this);
  }

  Widget center({double heightFactor, double widthFactor}) {
    return Center(heightFactor: heightFactor, widthFactor: widthFactor, child: this);
  }

  Widget onTap(Function function, {BorderRadius borderRadius = const BorderRadius.all(Radius.circular(0))}) {
    return InkWell(
      onTap: function,
      borderRadius: borderRadius,
      child: this,
    );
  }

  launch<T>(context) {
    if (this is StatelessWidget || this is StatefulWidget) {
      Navigator.of(context).push(MaterialPageRoute<T>(builder: (_) => this));
    } else {
      throw Exception('Error: Widget should be StatelessWidget or StatefulWidget');
    }
  }
}

extension StringExtentions on String {
  String validateEMail(context) {
    if (this.isEmpty) {
      return keyString(context, "error_email_required");
    }
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this) ? null : keyString(context, "error_invalid_email");
  }
}
