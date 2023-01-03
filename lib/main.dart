import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/features/home/screens/home_screen.dart';
import 'package:lottery/common/theme/custom_theme.dart';

void main() {
  runApp(GetMaterialApp(
    theme: lightTheme,
    darkTheme: darkTheme,
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

