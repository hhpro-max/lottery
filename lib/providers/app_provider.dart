import 'package:flutter/material.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:get/get.dart';
class AppProvider{
  var lotteries = (null as List<LotteryCard>?).obs;
  Color findLotteryColor(LotteryCard lotteryCard) {
    switch (lotteryCard.images['mainColor']) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      default:  
          return Colors.black;
    }
  }
  LotteryCard? getMainLotteryCard(){
    if(lotteries.value!=null){
      for (LotteryCard lottery in lotteries.value!) {
        if(lottery.isMain == 1){
          return lottery;
        }
      }
    }
    return null;
  }
}