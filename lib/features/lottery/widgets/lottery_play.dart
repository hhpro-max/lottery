import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_elevatedbutton.dart';

import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/models/lottery_slip.dart';
import 'package:lottery/providers/app_provider.dart';

import 'choose_number_page.dart';

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
  int itemCount = 1;
  int numberCount = 1;
  int slipIndex = 0;
  int slipNumberIndex = 0;

  List<Map> numbers = [];
  List<LotterySlip?> slips = [];
  @override
  void initState() {
    super.initState();
    itemCount = Get.find<AppProvider>().choosenNumbersList.length+1;
    slips = Get.find<AppProvider>().choosenNumbersList;
    numberCount = widget.lotteryCard.numberCount;
    numbers = List.generate(widget.lotteryCard.numberRange,
        (index) => {"number": index + 1, "isChoosen": false});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shadowColor: Colors.red,
      borderRadius: BorderRadius.circular(12),
      color: Get.isDarkMode ? Colors.white : Colors.black,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Play ${widget.lotteryCard.lotteryName}',
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(
              height: 10,
            ),
            Text('    ${widget.lotteryCard.descriptions['how']}',
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  slipNumberIndex = index;
                  return Container(
                    margin: const EdgeInsets.all(8),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customCommonElevatedButton(
                              title: "LUCKY DIP", onPressed: () {}),
                        ),
                        Text(
                          "Or",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customCommonElevatedButton(
                              title: "CHOOSE $numberCount NUMBERS",
                              onPressed: () {
                                showChooseNumberPage(
                                  lotteryId: widget.lotteryCard.id,
                                    context: context,
                                    numberCount: numberCount,
                                    choosenColor: Get.find<AppProvider>()
                                        .findLotteryColor(widget.lotteryCard),
                                    numbers: numbers).then((_)=>setState((){itemCount = Get.find<AppProvider>().choosenNumbersList[slipIndex].numbers.length+1;}));
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.all(12),
                          height: 45,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: numberCount,
                              itemBuilder: (context, index) {
                                return TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                    shape: const CircleBorder(),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: (slips.length <= slipIndex ||
                                            slips[slipIndex]!.numbers.length <=
                                                slipNumberIndex)
                                        ? const Text('N')
                                        : Text(slips[slipIndex]!
                                            .numbers[slipNumberIndex][index]
                                            .toString()),
                                  ),
                                );
                              }),
                        ),
                        index == itemCount - 1
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                style: IconButton.styleFrom(
                                    shape: const CircleBorder()),
                              )
                            : Container()
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
