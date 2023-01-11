import 'package:flutter/material.dart';
import 'package:lottery/common/theme/custom_colors.dart';

TextTheme customLtTextTheme(){
  return TextTheme(
    //todo 
    headlineLarge: TextStyle(color: CustomColors.ltCommonWidget1,fontWeight: FontWeight.bold),
    bodyText1: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
    bodyText2: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
  );
}

TextTheme customDtTextTheme(){
  return TextTheme(
    //todo 
    headlineLarge: TextStyle(color: CustomColors.dtCommonWidget1,fontWeight: FontWeight.bold),
   bodyText1: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
    bodyText2: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
    
  );
}