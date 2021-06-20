

//Widget text(String text,
//    {var fontSize = textSizeMedium,
//    textColor = t7black,
//    var fontFamily = fontRegular,
//    var isCentered = false,
//    var maxLine = 1,
//    var latterSpacing = 0.25,
//    var textAllCaps = false,
//    var isLongText = false}) {
//  return Text(textAllCaps ? text.toUpperCase() : text,
//      textAlign: isCentered ? TextAlign.center : TextAlign.start,
//      maxLines: isLongText ? null : maxLine,
//      style: TextStyle(
//          fontFamily: fontFamily,
//          fontSize: fontSize,
//          color: textColor,
//          height: 1.5,
//          letterSpacing: latterSpacing));
//}
//
//
//class T7Button extends StatefulWidget {
//  var textContent;
//  VoidCallback onPressed;
//  Color bgColor = t7white;
//
//  T7Button({
//    @required this.textContent,
//    @required this.onPressed,
//    @required this.bgColor,
//
//
//  });
//
//  @override
//  T7ButtonState createState() => T7ButtonState();
//}
//
//class T7ButtonState extends State<T7Button> {
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: widget.onPressed,
//      child: Container(
//        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
//        child: text(widget.textContent,
//            textColor: widget.bgColor == t7white ? t7black : t7white,
//            isCentered: true,
//            fontFamily: fontMedium,
//            textAllCaps: true),
//        decoration:
//            boxDecoration(bgColor: widget.bgColor, radius: 6)
//      ),
//    );
//  }
//}
//Widget backIcon(var color,var icon,var iconColor)
//{
//  return Container(
//    width: 40,
//    height: 40,
//    decoration: boxDecoration(bgColor: color,radius: 8,color: t7white,showShadow: false),
//    child: Icon(icon,color:iconColor)
//  );
//}
//Widget starText(var text,var txtColor)
//{
//  return RichText(
//    text: TextSpan(
//      children: [
//        TextSpan(
//            text: text,
//            style: TextStyle(
//                fontSize: textSizeSMedium,
//                color: txtColor)),
//        WidgetSpan(
//          child: Padding(
//            padding: const EdgeInsets.only(left: 4),
//            child: Icon(
//              Icons.star_border,
//              color: Colors.amber,
//              size: 16,
//            ),
//          ),
//        ),
//      ],
//    ),
//  );
//}
//
//Container T7EditTextStyle(var hintText, var text,{isPassword = false}) {
//  return Container(
//    child: TextFormField(
//        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
//      obscureText: isPassword,
//      decoration: InputDecoration(
//        contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
//        hintText: hintText,
//        labelText: text,
//        enabledBorder: UnderlineInputBorder(
//          borderSide: const BorderSide(color: t7view_color, width: 0.0),
//        ),
//        focusedBorder: UnderlineInputBorder(
//          borderSide: const BorderSide(color: t7view_color, width: 0.0),
//        ),
//
//      ),
//    ),
//  );
//}
//
//Column circleProgressDashboard(var text, var text1, var text2,var per) {
//  return Column(
//    children: <Widget>[
//      Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text(
//            text1,
//            style:
//                new TextStyle(color: t7colorPrimary, fontSize: textSizeSMedium),
//          ),
//          SizedBox(width: 26,),
//          Text(
//            text2,
//            style: new TextStyle(color: t7white, fontSize: textSizeSMedium),
//          ),
//        ],
//      ),
//      SizedBox(height: 8,),
//      CircularPercentIndicator(
//        radius: 100.0,
//        lineWidth: 6.0,
//        animation: true,
//        percent: per,
//        backgroundColor: t7white,
//        circularStrokeCap: CircularStrokeCap.round,
//        center: new Text(
//          text,
//          style: new TextStyle(fontSize: 20.0),
//        ),
//        progressColor: t7colorPrimary,
//      )
//    ],
//  );
//}
//
//TextFormField editTextStyle(var hintText, {isPassword = true}) {
//  return TextFormField(
//    style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
//    obscureText: isPassword,
//    decoration: InputDecoration(
//      contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
//      hintText: hintText,
//      hintStyle: TextStyle(color: t7textColorSecondary),
//      enabledBorder: OutlineInputBorder(
//        borderRadius: BorderRadius.circular(4),
//        borderSide: const BorderSide(color: t7view_color, width: 0.0),
//      ),
//      focusedBorder: OutlineInputBorder(
//        borderRadius: BorderRadius.circular(4),
//        borderSide: const BorderSide(color: t7view_color, width: 0.0),
//      ),
//    ),
//  );
//}
//
//class TopBar extends StatefulWidget {
//  var titleName;
//
//  TopBar({var this.titleName = ""});
//
//  @override
//  State<StatefulWidget> createState() {
//    return TopBarState();
//  }
//}
//
//class TopBarState extends State<TopBar> {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Container(
//        color: t7white,
//        width: MediaQuery.of(context).size.width,
//        height: 50,
//        child: Stack(
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.keyboard_arrow_left, size: 30),
//              onPressed: () {
//                finish(context);
//              },
//            ),
//            Center(
//                child: text(widget.titleName,
//                    textColor: t7colorPrimary,
//                    fontSize: textSizeLargeMedium,
//                    fontFamily: fontBold))
//          ],
//        ),
//      ),
//    );
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    return null;
//  }
//}
//
//Widget shareIcon(String iconPath) {
//  return Padding(
//    padding: const EdgeInsets.only(left: 20, right: 20),
//    child: Image.asset(iconPath, width: 28, height: 28, fit: BoxFit.fill),
//  );
//}
//
//BoxDecoration boxDecoration(
//    {double radius = 2,
//    Color color = Colors.transparent,
//    Color bgColor = t7white,
//    var showShadow = false}) {
//  return BoxDecoration(
//      color: bgColor,
//      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
//      boxShadow: showShadow
//          ? [BoxShadow(color: t7ShadowColor, blurRadius: 10, spreadRadius: 2)]
//          : [BoxShadow(color: Colors.transparent)],
//      border: Border.all(color: color),
//      borderRadius: BorderRadius.all(Radius.circular(radius)));
//}
//
//Widget ring(String description) {
//  return Column(
//    mainAxisAlignment: MainAxisAlignment.center,
//    children: <Widget>[
//      Container(
//        width: 100,
//        height: 100,
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(150.0),
//          border: Border.all(
//            width: 16.0,
//            color: t7colorPrimary,
//          ),
//        ),
//      ),
//      SizedBox(height: 16),
//      text(description,
//          textColor: t7textColorPrimary,
//          fontSize: textSizeNormal,
//          fontFamily: fontSemibold,
//          isCentered: true,
//          maxLine: 2)
//    ],
//  );
//}
//
//class ScrollingBehavior extends ScrollBehavior {
//  @override
//  Widget buildViewportChrome(
//      BuildContext context, Widget child, AxisDirection axisDirection) {
//    return child;
//  }
//}
//
//class Slider extends StatelessWidget {
//  final String file;
//
//  Slider({Key key, @required this.file}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
//      child: Card(
//        semanticContainer: true,
//        clipBehavior: Clip.antiAliasWithSaveLayer,
//        elevation: 0,
//        margin: EdgeInsets.all(0),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//        child: Image.asset(file, fit: BoxFit.fill),
//      ),
//    );
//  }
//}
//
//Padding settingText(
//  var text,
//) {
//  return Padding(
//    padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//    child: Text(
//      text,
//      style: TextStyle(
//        fontFamily: fontRegular,
//        color: t7textColorPrimary,
//        fontSize: textSizeMedium,
//      ),
//    ),
//  );
//}
//
//Widget divider()
//{
//  return Padding(
//    padding: const EdgeInsets.only(top: 16.0,bottom:  16),
//    child: Divider(
//      color: t7view_color,
//      height: 0.5,
//    ),
//  );
//}
