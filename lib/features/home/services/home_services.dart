import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottery/models/lottery_card.dart';
import 'package:lottery/providers/user_provider.dart';

import '../../../helpers/applogger/app_logger.dart';
import '../../../helpers/config.dart';

class HomeServices {
  static Future<List<LotteryCard>> getLotteries() async {
    List<LotteryCard> lotteries = [];
    try {
      http.Response response = await http.get(
          Uri.parse("${Get.find<Config>().serverUrl}/lottery/lotteries"),
          headers: Get.find<UserProvider>().headers);
      
      for (int i = 0; i < jsonDecode(response.body).length; i++) {
        lotteries.add(
            LotteryCard.fromJson(jsonEncode(jsonDecode(response.body)[i])));
      }
      //logging
      Get.find<AppLogger>().logger.i("products are fetched -> $lotteries");
      //
    } catch (e) {
      //logging
      Get.find<AppLogger>()
          .logger
          .wtf("error in getLotteries method in home_services -> \n $e");
      e.printError();
      
      //
    }
    return lotteries;
  }
}
