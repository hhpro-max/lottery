// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_elevatedbutton.dart';

import 'package:lottery/models/lottery_card.dart';

class LotteryPlay extends StatefulWidget {
  final LotteryCard lotteryCard;
  const LotteryPlay({
    Key? key,
    required this.lotteryCard,
  }) : super(key: key);

  @override
  State<LotteryPlay> createState() => _LotteryPlayState();
}

class _LotteryPlayState extends State<LotteryPlay> {
  int itemCount = 2;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shadowColor: Colors.red,
      borderRadius: BorderRadius.circular(12),
      color: Get.isDarkMode?Colors.white:Colors.black,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Play ${widget.lotteryCard.lotteryName}',style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 10,),
            Text('    ${widget.lotteryCard.descriptions['how']}',style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 20,),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itemCount, itemBuilder: (context, index){
              return Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    customCommonElevatedButton(title: "LUCKY DIP",onPressed: (){}),
                    
                  ],
                ),
              );
            } )
          ],
        ),
      ),
    );
  }
}