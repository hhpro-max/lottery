import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/features/auth/screens/sign_up_screen.dart';
import 'package:lottery/features/auth/screens/sing_in_screen.dart';
import 'package:lottery/features/home/screens/home_screen.dart';
import 'package:lottery/common/theme/custom_theme.dart';
import 'package:lottery/features/profile/screen/profile_screen.dart';
import 'package:lottery/helpers/applogger/app_logger.dart';
import 'package:lottery/helpers/config.dart';
import 'package:lottery/helpers/error_handler.dart';
import 'package:lottery/providers/user_provider.dart';
import 'package:path/path.dart' as path;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config config = Get.put<Config>(Config(mainDirectory: path.current));
  AppLogger appLogger = Get.put<AppLogger>(AppLogger());
  ErrHandler errHandler = Get.put<ErrHandler>(ErrHandler());
  UserProvider userProvider = Get.put<UserProvider>(UserProvider());
  appLogger.logger.i("!APP IS RUNNING!");
  //config.initDirectory();
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: config.homePageRouteName, page: ()=>HomeScreen()),
      GetPage(name: config.signinPageRouteName, page: ()=>SigninScreen()),
      GetPage(name: config.singupPageRouteName, page: ()=>SignUpScreen()),
      GetPage(name: config.profilePageRouteName, page: ()=>ProfileScreen())
    ],
    theme: lightTheme,
    darkTheme: darkTheme,
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

