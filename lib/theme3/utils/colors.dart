import 'dart:ui';

import 'package:flutter/material.dart';

const t3_colorPrimary = Color(0XFFfc4a1a);
const t3_colorPrimaryDark = Color(0XFFf7b733);
const t3_colorAccent = Color(0XFFf7b733);

const t3_textColorPrimary = Color(0XFF333333);
const t3_textColorSecondary = Color(0XFF9D9D9D);

const t3_app_background = Color(0XFFf8f8f8);
const t3_view_color = Color(0XFFDADADA);
const t3_gray = Color(0XFFF4F4F4);

const t3_red = Color(0XFFF12727);
const t3_green = Color(0XFF8BC34A);
const t3_edit_background = Color(0XFFF5F4F4);
const t3_light_gray = Color(0XFFCECACA);
const t3_tint = Color(0XFFF4704C);
const t3_colorPrimary_light = Color(0XFFF36F4B);
const t3_orange = Color(0XFFF13E0A);

const t3_white = Color(0XFFffffff);
const t3_black = Color(0XFF000000);
const t3_icon_color = Color(0XFF747474);

const t3_shadow = Color(0X70E2E2E5);
var t3White = materialColor(0XFFFFFFFF);
const shadow_color = Color(0X95E9EBF0);

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0XFF5959fc, color);
