import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';

class BottomSheetScreen extends StatefulWidget {
  static String tag = '/BottomSheetScreen';

  @override
  BottomSheetScreenState createState() => BottomSheetScreenState();
}

class BottomSheetScreenState extends State<BottomSheetScreen> {
  var aText = lipsum.createParagraph(numParagraphs: 1);

  showBottomSheetDialog(context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network('https://picsum.photos/seed/picsum/200/300', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.only(left: 16, right: 16, top: 8), child: text(aText, isLongText: true)),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);

    return Scaffold(
      appBar: getAppBar(context, "Bottom Sheet"),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          children: <Widget>[
            MaterialButton(
              color: primaryColor,
              onPressed: () => showBottomSheetDialog(context),
              child: Text('Show BottomSheet', style: primaryTextStyle()),
            )
          ],
        ),
      ),
    );
  }
}
