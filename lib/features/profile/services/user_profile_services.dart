

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/helpers/error_handler.dart';

import 'package:lottery/providers/user_provider.dart';
import 'package:http/http.dart' as http;

import '../../../helpers/config.dart';
class UserProfileServices{
  static void logout({required BuildContext context})async{
    Get.find<Config>().waitingForResponse.value = true;
    http.Response response = await http.post(Uri.parse("${Get.find<Config>().serverUrl}/auth/logout"),
    headers: Get.find<UserProvider>().headers,
    );
    
    Get.find<ErrHandler>().httpErrHandler(response: response, onSuccess: ()async{
        await Get.find<UserProvider>().setToken('');
        Get.find<UserProvider>().reSetUser();
    }, context: context,
    actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              Get.offAllNamed('/');
            }, child: const Text("OK"))
          ],
    );
    Get.find<Config>().waitingForResponse.value = false;
  }
}