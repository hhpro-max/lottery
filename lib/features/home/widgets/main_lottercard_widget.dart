import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/helpers/config.dart';
import 'package:lottery/providers/app_provider.dart';

import '../../../common/widgets/custom_common_elevatedbutton.dart';

class MainLotteryCardWidget extends StatefulWidget {
  const MainLotteryCardWidget({super.key});

  @override
  State<MainLotteryCardWidget> createState() => _MainLotteryCardWidgetState();
}

class _MainLotteryCardWidgetState extends State<MainLotteryCardWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Get.find<AppProvider>().lotteries.value != null && Get.find<AppProvider>().getMainLotteryCard()!=null
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
            GestureDetector(
              onTap: (){
                Get.toNamed(Get.find<Config>().lotterycardPageRouteName,arguments: Get.find<AppProvider>().getMainLotteryCard()!);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Obx(() => Image(
                      //todo makes loadingbuilder and error builder common to use for every class (clean code)
                          // loadingBuilder: (context, child, loadingProgress) {
                          //   return const CircularProgressIndicator();
                          // },
                          // //! it is not working
                          // errorBuilder: ((context, error, stackTrace) {
                          //   error.printError();
                          //   stackTrace;
                          //   return const Icon(Icons.error);
                          // }),
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
                          onPressed: () {Get.toNamed(Get.find<Config>().lotterycardPageRouteName,arguments: Get.find<AppProvider>().getMainLotteryCard()!);}))
                ],
              ),
            ),
          ])
        : const Center(child: CircularProgressIndicator());
  }
}
