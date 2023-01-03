
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/helpers/config.dart';

Switch customSwitch = Switch(value: Config.theme.value,onChanged: (val){
  Get.isDarkMode?Get.changeThemeMode(ThemeMode.light):Get.changeThemeMode(ThemeMode.dark);
},);