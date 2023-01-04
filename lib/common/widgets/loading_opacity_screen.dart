import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingOpacityScreen extends StatelessWidget {
  const LoadingOpacityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      
      child: Opacity(
        opacity: 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Get.isDarkMode?Colors.white:Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: Center(
            child: CircularProgressIndicator(color: Get.isDarkMode?Colors.black:Colors.white),
          ),
        ),
      ),
    );
  }
}