import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'T1Colors.dart';

void showSimpleCustomDialog(BuildContext context) {
  Dialog simpleDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
      height: 400.0,
      width: 400.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.close,
                color: t1_textColorPrimary,
              ),
              padding: EdgeInsets.all(8),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "OOPs!",
                style: TextStyle(fontSize: 30, color: t1_colorPrimary, fontFamily: 'Bold'),
              ),
            ),
            SizedBox(height: 8),
            Center(child: Image.asset('img/T1_ic_ring.png', height: 100, width: 100)),
            SizedBox(height: 16),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(fontSize: 18, color: t1_textColorSecondary),
            ),
            SizedBox(height: 45),
            Container(
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Material(
                    elevation: 2,
                    shadowColor: Colors.deepOrangeAccent[200],
                    borderRadius: new BorderRadius.circular(40.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: MaterialButton(
                        child: Text(
                          "Try again",
                          style: TextStyle(fontSize: 18),
                        ),
                        textColor: t1_white,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                        color: t1_colorPrimary,
                        onPressed: () => {},
                      ),
                    ))),
          ],
        ),
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => simpleDialog);
}
