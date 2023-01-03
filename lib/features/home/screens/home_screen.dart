import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/features/home/widgets/custom_appbar.dart';
import 'package:lottery/features/home/widgets/custom_drawer.dart';
import 'package:lottery/helpers/config.dart';

class HomeScreen
 extends StatelessWidget {
  const HomeScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: customDrawer(),
      appBar: customAppBar(),
      body: Container(),
    );
  }
}