import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';
import 'package:prokit_flutter/main/utils/widget.dart';

class FoldingCellScreen extends StatefulWidget {
  static String tag = '/FoldingCellScreen';

  @override
  FoldingCellScreenState createState() => FoldingCellScreenState();
}

class FoldingCellScreenState extends State<FoldingCellScreen> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);

    return Scaffold(
      appBar: getAppBar(context, "Folding Cell in ListView"),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        alignment: Alignment.topCenter,
        child: SimpleFoldingCell(
            key: _foldingCellKey,
            frontWidget: _buildFrontWidget(),
            innerTopWidget: _buildInnerTopWidget(),
            innerBottomWidget: _buildInnerBottomWidget(),
            cellSize: Size(MediaQuery.of(context).size.width, 125),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('cell opened'),
            onClose: () => print('cell closed')),
      ),
    );
  }

  Widget _buildFrontWidget() {
    return Container(
        color: Color(0xFFffcd3c),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            text("CARD", fontSize: 20.0),
            FlatButton(
              onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
              child: text(
                "Open",
                textColor: Colors.white,
              ),
              color: Colors.indigoAccent,
              splashColor: Colors.white.withOpacity(0.5),
            )
          ],
        ));
  }

  Widget _buildInnerTopWidget() {
    return Container(
        color: Color(0xFFff9234),
        alignment: Alignment.center,
        child: Text("TITLE",
            style: TextStyle(
                color: Color(0xFF2e282a),
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.w800)));
  }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(
          onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
          child: text(
            "Close",
          ),
          textColor: Colors.white,
          color: Colors.indigoAccent,
          splashColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
