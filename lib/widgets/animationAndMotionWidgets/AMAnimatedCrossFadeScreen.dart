import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class AMAnimatedCrossFadeScreen extends StatefulWidget {
  static String tag = '/AMAnimatedCrossFadeScreen';

  @override
  AMAnimatedCrossFadeScreenState createState() => AMAnimatedCrossFadeScreenState();
}

class AMAnimatedCrossFadeScreenState extends State<AMAnimatedCrossFadeScreen> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    });

    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });

      await Future.delayed(Duration(seconds: 3));
      init();
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: appStore.scaffoldBackground,
          appBar: appBar(context, 'Animated Cross Fade'),
          body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              AnimatedCrossFade(
                crossFadeState: _crossFadeState,
                duration: const Duration(seconds: 2),
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                firstChild: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                secondChild: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
                  return Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        key: bottomChildKey,
                        top: 0.0,
                        child: bottomChild,
                      ),
                      Positioned(
                        key: topChildKey,
                        child: topChild,
                      ),
                    ],
                  );
                },
              ),
              16.height,
              AnimatedCrossFade(
                crossFadeState: _crossFadeState,
                duration: const Duration(seconds: 2),
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                firstChild: FittedBox(
                  child: Container(
                    decoration: boxDecoration(radius: 8, bgColor: Colors.red),
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Center(
                        child: Text(
                      "In",
                      style: primaryTextStyle(color: Colors.white),
                    )),
                  ),
                ),
                secondChild: FittedBox(
                  child: Container(
                    decoration: boxDecoration(radius: 8, bgColor: Colors.blueGrey),
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Center(child: Text("Out", style: primaryTextStyle(color: Colors.white))),
                  ),
                ),
                layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
                  return Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        key: bottomChildKey,
                        top: 0.0,
                        child: bottomChild,
                      ),
                      Positioned(
                        key: topChildKey,
                        child: topChild,
                      ),
                    ],
                  );
                },
              )
            ],
          )),
    );
  }
}
