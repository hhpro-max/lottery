import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_elevatedbutton.dart';
import 'package:lottery/helpers/show_custom_alertdialog.dart';

import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/models/lottery_slip.dart';
import 'package:lottery/providers/app_provider.dart';
import 'package:path/path.dart';

import '../../../providers/user_provider.dart';
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
  int slipNumberIndex = 0;

  List<Map> numbers = [];
  LotterySlip slip = LotterySlip(lotteryId: '', userId: "", numbers: []);
  @override
  void initState() {
    super.initState();
    slip.lotteryId = widget.lotteryCard.id;
    for (LotterySlip element in Get.find<AppProvider>().choosenNumbersList) {
      if (element.lotteryId == slip.lotteryId) {
        slip = element;
        break;
      }
    }
    itemCount = slip.numbers.length + 1;
    numberCount = widget.lotteryCard.numberCount;
    numbers = List.generate(widget.lotteryCard.numberRange,
        (index) => {"number": index + 1, "isChoosen": false});
  }

  deletDuplicateItems({required BuildContext context}) {
    loop:
    for (var element1 in slip.numbers) {
      int duplicate = 0;
      for (var element2 in slip.numbers) {
        if (listEquals(element1, element2)) {
          duplicate++;
          if (duplicate >= 2) {
            slip.numbers.remove(element2);
            showMyDialog(
                context: context,
                title: '',
                description: "!duplicated numbers!",
                barrierDismissible: true);
            break loop;
          }
        }
      }
    }
  }

  updateUserSlips() {
    bool isContainsSlip = false;
    for (LotterySlip element in Get.find<AppProvider>().choosenNumbersList) {
      if (element.lotteryId == slip.lotteryId) {
        element = slip;
        isContainsSlip = true;
        break;
      }
    }
    if (!isContainsSlip) {
      Get.find<AppProvider>().choosenNumbersList.add(slip);
    }
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
                              title: slip.numbers.length > index
                                  ? "DELETE"
                                  : "LUCKY DIP",
                              onPressed: () {
                                setState(() {
                                  if (slip.numbers.length > index) {
                                    slip.numbers.removeAt(index);
                                    itemCount--;
                                  } else {
                                    List<int> rNumbers = [];
                                    while (true) {
                                      Random random = Random();
                                      int rNum =
                                          random.nextInt(numbers.length) + 1;
                                      rNumbers.add(rNum);
                                      rNumbers = rNumbers.toSet().toList();
                                      if (rNumbers.length == numberCount) {
                                        break;
                                      }
                                    }
                                    deletDuplicateItems(context: context);
                                    rNumbers.sort();
                                    slip.numbers.add(rNumbers);

                                    itemCount++;
                                  }
                                });
                              }),
                        ),
                        Text(
                          "Or",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customCommonElevatedButton(
                              title: slip.numbers.length > index
                                  ? "EDIT"
                                  : "CHOOSE $numberCount NUMBERS",
                              onPressed: () {
                                showChooseNumberPage(
                                        choosenNumsList:
                                            slip.numbers.length > index
                                                ? slip.numbers[index]
                                                : [],
                                        lotterySlip: slip,
                                        context: context,
                                        numberCount: numberCount,
                                        choosenColor: Get.find<AppProvider>()
                                            .findLotteryColor(
                                                widget.lotteryCard),
                                        numbers: numbers)
                                    .then((_) => setState(() {
                                          deletDuplicateItems(context: context);
                                          itemCount = slip.numbers.length + 1;
                                        }));
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
                                    child: (slip.numbers.isEmpty ||
                                            slip.numbers.length <=
                                                slipNumberIndex)
                                        ? const Text('N')
                                        : Text(slip.numbers[slipNumberIndex]
                                                [index]
                                            .toString()),
                                  ),
                                );
                              }),
                        ),
                        index == itemCount - 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
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
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'total : ${slip.numbers.length * widget.lotteryCard.price} \$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      customCommonElevatedButton(
                                          title: "lets play",
                                          onPressed: () {
                                            updateUserSlips();
                                            if (Get.find<UserProvider>()
                                                .user
                                                .id
                                                .isEmpty) {
                                              return showMyDialog(
                                                  actions: [
                                                    TextButton(onPressed: (){
                                                      Navigator.pop(context);
                                                      Get.offNamed('/signin');
                                                    }, child: const Text('lets signin or signup'))
                                                  ],
                                                  context: context,
                                                  title: 'auth failed',
                                                  description:
                                                      'please login first',
                                                  barrierDismissible: false);
                                            }
                                            if (slip.numbers.isNotEmpty) {
                                              slip.userId =
                                                  Get.find<UserProvider>()
                                                      .user
                                                      .id;
                                              Get.toNamed('/payment',
                                                  arguments: [
                                                    widget.lotteryCard,
                                                    slip
                                                  ]);
                                            } else {
                                              showMyDialog(
                                                  context: context,
                                                  title: '',
                                                  description:
                                                      'pls choose at least one line of numbers',
                                                  barrierDismissible: true);
                                            }
                                          })
                                    ],
                                  )
                                ],
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
