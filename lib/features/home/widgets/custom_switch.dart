
import 'package:flutter/material.dart';
import 'package:get/get.dart';



Switch customSwitch = Switch(value: Get.isDarkMode,onChanged: (val){
  Get.isDarkMode?Get.changeThemeMode(ThemeMode.light):Get.changeThemeMode(ThemeMode.dark);
},);