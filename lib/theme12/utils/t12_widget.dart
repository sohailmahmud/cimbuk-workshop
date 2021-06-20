import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/dashboard/utils/DbExtension.dart';
import 'package:prokit_flutter/theme12/models/T12Models.dart';
import 'package:prokit_flutter/theme12/utils/t12_colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/theme12/utils/t12_corousel_widget.dart';
import 'package:prokit_flutter/theme12/utils/t12_images.dart';

import 't12_constant.dart';

Widget text(var text,
    {var fontSize = textSizeLargeMedium, textColor = t12_text_secondary, var fontFamily = fontRegular, var isCentered = false, var maxLine = 1, var latterSpacing = 0.1, overflow: Overflow}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: textColor, height: 1.5, letterSpacing: latterSpacing));
}
Widget toolBarTitle(var title,{textColor=t12_text_color_primary}){
  return text(title,fontSize: textSizeNormal,fontFamily: fontBold,textColor: textColor);
}
BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color bgColor = Colors.white, var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}
Widget themeLogo(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset(t12_ic_logo,width: 30,height: 30,),
      text("Werolla",fontSize: textSizeLarge,fontFamily: fontBold,textColor: t12_text_color_primary).paddingLeft(spacing_standard_new)
    ],
  );
}

Widget formField( context,hint,
    {isEnabled = true,
      isDummy = false,
      controller,
      isPasswordVisible = false,
      isPassword = false,
      keyboardType = TextInputType.text,
      FormFieldValidator<String> validator,
      onSaved,
      textInputAction = TextInputAction.next,
      FocusNode focusNode,
      FocusNode nextFocus,
      IconData suffixIcon,
      IconData prefixIcon,
      maxLine = 1,
      suffixIconSelector}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword?isPasswordVisible:false,
    cursorColor: t12_primary_color,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(spacing_standard),
        borderSide: BorderSide(color: Colors.transparent)

      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(spacing_standard),
          borderSide: BorderSide(color: Colors.transparent)

      ),
      filled: true,
      fillColor: t12_edittext_background,
      hintText:hint,
      hintStyle: TextStyle(
          fontSize: textSizeMedium, color: t12_text_secondary),
      prefixIcon:Icon(
        prefixIcon,
        color: t12_text_secondary,
        size: 20,
      ) ,
      suffixIcon: isPassword
          ? GestureDetector(
        onTap: suffixIconSelector,
        child: new Icon(
          suffixIcon,
          color: t12_text_secondary,
          size: 20,
        ),
      )
          : Icon(
        suffixIcon,
        color: t12_text_secondary,
        size: 20,
      ),
    ),
    style: TextStyle(
        fontSize: textSizeNormal,
        color: isDummy
            ? Colors.transparent
            : t12_text_color_primary,
        fontFamily: fontRegular),
  );
}

//-------------------------------------------Button-------------------------------------------------------------------------
/*
SizedBox buttonStyle(var text) {
  return SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        textColor: t11_WhiteColor,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
        color: t11_PrimaryColor,
        onPressed: () => {},
      ));
}*/
Widget appBar(context,var title,{actions}){
  return AppBar(
    title: toolBarTitle(title),
    leading: Icon(Icons.arrow_back_ios).onTap((){
      Navigator.pop(context);
    }),
    titleSpacing:0,
    iconTheme: IconThemeData(color: t12_text_color_primary),
    backgroundColor: Colors.white.withOpacity(0.1),
    elevation: 0,
    actions: actions,
  );
}
class T12SliderWidget extends StatelessWidget {
  List<T12Slider> mSliderList;
  var callBack;
  T12SliderWidget(this.mSliderList,this.callBack);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width*(9/16));
    return T12CarouselSlider.builder(
      viewportFraction: 0.92,
      height: cardSize.height,
      enlargeCenterPage: true,
      onPageChanged: callBack,
      itemCount: mSliderList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: cardSize.height,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: t12_gradient_colors[index%t12_gradient_colors.length],begin:Alignment.topRight ),
                      borderRadius: BorderRadius.all(Radius.circular(spacing_standard))
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: cardSize.height,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          text("Shopping Card",textColor: Colors.white.withOpacity(0.7),fontSize: textSizeMedium),
                          Image.asset("images/theme12/mastercard.png",width: 40,height: 40,)
                        ],
                      ),
                      Expanded(child: text("**** **** **** 3960",textColor: Colors.white,fontFamily: fontBold,fontSize: textSizeNormal).paddingTop(spacing_standard)),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("CARD HOLDER",textColor: Colors.white.withOpacity(0.7),fontSize: textSizeMedium),
                                text("JAMES DENNIS",textColor: Colors.white,fontSize: textSizeMedium,fontFamily: fontMedium),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text("EXPIRES",textColor: Colors.white.withOpacity(0.7),fontSize: textSizeMedium),
                              text("10/22",textColor: Colors.white,fontSize: textSizeMedium,fontFamily: fontMedium),
                            ],
                          ).paddingRight(spacing_standard_new),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text("CVV",textColor: Colors.white.withOpacity(0.7),fontSize: textSizeMedium),
                              text("***",textColor: Colors.white,fontSize: textSizeMedium,fontFamily: fontMedium),
                            ],
                          )
                        ],
                      )
                    ],
                  ).paddingAll(spacing_standard_new)

                ],
              ),
            );
      }
    );
  }
}
Widget headingText(String content) {
  return text(content, textColor: t12_text_color_primary, fontFamily: fontBold, fontSize: textSizeNormal);
}
Widget transactionWidget(T12Transactions transaction,var categoryWidth){
  return Container(
    decoration: boxDecoration(showShadow: true,radius: spacing_standard),
    padding: EdgeInsets.all(spacing_standard),
    margin: EdgeInsets.only(bottom: spacing_standard),
    child: Row(
      children: <Widget>[
        Image.asset(transaction.img,width:categoryWidth*0.75,height: categoryWidth*0.75,).cornerRadiusWithClipRRect(spacing_standard).paddingRight(spacing_standard),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text(transaction.type,fontSize: textSizeMedium,textColor: t12_text_color_primary,fontFamily: fontMedium),
              text(transaction.subType,fontSize: textSizeMedium,textColor: t12_text_secondary).paddingTop(spacing_control_half),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            text(transaction.transactionType=="credited"?"+ \$"+ transaction.amount.toString():"- \$"+ transaction.amount.toString(),fontSize: textSizeMedium,textColor:transaction.transactionType=="credited"?t12_success:t12_error ,fontFamily: fontBold),
            text(transaction.time,fontSize: textSizeMedium,textColor: t12_text_secondary).paddingTop(spacing_control)
          ],
        )
      ],
    ),
  );
}