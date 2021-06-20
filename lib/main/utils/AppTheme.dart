import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppColors.dart';

class AppThemeData {
  //
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: appColorPrimary,
    primaryColorDark: appColorPrimary,
    errorColor: Colors.red,
    hoverColor: Colors.grey,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: appLayout_background,
      iconTheme: IconThemeData(color: textPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: appColorPrimary,
      primaryVariant: appColorPrimary,
    ),
    cardTheme: CardTheme(color: Colors.white),
    iconTheme: IconThemeData(color: textPrimaryColor),
    textTheme: TextTheme(
      button: TextStyle(color: appColorPrimary),
      headline6: TextStyle(color: textPrimaryColor),
      subtitle2: TextStyle(color: textSecondaryColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColorDark,
    highlightColor: appBackgroundColorDark,
    errorColor: Color(0xFFCF6676),
    appBarTheme: AppBarTheme(
        color: appBackgroundColorDark,
        iconTheme: IconThemeData(color: whiteColor)),
    primaryColor: color_primary_black,
    accentColor: whiteColor,
    dividerColor: Color(0xFFDADADA),
    primaryColorDark: color_primary_black,
    hoverColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryTextTheme: TextTheme(
      headline6: primaryTextStyle(color: Colors.white),
      overline: primaryTextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme.light(
      primary: appBackgroundColorDark,
      onPrimary: cardBackgroundBlackDark,
      primaryVariant: color_primary_black,
    ),
    cardTheme: CardTheme(color: cardBackgroundBlackDark),
    iconTheme: IconThemeData(color: whiteColor),
    textTheme: TextTheme(
      button: TextStyle(color: color_primary_black),
      headline6: TextStyle(color: whiteColor),
      subtitle2: TextStyle(color: Colors.white54),
    ),
  );
}
