import 'package:flutter/material.dart';

AppBar customCommonAppBar({
  Widget? customTitle,
  String? titleText,
  List<Widget>? actions,
}){
  return AppBar(
      title: customTitle??Text(titleText??"no title"),
      actions: actions,
      
  );
}