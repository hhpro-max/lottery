import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/providers/app_provider.dart';

import '../../../common/widgets/custom_common_elevatedbutton.dart';

class MainLotteryCardWidget extends StatefulWidget {
  MainLotteryCardWidget({super.key});

  @override
  State<MainLotteryCardWidget> createState() => _MainLotteryCardWidgetState();
}

class _MainLotteryCardWidgetState extends State<MainLotteryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Get.find<AppProvider>().lotteries.value != null
        ? Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.7,
              child: Container( height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Get.find<AppProvider>().findLotteryColor(
                      Get.find<AppProvider>().getMainLotteryCard()!),
                      borderRadius: BorderRadius.circular(20)
                      ),),
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Obx(() => Image(
                        image: NetworkImage(Get.find<AppProvider>()
                            .getMainLotteryCard()!
                            .images['main']),
                      )),
                ),
                Positioned(
                    bottom: 20,
                    left: 10,
                    child: customCommonElevatedButton(
                        title:
                            'play for ${Get.find<AppProvider>().getMainLotteryCard()!.price}\$',
                        onPressed: () {}))
              ],
            ),
          ])
        : const Center(child: CircularProgressIndicator());
  }
}
