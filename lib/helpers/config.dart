

import 'package:get/get.dart';

class Config{
  String appName = "lottery";
  //app path
  String mainDirectory;
  //route names
  String homePageRouteName = '/';
  String signinPageRouteName = '/signin';
  String singupPageRouteName= '/signup';
  String profilePageRouteName = '/profile';
  String lotterycardPageRouteName = '/lottery';
  String lotteryMoreInfoPageRouteName = '/moreinfo';
  //server connection configs
  String serverUrl = "http://localhost:3000";
  var waitingForSigninRes = false.obs;
  var waitingForSignupRes = false.obs;
  Config({required this.mainDirectory});
}