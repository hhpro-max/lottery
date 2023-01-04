import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../config.dart';

class FileOutPut extends LogOutput{
  
  @override
  void output(OutputEvent event) async{
    final File file = File("${Get.find<Config>().mainDirectory}/lib/helpers/applogger/applogs.log");
    
    for (var line in event.lines) {
      await file.writeAsString(line,mode: FileMode.append);
      await file.writeAsString("\n",mode: FileMode.append);
    }
  }

}