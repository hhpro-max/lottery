import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottery/helpers/config.dart';

class AuthServices {
  static void signIn(String userName, String password) async {
    Get.find<Config>().waitingForLoginRes.value = true;
    try {
      http.Response response = await http.post(
          Uri.parse("${Get.find<Config>().serverUrl}/signin"),
          body: jsonEncode({"userName": userName, "password": password}),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
          //todo 
      Get.find<Config>().waitingForLoginRes.value = false;    
    } catch (e) {
      Get.find<Config>().waitingForLoginRes.value = false;
    }
  }
}
