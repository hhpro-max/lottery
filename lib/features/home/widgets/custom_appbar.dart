import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/providers/user_provider.dart';
import '../../../helpers/config.dart';




AppBar customAppBar(){
  return AppBar(
        title: Text(Get.find<Config>().appName),
        actions: [
           IconButton(onPressed: (){
            if(Get.find<UserProvider>().user.id.isEmpty){
              Get.toNamed('/signin');
            }else{
              Get.toNamed('/profile');
            }
           }, icon:const Icon(Icons.person))
        ],
      );
}

