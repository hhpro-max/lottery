import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/config.dart';




AppBar customAppBar(){
  return AppBar(
        title: Text(Config.appName),
        actions: [
           //todo
        ],
      );
}

