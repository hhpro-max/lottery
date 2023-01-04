

import 'package:get/get.dart';

class Config{
  String appName = "lottery";
  //app path
  String mainDirectory;
  //route names
  String homePageRouteName = '/';
  String signinPageRouteName = '/signin';
  //server connection configs
  String serverUrl = "http://localhost:3000";
  var waitingForLoginRes = false.obs;

  Config({required this.mainDirectory});
}