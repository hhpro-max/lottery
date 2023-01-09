import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/features/home/services/home_services.dart';
import 'package:lottery/features/home/widgets/custom_appbar.dart';
import 'package:lottery/features/home/widgets/custom_drawer.dart';
import 'package:lottery/helpers/config.dart';
import 'package:lottery/providers/app_provider.dart';

class HomeScreen
 extends StatelessWidget {
  const HomeScreen
  ({super.key});
  void fetchLotteries()async{
    Get.find<AppProvider>().lotteries.value = await HomeServices.getLotteries();
  }
  @override
  Widget build(BuildContext context) {
    fetchLotteries();
    return Scaffold(
      drawer: customDrawer(),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            //todo complete this
            children: [
              Row(
                
                children: [Expanded(child: Opacity(
                  opacity: 0.7,
                  child: Container(
                  height: 200,
                  
                  color: Get.find<AppProvider>().lotteries.value!=null? Get.find<AppProvider>().lotteries.value![0].images['mainColor']=='green'?Colors.green:Colors.white:Colors.red,
                  child: Get.find<AppProvider>().lotteries.value!=null?Image(image: NetworkImage(Get.find<AppProvider>().lotteries.value![0].images['main']),fit: BoxFit.fitHeight):CircularProgressIndicator(),
                              ),
                )),
              Expanded(child: Container())
              ],
              )
            ],
          ),
        ),
      ),
    );
  }
}