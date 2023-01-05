import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottery/helpers/config.dart';
import 'package:lottery/helpers/error_handler.dart';

class AuthServices {
  static void signIn({required String userName,required String password,required BuildContext context}) async {
    Get.find<Config>().waitingForLoginRes.value = true;
    try {
      http.Response response = await http.post(
          Uri.parse("${Get.find<Config>().serverUrl}/auth/signin"),
          body: jsonEncode({"userName": userName, "password": password}),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
          //todo 
          Get.find<ErrHandler>().httpErrHandler(response: response, onSuccess: (){}, context: context);
      Get.find<Config>().waitingForLoginRes.value = false;    
    } catch (e) {
      Get.find<Config>().waitingForLoginRes.value = false;
    }
  }
}
