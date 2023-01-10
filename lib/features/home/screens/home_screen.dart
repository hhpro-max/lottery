import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_elevatedbutton.dart';
import 'package:lottery/features/home/services/home_services.dart';
import 'package:lottery/features/home/widgets/custom_appbar.dart';
import 'package:lottery/features/home/widgets/custom_drawer.dart';
import 'package:lottery/features/home/widgets/main_lottercard_widget.dart';
import 'package:lottery/helpers/config.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/providers/app_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchLotteries() async {
    Get.find<AppProvider>().lotteries.value = await HomeServices.getLotteries();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchLotteries();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            //todo complete this
            children: [
              MainLotteryCardWidget()
            ],
          ),
        ),
      ),
    );
  }
}
