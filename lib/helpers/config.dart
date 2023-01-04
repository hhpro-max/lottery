import 'dart:io';

import 'package:get/get.dart';

class Config{
  String appName = "lottery";
  var theme = Get.isDarkMode.obs;
  
//app path
  String mainDirectory;
  //route names
  String homePageRouteName = '/';
  String signinPageRouteName = '/signin';
  //server connection configs
  String serverUrl = "http://localhost:3000";

  Config({required this.mainDirectory});
}