import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/config.dart';




AppBar customAppBar(){
  return AppBar(
        title: Text(Get.find<Config>().appName),
        actions: [
           IconButton(onPressed: (){
            Get.toNamed('/signin');
           }, icon:const Icon(Icons.person))
        ],
      );
}

