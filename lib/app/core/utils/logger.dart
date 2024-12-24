import 'package:flutter/foundation.dart';

class Logger {
  static void log(String message) {
    if (kDebugMode) {
      print('[LOG] $message');
    }
  }

  static void error(String message) {
    if (kDebugMode) {
      print('[ERROR] $message');
    }
  }

  static void info(String message) {
    if (kDebugMode) {
      print('[INFO] $message');
    }
  }
}
