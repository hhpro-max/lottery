import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/providers/app_provider.dart';

class LotteryWinRules extends StatelessWidget {
  final LotteryCard lotteryCard;

  const LotteryWinRules({super.key, required this.lotteryCard});
  Widget getRuleNumText(int index) {
    List<String> ruleNameList =
        (lotteryCard.rules.keys.elementAt(index) as String).split('.');
    if (ruleNameList.length == 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${ruleNameList[0]} Main Numbers"),
          Text("plus ${ruleNameList[1]} bonus ball"),
        ],
      );
    } else {
      return Text("${ruleNameList[0]} Main Numbers");
    }
  }
  Widget getRuleBalls(int index){
    List<String> ruleNameList = lotteryCard.rules.keys.elementAt(index).toString().split('.');
    if(ruleNameList.length==2){
      return SizedBox(
                        height: 25,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: int.parse(ruleNameList[0]) + int.parse(ruleNameList[1]),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Get.find<AppProvider>()
                                          .findLotteryColor(lotteryCard)),
                                  child: index>=int.parse(ruleNameList[0])? Icon(Icons.star,color: Colors.yellow[200],):Center(child: Text((index+1).toString())),
                                ),
                              );
                            }),
                      );
    }else{
      return SizedBox(
                        height: 25,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: int.parse(ruleNameList[0]),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Get.find<AppProvider>()
                                          .findLotteryColor(lotteryCard)),
                                          child: Center(child: Text((index+1).toString())),
                                ),
                                
                              );
                            }),
                      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.red[900]
      ),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: lotteryCard.rules.length,
          itemBuilder: (context, index) {
            var keyVal = lotteryCard.rules.keys.elementAt(index);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: getRuleNumText(index)),
                      Expanded(
                          child: getRuleBalls(index)),
                      Expanded(child: Text(lotteryCard.rules[keyVal],textDirection: TextDirection.rtl,)),
                    ],
                  ),
                  const Divider()
                ],
              ),
            );
          }),
    );
  }
}
