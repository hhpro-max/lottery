import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/features/auth/screens/sing_in_screen.dart';
import 'package:lottery/features/home/screens/home_screen.dart';
import 'package:lottery/common/theme/custom_theme.dart';
import 'package:lottery/helpers/config.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: Config.homePageRouteName, page: ()=>HomeScreen()),
      GetPage(name: Config.signinPageRouteName, page: ()=>SigninScreen())
    ],
    theme: lightTheme,
    darkTheme: darkTheme,
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

