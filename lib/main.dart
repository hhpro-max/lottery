import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/features/auth/screens/sign_up_screen.dart';
import 'package:lottery/features/auth/screens/sing_in_screen.dart';
import 'package:lottery/features/home/screens/home_screen.dart';
import 'package:lottery/common/theme/custom_theme.dart';
import 'package:lottery/features/lottery/screens/lottery_card_screen.dart';
import 'package:lottery/features/lottery/screens/more_info_screen.dart';
import 'package:lottery/features/profile/screen/profile_screen.dart';
import 'package:lottery/helpers/applogger/app_logger.dart';
import 'package:lottery/helpers/config.dart';
import 'package:lottery/helpers/error_handler.dart';
import 'package:lottery/helpers/utils.dart';
import 'package:lottery/providers/app_provider.dart';
import 'package:lottery/providers/user_provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //get dependency manager
  Config config = Get.put<Config>(Config(mainDirectory: path.current));
  AppLogger appLogger = Get.put<AppLogger>(AppLogger());
  ErrHandler errHandler = Get.put<ErrHandler>(ErrHandler());
  UserProvider userProvider = Get.put<UserProvider>(UserProvider());
  AppProvider appProvider = Get.put<AppProvider>(AppProvider());
  Utils utils = Get.put<Utils>(Utils());
  appLogger.logger.i("!APP IS RUNNING!");
  //check internet connection
  if(!await connectToServer()){
    //todo work on this page
    runApp(const MaterialApp(home: Scaffold(body: Center(child: Text('connection rufuzed'),)),));
      return;
  }
  //config.initDirectory();
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: config.homePageRouteName, page: () => HomeScreen()),
      GetPage(name: config.signinPageRouteName, page: () => SigninScreen()),
      GetPage(name: config.singupPageRouteName, page: () => SignUpScreen()),
      GetPage(name: config.profilePageRouteName, page: () => ProfileScreen()),
      GetPage(
          name: config.lotterycardPageRouteName,
          page: () => LotteryCardScreen(
                lotteryCard: Get.arguments,
              )),
      GetPage(name: config.lotteryMoreInfoPageRouteName, page:()=> LotteryMoreInfoScreen(lotteryCard: Get.arguments))         

    ],
    theme: lightTheme,
    darkTheme: darkTheme,
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

Future<bool> connectToServer() async {
  try {
    await http.get(Uri.parse("${Get.find<Config>().serverUrl}/"));
    return true;
  } catch (e) {
    return false;
  }
}
