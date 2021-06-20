import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class MWSliverAppBarScreen1 extends StatefulWidget {
  static String tag = '/MWSliverAppBarScreen1';

  @override
  _MWSliverAppBarScreen1State createState() => _MWSliverAppBarScreen1State();
}

class _MWSliverAppBarScreen1State extends State<MWSliverAppBarScreen1> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.filter_1),
              onPressed: () {
                // Do something
              },
            ),
            expandedHeight: 220.0,
            floating: true,
            pinned: true,
            snap: false,
            elevation: 50,
            backgroundColor: appStore.appBarColor,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('SliverAppBar with ListView', style: primaryTextStyle()),
                background: CachedNetworkImage(imageUrl: 'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', fit: BoxFit.cover)),
          ),
          SliverList(delegate: SliverChildListDelegate(_buildList(50))),
        ],
      ),
    );
  }
}

List _buildList(int count) {
  List<Widget> listItems = List();

  for (int i = 1; i < count; i++) {
    listItems.add(
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Item ${i.toString()}',
          style: TextStyle(fontSize: 20.0, color: appStore.textPrimaryColor),
        ),
      ),
    );
  }
  return listItems;
}
