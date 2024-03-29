import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottery/helpers/applogger/app_logger.dart';
import 'package:lottery/helpers/config.dart';
import 'package:lottery/helpers/error_handler.dart';
import 'package:lottery/models/user.dart';
import 'package:lottery/providers/user_provider.dart';

class AuthServices {
  static void signIn(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    Get.find<Config>().waitingForResponse.value = true;
    try {
      http.Response response = await http.post(
          Uri.parse("${Get.find<Config>().serverUrl}/auth/signin"),
          body: jsonEncode({"userName": userName, "password": password}),
          headers: Get.find<UserProvider>().headers);
      Get.find<ErrHandler>().httpErrHandler(
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              Get.offNamed('/profile');
            }, child: const Text("OK"))
          ],
          response: response,
          onSuccess: () async {
            await Get.find<UserProvider>().setToken(jsonDecode(response.body)['token']);
            Get.find<UserProvider>().setUser(response.body);
            //logging
            Get.find<AppLogger>().logger.i(
                "user signed in successfuly -> ${Get.find<UserProvider>().user.toJson()} // with token ${Get.find<UserProvider>().token}");
          },
          context: context,
          
          );
      Get.find<Config>().waitingForResponse.value = false;
    } catch (e) {
      Get.find<Config>().waitingForResponse.value = false;
      //logging
      Get.find<AppLogger>()
          .logger
          .wtf("error in singin method in authservices -> \n $e");
      e.printError();
    }
  }

  static void signUp(
      {required String userName,
      required String email,
      required String password,
      required BuildContext context}) async {
    Get.find<Config>().waitingForResponse.value = true;
    try {
      User user = User(
          id: "",
          userName: userName,
          email: email,
          password: password,
          cart: []);
      http.Response response = await http.post(
          Uri.parse("${Get.find<Config>().serverUrl}/auth/signup"),
          body: user.toJson(),
          headers: Get.find<UserProvider>().headers);
      Get.find<ErrHandler>().httpErrHandler(
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              Get.offNamed('/profile');
            }, child: const Text("OK"))
          ],
          response: response, onSuccess: () async{
            await Get.find<UserProvider>().setToken(jsonDecode(response.body)['token']);
            Get.find<UserProvider>().setUser(response.body);
            //logging
            Get.find<AppLogger>().logger.i(
                "user signed up successfuly -> ${Get.find<UserProvider>().user.toJson()} // with token ${Get.find<UserProvider>().token}");
          }, context: context);
      Get.find<Config>().waitingForResponse.value = false;
    } catch (e) {
      Get.find<Config>().waitingForResponse.value = false;
      //logging
      Get.find<AppLogger>()
          .logger
          .wtf("error in singup method in authservices -> \n $e");
      e.printError();
    }
  
  }
}
