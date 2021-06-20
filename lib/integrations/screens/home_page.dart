import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/models/ContentModel.dart';
import 'package:prokit_flutter/integrations/utils/data_provider.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IntegrationHomePage extends StatefulWidget {
  static String tag = '/HomePage';

  @override
  IntegrationHomePageState createState() => IntegrationHomePageState();
}

class IntegrationHomePageState extends State<IntegrationHomePage> with AfterLayoutMixin<IntegrationHomePage> {
  List<ContentModel> list = List();
  var isEnglishSelected = true;
  var isDarkThemeSelected = false;

  init(context) async {
    list = await getContents(context);
    setState(() {});
  }

  @override
  void afterFirstLayout(BuildContext context) {
    init(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildExpandedTile(ContentModel model) {
      return InkWell(
        onTap: () {
          if (model.pageName != null) model.pageName.launch(context);
          appStore.setDarkMode(false);
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationWithShadow(
                backgroundColor: appStore.scaffoldBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(4),
                  topLeft: Radius.circular(4),
                ),
                blurRadius: 5.0,
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(8, 8, 40, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.title, style: boldTextStyle()).expand(),
                  Container(
                    alignment: Alignment.center,
                    height: 25,
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: model.tag.isNotEmpty ? boxDecoration(bgColor: appDarkRed, radius: 4) : BoxDecoration(),
                    child: text(model.tag, fontSize: textSizeSmall, textColor: whiteColor),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    var width = MediaQuery.of(context).size.width;
    Widget buildListTile(ContentModel item, index) {
      if (item.items == null) return ListTile(title: Text(item.title));
      return ListTileTheme(
        dense: true,
        contentPadding: EdgeInsets.all(0),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: item.isExpanded,
            onExpansionChanged: (isExpanded) {
              setState(() {
                item.isExpanded = isExpanded;
              });
            },
            title: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: width / 6,
                    height: 80,
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.all(width / 25),
                    decoration: BoxDecoration(color: item.bgColor, borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Image.asset('images/integrations/icons/${item.icon}', height: 30, color: Colors.white),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: 80,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          margin: EdgeInsets.only(right: width / 28),
                          decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 4, showShadow: true),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item.title, style: boldTextStyle()),
                                  4.height,
                                  Text(item.subTitle.validate(), style: secondaryTextStyle(), maxLines: 1),
                                ],
                              ).expand(),
                            ],
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: item.bgColor),
                          child: Icon(!item.isExpanded ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_down, size: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            trailing: SizedBox(),
            children: item.items.map(buildExpandedTile).toList(),
          ),
        ),
      );
    }

    final listView = ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      itemBuilder: (context, index) => buildListTile(list[index], index),
      physics: NeverScrollableScrollPhysics(),
    );

    return Scaffold(
      appBar: appBar(context, 'Integrations'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            listView,
          ],
        ),
      ),
    );
  }
}
