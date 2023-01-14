import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottery/features/lottery/widgets/lottery_win_rules.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/providers/app_provider.dart';

import '../../../common/widgets/custom_common_elevatedbutton.dart';

class LotteryBotInfo extends StatefulWidget {
  final LotteryCard lotteryCard;
  const LotteryBotInfo({super.key, required this.lotteryCard});

  @override
  State<LotteryBotInfo> createState() => _LotteryBotInfoState();
}

class _LotteryBotInfoState extends State<LotteryBotInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        SizedBox(
          
          width: 500,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: NetworkImage(widget.lotteryCard.images['info']),
                        ),
                      ),
                      Positioned(
                          bottom: 20,
                          right: 10,
                          child: customCommonElevatedButton(
                              title: 'more info', onPressed: () {}))
                    ],
                  ),
                ],
              ),
              Row(
               
                children: [
                  Container(
                    
                    height: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    color: Get.find<AppProvider>().findLotteryColor(widget.lotteryCard)
                    ),
                    child: Center(child: Text(widget.lotteryCard.descriptions['moreInfo'])),
                  ),
                  Expanded(child: Container())
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        LotteryWinRules(lotteryCard: widget.lotteryCard)
      ],
    );
  }
}
