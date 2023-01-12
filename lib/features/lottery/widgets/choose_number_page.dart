import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/helpers/show_custom_alertdialog.dart';
import 'package:get/get.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/models/lottery_slip.dart';
import 'package:lottery/providers/app_provider.dart';
import 'package:lottery/providers/user_provider.dart';
showChooseNumberPage(
    {required BuildContext context,
    required int numberCount,
    required List<Map> numbers,
    required Color choosenColor,
    required String lotteryId
    }) {
  List<int> choosenNums = [];
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    for (var element in numbers) {
                      element['isChoosen'] = false;
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('CANCEL')),
              TextButton(
                  onPressed: () {
                    if (choosenNums.length < numberCount) {
                      var random = Random();
                      int rNumber = random.nextInt(51);
                      choosenNums.addIf(
                          !choosenNums.contains(rNumber), rNumber);
                      choosenNums.sort();
                      for (var element in numbers) {
                        if (element['number'] == rNumber) {
                          setState(
                            () {
                              element['isChoosen'] = true;
                            },
                          );
                          break;
                        }
                      }
                    }
                  },
                  child: const Text("RANDOM")),
              TextButton(
                  onPressed: () {
                    if (choosenNums.length == numberCount) {
                      for (var element in numbers) {
                        element['isChoosen'] = false;
                      }
                      Get.find<AppProvider>().choosenNumbersList.isEmpty?
                      Get.find<AppProvider>().choosenNumbersList.add(LotterySlip(lotteryId: lotteryId, userId: Get.find<UserProvider>().user.id, numbers: [choosenNums])):
                      Get.find<AppProvider>().choosenNumbersList.forEach((element) {if(element.lotteryId==lotteryId){
                        element.numbers.add(choosenNums);
                        return;
                      }else if(Get.find<AppProvider>().choosenNumbersList.indexOf(element)==Get.find<AppProvider>().choosenNumbersList.length-1){
                      Get.find<AppProvider>().choosenNumbersList.add(LotterySlip(lotteryId: lotteryId, userId: Get.find<UserProvider>().user.id, numbers: [choosenNums]));
                      }
                      });
                      
                      
                      Navigator.pop(context);
                    } else {
                      showMyDialog(
                          context: context,
                          title: "",
                          description:
                              "please choose ${numberCount - choosenNums.length} more numbers",
                          barrierDismissible: true);
                    }
                  },
                  child: const Text('OK')),
            ],
            title: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "CHOOSE $numberCount NUMBERS",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    choosenNums.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "choose ${numberCount - choosenNums.length} more numbers",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
            scrollable: false,
            content: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return TextButton(
                      style: TextButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: numbers[index]['isChoosen'] == true
                              ? choosenColor
                              : Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                      onPressed: () {
                        setState(() {
                          if (choosenNums.length >= numberCount) {
                            if (numbers[index]['isChoosen'] == true) {
                              numbers[index]['isChoosen'] = false;
                              choosenNums.remove(numbers[index]['number']);
                            }
                            return;
                          }
                          if (numbers[index]['isChoosen'] == true) {
                            numbers[index]['isChoosen'] = false;
                            choosenNums.remove(numbers[index]['number']);
                          } else {
                            numbers[index]['isChoosen'] = true;
                            choosenNums.add(numbers[index]['number']);
                          }
                          choosenNums = choosenNums.toSet().toList();
                          choosenNums.sort();
                        });
                      },
                      child: Text(
                        numbers[index]['number'].toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ));
                },
              ),
            ),
          );
        });
      });
}
