import 'package:logger/logger.dart';
import 'package:lottery/helpers/applogger/logger_config.dart';

class AppLogger{
  var logger = Logger(
    printer: PrettyPrinter(
      colors: false,
      printTime: true,
      printEmojis: true,
    ),
    output: FileOutPut()
  );
  
}