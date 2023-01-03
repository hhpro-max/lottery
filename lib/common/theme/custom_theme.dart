import 'package:flutter/material.dart';
import 'package:lottery/common/theme/custom_colors.dart';
import 'package:lottery/common/theme/custom_text_theme.dart';

//* initial light theme
ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    color: CustomColors.ltBackGround1,
    titleTextStyle: TextStyle(color: CustomColors.ltCommonWidget1),
    iconTheme: IconThemeData(color: CustomColors.ltCommonWidget1)
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: CustomColors.ltBackGround1,
  ),
  scaffoldBackgroundColor: CustomColors.ltBackGround2,
  textTheme: customTextTheme(),
  dividerColor: CustomColors.ltCommonWidget1,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: CustomColors.ltTextButton
    )
  ),
);
// initial dark theme
ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    color: CustomColors.dtBackGround1,
    titleTextStyle: TextStyle(color: CustomColors.dtCommonWidget1),
    iconTheme: IconThemeData(color: CustomColors.dtCommonWidget1)
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: CustomColors.dtBackGround1
  ),
  scaffoldBackgroundColor: CustomColors.dtBackGround2,
  textTheme: customTextTheme(),
  dividerColor: CustomColors.dtCommonWidget1,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: CustomColors.ltTextButton
    )
  ),
);