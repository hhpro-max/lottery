// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottery/models/lottery_card.dart';

class LotteryInfo extends StatefulWidget {
  final LotteryCard lotteryCard;
  const LotteryInfo({
    Key? key,
    required this.lotteryCard,
  }) : super(key: key);

  @override
  State<LotteryInfo> createState() => _LotteryInfoState();
}

class _LotteryInfoState extends State<LotteryInfo> {
  Timer? countDownTimer;
  Duration? duration;

  @override
  void initState() {
    super.initState();
    List<String> lDate =
        widget.lotteryCard.descriptions['finishTime'].toString().split(" ");
    int years = int.parse(lDate[0].split("-")[0]) - DateTime.now().year;
    int months = int.parse(lDate[0].split("-")[1]) - DateTime.now().month;
    int days = (int.parse(lDate[0].split("-")[2]) - DateTime.now().day) +
        (months * 30) +
        (years * 365);
    int hours = int.parse(lDate[1].split(":")[0]) - DateTime.now().hour;
    int minutes = int.parse(lDate[1].split(":")[1]) - DateTime.now().minute;
    int seconds = int.parse(lDate[1].split(":")[2]) - DateTime.now().second;
    duration =
        Duration(days: days, hours: hours, minutes: minutes, seconds: seconds);
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      const reduceSecondsBy = 1;
      setState(() {
        final seconds = duration!.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countDownTimer!.cancel();
        } else {
          duration = Duration(seconds: seconds);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    countDownTimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(duration!.inDays);
    final hours = strDigits(duration!.inHours.remainder(24));
    final minutes = strDigits(duration!.inMinutes.remainder(60));
    final seconds = strDigits(duration!.inSeconds.remainder(60));
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(widget.lotteryCard.descriptions['main'],
          style: Theme.of(context).textTheme.headlineLarge),
        
      Text(
        widget.lotteryCard.descriptions['info'],
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      const SizedBox(height: 20,), 
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Get.isDarkMode?Colors.black:Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'game close in : ', 
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 5,),
            Center(
              child: Text(
                "$days days and $hours:$minutes:$seconds",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
