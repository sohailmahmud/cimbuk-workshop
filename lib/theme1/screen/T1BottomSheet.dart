import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/theme1/utils/T1Extension.dart';
import 'package:prokit_flutter/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/theme1/utils/T1Widget.dart';

class T1BottomSheet extends StatefulWidget {
  static var tag = "/T1BottomSheet";

  @override
  T1BottomSheetState createState() => T1BottomSheetState();
}

class T1BottomSheetState extends State<T1BottomSheet> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  Future showBottomSheet() async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Image.asset(t1_ic_bottom_sheet, width: MediaQuery.of(context).size.width, height: 150, fit: BoxFit.fill),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40),
                        text(t1_lbl_share_to, textColor: t1TextColorPrimary, fontFamily: fontMedium),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Icon(Icons.keyboard_arrow_left, size: 24),
                            Container(
                              width: MediaQuery.of(context).size.width - 100,
                              height: 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    shareIcon(t1_whatsup),
                                    shareIcon(t1_facebook),
                                    shareIcon(t1_instagram),
                                    shareIcon(t1_linkedin),
                                    shareIcon(t1_whatsup),
                                  ],
                                ),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right, size: 24),
                            SizedBox(width: 10),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 45,
                height: 45,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.share, color: t1_colorPrimary),
                  backgroundColor: t1_white,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t1White);

    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        showBottomSheet();
      },
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          TopBar(t1_Bottom_Sheet),
          InkWell(child: ring(t1_lbl_welcome_to_bottom_n_sheet), onTap: () => showBottomSheet()),
        ],
      ),
    );
  }
}
