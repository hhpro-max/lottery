import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_appbar.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/models/lottery_slip.dart';
import 'package:lottery/providers/app_provider.dart';

enum PayMentMethod { crypto, credit }

class LotteryPaymentScreen extends StatefulWidget {
  final LotteryCard lotteryCard;
  final LotterySlip lotterySlip;
  const LotteryPaymentScreen(
      {super.key, required this.lotteryCard, required this.lotterySlip});

  @override
  State<LotteryPaymentScreen> createState() => _LotteryPaymentScreenState();
}

class _LotteryPaymentScreenState extends State<LotteryPaymentScreen> {
  PayMentMethod _payMentMethod = PayMentMethod.crypto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCommonAppBar(
          titleText: '${widget.lotteryCard.lotteryName} payment'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YOU CAN PAY WITH WHAT EVER YOU WANT',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Just Choose In Witch Way You Can Pay Easier',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'We Support Wide Range Of Crypto\'s And Credit\'s',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 9 / 10,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Get.find<AppProvider>()
                        .findLotteryColor(widget.lotteryCard),
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lottery Name : ${widget.lotteryCard.lotteryName}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "lottery ID : ${widget.lotteryCard.id}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Choosen Numbers : ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: widget.lotterySlip.numbers.length,
                        itemBuilder: (context, index) {
                          int slipNumberIndex = index;
                          return Column(
                            children: [
                              SizedBox(
                                height: 45,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget
                                        .lotterySlip.numbers[index].length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          index == 0
                                              ? const Icon(
                                                  Icons.navigate_before)
                                              : Container(),
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Container(
                                                width: 45,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    color: Get.isDarkMode
                                                        ? Colors.black
                                                        : Colors.white),
                                                child: Center(
                                                  child: Text(
                                                    widget
                                                        .lotterySlip
                                                        .numbers[
                                                            slipNumberIndex]
                                                            [index]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.cyan),
                                                  ),
                                                ),
                                              )),
                                          index ==
                                                  widget
                                                          .lotterySlip
                                                          .numbers[
                                                              slipNumberIndex]
                                                          .length -
                                                      1
                                              ? const Icon(Icons.navigate_next)
                                              : const Text(
                                                  "-",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                        ],
                                      );
                                    }),
                              ),
                              const Divider()
                            ],
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text('Please choose payment method',style: Theme.of(context).textTheme.headlineSmall,),
                    ListTile(
                     
                      title: const Text('Crypto',style: TextStyle(fontWeight: FontWeight.bold),),
                      leading: Radio(value: PayMentMethod.crypto, groupValue: _payMentMethod, onChanged: (PayMentMethod? val){
                        setState(() {
                          _payMentMethod = val!;
                        });
                      }),
                    ),
                    //todo complete here soon
                    _payMentMethod == PayMentMethod.crypto ? Container(color: Colors.yellow,height: 40,):const SizedBox(height: 10,),
                    ListTile(
                      title: const Text('Credit Card',style: TextStyle(fontWeight: FontWeight.bold),),
                      leading: Radio(value: PayMentMethod.credit, groupValue: _payMentMethod, onChanged: (PayMentMethod? val){
                        setState(() {
                          _payMentMethod = val!;
                        });
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
