import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_appbar.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/providers/app_provider.dart';

import '../widgets/lottery_win_rules.dart';

class LotteryMoreInfoScreen extends StatelessWidget {
  final LotteryCard lotteryCard;
  const LotteryMoreInfoScreen({super.key, required this.lotteryCard});
  Widget getStep({required String text}) {
    return Expanded(
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
            color: Get.find<AppProvider>().findLotteryColor(lotteryCard)),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCommonAppBar(titleText: lotteryCard.lotteryName),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(lotteryCard.descriptions['explanation'],style: Theme.of(context).textTheme.headlineSmall,),
          ),
          Row(
            children: [
              getStep(text: lotteryCard.descriptions['rules']['step1']),
              getStep(text: lotteryCard.descriptions['rules']['step2']),
              getStep(text: lotteryCard.descriptions['rules']['step3'])
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              getStep(text: lotteryCard.descriptions['drawDate']),
              getStep(text: "if you won the lottery we will email you"),
              getStep(text: 'you can always check result in our site')
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          LotteryWinRules(lotteryCard: lotteryCard)
        ],
      ),
    );
  }
}
