// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottery/common/widgets/custom_common_appbar.dart';
import 'package:lottery/features/lottery/widgets/lottery_bot_info.dart';
import 'package:lottery/features/lottery/widgets/lottery_top_info.dart';
import 'package:lottery/features/lottery/widgets/lottery_play.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/providers/app_provider.dart';

class LotteryCardScreen extends StatefulWidget {
  LotteryCard lotteryCard;
  LotteryCardScreen({
    Key? key,
    required this.lotteryCard,
  }) : super(key: key);

  @override
  State<LotteryCardScreen> createState() => _LotteryCardScreenState();
}

class _LotteryCardScreenState extends State<LotteryCardScreen> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: customCommonAppBar(titleText: widget.lotteryCard.lotteryName),
      body: Stack(children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Get.find<AppProvider>()
                    .findLotteryColor(widget.lotteryCard)),
          ),
        ),
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                
                LotteryTopInfo(lotteryCard: widget.lotteryCard),
                const SizedBox(height: 20,),
                LotteryPlay(lotteryCard: widget.lotteryCard),
                const SizedBox(height: 20,),
                LotteryBotInfo(lotteryCard: widget.lotteryCard)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
